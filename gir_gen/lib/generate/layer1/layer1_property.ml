(* Layer 1 Property - Property generation for OCaml interfaces *)

open Gen_buffer
open Types

(** Generate a property getter external declaration *)
let generate_property_getter ~ctx ~class_name ~buf (prop : gir_property)
    type_mapping =
  let prop_snake, prop_ocaml_type =
    Layer1_helpers.property_naming ~prop ~type_mapping
  in
  let getter_name = Fmt.str "get_%s" prop_snake in
  let c_getter = Utils.ml_property_name ~ctx ~class_name prop in
  let doc =
    Entity_doc.property
      ~refs:(Doc_resolve.env_of_ctx ctx)
      ~accessor:Entity_doc.Getter prop
  in
  bprintf buf "%s" (Doc_emit.before_item doc);
  bprintf buf "external %s : t -> %s = \"%s\"\n\n" getter_name prop_ocaml_type
    c_getter;
  bprintf buf "%s" (Doc_emit.after_item doc)

(** Generate a property setter external declaration *)
let generate_property_setter ~ctx ~class_name ~buf (prop : gir_property)
    type_mapping =
  let prop_snake, prop_ocaml_type =
    Layer1_helpers.property_naming ~prop ~type_mapping
  in
  let setter_name = Fmt.str "set_%s" prop_snake in
  let c_setter = Utils.ml_property_setter_name ~ctx ~class_name prop in
  let doc =
    Entity_doc.property
      ~refs:(Doc_resolve.env_of_ctx ctx)
      ~accessor:Entity_doc.Setter prop
  in
  bprintf buf "%s" (Doc_emit.before_item doc);
  bprintf buf "external %s : t -> %s -> unit = \"%s\"\n\n" setter_name
    prop_ocaml_type c_setter;
  bprintf buf "%s" (Doc_emit.after_item doc)

(** Generate a property's getter and/or setter declarations. The caller selects
    the properties and accessors ({!Emitted_members.l1_properties}), so that
    layer 0 (C stubs) and layer 1 (OCaml externals) agree on what is emitted. *)
let generate_property_decl ~ctx ~class_name ~buf
    ({ prop; getter; setter } : Emitted_members.accessors) =
  Option.iter (fun type_mapping ->
      if getter then
        generate_property_getter ~ctx ~class_name ~buf prop type_mapping;
      if setter then
        generate_property_setter ~ctx ~class_name ~buf prop type_mapping)
  @@ Type_mappings.find_type_mapping_for_gir_type ~ctx prop.prop_type
