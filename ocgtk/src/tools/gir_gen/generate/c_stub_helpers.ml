(* C Stub Code Generation - Shared Helpers *)

(** This module provides organized C stub code generation functionality
    divided into focused sub-modules:
    - Type_analysis: Type classification and property introspection
    - Array_conv: Array conversion between OCaml and C
    - GValue: GValue getter/setter generation
    - Code_gen: Code generation utilities (headers, return statements, etc.) *)

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

(** Type analysis helpers for property type introspection *)
module Type_analysis = struct
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

  (* Check if a method is a copy method that should be skipped in bindings *)
  let is_copy_method (meth : gir_method) =
    let lower_name = String.lowercase_ascii meth.method_name in
    let lower_cid = String.lowercase_ascii meth.c_identifier in
    String.equal lower_name "copy" || ends_with ~suffix:"_copy" lower_cid

  (* Check if a method is a free method that should be skipped in bindings *)
  let is_free_method (meth : gir_method) =
    let lower_name = String.lowercase_ascii meth.method_name in
    let lower_cid = String.lowercase_ascii meth.c_identifier in
    String.equal lower_name "free" || ends_with ~suffix:"_free" lower_cid

  (* Check if a method is a copy or free method that should be skipped in bindings *)
  let is_copy_or_free meth = is_copy_method meth || is_free_method meth

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

  let is_string_type ctype =
    match ctype with
    | Some
        ( "char*" | "gchararray" | "gchar*" | "utf8" | "const gchar*"
        | "const char*" ) ->
        true
    | _ -> false

  (** Analyze property type and extract GValue conversion information *)
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
end

(** Array conversion helpers *)
module Array_conv = struct
  (* Check if an array contains string elements *)
  let is_string_array (array_info : gir_array) =
    let elem_name = String.lowercase_ascii array_info.element_type.name in
    let elem_ctype = array_info.element_type.c_type in
    String.equal elem_name "utf8" || String.equal elem_name "gchararray" ||
    Type_analysis.is_string_type elem_ctype

  (** Generate conversion code for zero-terminated arrays.
      Handles both pointer arrays (NULL-terminated) and non-pointer arrays (structs). *)
  let zero_terminated_conversion
      ~length_var
      ~c_array_var
      ~var
      ~element_c_type
      ~element_tm
      ~is_pointer_array
      ~deref_prefix =
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

  (** Generate conversion code for non-zero-terminated arrays.
      Allocates memory without extra slot for NULL terminator. *)
  let non_zero_terminated_conversion
      ~length_var
      ~c_array_var
      ~var
      ~element_c_type
      ~element_tm
      ~deref_prefix =
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

  (** Generate length code when length is explicitly provided. *)
  let length_code_explicit ~length_var ~expr =
    sprintf "int %s = %s;" length_var expr

  (** Generate length code for zero-terminated pointer arrays. *)
  let length_code_for_zero_terminated_pointer ~length_var ~var =
    sprintf "int %s = 0;\n    while (%s[%s] != NULL) %s++;" length_var var length_var length_var

  (** Generate length code for zero-terminated non-pointer arrays. *)
  let length_code_for_zero_terminated_nonpointer ~length_var ~var ~element_c_type =
    sprintf "int %s = 0;\n    while (%s[%s] != (%s)0) %s++;" length_var var length_var element_c_type length_var

  (** Generate length code for string arrays (NULL-terminated). *)
  let length_code_for_string_array ~length_var ~var =
    sprintf "int %s = 0;\n    while (%s[%s] != NULL) %s++;" length_var var length_var length_var

  (** Generate cleanup code for string arrays (frees each string and then the container). *)
  let cleanup_for_string_array ~length_var ~var =
    sprintf
      "for (int i = 0; i < %s; i++) {\n\
      \      g_free((gpointer)%s[i]);\n\
      \    }\n\
      \    g_free(%s);"
      length_var var var

  (** Generate cleanup code for pointer arrays (just frees the container). *)
  let cleanup_for_pointer_array ~var =
    sprintf "g_free(%s);" var

  (** Generate length code for arrays when no explicit length is provided.
      Returns the appropriate length code based on array properties. *)
  let length_code_for_array
      ~var
      ~length_var
      ~array_info
      ~is_pointer_array
      ~element_c_type =
    if array_info.zero_terminated then
      if is_pointer_array then
        length_code_for_zero_terminated_pointer ~length_var ~var
      else
        length_code_for_zero_terminated_nonpointer ~length_var ~var ~element_c_type
    else if is_string_array array_info then
      length_code_for_string_array ~length_var ~var
    else
      (* No length information and not a string array - cannot safely convert *)
      failwith (sprintf "Array has no length information for %s (element type: %s). \
                         Either zero-terminated, length, or fixed-size attribute required."
                 var array_info.element_type.name)

  (** Generate cleanup code for TransferFull ownership.
      Returns appropriate cleanup based on array properties. *)
  let cleanup_code_for_transfer_full
      ~array_info
      ~is_pointer_array
      ~length_var
      ~var =
    if is_string_array array_info then
      cleanup_for_string_array ~length_var ~var
    else if is_pointer_array then
      (* Generic pointer array: might need element-wise freeing, but we can't know the type *)
      (* For now, just free the container - this may leak if elements need freeing *)
      (* TODO: Add heuristics or metadata to determine if elements need freeing *)
      cleanup_for_pointer_array ~var
    else
      (* Primitive array: just free the container *)
      cleanup_for_pointer_array ~var

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
            zero_terminated_conversion
              ~length_var
              ~c_array_var
              ~var
              ~element_c_type
              ~element_tm
              ~is_pointer_array
              ~deref_prefix
          else
            non_zero_terminated_conversion
              ~length_var
              ~c_array_var
              ~var
              ~element_c_type
              ~element_tm
              ~deref_prefix
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
          | Some expr -> length_code_explicit ~length_var ~expr
          | None -> length_code_for_array ~var ~length_var ~array_info ~is_pointer_array ~element_c_type
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
              cleanup_for_pointer_array ~var
          | Types.TransferFull ->
              (* We own everything - free elements (if pointers) then container *)
              cleanup_code_for_transfer_full ~array_info ~is_pointer_array ~length_var ~var
        in

        (conversion_code, ml_array_var, cleanup_code)
end

(** GValue handling *)
module GValue = struct
  (** Classification of GValue types into categories for dispatch *)
  type gvalue_type_category =
    | Enum  (** GEnum types *)
    | Bitfield  (** GFlags/bitfield types *)
    | Boolean  (** gboolean *)
    | Integer of {
        c_type_name : string;
        getter : string;  (** g_value_get_* function name *)
      }  (** Integer types (int, uint, long, etc.) *)
    | Float of string  (** Float/double types with getter name *)
    | String  (** String types *)
    | Boxed of {
        c_type : string;
        is_pointer : bool;  (** true if passed by pointer *)
      }  (** Boxed types (records/structs) *)
    | Object of string  (** Object types with C type name *)
    | Pointer  (** Generic pointer types *)
    | Unsupported of string  (** Fallback for unsupported types *)

  (** Classify a property_gvalue_info into a gvalue_type_category *)
  let classify_gvalue_type ~c_type_name (prop_info : Type_analysis.property_gvalue_info) =
    let open Type_analysis in
    let base_lower = prop_info.base_lower in
    if prop_info.is_enum then Enum
    else if prop_info.is_bitfield then Bitfield
    else if String.equal base_lower "gboolean" then Boolean
    else if list_contains ~value:base_lower int32_types then
      Integer { c_type_name; getter = "get_int" }
    else if list_contains ~value:base_lower uint32_types then
      Integer { c_type_name; getter = "get_uint" }
    else if list_contains ~value:base_lower int64_types then
      Integer { c_type_name; getter = "get_int64" }
    else if list_contains ~value:base_lower uint64_types then
      Integer { c_type_name; getter = "get_uint64" }
    else if list_contains ~value:base_lower long_types then
      Integer { c_type_name; getter = "get_long" }
    else if list_contains ~value:base_lower ulong_types then
      Integer { c_type_name; getter = "get_ulong" }
    else if list_contains ~value:base_lower ssize_types then
      Integer { c_type_name; getter = "get_ssize" }
    else if list_contains ~value:base_lower size_types then
      Integer { c_type_name; getter = "get_size" }
    else if list_contains ~value:base_lower double_types then
      Float "get_double"
    else if list_contains ~value:base_lower float_types then
      Float "get_float"
    else if prop_info.has_pointer && list_contains ~value:base_lower string_base_types then
      String
    else
      match prop_info.record_info with
      | Some (record, is_pointer, _) ->
          Boxed { c_type = record.c_type; is_pointer }
      | None ->
          if Option.is_some prop_info.class_info then
            Object c_type_name
          else if prop_info.pointer_like then Pointer
          else Unsupported base_lower

  (** Dispatch function that takes generator functions for getter/setter generation.
      Eliminates duplication between generate_getter_for_category and generate_setter_for_category. *)
  let gvalue_type_dispatch ~c_type_name ~(gen_enum : unit -> string) ~gen_bitfield ~gen_boolean
      ~gen_integer ~gen_float ~gen_string ~gen_boxed ~gen_boxed_no_ptr
      ~gen_object ~gen_pointer category =
    match category with
    | Enum -> gen_enum ()
    | Bitfield -> gen_bitfield ()
    | Boolean -> gen_boolean ()
    | Integer { getter; _ } -> gen_integer getter
    | Float getter -> gen_float getter
    | String -> gen_string ()
    | Boxed { c_type; is_pointer } ->
        if is_pointer then gen_boxed c_type
        else gen_boxed_no_ptr c_type
    | Object c_type -> gen_object c_type
    | Pointer -> gen_pointer c_type_name
    | Unsupported _ ->
        sprintf "    caml_failwith(\"unsupported property type\");\n"

  (** Generate getter code based on type category *)
  let generate_getter_for_category ~ml_name:_ ~prop:_ ~c_type_name category =
    gvalue_type_dispatch ~c_type_name
      ~gen_enum:(fun () -> sprintf "    prop_value = (%s)g_value_get_enum(&prop_gvalue);\n" c_type_name)
      ~gen_bitfield:(fun () -> sprintf "    prop_value = (%s)g_value_get_flags(&prop_gvalue);\n" c_type_name)
      ~gen_boolean:(fun () -> "    prop_value = g_value_get_boolean(&prop_gvalue);\n")
      ~gen_integer:(fun getter -> sprintf "    prop_value = g_value_%s(&prop_gvalue);\n" getter)
      ~gen_float:(fun getter -> sprintf "    prop_value = g_value_%s(&prop_gvalue);\n" getter)
      ~gen_string:(fun () -> "    prop_value = g_value_get_string(&prop_gvalue);\n")
      ~gen_boxed:(fun c_type -> sprintf "    prop_value = (%s*)g_value_get_boxed(&prop_gvalue);\n" c_type)
      ~gen_boxed_no_ptr:(fun c_type -> sprintf "    prop_value = (%s*)g_value_get_boxed(&prop_gvalue);\n" c_type)
      ~gen_object:(fun c_type -> sprintf "    prop_value = (%s*)g_value_get_object(&prop_gvalue);\n" c_type)
      ~gen_pointer:(fun ct -> sprintf "    prop_value = (%s)g_value_get_pointer(&prop_gvalue);\n" ct)
      category

  (** Convert getter name to setter name (e.g., "get_int" -> "set_int") *)
  let getter_to_setter getter =
    CCString.replace ~sub:"get_" ~by:"set_" getter

  (** Generate setter code based on type category *)
  let generate_setter_for_category ~ml_name:_ ~c_type_name category =
    gvalue_type_dispatch ~c_type_name
      ~gen_enum:(fun () -> "    g_value_set_enum(&prop_gvalue, c_value);\n")
      ~gen_bitfield:(fun () -> "    g_value_set_flags(&prop_gvalue, c_value);\n")
      ~gen_boolean:(fun () -> "    g_value_set_boolean(&prop_gvalue, c_value);\n")
      ~gen_integer:(fun getter -> sprintf "    g_value_%s(&prop_gvalue, c_value);\n" (getter_to_setter getter))
      ~gen_float:(fun getter -> sprintf "    g_value_%s(&prop_gvalue, c_value);\n" (getter_to_setter getter))
      ~gen_string:(fun () -> "    g_value_set_string(&prop_gvalue, c_value);\n")
      ~gen_boxed:(fun _ -> "    g_value_set_boxed(&prop_gvalue, c_value);\n")
      ~gen_boxed_no_ptr:(fun _ -> "    g_value_set_boxed(&prop_gvalue, &c_value);\n")
      ~gen_object:(fun _ -> "    g_value_set_object(&prop_gvalue, c_value);\n")
      ~gen_pointer:(fun _ -> "    g_value_set_pointer(&prop_gvalue, c_value);\n")
      category

  let generate_gvalue_getter_assignment ~ml_name ~prop ~c_type_name ~prop_info =
    let category = classify_gvalue_type ~c_type_name prop_info in
    generate_getter_for_category ~ml_name ~prop ~c_type_name category

  let generate_gvalue_setter_assignment ~ml_name ~prop:_ ~prop_info =
    let category = classify_gvalue_type ~c_type_name:(prop_info.Type_analysis.base_type) prop_info in
    generate_setter_for_category ~ml_name ~c_type_name:(prop_info.Type_analysis.base_type) category
end

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

(* Re-export commonly used functions at top level for backward compatibility *)
type property_gvalue_info = Type_analysis.property_gvalue_info

(* Accumulator for parameter processing - kept at top level for record field access *)
type param_acc = { ocaml_idx : int; decls : Buffer.t; args : string list; cleanups : string list }

let analyze_property_type = Type_analysis.analyze_property_type
let is_copy_method = Type_analysis.is_copy_method
let is_free_method = Type_analysis.is_free_method
let is_copy_or_free = Type_analysis.is_copy_or_free
let fold_mapi = Type_analysis.fold_mapi
let list_contains = Type_analysis.list_contains
let is_string_type = Type_analysis.is_string_type
let generate_array_ml_to_c = Array_conv.generate_array_ml_to_c
let generate_array_c_to_ml = Array_conv.generate_array_c_to_ml
let is_string_array = Array_conv.is_string_array
let generate_gvalue_getter_assignment = GValue.generate_gvalue_getter_assignment
let generate_gvalue_setter_assignment = GValue.generate_gvalue_setter_assignment
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
