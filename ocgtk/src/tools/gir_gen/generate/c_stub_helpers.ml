(* C Stub Code Generation - Shared Helpers *)

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

(* Type analysis helpers for property type introspection *)
type property_gvalue_info = {
  base_type : string;
  base_lower : string;
  has_pointer : bool;
  pointer_like : bool;
  record_info : (gir_record * bool * bool) option;
  class_info : gir_class option;
  is_enum : bool;
  is_bitfield : bool;
  stack_allocated : bool;
}

let list_contains ~value list =
  List.exists list ~f:(fun candidate -> String.equal candidate value)

let ends_with ~suffix str =
  let len_s = String.length suffix and len_str = String.length str in
  len_str >= len_s
  && String.equal (String.sub str ~pos:(len_str - len_s) ~len:len_s) suffix

(* Fold with map and index - combines fold_left_map with index tracking *)
let fold_mapi ~f ~init list =
  let rec aux idx acc = function
    | [] -> (acc, [])
    | x :: xs ->
        let acc', y = f idx acc x in
        let final_acc, ys = aux (idx + 1) acc' xs in
        (final_acc, y :: ys)
  in
  aux 0 init list

let string_base_types = [ "gchar"; "char"; "utf8"; "gchararray" ]

let int32_types =
  [ "gint"; "int"; "gint32"; "int32"; "gint16"; "int16"; "gint8"; "int8" ]

let uint32_types =
  [
    "guint"; "uint"; "guint32"; "uint32"; "guint16"; "uint16"; "guint8"; "uint8";
  ]

let int64_types = [ "gint64"; "int64" ]
let uint64_types = [ "guint64"; "uint64" ]
let long_types = [ "glong"; "long"; "goffset"; "off_t" ]
let ulong_types = [ "gulong"; "ulong" ]
let ssize_types = [ "gssize"; "ssize_t" ]
let size_types = [ "gsize"; "size_t" ]
let float_types = [ "gfloat"; "float" ]
let double_types = [ "gdouble"; "double" ]
let pointer_types = [ "gpointer"; "gconstpointer" ]

let all_stack_allocated_builtins =
  string_base_types @ int32_types @ uint32_types @ int64_types @ uint64_types
  @ long_types @ ulong_types @ ssize_types @ float_types @ double_types
  @ pointer_types

let analyze_property_type ~ctx (gir_type : gir_type) =
  let c_type =
    match gir_type.c_type with
    | Some c_type -> c_type
    | None ->
        Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type
        |> Option.map (fun tm -> tm.c_type)
        |> Option.value ~default:"void"
  in
  let normalized =
    Type_mappings.normalize_c_pointer_type c_type |> String.trim
  in
  let rec find_last idx =
    if idx < 0 then None
    else
      match String.get normalized idx with
      | ' ' | '\t' -> find_last (idx - 1)
      | '*' -> Some idx
      | _ -> None
  in
  let base_type, has_pointer =
    match find_last (String.length normalized - 1) with
    | Some idx ->
        let stripped = String.trim (String.sub normalized ~pos:0 ~len:idx) in
        (stripped, true)
    | None -> (normalized, false)
  in
  let base_lower = String.lowercase_ascii gir_type.name in
  let record_info =
    Type_mappings.find_record_mapping ctx.records gir_type.name
  in
  let class_info = Type_mappings.find_class_mapping ctx.classes gir_type.name in
  let is_enum =
    List.exists ctx.enums ~f:(fun e -> String.equal e.enum_name gir_type.name)
  in
  let is_bitfield =
    List.exists ctx.bitfields ~f:(fun b ->
        String.equal b.bitfield_name gir_type.name)
  in
  let pointer_like =
    has_pointer
    || List.exists pointer_types ~f:(fun candidate ->
        String.equal candidate base_lower)
  in
  let stack_allocated =
    is_enum || is_bitfield
    || List.exists ~f:(String.equal normalized) all_stack_allocated_builtins
  in
  {
    base_type;
    base_lower;
    has_pointer;
    pointer_like;
    record_info;
    class_info;
    is_enum;
    is_bitfield;
    stack_allocated;
  }

let is_string_type ctype =
  match ctype with
  | Some
      ( "char*" | "gchararray" | "gchar*" | "utf8" | "const gchar*"
      | "const char*" ) ->
      true
  | _ -> false

(* Check if an array contains string elements *)
let is_string_array (array_info : gir_array) =
  let elem_name = String.lowercase_ascii array_info.element_type.name in
  let elem_ctype = array_info.element_type.c_type in
  String.equal elem_name "utf8" || String.equal elem_name "gchararray" ||
  is_string_type elem_ctype

(* Generate inline code for converting OCaml array to C array *)
let generate_array_ml_to_c ~ctx ~var ~(array_info : gir_array) ~element_mapping:_ ~element_c_type ~transfer_ownership =
  (* Get element type mapping for conversion *)
  match Type_mappings.find_type_mapping_for_gir_type ~ctx array_info.element_type with
  | None ->
      failwith (sprintf "Array element type '%s' not supported" array_info.element_type.name)
  | Some element_tm ->
      let length_var = var ^ "_length" in
      let c_array_var = "c_" ^ var in
      let is_pointer_array = String.contains element_c_type '*' in

      (* Determine if this array should be zero-terminated *)
      let should_zero_terminate =
        array_info.zero_terminated ||
        (* Default: string arrays without explicit length are typically zero-terminated in GTK *)
        (is_string_array array_info && Option.is_none array_info.length)
      in

      (* For struct arrays (non-pointer elements), we need to dereference the
         conversion result since _val macros return pointers *)
      let deref_prefix = if is_pointer_array then "" else "*" in

      (* Generate conversion code based on array type *)
      let conversion_code =
        if should_zero_terminate then
          (* Zero-terminated array - use g_malloc for GTK compatibility *)
          if is_pointer_array then
            sprintf
              "int %s = Wosize_val(%s);\n\
              \    %s* %s = (%s*)g_malloc(sizeof(%s) * (%s + 1));\n\
              \    for (int i = 0; i < %s; i++) {\n\
              \      %s[i] = %s(Field(%s, i));\n\
              \    }\n\
              \    %s[%s] = NULL;"
              length_var var
              element_c_type c_array_var element_c_type element_c_type length_var
              length_var
              c_array_var element_tm.ml_to_c var
              c_array_var length_var
          else
            sprintf
              "int %s = Wosize_val(%s);\n\
              \    %s* %s = (%s*)g_malloc(sizeof(%s) * (%s + 1));\n\
              \    for (int i = 0; i < %s; i++) {\n\
              \      %s[i] = %s%s(Field(%s, i));\n\
              \    }\n\
              \    %s[%s] = (%s){0};"
              length_var var
              element_c_type c_array_var element_c_type element_c_type length_var
              length_var
              c_array_var deref_prefix element_tm.ml_to_c var
              c_array_var length_var element_c_type
        else
          (* Non-zero-terminated array - use g_malloc for GTK compatibility *)
          sprintf
            "int %s = Wosize_val(%s);\n\
            \    %s* %s = (%s*)g_malloc(sizeof(%s) * %s);\n\
            \    for (int i = 0; i < %s; i++) {\n\
            \      %s[i] = %s%s(Field(%s, i));\n\
            \    }"
            length_var var
            element_c_type c_array_var element_c_type element_c_type length_var
            length_var
            c_array_var deref_prefix element_tm.ml_to_c var
      in

      (* Generate cleanup code if needed (TransferNone means we still own the memory) *)
      let cleanup_code = match transfer_ownership with
        | Types.TransferNone ->
            (* GTK won't free it, we must clean up after the call *)
            sprintf "g_free(%s);" c_array_var
        | Types.TransferFull | Types.TransferContainer | Types.TransferFloating ->
            (* GTK takes ownership, no cleanup needed *)
            ""
      in

      (conversion_code, c_array_var, length_var, cleanup_code)

(* Generate inline code for converting C array to OCaml array *)
let generate_array_c_to_ml ~ctx ~var ~(array_info : gir_array) ~length_expr ~element_c_type ~transfer_ownership =
  match Type_mappings.find_type_mapping_for_gir_type ~ctx array_info.element_type with
  | None ->
      failwith (sprintf "Array element type '%s' not supported" array_info.element_type.name)
  | Some element_tm ->
      let ml_array_var = "ml_" ^ var in
      let length_var = var ^ "_length" in
      let is_pointer_array = String.contains element_c_type '*' in

      (* Generate code to compute length *)
      let length_code =
        match length_expr with
        | Some expr -> sprintf "int %s = %s;" length_var expr
        | None ->
            (* No explicit length - check if zero-terminated or can be inferred *)
            if array_info.zero_terminated then
              (* Explicitly zero-terminated *)
              if is_pointer_array then
                sprintf "int %s = 0;\n    while (%s[%s] != NULL) %s++;"
                  length_var var length_var length_var
              else
                sprintf "int %s = 0;\n    while (%s[%s] != (%s)0) %s++;"
                  length_var var length_var element_c_type length_var
            else if is_string_array array_info then
              (* String arrays are typically zero-terminated even if not explicitly marked *)
              sprintf "int %s = 0;\n    while (%s[%s] != NULL) %s++;"
                length_var var length_var length_var
            else
              (* No length information and not a string array - cannot safely convert *)
              failwith (sprintf "Array has no length information for %s (element type: %s). \
                                 Either zero-terminated, length, or fixed-size attribute required."
                         var array_info.element_type.name)
      in

      (* Generate conversion loop *)
      let conversion_code =
        sprintf
          "%s\n\
          \    value %s = caml_alloc(%s, 0);\n\
          \    for (int i = 0; i < %s; i++) {\n\
          \      Store_field(%s, i, %s(%s[i]));\n\
          \    }"
          length_code
          ml_array_var length_var
          length_var
          ml_array_var element_tm.c_to_ml var
      in

      (* Generate cleanup code if we own the array (TransferFull or TransferContainer) *)
      let cleanup_code = match transfer_ownership with
        | Types.TransferNone | Types.TransferFloating ->
            (* GTK owns the array - don't free it *)
            ""
        | Types.TransferContainer ->
            (* We own the container but not the elements - just free the container *)
            sprintf "g_free(%s);" var
        | Types.TransferFull ->
            (* We own everything - free elements (if pointers) then container *)
            if is_string_array array_info then
              (* String array: free each string then the container *)
              sprintf
                "for (int i = 0; i < %s; i++) {\n\
                \      g_free((gpointer)%s[i]);\n\
                \    }\n\
                \    g_free(%s);"
                length_var var var
            else if is_pointer_array then
              (* Generic pointer array: might need element-wise freeing, but we can't know the type *)
              (* For now, just free the container - this may leak if elements need freeing *)
              (* TODO: Add heuristics or metadata to determine if elements need freeing *)
              sprintf "g_free(%s);" var
            else
              (* Primitive array: just free the container *)
              sprintf "g_free(%s);" var
      in

      (conversion_code, ml_array_var, cleanup_code)

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

let generate_gvalue_getter_assignment ~ml_name ~prop ~c_type_name ~prop_info =
  let base_lower = prop_info.base_lower in
  let fallback =
    sprintf "    caml_failwith(\"%s: unsupported property type '%s'\");\n"
      ml_name prop.prop_name
  in
  if prop_info.is_enum then
    sprintf "    prop_value = (%s)g_value_get_enum(&prop_gvalue);\n" c_type_name
  else if prop_info.is_bitfield then
    sprintf "    prop_value = (%s)g_value_get_flags(&prop_gvalue);\n"
      c_type_name
  else if String.equal base_lower "gboolean" then
    "    prop_value = g_value_get_boolean(&prop_gvalue);\n"
  else if list_contains ~value:base_lower int32_types then
    sprintf "    prop_value = (%s)g_value_get_int(&prop_gvalue);\n" c_type_name
  else if list_contains ~value:base_lower uint32_types then
    sprintf "    prop_value = (%s)g_value_get_uint(&prop_gvalue);\n" c_type_name
  else if list_contains ~value:base_lower int64_types then
    sprintf "    prop_value = (%s)g_value_get_int64(&prop_gvalue);\n"
      c_type_name
  else if list_contains ~value:base_lower uint64_types then
    sprintf "    prop_value = (%s)g_value_get_uint64(&prop_gvalue);\n"
      c_type_name
  else if list_contains ~value:base_lower long_types then
    sprintf "    prop_value = (%s)g_value_get_long(&prop_gvalue);\n" c_type_name
  else if list_contains ~value:base_lower ulong_types then
    sprintf "    prop_value = (%s)g_value_get_ulong(&prop_gvalue);\n"
      c_type_name
  else if list_contains ~value:base_lower ssize_types then
    sprintf "    prop_value = (%s)g_value_get_ssize(&prop_gvalue);\n"
      c_type_name
  else if list_contains ~value:base_lower size_types then
    sprintf "    prop_value = (%s)g_value_get_size(&prop_gvalue);\n" c_type_name
  else if list_contains ~value:base_lower double_types then
    "    prop_value = g_value_get_double(&prop_gvalue);\n"
  else if list_contains ~value:base_lower float_types then
    "    prop_value = g_value_get_float(&prop_gvalue);\n"
  else if
    prop_info.has_pointer && list_contains ~value:base_lower string_base_types
  then "    prop_value = g_value_get_string(&prop_gvalue);\n"
  else
    match prop_info.record_info with
    | Some (record, is_pointer, _) ->
        if is_pointer then
          sprintf "    prop_value = (%s*)g_value_get_boxed(&prop_gvalue);\n"
            record.c_type
        else
          (* For non-pointer records (value-like structs), we can use the boxed pointer directly *)
          sprintf "    prop_value = (%s*)g_value_get_boxed(&prop_gvalue);\n"
            record.c_type
    | None ->
        if Option.is_some prop_info.class_info then
          sprintf "    prop_value = (%s*)g_value_get_object(&prop_gvalue);\n"
            c_type_name
        else if prop_info.pointer_like then
          sprintf "    prop_value = (%s)g_value_get_pointer(&prop_gvalue);\n"
            c_type_name
        else fallback

let generate_gvalue_setter_assignment ~ml_name ~prop ~prop_info =
  let base_lower = prop_info.base_lower in
  let fallback =
    sprintf "    caml_failwith(\"%s: unsupported property type '%s'\");\n"
      ml_name prop.prop_name
  in
  if prop_info.is_enum then "    g_value_set_enum(&prop_gvalue, c_value);\n"
  else if prop_info.is_bitfield then
    "    g_value_set_flags(&prop_gvalue, c_value);\n"
  else if String.equal base_lower "gboolean" then
    "    g_value_set_boolean(&prop_gvalue, c_value);\n"
  else if list_contains ~value:base_lower int32_types then
    "    g_value_set_int(&prop_gvalue, c_value);\n"
  else if list_contains ~value:base_lower uint32_types then
    "    g_value_set_uint(&prop_gvalue, c_value);\n"
  else if list_contains ~value:base_lower int64_types then
    "    g_value_set_int64(&prop_gvalue, c_value);\n"
  else if list_contains ~value:base_lower uint64_types then
    "    g_value_set_uint64(&prop_gvalue, c_value);\n"
  else if list_contains ~value:base_lower long_types then
    "    g_value_set_long(&prop_gvalue, c_value);\n"
  else if list_contains ~value:base_lower ulong_types then
    "    g_value_set_ulong(&prop_gvalue, c_value);\n"
  else if list_contains ~value:base_lower ssize_types then
    "    g_value_set_ssize(&prop_gvalue, c_value);\n"
  else if list_contains ~value:base_lower size_types then
    "    g_value_set_size(&prop_gvalue, c_value);\n"
  else if list_contains ~value:base_lower double_types then
    "    g_value_set_double(&prop_gvalue, c_value);\n"
  else if list_contains ~value:base_lower float_types then
    "    g_value_set_float(&prop_gvalue, c_value);\n"
  else if
    prop_info.has_pointer && list_contains ~value:base_lower string_base_types
  then "    g_value_set_string(&prop_gvalue, c_value);\n"
  else
    match prop_info.record_info with
    | Some (_, is_pointer, _) ->
        if is_pointer then "    g_value_set_boxed(&prop_gvalue, c_value);\n"
        else "    g_value_set_boxed(&prop_gvalue, &c_value);\n"
    | None ->
        if Option.is_some prop_info.class_info then
          "    g_value_set_object(&prop_gvalue, c_value);\n"
        else if prop_info.pointer_like then
          "    g_value_set_pointer(&prop_gvalue, c_value);\n"
        else fallback

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
  if
    String.length c_type > 0
    && String.equal
         (String.sub c_type ~pos:(String.length c_type - 1) ~len:1)
         "*"
  then String.sub c_type ~pos:0 ~len:(String.length c_type - 1)
  else c_type

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

type param_acc = { ocaml_idx : int; decls : Buffer.t; args : string list; cleanups : string list }
