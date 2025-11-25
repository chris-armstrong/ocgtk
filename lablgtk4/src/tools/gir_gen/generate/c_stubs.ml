(* C Stub Code Generation *)

open StdLabels
open Printf
open Types

(* Generate common header file with forward declarations for enum/bitfield converters *)
let generate_forward_decls_header ~classes ~external_enums ~external_bitfields =
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
  Buffer.add_string buf "\n";
  Buffer.add_string buf "/* Phase 5.3: Option type conversions for nullable parameters */\n";
  Buffer.add_string buf "#define GtkWidget_option_val(v) ((v) == Val_none ? NULL : GtkWidget_val(Some_val(v)))\n";
  Buffer.add_string buf "#define GtkEventController_option_val(v) ((v) == Val_none ? NULL : GtkEventController_val(Some_val(v)))\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "/* GdkEvent conversions - from ml_event_controller.c */\n";
  Buffer.add_string buf "#define GdkEvent_val(val) ((GdkEvent*)ext_of_val(val))\n";
  Buffer.add_string buf "#define Val_GdkEvent(obj) ((value)(val_of_ext(obj)))\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "/* Note: Res_Ok, Res_Error, ValUnit, and Val_GError are defined in wrappers.h */\n";
  Buffer.add_string buf "\n";

  (* Add forward declarations for external namespace enum/bitfield converters *)
  if List.length external_enums > 0 || List.length external_bitfields > 0 then begin
    Buffer.add_string buf "/* Forward declarations for external namespace enum/bitfield converters */\n";
    List.iter ~f:(fun (ns, enum : string * gir_enum) ->
      bprintf buf "value Val_%s%s(%s val);\n" ns enum.enum_name enum.enum_c_type;
      bprintf buf "%s %s%s_val(value val);\n" enum.enum_c_type ns enum.enum_name;
    ) external_enums;
    Buffer.add_string buf "\n";
    List.iter ~f:(fun (ns, bitfield : string * gir_bitfield) ->
      bprintf buf "value Val_%s%s(%s flags);\n" ns bitfield.bitfield_name bitfield.bitfield_c_type;
      bprintf buf "%s %s%s_val(value list);\n" bitfield.bitfield_c_type ns bitfield.bitfield_name;
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

let generate_c_constructor ~classes ~enums ~bitfields ~c_type (ctor : gir_constructor) _class_name =
  let c_name = ctor.c_identifier in
  let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in

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
      match Type_mappings.find_type_mapping ~enums ~bitfields ~classes p.param_type.c_type with
      | Some mapping ->
        if p.nullable then
          if p.param_type.c_type = "GtkWidget*" then
            sprintf "GtkWidget_option_val(arg%d)" (i + 1)
          else if String.length p.param_type.c_type > 3 &&
                  String.sub p.param_type.c_type ~pos:(String.length p.param_type.c_type - 1) ~len:1 = "*" then
            sprintf "(Is_some(arg%d) ? %s(Some_val(arg%d)) : NULL)" (i + 1) mapping.ml_to_c (i + 1)
          else
            sprintf "%s(arg%d)" mapping.ml_to_c (i + 1)
        else
          sprintf "%s(arg%d)" mapping.ml_to_c (i + 1)
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

let generate_c_method ~classes ~enums ~bitfields ~c_type (meth : gir_method) _class_name =
  let c_name = meth.c_identifier in
  let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in
  let param_count = 1 + List.length meth.parameters in
  let params = "value self" ::
    List.mapi ~f:(fun i _ -> sprintf "value arg%d" (i + 1)) meth.parameters in
  let param_names = "self" ::
    List.mapi ~f:(fun i _ -> sprintf "arg%d" (i + 1)) meth.parameters in

  let type_val_macro = sprintf "%s_val" c_type in
  let self_cast = sprintf "%s(self)" type_val_macro in

  (* Build C call - handle nullable parameters *)
  let c_args = self_cast ::
    List.mapi ~f:(fun i p ->
      match Type_mappings.find_type_mapping ~enums ~bitfields ~classes p.param_type.c_type with
      | Some mapping ->
        if p.nullable then
          if p.param_type.c_type = "GtkWidget*" then
            sprintf "GtkWidget_option_val(arg%d)" (i + 1)
          else if p.param_type.c_type = "GtkCheckButton*" then
            sprintf "(Is_some(arg%d) ? GtkWidget_val(Some_val(arg%d)) : NULL)" (i + 1) (i + 1)
          else if String.length p.param_type.c_type > 3 &&
                  String.sub p.param_type.c_type ~pos:(String.length p.param_type.c_type - 1) ~len:1 = "*" then
            sprintf "(Is_some(arg%d) ? %s(Some_val(arg%d)) : NULL)" (i + 1) mapping.ml_to_c (i + 1)
          else
            sprintf "%s(arg%d)" mapping.ml_to_c (i + 1)
        else
          sprintf "%s(arg%d)" mapping.ml_to_c (i + 1)
      | None -> sprintf "arg%d" (i + 1)
    ) meth.parameters in

  (* Build return conversion *)
  let ret_type = meth.return_type.c_type in
  let locals = if meth.throws then
    sprintf "GError *error = NULL;\n"
  else "" in
  let (c_call, ret_conv) =
    let args = (String.concat ~sep:", " c_args) ^ (if meth.throws then ", &error" else "") in

    if ret_type = "void" then
      (sprintf "%s(%s);" c_name args,
       if meth.throws then
         "if (error == NULL) CAMLreturn(Res_Ok(ValUnit)); else CAMLreturn(Res_Error(Val_GError(error)));"
         else "CAMLreturn(Val_unit);")
    else
      match Type_mappings.find_type_mapping ~enums ~bitfields ~classes ret_type with
      | Some mapping ->
        (sprintf "%s result = %s(%s);" ret_type c_name args,
         if meth.throws then
            sprintf "if (error == NULL) CAMLreturn(Res_Ok(%s(result))); else CAMLreturn(Res_Error(Val_GError(error)));" mapping.c_to_ml
         else sprintf "CAMLreturn(%s(result));" mapping.c_to_ml)
      | None ->
        (sprintf "void *result = %s(%s);" c_name args,
         if meth.throws then
           "if (error == NULL) CAMLreturn(Res_Ok((value)result)); else CAMLreturn(Res_Error(Val_GError(error)));"
         else "CAMLreturn((value)result);")
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

let generate_c_property_getter ~classes ~enums ~bitfields ~c_type (prop : gir_property) class_name =
  let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
  let prop_snake = Utils.to_snake_case prop_name_cleaned in
  let class_snake = Utils.to_snake_case class_name in
  let ml_name = sprintf "ml_gtk_%s_get_%s" class_snake prop_snake in

  (* Determine property type mapping *)
  let type_info = match Type_mappings.find_type_mapping ~enums ~bitfields ~classes prop.prop_type.c_type with
    | Some mapping -> mapping
    | None -> {
        ocaml_type = "unit";
        c_to_ml = "Val_unit";
        ml_to_c = "Unit_val";
        needs_copy = false;
      }
  in

  let c_cast = sprintf "%s_val" c_type in
  let c_type_name = c_type in

  sprintf "\nCAMLexport CAMLprim value %s(value self)\n\
{\n\
    CAMLparam1(self);\n\
    CAMLlocal1(result);\n\
    %s *obj = (%s *)%s(self);\n\
    %s prop_value;\n\
    g_object_get(G_OBJECT(obj), \"%s\", &prop_value, NULL);\n\
    result = %s(prop_value);\n\
    CAMLreturn(result);\n\
}\n"
    ml_name
    c_type_name c_type_name c_cast
    prop.prop_type.c_type
    prop.prop_name
    type_info.c_to_ml

let generate_c_property_setter ~classes ~enums ~bitfields ~c_type (prop : gir_property) class_name =
  let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
  let prop_snake = Utils.to_snake_case prop_name_cleaned in
  let class_snake = Utils.to_snake_case class_name in
  let ml_name = sprintf "ml_gtk_%s_set_%s" class_snake prop_snake in

  (* Determine property type mapping *)
  let type_info = match Type_mappings.find_type_mapping ~enums ~bitfields ~classes prop.prop_type.c_type with
    | Some mapping -> mapping
    | None -> {
        ocaml_type = "unit";
        c_to_ml = "Val_unit";
        ml_to_c = "Unit_val";
        needs_copy = false;
      }
  in

  let c_cast = sprintf "%s_val" c_type in
  let c_type_name = c_type in

  sprintf "\nCAMLexport CAMLprim value %s(value self, value new_value)\n\
{\n\
    CAMLexport CAMLparam2(self, new_value);\n\
    %s *obj = (%s *)%s(self);\n\
    %s c_value = %s(new_value);\n\
    g_object_set(G_OBJECT(obj), \"%s\", c_value, NULL);\n\
    CAMLreturn(Val_unit);\n\
}\n"
    ml_name
    c_type_name c_type_name c_cast
    prop.prop_type.c_type type_info.ml_to_c
    prop.prop_name

(* Generate complete C file for a single class/interface *)
let generate_class_c_code ~classes ~enums ~bitfields ~external_enums ~external_bitfields ~c_type class_name constructors methods properties =
  let buf = Buffer.create 4096 in

  (* Add header *)
  Buffer.add_string buf (generate_c_file_header ~class_name ~c_type ~external_enums ~external_bitfields ());

  (* Constructors - skip those that throw GError *)
  List.iter ~f:(fun ctor ->
    if not ctor.throws then
      Buffer.add_string buf (generate_c_constructor ~classes ~enums ~bitfields ~c_type ctor class_name)
  ) constructors;

  (* Build list of property names to avoid duplicates *)
  let property_method_names = ref [] in
  List.iter ~f:(fun (prop : gir_property) ->
    let has_type_mapping = match Type_mappings.find_type_mapping ~enums ~bitfields ~classes prop.prop_type.c_type with
      | Some _ -> true
      | None -> false
    in
    if has_type_mapping then begin
      let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
      let prop_snake = Utils.to_snake_case prop_name_cleaned in
      if prop.readable then
        property_method_names := (sprintf "get_%s" prop_snake) :: !property_method_names;
      if prop.writable && not prop.construct_only then
        property_method_names := (sprintf "set_%s" prop_snake) :: !property_method_names;
    end
  ) properties;

  (* Generate methods, skip duplicates *)
  List.iter ~f:(fun (meth : gir_method) ->
    let c_name = meth.c_identifier in
    let class_snake = Utils.to_snake_case class_name in
    let ocaml_name = Utils.to_snake_case (
      Str.global_replace (Str.regexp (sprintf "gtk_%s_" class_snake)) "" c_name
    ) in
    let has_blacklisted_type =
      Blacklists.is_blacklisted_type_name meth.return_type.name ||
      Blacklists.is_blacklisted_type_name meth.return_type.c_type ||
      List.exists meth.parameters ~f:(fun p ->
        Blacklists.is_blacklisted_type_name p.param_type.name ||
        Blacklists.is_blacklisted_type_name p.param_type.c_type)
    in
    (* Skip if: variadic function, duplicates property, or unmapped return type *)
    let should_skip =
      (meth.parameters |> List.exists ~f:(fun p -> p.varargs)) ||
      List.mem ocaml_name ~set:!property_method_names ||
      has_blacklisted_type ||
      Blacklists.should_skip_method ~find_type_mapping:(Type_mappings.find_type_mapping ~enums ~bitfields ~classes) ~enums ~bitfields meth
    in
    if not should_skip then
      Buffer.add_string buf (generate_c_method ~classes ~enums ~bitfields ~c_type meth class_name)
  ) (List.rev methods);

  (* Generate property getters and setters *)
  List.iter ~f:(fun (prop : gir_property) ->
    let is_blacklisted =
      Blacklists.is_blacklisted_type_name prop.prop_type.name ||
      Blacklists.is_blacklisted_type_name prop.prop_type.c_type
    in
    let is_simple_type = not is_blacklisted && match Type_mappings.find_type_mapping ~enums ~bitfields ~classes prop.prop_type.c_type with
      | Some _ -> true
      | None -> false
    in
    if is_simple_type then begin
      if prop.readable then
        Buffer.add_string buf (generate_c_property_getter ~classes ~enums ~bitfields ~c_type prop class_name);
      if prop.writable && not prop.construct_only then
        Buffer.add_string buf (generate_c_property_setter ~classes ~enums ~bitfields ~c_type prop class_name);
    end
  ) properties;

  Buffer.contents buf
