(* C Stub Code Generation *)

open StdLabels
open Printf
open Types

let nullable_c_to_ml_expr ~var ~(gir_type : gir_type) ~(mapping : type_mapping) =
  if not gir_type.nullable then
    sprintf "%s(%s)" mapping.c_to_ml var
  else
    match gir_type.c_type with
    | "gchararray" | "gchar*" | "utf8" | "const gchar*" | "const char*" ->
      sprintf "Val_option_string(%s)" var
    | "GtkWidget*" ->
      sprintf "Val_GtkWidget_option(%s)" var
    | _ when mapping.c_to_ml = "Val_GtkWidget" ->
      sprintf "Val_GtkWidget_option(%s)" var
    | _ when String.length gir_type.c_type > 0 &&
             String.sub gir_type.c_type ~pos:(String.length gir_type.c_type - 1) ~len:1 = "*" ->
      sprintf "Val_option(%s, %s)" var mapping.c_to_ml
    | _ ->
      sprintf "%s(%s)" mapping.c_to_ml var

let nullable_ml_to_c_expr ~var ~(gir_type : gir_type) ~(mapping : type_mapping) =
  if not gir_type.nullable then
    sprintf "%s(%s)" mapping.ml_to_c var
  else
    match gir_type.c_type with
    | "gchararray" | "gchar*" | "utf8" | "const gchar*" | "const char*" ->
      sprintf "String_option_val(%s)" var
    | "GtkWidget*" ->
      sprintf "GtkWidget_option_val(%s)" var
    | "GtkEventController*" ->
      sprintf "GtkEventController_option_val(%s)" var
    | _ when String.length gir_type.c_type > 0 &&
             String.sub gir_type.c_type ~pos:(String.length gir_type.c_type - 1) ~len:1 = "*" ->
      sprintf "Option_val(%s, %s, NULL)" var mapping.ml_to_c
    | _ ->
      sprintf "%s(%s)" mapping.ml_to_c var

let emit_enum_proto buf ~namespace (enum : gir_enum) =
  bprintf buf "value Val_%s%s(%s val);\n" namespace enum.enum_name enum.enum_c_type;
  bprintf buf "%s %s%s_val(value val);\n" enum.enum_c_type namespace enum.enum_name

let emit_bitfield_proto buf ~namespace (bitfield : gir_bitfield) =
  (* Special case: GdkPixbufFormatFlags is in GIR but marked skip in C headers *)
  if bitfield.bitfield_c_type = "GdkPixbufFormatFlags" then begin
    bprintf buf "/* GdkPixbufFormatFlags is in GIR but marked skip in C headers */\n";
    bprintf buf "#ifndef GDK_PIXBUF_FORMAT_WRITABLE\n";
    bprintf buf "typedef enum {\n";
    List.iter ~f:(fun flag ->
      bprintf buf "  %s = %d,\n" flag.flag_c_identifier flag.flag_value;
    ) bitfield.flags;
    bprintf buf "} GdkPixbufFormatFlags;\n";
    bprintf buf "#endif\n";
  end;
  bprintf buf "value Val_%s%s(%s flags);\n" namespace bitfield.bitfield_name bitfield.bitfield_c_type;
  bprintf buf "%s %s%s_val(value list);\n" bitfield.bitfield_c_type namespace bitfield.bitfield_name

type property_gvalue_info = {
  base_type : string;
  base_lower : string;
  has_pointer : bool;
  pointer_like : bool;
  record_info : (gir_record * bool * bool) option;
  class_info : gir_class option;
  is_enum : bool;
  is_bitfield : bool;
}

let list_contains ~value list =
  List.exists list ~f:(fun candidate -> candidate = value)

let analyze_property_type ~ctx (gir_type : gir_type) =
  let normalized = Type_mappings.normalize_c_pointer_type gir_type.c_type |> String.trim in
  let rec find_last idx =
    if idx < 0 then None
    else
      match String.get normalized idx with
      | ' ' | '\t' -> find_last (idx - 1)
      | '*' -> Some idx
      | _ -> None
  in
  let (base_type, has_pointer) =
    match find_last (String.length normalized - 1) with
    | Some idx ->
        let stripped = String.trim (String.sub normalized ~pos:0 ~len:idx) in
        (stripped, true)
    | None -> (normalized, false)
  in
  let base_lower = String.lowercase_ascii base_type in
  let record_info = Type_mappings.find_record_mapping ctx.records gir_type.c_type in
  let class_info = Type_mappings.find_class_mapping ctx.classes gir_type.c_type in
  let is_enum =
    List.exists ctx.enums ~f:(fun e ->
      e.enum_c_type = base_type || e.enum_c_type = gir_type.c_type)
  in
  let is_bitfield =
    List.exists ctx.bitfields ~f:(fun b ->
      b.bitfield_c_type = base_type || b.bitfield_c_type = gir_type.c_type)
  in
  let pointer_like =
    has_pointer ||
    List.exists ["gpointer"; "gconstpointer"] ~f:(fun candidate -> candidate = base_lower)
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
  }

let string_base_types = ["gchar"; "char"; "utf8"; "gchararray"]
let int32_types = ["gint"; "int"; "gint32"; "int32"; "gint16"; "int16"; "gint8"; "int8"]
let uint32_types = ["guint"; "uint"; "guint32"; "uint32"; "guint16"; "uint16"; "guint8"; "uint8"]
let int64_types = ["gint64"; "int64"]
let uint64_types = ["guint64"; "uint64"]
let long_types = ["glong"; "long"; "goffset"; "off_t"]
let ulong_types = ["gulong"; "ulong"]
let ssize_types = ["gssize"; "ssize_t"]
let size_types = ["gsize"; "size_t"]
let float_types = ["gfloat"; "float"]
let double_types = ["gdouble"; "double"]

let generate_gvalue_getter_assignment ~ml_name ~prop ~c_type_name ~prop_info =
  let base_lower = prop_info.base_lower in
  let fallback =
    sprintf "    caml_failwith(\"%s: unsupported property type '%s'\");\n"
      ml_name prop.prop_name
  in
  if prop_info.is_enum then
    sprintf "    prop_value = (%s)g_value_get_enum(&prop_gvalue);\n" c_type_name
  else if prop_info.is_bitfield then
    sprintf "    prop_value = (%s)g_value_get_flags(&prop_gvalue);\n" c_type_name
  else if base_lower = "gboolean" then
    "    prop_value = g_value_get_boolean(&prop_gvalue);\n"
  else if list_contains ~value:base_lower int32_types then
    sprintf "    prop_value = (%s)g_value_get_int(&prop_gvalue);\n" c_type_name
  else if list_contains ~value:base_lower uint32_types then
    sprintf "    prop_value = (%s)g_value_get_uint(&prop_gvalue);\n" c_type_name
  else if list_contains ~value:base_lower int64_types then
    sprintf "    prop_value = (%s)g_value_get_int64(&prop_gvalue);\n" c_type_name
  else if list_contains ~value:base_lower uint64_types then
    sprintf "    prop_value = (%s)g_value_get_uint64(&prop_gvalue);\n" c_type_name
  else if list_contains ~value:base_lower long_types then
    sprintf "    prop_value = (%s)g_value_get_long(&prop_gvalue);\n" c_type_name
  else if list_contains ~value:base_lower ulong_types then
    sprintf "    prop_value = (%s)g_value_get_ulong(&prop_gvalue);\n" c_type_name
  else if list_contains ~value:base_lower ssize_types then
    sprintf "    prop_value = (%s)g_value_get_ssize(&prop_gvalue);\n" c_type_name
  else if list_contains ~value:base_lower size_types then
    sprintf "    prop_value = (%s)g_value_get_size(&prop_gvalue);\n" c_type_name
  else if list_contains ~value:base_lower double_types then
    "    prop_value = g_value_get_double(&prop_gvalue);\n"
  else if list_contains ~value:base_lower float_types then
    "    prop_value = g_value_get_float(&prop_gvalue);\n"
  else if prop_info.has_pointer && list_contains ~value:base_lower string_base_types then
    "    prop_value = g_value_get_string(&prop_gvalue);\n"
  else
    match prop_info.record_info with
    | Some (record, is_pointer, _) ->
        if is_pointer then
          sprintf "    prop_value = (%s*)g_value_get_boxed(&prop_gvalue);\n" record.c_type
        else
          (* For non-pointer records (value-like structs), we can use the boxed pointer directly *)
          sprintf "    prop_value = (%s*)g_value_get_boxed(&prop_gvalue);\n" record.c_type
    | None ->
        if Option.is_some prop_info.class_info then
          sprintf "    prop_value = (%s)g_value_get_object(&prop_gvalue);\n" c_type_name
        else if prop_info.pointer_like then
          sprintf "    prop_value = (%s)g_value_get_pointer(&prop_gvalue);\n" c_type_name
        else
          fallback
let generate_gvalue_setter_assignment ~ml_name ~prop ~prop_info =
  let base_lower = prop_info.base_lower in
  let fallback =
    sprintf "    caml_failwith(\"%s: unsupported property type '%s'\");\n"
      ml_name prop.prop_name
  in
  if prop_info.is_enum then
    "    g_value_set_enum(&prop_gvalue, c_value);\n"
  else if prop_info.is_bitfield then
    "    g_value_set_flags(&prop_gvalue, c_value);\n"
  else if base_lower = "gboolean" then
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
  else if prop_info.has_pointer && list_contains ~value:base_lower string_base_types then
    "    g_value_set_string(&prop_gvalue, c_value);\n"
  else
    match prop_info.record_info with
    | Some (_, is_pointer, _) ->
        if is_pointer then
          "    g_value_set_boxed(&prop_gvalue, c_value);\n"
        else
          "    g_value_set_boxed(&prop_gvalue, &c_value);\n"
    | None ->
        if Option.is_some prop_info.class_info then
          "    g_value_set_object(&prop_gvalue, c_value);\n"
        else if prop_info.pointer_like then
          "    g_value_set_pointer(&prop_gvalue, c_value);\n"
        else
          fallback


(* Generate common header file with forward declarations for enum/bitfield converters *)
let value_record_macros = ["GtkTreeIter"; "GtkTextIter"; "GtkRequisition"; "GtkBorder"]

let is_value_like_record (record : gir_record) =
  List.mem record.c_type ~set:value_record_macros
  || (List.length record.fields > 0 && List.length record.constructors = 0)

let generate_forward_decls_header ~classes ~gtk_enums ~gtk_bitfields ~external_enums ~external_bitfields ~records =
  let buf = Buffer.create 4096 in
  Buffer.add_string buf "/**************************************************************************/\n";
  Buffer.add_string buf "/*                LablGTK4 - OCaml bindings for GTK4                      */\n";
  Buffer.add_string buf "/*                                                                        */\n";
  Buffer.add_string buf "/*    This program is free software; you can redistribute it              */\n";
  Buffer.add_string buf "/*    and/or modify it under the terms of the GNU Library General         */\n";
  Buffer.add_string buf "/*    Public License as published by the Free Software Foundation         */\n";
  Buffer.add_string buf "/*    version 2, with the exception described in file COPYING which       */\n";
  Buffer.add_string buf "/*    comes with the library.                                             */\n";
  Buffer.add_string buf "/*                                                                        */\n";
  Buffer.add_string buf "/**************************************************************************/\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "/* GENERATED CODE - DO NOT EDIT */\n";
  Buffer.add_string buf "/* Forward declarations for generated enum and bitfield converters */\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "#ifndef _gtk4_generated_forward_decls_\n";
  Buffer.add_string buf "#define _gtk4_generated_forward_decls_\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "#include <gtk/gtk.h>\n";
  Buffer.add_string buf "#include <gdk-pixbuf/gdk-pixbuf.h>\n";
  Buffer.add_string buf "#include <graphene.h>\n";
  Buffer.add_string buf "#include <caml/mlvalues.h>\n";
  Buffer.add_string buf "\n";

  (* Add common type conversions used by all generated files *)
  Buffer.add_string buf "/* Type conversions - use direct cast (GObjects) */\n";
  Buffer.add_string buf "#define GtkEventController_val(val) ((GtkEventController*)ext_of_val(val))\n";
  Buffer.add_string buf "#define Val_GtkEventController(obj) ((value)(val_of_ext(obj)))\n";
  Buffer.add_string buf "/* Note: GtkWidget_val and Val_GtkWidget are defined in wrappers.h */\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "/* Class-specific conversion macros (shared) */\n";
  let seen = Hashtbl.create 97 in
  List.iter ~f:(fun (cls : gir_class) ->
    if not (Hashtbl.mem seen cls.c_type) then begin
      Hashtbl.add seen cls.c_type ();
      if cls.c_type <> "GtkWidget" && cls.c_type <> "GtkEventController" then begin
        bprintf buf "#ifndef Val_%s\n" cls.c_type;
        bprintf buf "#define %s_val(val) ((%s*)ext_of_val(val))\n" cls.c_type cls.c_type;
        bprintf buf "#define Val_%s(obj) ((value)(val_of_ext(obj)))\n" cls.c_type;
        bprintf buf "#endif /* Val_%s */\n\n" cls.c_type;
      end
    end
  ) classes;
  List.iter ~f:(fun (record : gir_record) ->
    if (Type_mappings.is_boxed_record record || record.disguised) && not (Hashtbl.mem seen record.c_type) then begin
      Hashtbl.add seen record.c_type ();
      bprintf buf "#ifndef Val_%s\n" record.c_type;
      if not record.opaque then begin
        bprintf buf "#define %s_val(val) ((%s*)ml_gir_record_ptr_val((val), \"%s\"))\n" record.c_type record.c_type record.c_type;
        bprintf buf "#define Val_%s_ptr(ptr) ml_gir_record_alloc((ptr), sizeof(%s), \"%s\", NULL)\n" record.c_type record.c_type record.c_type;
        if List.mem record.c_type ~set:value_record_macros then begin
          bprintf buf "#define Val_%s(obj) Val_%s_ptr(&(obj))\n" record.c_type record.c_type;
          bprintf buf "#define Val_%s_option(ptr) ((ptr) ? Val_some(Val_%s_ptr(ptr)) : Val_none)\n" record.c_type record.c_type;
        end else begin
          bprintf buf "#define Val_%s(obj) Val_%s_ptr(obj)\n" record.c_type record.c_type;
          bprintf buf "#define Val_%s_option(ptr) ((ptr) ? Val_some(Val_%s_ptr(ptr)) : Val_none)\n" record.c_type record.c_type;
        end
      end else begin
        bprintf buf "#define %s_val(val) ((%s*)ext_of_val(val))\n" record.c_type record.c_type;
        bprintf buf "#define Val_%s(obj) ((value)(val_of_ext(obj)))\n" record.c_type;
      end;
      bprintf buf "#endif /* Val_%s */\n\n" record.c_type;
    end
  ) records;

  (* Special-case value structs that are returned via out parameters *)
  Buffer.add_string buf "/* Value-returning structs copied into OCaml */\n";
  Buffer.add_string buf "#ifndef Val_GtkTreeIter\n";
  Buffer.add_string buf "#define GtkTreeIter_val(val) ((GtkTreeIter*)ext_of_val(val))\n";
  Buffer.add_string buf "#define Val_GtkTreeIter(obj) copy_GtkTreeIter(&(obj))\n";
  Buffer.add_string buf "#define Val_GtkTreeIter_option(ptr) ((ptr) ? Val_some(copy_GtkTreeIter(ptr)) : Val_none)\n";
  Buffer.add_string buf "#endif /* Val_GtkTreeIter */\n\n";

  Buffer.add_string buf "#ifndef Val_GtkTextIter\n";
  Buffer.add_string buf "#define GtkTextIter_val(val) ((GtkTextIter*)ext_of_val(val))\n";
  Buffer.add_string buf "#define Val_GtkTextIter(obj) copy_GtkTextIter(&(obj))\n";
  Buffer.add_string buf "#define Val_GtkTextIter_option(ptr) ((ptr) ? Val_some(copy_GtkTextIter(ptr)) : Val_none)\n";
  Buffer.add_string buf "#endif /* Val_GtkTextIter */\n\n";

  Buffer.add_string buf "#ifndef Val_GtkRequisition\n";
  Buffer.add_string buf "#define GtkRequisition_val(val) ((GtkRequisition*)ext_of_val(val))\n";
  Buffer.add_string buf "#define Val_GtkRequisition(obj) copy_GtkRequisition(&(obj))\n";
  Buffer.add_string buf "#define Val_GtkRequisition_option(ptr) ((ptr) ? Val_some(copy_GtkRequisition(ptr)) : Val_none)\n";
  Buffer.add_string buf "#endif /* Val_GtkRequisition */\n\n";

  Buffer.add_string buf "#ifndef Val_GtkBorder\n";
  Buffer.add_string buf "#define GtkBorder_val(val) ((GtkBorder*)ext_of_val(val))\n";
  Buffer.add_string buf "#define Val_GtkBorder(obj) copy_GtkBorder(&(obj))\n";
  Buffer.add_string buf "#define Val_GtkBorder_option(ptr) ((ptr) ? Val_some(copy_GtkBorder(ptr)) : Val_none)\n";
  Buffer.add_string buf "#endif /* Val_GtkBorder */\n\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "/* Phase 5.3: Option type conversions for nullable parameters */\n";
  Buffer.add_string buf "#define GtkWidget_option_val(v) ((v) == Val_none ? NULL : GtkWidget_val(Some_val(v)))\n";
  Buffer.add_string buf "#define GtkEventController_option_val(v) ((v) == Val_none ? NULL : GtkEventController_val(Some_val(v)))\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "/* Const-safe string extraction for setters */\n";
  Buffer.add_string buf "#define ML_DECL_CONST_STRING(name, expr) const gchar *name = (const gchar *)(expr)\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "/* GdkEvent conversions - from ml_event_controller.c */\n";
  Buffer.add_string buf "#define GdkEvent_val(val) ((GdkEvent*)ext_of_val(val))\n";
  Buffer.add_string buf "#define Val_GdkEvent(obj) ((value)(val_of_ext(obj)))\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "/* Note: Res_Ok, Res_Error, ValUnit, and Val_GError are defined in wrappers.h */\n";
  Buffer.add_string buf "\n";

  (* Add forward declarations for Gtk enum/bitfield converters *)
  if List.length gtk_enums > 0 || List.length gtk_bitfields > 0 then begin
    Buffer.add_string buf "/* Forward declarations for Gtk enum/bitfield converters */\n";
    List.iter ~f:(fun (enum : gir_enum) ->
      bprintf buf "value Val_Gtk%s(%s val);\n" enum.enum_name enum.enum_c_type;
      bprintf buf "%s Gtk%s_val(value val);\n" enum.enum_c_type enum.enum_name;
    ) gtk_enums;
    Buffer.add_string buf "\n";
    List.iter ~f:(fun (bitfield : gir_bitfield) ->
      bprintf buf "value Val_Gtk%s(%s flags);\n" bitfield.bitfield_name bitfield.bitfield_c_type;
      bprintf buf "%s Gtk%s_val(value list);\n" bitfield.bitfield_c_type bitfield.bitfield_name;
    ) gtk_bitfields;
    Buffer.add_string buf "\n";
  end;

  (* Add forward declarations for external namespace enum/bitfield converters *)
  if List.length external_enums > 0 || List.length external_bitfields > 0 then begin
    Buffer.add_string buf "\n/* Forward declarations for external namespace enum/bitfield converters */\n";
    List.iter ~f:(fun (ns, enum : string * gir_enum) ->
      emit_enum_proto buf ~namespace:ns enum;
    ) external_enums;
    Buffer.add_string buf "\n";
    List.iter ~f:(fun (ns, bitfield : string * gir_bitfield) ->
      emit_bitfield_proto buf ~namespace:ns bitfield;
    ) external_bitfields;
  end;

  Buffer.add_string buf "\n";
  Buffer.add_string buf "#endif /* _gtk4_generated_forward_decls_ */\n";
  Buffer.contents buf

(* Generate C file header with common includes and type conversions *)
let generate_c_file_header ?(class_name="") ?(c_type="") ?(external_enums=[]) ?(external_bitfields=[]) () =
  let _ = (external_enums, external_bitfields) in
  let buf = Buffer.create 1024 in
  Buffer.add_string buf "/* GENERATED CODE - DO NOT EDIT */\n";
  if class_name <> "" then
    bprintf buf "/* C bindings for %s */\n" class_name
  else
    Buffer.add_string buf "/* Generated from Gtk-4.0.gir */\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "#include <gtk/gtk.h>\n";
  Buffer.add_string buf "#include <caml/mlvalues.h>\n";
  Buffer.add_string buf "#include <caml/memory.h>\n";
  Buffer.add_string buf "#include <caml/alloc.h>\n";
  Buffer.add_string buf "#include <caml/callback.h>\n";
  Buffer.add_string buf "#include <caml/fail.h>\n";
  Buffer.add_string buf "#include <caml/hash.h>\n";
  Buffer.add_string buf "#include <caml/custom.h>\n";
  Buffer.add_string buf "#include \"wrappers.h\"\n";
  Buffer.add_string buf "#include \"ml_gobject.h\"\n";
  Buffer.add_string buf "\n";

  (* Include common header for type conversions and forward declarations *)
  Buffer.add_string buf "/* Include common type conversions and forward declarations */\n";
  Buffer.add_string buf "#include \"generated_forward_decls.h\"\n";
  Buffer.add_string buf "\n";

  (* Generate type-specific conversion macros for this class *)
  if c_type <> "" && c_type <> "GtkWidget" && c_type <> "GtkEventController" then begin
    bprintf buf "/* Type-specific conversion macros for %s */\n" c_type;
    bprintf buf "#ifndef Val_%s\n" c_type;
    bprintf buf "#define %s_val(val) ((%s*)ext_of_val(val))\n" c_type c_type;
    bprintf buf "#define Val_%s(obj) ((value)(val_of_ext(obj)))\n" c_type;
    bprintf buf "#endif /* Val_%s */\n\n" c_type;
  end;

  Buffer.contents buf

let generate_c_constructor ~ctx ~c_type (ctor : gir_constructor) _class_name =
  let c_name = ctor.c_identifier in
  let ml_name =
    let prefixed = Str.global_replace (Str.regexp "^gtk_") "ml_gtk_" c_name in
    if String.length prefixed >= 3 && String.sub prefixed ~pos:0 ~len:3 = "ml_" then
      prefixed
    else
      "ml_" ^ c_name
  in

  let val_macro = sprintf "Val_%s" c_type in
  let var_name = "obj" in

  (* Generate parameters *)
  let param_count = if List.length ctor.ctor_parameters = 0 then 1 else List.length ctor.ctor_parameters in
  let params =
    if List.length ctor.ctor_parameters = 0 then
      ["value unit"]
    else
      List.mapi ~f:(fun i _ -> sprintf "value arg%d" (i + 1)) ctor.ctor_parameters
  in
  let param_names =
    if List.length ctor.ctor_parameters = 0 then
      ["unit"]
    else
      List.mapi ~f:(fun i _ -> sprintf "arg%d" (i + 1)) ctor.ctor_parameters
  in

  (* Build C call arguments - handle nullable parameters *)
  let c_args =
    List.mapi ~f:(fun i p ->
      match Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type with
      | Some mapping ->
        let param_type = { p.param_type with nullable = p.nullable || p.param_type.nullable } in
        nullable_ml_to_c_expr ~var:(sprintf "arg%d" (i + 1)) ~gir_type:param_type ~mapping
      | None -> sprintf "arg%d" (i + 1)
    ) ctor.ctor_parameters
  in

  (* Handle >5 parameters with bytecode/native variants *)
  if param_count > 5 then begin
    let first_five = List.filteri ~f:(fun i _ -> i < 5) param_names in
    let rest = List.filteri ~f:(fun i _ -> i >= 5) param_names in

    let native_func = sprintf "\nCAMLexport CAMLprim value %s_native(%s)\n\
{\n\
    CAMLparam5(%s);\n\
    CAMLxparam%d(%s);\n\
    %s *%s = %s(%s);\n\
    CAMLreturn(%s(%s));\n\
}\n"
      ml_name
      (String.concat ~sep:", " params)
      (String.concat ~sep:", " first_five)
      (param_count - 5)
      (String.concat ~sep:", " rest)
      c_type var_name c_name (String.concat ~sep:", " c_args)
      val_macro var_name
    in

    let bytecode_func = sprintf "\nCAMLexport CAMLprim value %s_bytecode(value * argv, int argn)\n\
{\n\
    return %s_native(%s);\n\
}\n"
      ml_name
      ml_name
      (String.concat ~sep:", " (List.mapi ~f:(fun i _ -> sprintf "argv[%d]" i) param_names))
    in

    native_func ^ bytecode_func
  end else begin
    sprintf "\nCAMLexport CAMLprim value %s(%s)\n\
{\n\
    CAMLparam%d(%s);\n\
    %s *%s = %s(%s);\n\
    CAMLreturn(%s(%s));\n\
}\n"
      ml_name
      (String.concat ~sep:", " params)
      param_count
      (String.concat ~sep:", " param_names)
      c_type var_name c_name (String.concat ~sep:", " c_args)
      val_macro var_name
  end

let generate_c_method ~ctx ~c_type (meth : gir_method) class_name =
  let c_name = meth.c_identifier in
  let ml_name = Utils.ml_method_name ~class_name meth
    
  in
  let in_params = List.filter ~f:(fun p -> p.direction <> Out) meth.parameters in
  let param_count = 1 + List.length in_params in
  let params = "value self" ::
    List.mapi ~f:(fun i _ -> sprintf "value arg%d" (i + 1)) in_params in
  let param_names = "self" ::
    List.mapi ~f:(fun i _ -> sprintf "arg%d" (i + 1)) in_params in

  let type_val_macro = sprintf "%s_val" c_type in
  let self_cast = sprintf "%s(self)" type_val_macro in

  (* Build C call - handle nullable parameters *)
  let out_decls, c_args =
    let ocaml_idx = ref 0 in
    let out_decl_buf = Buffer.create 128 in
    let args = ref [] in
    List.iteri ~f:(fun i p ->
      match p.direction with
      | Out ->
        let var_name = sprintf "out%d" (i + 1) in
        let base_c_type =
          if String.length p.param_type.c_type > 0 &&
             String.sub p.param_type.c_type ~pos:(String.length p.param_type.c_type - 1) ~len:1 = "*"
          then String.sub p.param_type.c_type ~pos:0 ~len:(String.length p.param_type.c_type - 1)
          else p.param_type.c_type
        in
        bprintf out_decl_buf "%s %s;\n" base_c_type var_name;
        args := !args @ [sprintf "&%s" var_name]
      | In | InOut ->
        incr ocaml_idx;
        let arg_name = sprintf "arg%d" !ocaml_idx in
        let arg_expr = match Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type with
          | Some mapping ->
            let param_type = { p.param_type with nullable = p.nullable || p.param_type.nullable } in
            nullable_ml_to_c_expr ~var:arg_name ~gir_type:param_type ~mapping
          | None -> arg_name
        in
        args := !args @ [arg_expr]
    ) meth.parameters;
    Buffer.contents out_decl_buf, self_cast :: !args
  in

  (* Build return conversion *)
  let ret_type = meth.return_type.c_type in
  let locals = Buffer.create 256 in
  if meth.throws then Buffer.add_string locals "GError *error = NULL;\n";
  Buffer.add_string locals out_decls;
  let locals = Buffer.contents locals in
  let (c_call, ret_conv) =
    let args = (String.concat ~sep:", " c_args) ^ (if meth.throws then ", &error" else "") in

    let out_conversions =
      List.filter_map ~f:(fun (p, idx) ->
        if p.direction = Out then
          let base_gir_type =
            if String.length p.param_type.c_type > 0 &&
               String.sub p.param_type.c_type ~pos:(String.length p.param_type.c_type - 1) ~len:1 = "*"
            then { p.param_type with c_type = String.sub p.param_type.c_type ~pos:0 ~len:(String.length p.param_type.c_type - 1) }
            else p.param_type
          in
          match Type_mappings.find_type_mapping_for_gir_type ~ctx base_gir_type with
          | Some mapping ->
            let var_name = sprintf "out%d" (idx + 1) in
            Some (nullable_c_to_ml_expr ~var:var_name ~gir_type:base_gir_type ~mapping)
          | None -> None
        else None
      ) (List.mapi ~f:(fun i p -> (p, i)) meth.parameters)
    in

    let combine_results ml_primary =
      match (ml_primary, out_conversions) with
      | (None, []) -> if meth.throws then
          "if (error == NULL) CAMLreturn(Res_Ok(ValUnit)); else CAMLreturn(Res_Error(Val_GError(error)));"
        else "CAMLreturn(Val_unit);"
      | (Some v, []) -> if meth.throws then
          sprintf "if (error == NULL) CAMLreturn(Res_Ok(%s)); else CAMLreturn(Res_Error(Val_GError(error)));" v
        else sprintf "CAMLreturn(%s);" v
      | (None, [single]) -> if meth.throws then
          "CAMLlocal1(ret);\n    ret = " ^ single ^ ";\n    if (error == NULL) CAMLreturn(Res_Ok(ret)); else CAMLreturn(Res_Error(Val_GError(error)));"
        else sprintf "CAMLreturn(%s);" single
      | (Some v, outs) ->
        let all = v :: outs in
        let stores = List.mapi ~f:(fun i expr -> sprintf "Store_field(ret, %d, %s);" i expr) all in
        let alloc = sprintf "ret = caml_alloc(%d, 0);" (List.length all) in
        if meth.throws then
          String.concat ~sep:"\n    " (
            ["CAMLlocal1(ret);"; alloc] @ stores @
            ["if (error == NULL) CAMLreturn(Res_Ok(ret)); else CAMLreturn(Res_Error(Val_GError(error)));"]
          )
        else
          String.concat ~sep:"\n    " (["CAMLlocal1(ret);"; alloc] @ stores @ ["CAMLreturn(ret);"])
      | (None, outs) ->
        let stores = List.mapi ~f:(fun i expr -> sprintf "Store_field(ret, %d, %s);" i expr) outs in
        let alloc = sprintf "ret = caml_alloc(%d, 0);" (List.length outs) in
        if meth.throws then
          String.concat ~sep:"\n    " (
            ["CAMLlocal1(ret);"; alloc] @ stores @
            ["if (error == NULL) CAMLreturn(Res_Ok(ret)); else CAMLreturn(Res_Error(Val_GError(error)));"]
          )
        else
          String.concat ~sep:"\n    " (["CAMLlocal1(ret);"; alloc] @ stores @ ["CAMLreturn(ret);"])
    in

    if ret_type = "void" then
      (sprintf "%s(%s);" c_name args, combine_results None)
    else
      match Type_mappings.find_type_mapping_for_gir_type ~ctx meth.return_type with
      | Some mapping ->
        let ml_result = nullable_c_to_ml_expr ~var:"result" ~gir_type:meth.return_type ~mapping in
        (sprintf "%s result = %s(%s);" ret_type c_name args,
         combine_results (Some ml_result))
      | None ->
        (sprintf "void *result = %s(%s);" c_name args,
         combine_results (Some "(value)result"))
  in

  (* For functions with >5 parameters, generate both bytecode and native variants *)
  if param_count > 5 then
    let first_five = List.filteri ~f:(fun i _ -> i < 5) param_names in
    let rest = List.filteri ~f:(fun i _ -> i >= 5) param_names in

    let native_func = sprintf "\nCAMLexport CAMLprim value %s_native(%s)\n\
{\n\
    CAMLparam5(%s);\n\
    CAMLxparam%d(%s);\n\
    %s\n\
    %s\n\
    %s\n\
}\n"
      ml_name
      (String.concat ~sep:", " params)
      (String.concat ~sep:", " first_five)
      (param_count - 5)
      (String.concat ~sep:", " rest)
      locals
      c_call
      ret_conv
    in

    let bytecode_func = sprintf "\nCAMLexport CAMLprim value %s_bytecode(value * argv, int argn)\n\
{\n\
    return %s_native(%s);\n\
}\n"
      ml_name
      ml_name
      (String.concat ~sep:", " (List.mapi ~f:(fun i _ -> sprintf "argv[%d]" i) param_names))
    in

    native_func ^ bytecode_func
  else
    sprintf "\nCAMLexport CAMLprim value %s(%s)\n\
{\n\
    CAMLparam%d(%s);\n\
    %s\n\
    %s\n\
    %s\n\
}\n"
      ml_name
      (String.concat ~sep:", " params)
      param_count
      (String.concat ~sep:", " param_names)
      locals
      c_call
      ret_conv

let generate_c_property_getter ~ctx ~c_type (prop : gir_property) class_name =

  let ml_name = Utils.ml_property_name ~class_name prop in

  (* Determine property type mapping *)
  let type_info = match Type_mappings.find_type_mapping_for_gir_type ~ctx prop.prop_type with
    | Some mapping -> mapping
    | None -> {
        ocaml_type = "unit";
        c_to_ml = "Val_unit";
        ml_to_c = "Unit_val";
        needs_copy = false;
        layer2_class = None;
      }
  in

  let ml_prop_value =
    nullable_c_to_ml_expr ~var:"prop_value" ~gir_type:prop.prop_type ~mapping:type_info
  in

  let c_cast = sprintf "%s_val" c_type in
  let normalized = Utils.normalize_class_name prop.prop_type.c_type in
  let record_match =
    List.find_opt ctx.records ~f:(fun r ->
      let rname = Utils.normalize_class_name r.record_name in
      let rc = Utils.normalize_class_name r.c_type in
      rname = normalized || rc = normalized)
  in
  let c_type_name =
    match record_match with
    | Some record ->
      let base = record.c_type in
      if String.contains prop.prop_type.c_type '*' then base ^ "*" else base
    | None -> prop.prop_type.c_type
  in

  let record_info = Type_mappings.find_record_mapping ctx.records prop.prop_type.c_type in
  let prop_info = analyze_property_type ~ctx prop.prop_type in
  let prop_record =
    match record_info with
    | Some (record, _, _) -> Some record
    | None -> None
  in
  let prop_record_is_pointer =
    match prop_record with
    | Some record -> not (is_value_like_record record)
    | None -> false
  in
  let record_pointer = Option.is_some record_match && String.contains prop.prop_type.c_type '*' in
  let prop_decl =
    match record_info with
    | Some (record, true, _) ->
        sprintf "    %s *prop_value;\n" record.c_type
    | Some (record, _, _) when prop_info.has_pointer ->
        sprintf "    %s *prop_value;\n" record.c_type
    | Some (record, _, _) when prop_record_is_pointer ->
        (* Value-like records should also use pointer since we get the boxed pointer directly *)
        sprintf "    %s *prop_value;\n" record.c_type
    | _ when record_pointer ->
        (match record_match with
        | Some record -> sprintf "    %s *prop_value;\n" record.c_type
        | None -> sprintf "    %s *prop_value;\n" c_type_name)
    | _ ->
      if String.contains prop.prop_type.c_type '*' then
        sprintf "    %s *prop_value;\n" c_type_name
      else
        sprintf "    %s prop_value;\n" c_type_name
  in
  let gvalue_assignment = generate_gvalue_getter_assignment ~ml_name ~prop ~c_type_name ~prop_info in
  sprintf "\nCAMLexport CAMLprim value %s(value self)\n\
{\n\
    CAMLparam1(self);\n\
    CAMLlocal1(result);\n\
    %s *obj = (%s *)%s(self);\n\
%s\
    GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), \"%s\");\n\
    if (pspec == NULL) caml_failwith(\"%s: property '%s' not found\");\n\
    GValue prop_gvalue = G_VALUE_INIT;\n\
    g_value_init(&prop_gvalue, pspec->value_type);\n\
    g_object_get_property(G_OBJECT(obj), \"%s\", &prop_gvalue);\n\
%s\n\
    result = %s;\n\
    g_value_unset(&prop_gvalue);\n\
    CAMLreturn(result);\n\
}\n"
    ml_name
    c_type c_type c_cast
    prop_decl
    prop.prop_name
    ml_name prop.prop_name
    prop.prop_name
    gvalue_assignment
    ml_prop_value

let generate_c_property_setter ~ctx ~c_type (prop : gir_property) class_name =
  let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
  let prop_snake = Utils.to_snake_case prop_name_cleaned in
  let class_snake = Utils.to_snake_case class_name in
  let ml_name = sprintf "ml_gtk_%s_set_%s" class_snake prop_snake in

  (* Determine property type mapping *)
  let type_info = match Type_mappings.find_type_mapping_for_gir_type ~ctx prop.prop_type with
    | Some mapping -> mapping
    | None -> {
        ocaml_type = "unit";
        c_to_ml = "Val_unit";
        ml_to_c = "Unit_val";
        needs_copy = false;
        layer2_class = None;
      }
  in

  let c_value_expr =
    nullable_ml_to_c_expr ~var:"new_value" ~gir_type:prop.prop_type ~mapping:type_info
  in

  let value_declaration =
    match String.lowercase_ascii prop.prop_type.c_type with
    | "gchar*" | "gchararray" | "utf8" | "const gchar*" | "const char*" ->
      sprintf "    ML_DECL_CONST_STRING(c_value, %s);\n" c_value_expr
    | _ ->
      sprintf "    %s c_value = %s;\n" prop.prop_type.c_type c_value_expr
  in

  let c_cast = sprintf "%s_val" c_type in
  let prop_info = analyze_property_type ~ctx prop.prop_type in
  let setter_assignment = generate_gvalue_setter_assignment ~ml_name ~prop ~prop_info in

  sprintf "\nCAMLexport CAMLprim value %s(value self, value new_value)\n\
{\n\
    CAMLparam2(self, new_value);\n\
    %s *obj = (%s *)%s(self);\n\
%s\
    GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), \"%s\");\n\
    if (pspec == NULL) caml_failwith(\"%s: property '%s' not found\");\n\
    GValue prop_gvalue = G_VALUE_INIT;\n\
    g_value_init(&prop_gvalue, pspec->value_type);\n\
%s\
    g_object_set_property(G_OBJECT(obj), \"%s\", &prop_gvalue);\n\
    g_value_unset(&prop_gvalue);\n\
    CAMLreturn(Val_unit);\n\
}\n"
    ml_name
    c_type c_type c_cast
    value_declaration
    prop.prop_name
    ml_name prop.prop_name
    setter_assignment
    prop.prop_name

(* Generate complete C file for a single class/interface *)
let generate_class_c_code ~ctx ~c_type class_name constructors methods properties =
  let buf = Buffer.create 4096 in

  (* Add header *)
  Buffer.add_string buf (generate_c_file_header ~class_name ~c_type ~external_enums:ctx.external_enums ~external_bitfields:ctx.external_bitfields ());

  (* Constructors - skip those that throw GError or are variadic *)
  List.iter ~f:(fun ctor ->
    if (not ctor.throws) && (not (Filtering.constructor_has_varargs ctor)) then
      Buffer.add_string buf (generate_c_constructor ~ctx ~c_type ctor class_name)
  ) constructors;

  (* Generate methods, skip duplicates *)
  List.iter ~f:(fun (meth : gir_method) ->
    let should_skip =
      Filtering.should_skip_method_binding
        ~ctx  meth
    in
    if not should_skip then
      Buffer.add_string buf (generate_c_method ~ctx ~c_type meth class_name)
  ) (List.rev methods);

  (* Generate property getters and setters *)
  List.iter ~f:(fun (prop : gir_property) ->
    if Filtering.should_generate_property ~ctx ~class_name ~methods prop then begin
      if prop.readable then
        Buffer.add_string buf (generate_c_property_getter ~ctx ~c_type prop class_name);
      if prop.writable && not prop.construct_only then
        Buffer.add_string buf (generate_c_property_setter ~ctx ~c_type prop class_name);
    end
  ) properties;

  Buffer.contents buf

let generate_record_c_code ~ctx (record : gir_record) =
  let buf = Buffer.create 2048 in

  Buffer.add_string buf (generate_c_file_header ~class_name:record.record_name ~c_type:record.c_type ~external_enums:ctx.external_enums ~external_bitfields:ctx.external_bitfields ());

  let class_snake = Utils.to_snake_case record.record_name in
  let is_copy_or_free (meth : gir_method) =
    let lower_name = String.lowercase_ascii meth.method_name in
    let lower_cid = String.lowercase_ascii meth.c_identifier in
    let ends_with suffix str =
      let len_s = String.length suffix and len_str = String.length str in
      len_str >= len_s && String.sub str ~pos:(len_str - len_s) ~len:len_s = suffix
    in
    lower_name = "copy" || lower_name = "free" ||
    ends_with "_copy" lower_cid || ends_with "_free" lower_cid
  in

  (* Override conversion macros to accept both abstract and custom blocks, and add owned wrappers for non-opaque records. *)
  let is_value_record = is_value_like_record record in

  if (not record.opaque) && (not is_value_record) then begin
    bprintf buf "/* Custom ownership helpers for %s */\n" record.c_type;
    bprintf buf "static inline %s *%s_ptr_val(value v) {\n" record.c_type record.c_type;
    bprintf buf "  if (Tag_val(v) == Custom_tag) return *(%s **)Data_custom_val(v);\n" record.c_type;
    bprintf buf "  else return (%s*)ext_of_val(v);\n" record.c_type;
    bprintf buf "}\n";
    bprintf buf "static void finalize_%s(value v) {\n" record.c_type;
    bprintf buf "  %s *ptr = (%s*)%s_ptr_val(v);\n" record.c_type record.c_type record.c_type;
    bprintf buf "  if (ptr != NULL) g_free(ptr);\n";
    bprintf buf "}\n";
    bprintf buf "static struct custom_operations %s_custom_ops = {\n" record.c_type;
    bprintf buf "  \"%s_custom\",\n" record.c_type;
    bprintf buf "  finalize_%s,\n" record.c_type;
    bprintf buf "  custom_compare_default,\n";
    bprintf buf "  custom_hash_default,\n";
    bprintf buf "  custom_serialize_default,\n";
    bprintf buf "  custom_deserialize_default,\n";
    bprintf buf "  custom_compare_ext_default\n";
    bprintf buf "};\n";
    bprintf buf "static value Val_owned_%s(%s *ptr) {\n" record.c_type record.c_type;
    bprintf buf "  CAMLparam0();\n";
    bprintf buf "  CAMLlocal1(v);\n";
    bprintf buf "  v = caml_alloc_custom(&%s_custom_ops, sizeof(%s*), 0, 1);\n" record.c_type record.c_type;
    bprintf buf "  *(%s**)Data_custom_val(v) = ptr;\n" record.c_type;
    bprintf buf "  CAMLreturn(v);\n";
    bprintf buf "}\n";
    bprintf buf "#undef %s_val\n" record.c_type;
    bprintf buf "#define %s_val(v) (%s_ptr_val(v))\n\n" record.c_type record.c_type;
  end;

  List.iter ~f:(fun ctor ->
    if (not ctor.throws) && (not (Filtering.constructor_has_varargs ctor)) then
      Buffer.add_string buf (generate_c_constructor ~ctx ~c_type:record.c_type ctor record.record_name)
  ) record.constructors;

  (* Synthetic allocator for non-opaque records without constructors *)
  if (not record.opaque) && (not is_value_record) && record.constructors = [] then begin
    let ml_name = sprintf "ml_gtk_%s_new" class_snake in
    bprintf buf "\n/* Synthetic allocator for non-opaque record %s */\n" record.record_name;
    bprintf buf "CAMLexport CAMLprim value %s(value unit)\n{\n" ml_name;
    bprintf buf "    CAMLparam1(unit);\n";
    bprintf buf "    %s *obj = g_new0(%s, 1);\n" record.c_type record.c_type;
    bprintf buf "    if (obj == NULL) caml_failwith(\"%s allocation failed\");\n" record.c_type;
    bprintf buf "    CAMLreturn(Val_owned_%s(obj));\n" record.c_type;
    bprintf buf "}\n";
  end;

  List.iter ~f:(fun (meth : gir_method) ->
    let should_skip =
      Filtering.should_skip_method_binding
        ~ctx
        
        meth
    in
    if (not should_skip) && (not (is_copy_or_free meth)) then
      Buffer.add_string buf (generate_c_method ~ctx ~c_type:record.c_type meth record.record_name)
  ) (List.rev record.methods);

  Buffer.contents buf
