(* C Stub Code Generation - Property Support *)

open Printf
open Containers
open StdLabels
open Types

module Log =
  (val Logs.src_log
          (Logs.Src.create "gir_gen.c_stub_property"
             ~doc:"C stub code generation for property support"))

(* Template record for property wrapper sections *)
type property_wrapper_template = {
  header : string;
  locals : string;
  obj_decl : string;
  pspec_find : string;
  pspec_check : string;
  gvalue_init : string;
  operation : string;
  gvalue_unset : string;
  footer : string;
}

(* [get_c_type_str ~ctx gir_type] retrieves the C type string representation for a GIR type.
   Returns the c_type directly if present, otherwise consults the type mapping context.
   Falls back to "void" if no mapping is found. *)
let get_c_type_str ~ctx (gir_type : gir_type) =
  match gir_type.c_type with
  | Some c_type -> c_type
  | None ->
      Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type
      |> Option.map (fun tm -> tm.c_type)
      |> Option.value ~default:"void"

(* [generate_property_wrapper ~ctx ~c_type prop class_name ~is_getter
    ~c_to_ml_expr ~ml_to_c_expr ~gvalue_assignment ~result_expr ~caml_params ~caml_locals] generates a C wrapper
    function for both property getters and setters. Uses a template-based approach with named sections
    for clearer code structure. *)
let generate_property_wrapper ~ctx ~c_type (prop : gir_property) class_name ~is_getter
    ~c_to_ml_expr ~ml_to_c_expr ~gvalue_assignment ~result_expr ~caml_params ~caml_locals =
  let prop_info = C_stub_helpers.analyze_property_type ~ctx prop.prop_type in
  let c_cast = sprintf "%s_val" c_type in

  let prop_name =
    if is_getter then Utils.ml_property_name ~class_name prop
    else
      let prop_name_cleaned =
        String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name
      in
      let prop_snake = Utils.to_snake_case prop_name_cleaned in
      let class_snake = Utils.to_snake_case class_name in
      sprintf "ml_gtk_%s_set_%s" class_snake prop_snake
  in

  let value_declaration =
    if is_getter then
      let c_type_name = get_c_type_str ~ctx prop.prop_type in
      let prop_pointer = if prop_info.stack_allocated then "" else "*" in
      sprintf "    %s %sprop_value;\n" c_type_name prop_pointer
    else
      let type_info =
        Type_mappings.find_type_mapping_for_gir_type ~ctx prop.prop_type
        |> Option.value ~default:C_stub_helpers.default_type_mapping
      in
      let is_string_type =
        prop.prop_type.c_type
        |> Option.map (fun ct ->
            List.exists ~f:(fun s -> String.equal s ct)
              [ "gchar*"; "gchararray"; "utf8"; "const gchar*"; "const char*" ])
        |> Option.value ~default:false
      in
      if is_string_type then
        sprintf "    ML_DECL_CONST_STRING(c_value, %s);\n" ml_to_c_expr
      else
        let pointer_prefix = if prop_info.stack_allocated then "" else "*" in
        sprintf "    %s %sc_value = %s;\n" type_info.c_type pointer_prefix ml_to_c_expr
  in

  let property_operation =
    if is_getter then
      sprintf "      g_object_get_property(G_OBJECT(obj), \"%s\", &prop_gvalue);\n      %s\n      result = %s;\n"
        prop.prop_name gvalue_assignment c_to_ml_expr
    else
      sprintf "      %sg_object_set_property(G_OBJECT(obj), \"%s\", &prop_gvalue);\n"
        gvalue_assignment prop.prop_name
  in

  (* Template-based code generation with named sections *)
  let template = {
    header = sprintf "\nCAMLexport CAMLprim value %s(%s)\n{\n" prop_name caml_params;
    locals = caml_locals;
    obj_decl = sprintf "%s *obj = (%s *)%s(self);\n" c_type c_type c_cast;
    pspec_find = sprintf "%sGParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), \"%s\");\n" value_declaration prop.prop_name;
    pspec_check = sprintf "if (pspec == NULL) caml_failwith(\"%s: property '%s' not found\");\n" prop_name prop.prop_name;
    gvalue_init = "GValue prop_gvalue = G_VALUE_INIT;\ng_value_init(&prop_gvalue, pspec->value_type);\n";
    operation = property_operation;
    gvalue_unset = "g_value_unset(&prop_gvalue);\n";
    footer = sprintf "%s}\n" result_expr;
  } in

  (* Render template sections in order *)
  let buf = Buffer.create 256 in
  Buffer.add_string buf template.header;
  Buffer.add_string buf template.locals;
  Buffer.add_string buf template.obj_decl;
  Buffer.add_string buf template.pspec_find;
  Buffer.add_string buf template.pspec_check;
  Buffer.add_string buf template.gvalue_init;
  Buffer.add_string buf template.operation;
  Buffer.add_string buf template.gvalue_unset;
  Buffer.add_string buf template.footer;
  Buffer.contents buf

(* [generate_c_property_getter ~ctx ~c_type prop class_name] generates a C wrapper function
   to read a GObject property via g_object_get_property. Initializes GValue for the property,
   reads the property value via g_object_get_property, converts from C GValue to OCaml value
   using type mapping, and unsets the GValue. Properly declares property variable as stack or
   heap allocated based on property type analysis. Returns the complete C function code. *)
let generate_c_property_getter ~ctx ~c_type (prop : gir_property) class_name =
  let type_info =
    Type_mappings.find_type_mapping_for_gir_type ~ctx prop.prop_type
    |> Option.value ~default:C_stub_helpers.default_type_mapping
  in

  let c_to_ml_expr =
    C_stub_helpers.nullable_c_to_ml_expr ~ctx ~var:"prop_value"
      ~gir_type:prop.prop_type ~mapping:type_info ()
  in

  let c_type_name = get_c_type_str ~ctx prop.prop_type in
  let gvalue_assignment =
    C_stub_helpers.generate_gvalue_getter_assignment ~ml_name:"getter" ~prop ~c_type_name
      ~prop_info:(C_stub_helpers.analyze_property_type ~ctx prop.prop_type)
  in

  generate_property_wrapper ~ctx ~c_type prop class_name ~is_getter:true
    ~c_to_ml_expr:c_to_ml_expr ~ml_to_c_expr:"" ~gvalue_assignment:gvalue_assignment
    ~result_expr:"CAMLreturn(result);"
    ~caml_params:"value self"
    ~caml_locals:"    CAMLparam1(self);\n    CAMLlocal1(result);\n"

(* [generate_c_property_setter ~ctx ~c_type prop class_name] generates a C wrapper function
   to write a GObject property via g_object_set_property. Converts OCaml value to C value,
   initializes GValue for the property, stores converted value in GValue, calls g_object_set_property,
   and unsets the GValue. Optimizes string types using const string declarations. Returns the
   complete C function code. *)
let generate_c_property_setter ~ctx ~c_type (prop : gir_property) class_name =
  let type_info =
    Type_mappings.find_type_mapping_for_gir_type ~ctx prop.prop_type
    |> Option.value ~default:C_stub_helpers.default_type_mapping
  in

  let ml_to_c_expr =
    C_stub_helpers.nullable_ml_to_c_expr ~var:"new_value"
      ~gir_type:prop.prop_type ~mapping:type_info
  in

  let prop_info = C_stub_helpers.analyze_property_type ~ctx prop.prop_type in
  let setter_assignment =
    C_stub_helpers.generate_gvalue_setter_assignment ~ml_name:"setter" ~prop_info
  in

  generate_property_wrapper ~ctx ~c_type prop class_name ~is_getter:false
    ~c_to_ml_expr:"" ~ml_to_c_expr:ml_to_c_expr ~gvalue_assignment:setter_assignment
    ~result_expr:"    CAMLreturn(Val_unit);\n"
    ~caml_params:"value self, value new_value"
    ~caml_locals:"    CAMLparam2(self, new_value);\n"
