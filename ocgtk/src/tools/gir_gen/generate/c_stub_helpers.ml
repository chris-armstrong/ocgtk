(* C Stub Code Generation - Shared Helpers *)

(** This module provides organized C stub code generation functionality.
    The following sub-modules have been extracted to separate files for better organization:
    - Type_analysis: Type classification and property introspection (c_stub_type_analysis.ml)
    - Array_conv: Array conversion between OCaml and C (c_stub_array_conv.ml)
    - GValue: GValue getter/setter generation (c_stub_gvalue.ml)

    This module re-exports these modules for backward compatibility and provides:
    - Code_gen: Code generation utilities (headers, return statements, etc.)
    - Forward_decl: Forward declaration generation helpers *)

open Printf
open Containers
open StdLabels
open Types

(* Get C include header for a namespace. This uses
   hardcoded values for now because the c:include is
   not properly parsed from the GIR file *)
let include_header_for_namespace namespace_name =
  let ns_lower = String.lowercase_ascii namespace_name in
  match ns_lower with
  | "gtk" -> "#include <gtk/gtk.h>"
  | "gdk" -> "#include <gdk/gdk.h>"
  | "pango" -> "#include <pango/pango.h>"
  | "gdkpixbuf" -> "#include <gdk-pixbuf/gdk-pixbuf.h>"
  | "gsk" -> "#include <gsk/gsk.h>"
  | "graphene" -> "#include <graphene.h>"
  | "gio" -> "#include <gio/gio.h>"
  | "gobject" -> "#include <glib-object.h>"
  | _ -> sprintf "#include <%s/%s.h>" ns_lower ns_lower

(** Code generation utilities *)
module Code_gen = struct
  (* Default type mapping for when no mapping is found *)
  let default_type_mapping =
    {
      ocaml_type = "unit";
      c_to_ml = "Val_unit";
      ml_to_c = "Unit_val";
      needs_copy = false;
      layer2_class = None;
      c_type = "void";
    }

  (* Generate C file header with common includes and type conversions *)
  let generate_c_file_header ~ctx ?(class_name = "") ?(external_enums = [])
      ?(external_bitfields = []) () =
    let _ = (external_enums, external_bitfields) in
    let buf = Buffer.create 1024 in
    Buffer.add_string buf "/* GENERATED CODE - DO NOT EDIT */\n";
    if not (String.equal class_name "") then
      bprintf buf "/* C bindings for %s */\n" class_name
    else bprintf buf "/* Generated from %s.gir */\n" ctx.namespace.namespace_name;
    Buffer.add_string buf "\n";
    bprintf buf "%s\n" (include_header_for_namespace ctx.namespace.namespace_name);
    Buffer.add_string buf "#include <caml/mlvalues.h>\n";
    Buffer.add_string buf "#include <caml/memory.h>\n";
    Buffer.add_string buf "#include <caml/alloc.h>\n";
    Buffer.add_string buf "#include <caml/callback.h>\n";
    Buffer.add_string buf "#include <caml/fail.h>\n";
    Buffer.add_string buf "#include <caml/hash.h>\n";
    Buffer.add_string buf "#include <caml/custom.h>\n";
    Buffer.add_string buf "#include \"wrappers.h\"\n";
    (* Include converters.h for GTK library - contains GTK/GDK/Pango specific type conversions *)
    if String.equal (String.lowercase_ascii ctx.namespace.namespace_name) "gtk"
    then Buffer.add_string buf "#include \"converters.h\"\n";
    Buffer.add_string buf "\n";
    List.iter
      ~f:(fun c_include ->
        Buffer.add_string buf (sprintf "#include <%s>\n" c_include))
      ctx.repository.repository_c_includes;

    (* Include common header for type conversions and forward declarations *)
    Buffer.add_string buf
      "/* Include common type conversions and forward declarations */\n";
    Buffer.add_string buf "#include \"generated_forward_decls.h\"\n";
    Buffer.add_string buf "\n";

    (* No longer generate type-specific macros here - all macros are in generated_forward_decls.h *)
    Buffer.contents buf

  (* Helper: extract base C type by removing trailing pointer *)
  let base_c_type_of c_type =
    CCString.chop_suffix ~suf:"*" c_type |> Option.value ~default:c_type

  (** Build return statement code based on return type and out parameters. Handles
      both throwing and non-throwing methods. *)
  let build_return_statement ~throws ml_primary out_conversions =
    match (ml_primary, out_conversions) with
    | None, [] ->
        if throws then
          "if (error == NULL) CAMLreturn(Res_Ok(ValUnit)); else \
           CAMLreturn(Res_Error(Val_GError(error)));"
        else "CAMLreturn(Val_unit);"
    | Some v, [] ->
        if throws then
          sprintf
            "if (error == NULL) CAMLreturn(Res_Ok(%s)); else \
             CAMLreturn(Res_Error(Val_GError(error)));"
            v
        else sprintf "CAMLreturn(%s);" v
    | None, [ single ] ->
        if throws then
          "CAMLlocal1(ret);\n    ret = " ^ single
          ^ ";\n\
            \    if (error == NULL) CAMLreturn(Res_Ok(ret)); else \
             CAMLreturn(Res_Error(Val_GError(error)));"
        else sprintf "CAMLreturn(%s);" single
    | Some v, outs ->
        let all = v :: outs in
        let stores =
          List.mapi
            ~f:(fun i expr -> sprintf "Store_field(ret, %d, %s);" i expr)
            all
        in
        let alloc = sprintf "ret = caml_alloc(%d, 0);" (List.length all) in
        if throws then
          String.concat ~sep:"\n    "
            ([ "CAMLlocal1(ret);"; alloc ]
            @ stores
            @ [
                "if (error == NULL) CAMLreturn(Res_Ok(ret)); else \
                 CAMLreturn(Res_Error(Val_GError(error)));";
              ])
        else
          String.concat ~sep:"\n    "
            ([ "CAMLlocal1(ret);"; alloc ] @ stores @ [ "CAMLreturn(ret);" ])
    | None, outs ->
        let stores =
          List.mapi
            ~f:(fun i expr -> sprintf "Store_field(ret, %d, %s);" i expr)
            outs
        in
        let alloc = sprintf "ret = caml_alloc(%d, 0);" (List.length outs) in
        if throws then
          String.concat ~sep:"\n    "
            ([ "CAMLlocal1(ret);"; alloc ]
            @ stores
            @ [
                "if (error == NULL) CAMLreturn(Res_Ok(ret)); else \
                 CAMLreturn(Res_Error(Val_GError(error)));";
              ])
        else
          String.concat ~sep:"\n    "
            ([ "CAMLlocal1(ret);"; alloc ] @ stores @ [ "CAMLreturn(ret);" ])

  (** Generate C code for constructors by iterating and filtering.
      Applies [Filtering.should_generate_constructor] filter and appends
      generated code to the buffer. *)
  let generate_constructors ~ctx ~c_type ~class_name ~buf ~generator constructors =
    List.iter
      ~f:(fun ctor ->
        if Filtering.should_generate_constructor ~ctx ctor then
          Buffer.add_string buf (generator ~ctx ~c_type ~class_name ctor))
      constructors

  (** Generate C code for methods by iterating and filtering.
      Applies [Filtering.should_skip_method_binding] filter plus an optional
      extra filter predicate, then appends generated code to the buffer.
      Methods are processed in reverse order (List.rev). *)
  let generate_methods ~ctx ~c_type ~class_name ~buf ~generator ?extra_filter
      methods =
    List.iter
      ~f:(fun (meth : gir_method) ->
        let should_skip = Filtering.should_skip_method_binding ~ctx meth in
        let passes_extra_filter =
          match extra_filter with None -> true | Some f -> f meth
        in
        if (not should_skip) && passes_extra_filter then
          Buffer.add_string buf (generator ~ctx ~c_type meth class_name))
      (List.rev methods)
end

(** Forward declaration generation helpers - shared across record, class, enum, and bitfield modules *)
module Forward_decl = struct
  (** Generate a section of forward declarations.
      Common pattern across record, class, enum, and bitfield modules.
      
      Parameters:
      - buf: Buffer to append declarations to
      - items: List of items to generate declarations for  
      - section_comment: Comment header for this section
      - generate_one: Function to generate declarations for a single item
      - deduplicate: Whether to track seen types with Hashtbl (default: true) *)
  let generate_section
      ~(buf : Buffer.t)
      ~(items : 'a list)
      ~(section_comment : string)
      ~(generate_one : 'a -> unit)
      ?(deduplicate : bool = true)
      () =
    if List.length items > 0 then (
      Buffer.add_string buf section_comment;
      let seen = if deduplicate then Some (Hashtbl.create 97) else None in
      List.iter
        ~f:(fun item ->
          match seen with
          | Some tbl when Hashtbl.mem tbl item -> ()
          | Some tbl ->
              Hashtbl.add tbl item ();
              generate_one item
          | None -> generate_one item)
        items;
      Buffer.add_string buf "\n")
end

(* Re-export commonly used functions at top level for backward compatibility *)
(* Define the type directly so record fields are accessible *)
type property_gvalue_info = {
  base_type : string;
  base_lower : string;
  has_pointer : bool;
  pointer_like : bool;
  record_info : (Types.gir_record * bool * bool) option;
  class_info : Types.gir_class option;
  is_enum : bool;
  is_bitfield : bool;
  stack_allocated : bool;
}

(* Accumulator for parameter processing - kept at top level for record field access *)
type param_acc = { ocaml_idx : int; decls : Buffer.t; args : string list; cleanups : string list }

(* Convert from internal type to public type *)
let analyze_property_type ~ctx (gir_type : Types.gir_type) =
  let internal = C_stub_type_analysis.Type_analysis.analyze_property_type ~ctx gir_type in
  {
    base_type = internal.base_type;
    base_lower = internal.base_lower;
    has_pointer = internal.has_pointer;
    pointer_like = internal.pointer_like;
    record_info = internal.record_info;
    class_info = internal.class_info;
    is_enum = internal.is_enum;
    is_bitfield = internal.is_bitfield;
    stack_allocated = internal.stack_allocated;
  }
let is_copy_method = C_stub_type_analysis.Type_analysis.is_copy_method
let is_free_method = C_stub_type_analysis.Type_analysis.is_free_method
let is_copy_or_free = C_stub_type_analysis.Type_analysis.is_copy_or_free
let fold_mapi = C_stub_type_analysis.Type_analysis.fold_mapi
let list_contains = C_stub_type_analysis.Type_analysis.list_contains
let is_string_type = C_stub_type_analysis.Type_analysis.is_string_type
let generate_array_ml_to_c = C_stub_array_conv.Array_conv.generate_array_ml_to_c
let generate_array_c_to_ml = C_stub_array_conv.Array_conv.generate_array_c_to_ml
let is_string_array = C_stub_array_conv.Array_conv.is_string_array
(* Convert prop_info from internal type to public type and call GValue function *)
let generate_gvalue_getter_assignment ~ml_name ~prop ~c_type_name ~prop_info:public_prop_info =
  let internal_prop_info = {
    C_stub_type_analysis.Type_analysis.base_type = public_prop_info.base_type;
    base_lower = public_prop_info.base_lower;
    has_pointer = public_prop_info.has_pointer;
    pointer_like = public_prop_info.pointer_like;
    record_info = public_prop_info.record_info;
    class_info = public_prop_info.class_info;
    is_enum = public_prop_info.is_enum;
    is_bitfield = public_prop_info.is_bitfield;
    stack_allocated = public_prop_info.stack_allocated;
  } in
  C_stub_gvalue.GValue.generate_gvalue_getter_assignment ~ml_name ~prop ~c_type_name ~prop_info:internal_prop_info

(* Generate setter without the unused prop parameter *)
let generate_gvalue_setter_assignment ~ml_name ~prop_info:public_prop_info =
  let internal_prop_info = {
    C_stub_type_analysis.Type_analysis.base_type = public_prop_info.base_type;
    base_lower = public_prop_info.base_lower;
    has_pointer = public_prop_info.has_pointer;
    pointer_like = public_prop_info.pointer_like;
    record_info = public_prop_info.record_info;
    class_info = public_prop_info.class_info;
    is_enum = public_prop_info.is_enum;
    is_bitfield = public_prop_info.is_bitfield;
    stack_allocated = public_prop_info.stack_allocated;
  } in
  C_stub_gvalue.GValue.generate_gvalue_setter_assignment ~ml_name ~prop:() ~prop_info:internal_prop_info
let generate_c_file_header = Code_gen.generate_c_file_header
let base_c_type_of = Code_gen.base_c_type_of
let build_return_statement = Code_gen.build_return_statement
let generate_constructors = Code_gen.generate_constructors
let generate_methods = Code_gen.generate_methods
let default_type_mapping = Code_gen.default_type_mapping

(* Nullable conversion expressions - these depend on Type_analysis.analyze_property_type *)
let nullable_c_to_ml_expr ~ctx ~var ~(gir_type : gir_type)
    ~(mapping : type_mapping) ?(direction : Types.gir_direction = In) () =
  (* out parameters that are record types are stack allocated, so we need to pass by reference
     to their Val_x function, which will copy them into the OCaml heap *)
  let var_expr =
    match (direction, analyze_property_type ~ctx gir_type) with
    | Out, { record_info = Some ({ opaque = false; _ }, _, _); _ }
    | InOut, { record_info = Some ({ opaque = false; _ }, _, _); _ } ->
        sprintf "&%s" var
    | _ -> var
  in
  if not gir_type.nullable then sprintf "%s(%s)" mapping.c_to_ml var_expr
  else
    match gir_type with
    | { c_type; _ } when is_string_type c_type ->
        sprintf "Val_option_string(%s)" var_expr
    | { c_type = Some c_type; _ }
      when String.length c_type > 0
           && String.equal
                (String.sub c_type ~pos:(String.length c_type - 1) ~len:1)
                "*" ->
        sprintf "Val_option(%s, %s)" var_expr mapping.c_to_ml
    | _ -> sprintf "%s(%s)" mapping.c_to_ml var_expr

let nullable_ml_to_c_expr ~var ~(gir_type : gir_type) ~(mapping : type_mapping)
    =
  (* Check for string types with transfer-ownership="full" - need to copy to mutable buffer *)
  match gir_type.transfer_ownership with
  | TransferFull when is_string_type gir_type.c_type ->
      (* String with transfer-full: copy to mutable buffer before passing *)
      if not gir_type.nullable then sprintf "String_copy(%s)" var
      else sprintf "String_option_val(String_copy(%s))" var
  | _ -> (
      if
        (* Normal case - no copy needed *)
        not gir_type.nullable
      then sprintf "%s(%s)" mapping.ml_to_c var
      else
        match gir_type with
        | { c_type; _ } when is_string_type c_type ->
            sprintf "String_option_val(%s)" var
        | { c_type = Some c_type; _ }
          when String.length c_type > 0
               && String.equal
                    (String.sub c_type ~pos:(String.length c_type - 1) ~len:1)
                    "*" ->
            sprintf "Option_val(%s, %s, NULL)" var mapping.ml_to_c
        | _ -> sprintf "%s(%s)" mapping.ml_to_c var)

(* Re-export forward declaration helper *)
let generate_forward_decl_section = Forward_decl.generate_section
