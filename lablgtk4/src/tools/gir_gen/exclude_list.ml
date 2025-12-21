(* Exclusion lists and filtering logic for GIR Code Generator *)

open StdLabels
open Printf

let variadic_function_exclude_list =
  [
    "gtk_text_buffer_insert_with_tags";
    "gtk_text_buffer_insert_with_tags_by_name";
    "gtk_text_buffer_create_tag";
  ]

let is_variadic_function c_identifier =
  List.mem c_identifier ~set:variadic_function_exclude_list

let platform_specific_type_exclude_list =
  [
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
  List.mem type_name ~set:platform_specific_type_exclude_list

(* Normalized type names (namespace and Gtk prefix stripped) that should be skipped wherever they appear *)
let type_name_exclude_list =
  List.map ~f:String.lowercase_ascii platform_specific_type_exclude_list

let is_excluded_type_name name =
  let normalized = Utils.normalize_class_name name |> String.lowercase_ascii in
  List.mem normalized ~set:type_name_exclude_list

(* Specific functions that should not be generated *)
let function_exclude_list = [ "gtk_tree_model_filter_get_virtual_root" ]
let is_excluded_function name = List.mem name ~set:function_exclude_list

let should_skip_class class_name =
  (* Removed skip list to allow wholesale regeneration of all classes *)
  let skip_list =
    [
      (* Print-related classes are platform-specific *)
      "PrintJob";
      "PrintUnixDialog";
      "PageSetupUnixDialog";
      "Printer";
      (* All other classes now allowed for generation *)
    ]
  in
  List.mem class_name ~set:skip_list

let should_skip_method ~find_type_mapping ~enums:_ ~bitfields:_
    (meth : Types.gir_method) =
  (* Skip if return type is unknown and not void *)
  let has_unknown_return =
    if meth.Types.return_type.Types.c_type <> Some "void" then
      match find_type_mapping meth.Types.return_type with
      | None ->
          eprintf "Skipping method %s: unknown return type %s\n"
            meth.Types.method_name meth.Types.return_type.Types.name;
          true
      | Some _ -> false
    else false
  in

  (* Skip if any parameter has an unknown type *)
  let has_unknown_params =
    List.exists
      ~f:(fun (p : Types.gir_param) ->
        match find_type_mapping p.Types.param_type with
        | None ->
            eprintf
              "Skipping method %s: unknown parameter type %s for parameter %s\n"
              meth.Types.method_name p.Types.param_type.Types.name
              p.Types.param_name;
            true
        | Some _ -> false)
      meth.Types.parameters
  in

  Printf.eprintf "Exclude_list.should_skip_method: %s -> %s=%b %b\n"
    meth.Types.method_name meth.Types.return_type.name has_unknown_return
    has_unknown_params;
  has_unknown_return || has_unknown_params
