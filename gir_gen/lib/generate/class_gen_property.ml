(* Property generation for class generation *)

(*E110-removed*)

open Types

(* Use Class_gen_helpers for shared functions
   Note: open StdLabels is needed here despite Class_gen_helpers having it,
   because opens don't propagate through include *)
include Class_gen_helpers

let map_param_sig ~ctx ~same_cluster_classes:_ ~current_layer2_module p =
  (* Regular type *)
  let gir_type =
    { p.param_type with nullable = p.nullable || p.param_type.nullable }
  in
  Class_gen_type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module
    ~gir_type
  |> require_type ~location:"map_param_sig.property"
       ~gir_type_name:gir_type.name

(* The accessors of a property, selected by [Emitted_members.l2]. *)
let generate_property_code ~generate_getter ~generate_setter
    ({ prop; getter; setter } : Emitted_members.accessors) =
  let prop_snake = Utils.ocaml_property_name prop.prop_name in
  (if getter then generate_getter prop prop_snake else "")
  ^ if setter then generate_setter prop prop_snake else ""

let generate_property_methods ~ctx ~module_name ~current_layer2_module
    ~same_cluster_classes:_ (accessors : Emitted_members.accessors) =
  let prop = accessors.prop in
  let generate_getter _prop prop_snake =
    let method_name = Emitted_members.l2_getter_name prop in
    let impl =
      match
        Class_gen_type_resolution.resolve_layer2_class_name ~ctx
          ~current_layer2_module ~gir_type:prop.prop_type
      with
      | Some class_name ->
          if prop.prop_type.nullable then
            Fmt.str "(%s.get_%s obj) |> Option.map (fun x -> new %s x)"
              module_name prop_snake class_name
          else
            Fmt.str "new %s (%s.get_%s obj)" class_name module_name prop_snake
      | _ -> Fmt.str "%s.get_%s obj" module_name prop_snake
    in
    Fmt.str "  method %s = %s\n" method_name impl
  in
  let generate_setter _prop prop_snake =
    let method_name = Emitted_members.l2_setter_name prop in

    let method_params_expr, value_resolve_expr, impl_wrapper =
      match
        Type_mappings.find_type_mapping_for_gir_type ~ctx prop.prop_type
      with
      | Some { layer2_class = Some class_info; _ } ->
          let class_ref =
            Class_gen_type_resolution.resolve_layer2_class_ref ~ctx
              ~current_layer2_module ~gir_type:prop.prop_type
            |> Option.value
                 ~default:(class_info.class_module ^ "." ^ class_info.class_type)
          in
          ( Fmt.str ": %s -> unit " class_ref,
            "v#" ^ class_info.class_layer1_accessor,
            "fun v -> " )
      | _ -> ("v", "v", "")
    in
    let impl =
      if prop.prop_type.nullable then
        Fmt.str
          "match %s with | Some v -> %s.set_%s obj v | None -> %s.set_%s obj \
           None"
          value_resolve_expr module_name prop_snake module_name prop_snake
      else Fmt.str "%s.set_%s obj %s" module_name prop_snake value_resolve_expr
    in
    Fmt.str "  method %s %s = %s %s\n" method_name method_params_expr
      impl_wrapper impl
  in
  generate_property_code ~generate_getter ~generate_setter accessors

let generate_property_signatures ~ctx ~class_name ~current_layer2_module
    ~same_cluster_classes (accessors : Emitted_members.accessors) =
  let prop = accessors.prop in
  let generate_getter _prop _prop_snake =
    let ocaml_type =
      match
        Class_gen_type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module
          ~gir_type:prop.prop_type
      with
      | None -> ""
      | Some ocaml_type ->
          if prop.prop_type.nullable then ocaml_type ^ " option" else ocaml_type
    in
    let method_name = Emitted_members.l2_getter_name prop in
    Doc_emit.around
      (Entity_doc.property
         ~refs:(Doc_resolve.class_member (Doc_resolve.env_of_ctx ctx))
         ~class_name ~accessor:Entity_doc.Getter prop)
      (Fmt.str "    method %s : %s\n" method_name ocaml_type)
  in
  let generate_setter _prop _prop_snake =
    let ocaml_type =
      map_param_sig ~ctx ~current_layer2_module ~same_cluster_classes
        {
          param_name = prop.prop_name;
          param_type = prop.prop_type;
          direction = Out;
          varargs = false;
          nullable = prop.prop_type.nullable;
          caller_allocates = false;
          param_doc = None;
        }
    in
    let method_name = Emitted_members.l2_setter_name prop in
    Doc_emit.around
      (Entity_doc.property
         ~refs:(Doc_resolve.class_member (Doc_resolve.env_of_ctx ctx))
         ~class_name ~accessor:Entity_doc.Setter prop)
      (Fmt.str "    method %s : %s -> unit\n" method_name ocaml_type)
  in
  generate_property_code ~generate_getter ~generate_setter accessors
