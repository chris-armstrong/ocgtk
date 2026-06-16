(* L2 class method generation for record field accessors.
   Generates getter/setter methods in class bodies/types and the module-level
   [make] constructor that wraps the L1 make external. *)

[@@@warning "-32"]

open StdLabels
open Printf
open Types

let method_snake_names methods =
  List.map methods ~f:(fun m -> Utils.to_snake_case m.method_name)

let find_l2_class_for_field ~ctx (fi : Field_analysis.field_info) =
  Option.bind fi.field_gir_type (fun gir_type ->
      Class_gen_type_resolution.find_layer2_class_for_type ~ctx gir_type)

let field_l2_type ~ctx ~current_layer2_module (fi : Field_analysis.field_info) =
  match find_l2_class_for_field ~ctx fi with
  | Some lc ->
      Class_gen_type_resolution.qualify_layer2_class_type ~current_layer2_module lc
  | None -> fi.ocaml_type

let getter_method_impl ~ctx ~current_layer2_module ~layer1_module_name fi =
  let name = fi.Field_analysis.field_name in
  let l2_class = find_l2_class_for_field ~ctx fi in
  let l2_type =
    match l2_class with
    | Some lc ->
        Class_gen_type_resolution.qualify_layer2_class_type ~current_layer2_module lc
    | None -> fi.ocaml_type
  in
  match l2_class with
  | Some lc ->
      let cls =
        Class_gen_type_resolution.qualify_layer2_class_name
          ~current_layer2_module lc
      in
      sprintf "  method get_%s : %s = new %s (%s.get_%s obj)\n" name l2_type cls
        layer1_module_name name
  | None ->
      sprintf "  method get_%s : %s = %s.get_%s obj\n" name l2_type
        layer1_module_name name

let setter_method_impl ~ctx ~current_layer2_module ~layer1_module_name fi =
  let name = fi.Field_analysis.field_name in
  let l2_class = find_l2_class_for_field ~ctx fi in
  let l2_type =
    match l2_class with
    | Some lc ->
        Class_gen_type_resolution.qualify_layer2_class_type ~current_layer2_module lc
    | None -> fi.ocaml_type
  in
  match l2_class with
  | Some lc ->
      sprintf
        "  method set_%s : %s -> unit = fun v -> %s.set_%s obj (v#%s)\n" name
        l2_type layer1_module_name name lc.class_layer1_accessor
  | None ->
      sprintf "  method set_%s : %s -> unit = fun v -> %s.set_%s obj v\n" name
        l2_type layer1_module_name name

let getter_method_sig ~ctx ~current_layer2_module fi =
  let l2_type = field_l2_type ~ctx ~current_layer2_module fi in
  sprintf "  method get_%s : %s\n" fi.Field_analysis.field_name l2_type

let setter_method_sig ~ctx ~current_layer2_module fi =
  let l2_type = field_l2_type ~ctx ~current_layer2_module fi in
  sprintf "  method set_%s : %s -> unit\n" fi.Field_analysis.field_name l2_type

let iter_active_fields ~fields ~field_infos ~methods ~f =
  let mnames = method_snake_names methods in
  List.iter fields ~f:(fun (field : gir_record_field) ->
      let snake = Utils.to_snake_case field.field_name in
      match
        List.find_opt
          ~f:(fun fi ->
            String.equal (fi : Field_analysis.field_info).field_name snake)
          field_infos
      with
      | None -> ()
      | Some fi -> f field fi snake mnames)

let method_name_conflicts ~prefix ~snake ~mnames =
  List.exists mnames ~f:(String.equal (prefix ^ snake))

(** Generate field getter/setter method implementations for the class body. *)
let generate_field_methods ~ctx ~layer1_module_name ~current_layer2_module
    ~fields ~field_infos ~methods ~buf =
  let mnames = method_snake_names methods in
  iter_active_fields ~fields ~field_infos ~methods
    ~f:(fun field fi snake _mnames ->
      if
        Field_filter.should_generate_field_getter field
        && not (method_name_conflicts ~prefix:"get_" ~snake ~mnames)
      then
        Buffer.add_string buf
          (getter_method_impl ~ctx ~current_layer2_module ~layer1_module_name fi);
      if
        Field_filter.should_generate_field_setter field
        && not (method_name_conflicts ~prefix:"set_" ~snake ~mnames)
      then
        Buffer.add_string buf
          (setter_method_impl ~ctx ~current_layer2_module ~layer1_module_name fi))

(** Generate field getter/setter method signatures for the class type definition. *)
let generate_field_method_sigs ~ctx ~current_layer2_module ~fields ~field_infos
    ~methods ~buf =
  let mnames = method_snake_names methods in
  iter_active_fields ~fields ~field_infos ~methods
    ~f:(fun field fi snake _mnames ->
      if
        Field_filter.should_generate_field_getter field
        && not (method_name_conflicts ~prefix:"get_" ~snake ~mnames)
      then
        Buffer.add_string buf (getter_method_sig ~ctx ~current_layer2_module fi);
      if
        Field_filter.should_generate_field_setter field
        && not (method_name_conflicts ~prefix:"set_" ~snake ~mnames)
      then
        Buffer.add_string buf (setter_method_sig ~ctx ~current_layer2_module fi))

(* Safe OCaml parameter name: sanitize reserved keywords by appending '_'. *)
let safe_param_name name = Utils.sanitize_identifier name

(** Generate module-level [make] function implementation for records. *)
let generate_field_make_fn ~ctx ~class_snake ~class_type_name
    ~layer1_module_name ~current_layer2_module ~field_infos ~buf =
  match field_infos with
  | [] -> ()
  | _ ->
      let param_list =
        List.map field_infos ~f:(fun fi ->
            let l2_type = field_l2_type ~ctx ~current_layer2_module fi in
            let pname = safe_param_name fi.Field_analysis.field_name in
            sprintf "(%s : %s)" pname l2_type)
      in
      bprintf buf "let make %s : %s =\n"
        (String.concat ~sep:" " param_list)
        class_type_name;
      let args =
        List.map field_infos ~f:(fun fi ->
            let pname = safe_param_name fi.Field_analysis.field_name in
            match find_l2_class_for_field ~ctx fi with
            | Some lc -> sprintf "%s#%s" pname lc.class_layer1_accessor
            | None -> pname)
      in
      bprintf buf "  new %s (%s.make %s)\n\n" class_snake layer1_module_name
        (String.concat ~sep:" " args)

(** Generate module-level [make] function signature for records. *)
let generate_field_make_fn_sig ~ctx ~class_type_name ~current_layer2_module
    ~field_infos ~buf =
  match field_infos with
  | [] -> ()
  | _ ->
      let param_types =
        List.map field_infos ~f:(field_l2_type ~ctx ~current_layer2_module)
      in
      bprintf buf "val make : %s\n"
        (String.concat ~sep:" -> " (param_types @ [ class_type_name ]))
