(* Blacklists and filtering logic for GIR Code Generator *)

open StdLabels
open Printf

let variadic_function_blacklist = [
  "gtk_text_buffer_insert_with_tags";
  "gtk_text_buffer_insert_with_tags_by_name";
  "gtk_text_buffer_create_tag";
]

let is_variadic_function c_identifier =
  List.mem c_identifier ~set:variadic_function_blacklist

let platform_specific_type_blacklist = [
  "PrintCapabilities";
  "PageSetup";
  "PageSetupUnixDialog";
  "PrintSettings";
  "PrintContext";
  "PrintOperation";
  "PrintOperationPreview";
  "PrintUnixDialog";
  "License";
]

let is_platform_specific_type type_name =
  List.mem type_name ~set:platform_specific_type_blacklist

let should_skip_class class_name =
  let skip_list = [
    "PrintJob";
    "PrintUnixDialog";
    "PageSetupUnixDialog";
    "Printer";
    "Box";
    "Fixed";
    "Frame";
    "Grid";
    "Notebook";
    "Paned";
    "Scrolled_window";
    "Snapshot";
    "Stack";
    "Widget";
    "Window";
  ] in
  List.mem class_name ~set:skip_list

let should_skip_method ~find_type_mapping ~enums:_ ~bitfields:_ (meth : Types.gir_method) =
  (* Skip if return type is unknown and not void *)
  let has_unknown_return =
    if meth.Types.return_type.Types.c_type <> "void" then
      match find_type_mapping meth.Types.return_type.Types.c_type with
      | None ->
        eprintf "Skipping method %s: unknown return type %s\n" meth.Types.method_name meth.Types.return_type.Types.c_type;
        true
      | Some _ -> false
    else
      false
  in

  (* Skip if any parameter has an unknown type *)
  let has_unknown_params =
    List.exists ~f:(fun (p : Types.gir_param) ->
      match find_type_mapping p.Types.param_type.Types.c_type with
      | None ->
        eprintf "Skipping method %s: unknown parameter type %s for parameter %s\n"
          meth.Types.method_name p.Types.param_type.Types.c_type p.Types.param_name;
        true
      | Some _ -> false
    ) meth.Types.parameters
  in

  has_unknown_return || has_unknown_params
