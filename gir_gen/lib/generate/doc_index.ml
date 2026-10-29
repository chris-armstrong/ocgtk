(* Doc_index — see doc_index.mli for the contract. *)

open StdLabels
open Types

let empty = StringMap.empty

let empty_namespace =
  {
    di_types = StringMap.empty;
    di_constants = StringMap.empty;
    di_members = StringMap.empty;
    di_enum_members = StringMap.empty;
    di_c_types = StringMap.empty;
    di_c_constants = StringMap.empty;
    di_c_symbols = StringMap.empty;
    di_members_listed = false;
  }

let add_all ~f items map =
  List.fold_left items ~init:map ~f:(fun map item ->
      let name, value = f item in
      StringMap.add name value map)

let variants member_names =
  add_all
    ~f:(fun name ->
      ( String.uppercase_ascii
          (String.map name ~f:(function '-' -> '_' | c -> c)),
        Enum_code.variant_name_of_member name ))
    member_names StringMap.empty

let add_c_symbols dc_kind ~type_name members map =
  add_all
    ~f:(fun (dc_member, c_identifier) ->
      (c_identifier, { dc_kind; dc_type = type_name; dc_member }))
    members map

(* The tables of one enumeration or bitfield, from its members' GIR names and
   C identifiers: the same for the current namespace and a references file. *)
let add_enum_members ~type_name members ns =
  {
    ns with
    di_enum_members =
      StringMap.add type_name
        (variants (List.map members ~f:fst))
        ns.di_enum_members;
    di_c_symbols =
      add_c_symbols Dc_enum_member ~type_name members ns.di_c_symbols;
  }

(* The tables of one class, interface or record, likewise *)
let add_type_members ~type_name ~members ~methods ~constructors ns =
  {
    ns with
    di_members = StringMap.add type_name members ns.di_members;
    di_c_symbols =
      ns.di_c_symbols
      |> add_c_symbols Dc_method ~type_name methods
      |> add_c_symbols Dc_constructor ~type_name constructors;
  }

let enum_members (e : gir_enum) =
  List.map e.members ~f:(fun (m : gir_enum_member) ->
      (m.member_name, m.c_identifier))

let bitfield_members (b : gir_bitfield) =
  List.map b.flags ~f:(fun (f : gir_bitfield_member) ->
      (f.flag_name, f.flag_c_identifier))

let method_symbols (e : entity) =
  List.map e.methods ~f:(fun (m : gir_method) ->
      (m.method_name, m.c_identifier))

let constructor_symbols (e : entity) =
  List.map e.constructors ~f:(fun (c : gir_constructor) ->
      (c.ctor_name, c.c_identifier))

let current_namespace ~classes ~interfaces ~records ~enums ~bitfields ~constants
    =
  let classes = List.filter ~f:Filtering.should_generate_class classes in
  let interfaces =
    List.filter ~f:Filtering.should_generate_interface interfaces
  in
  let records = List.filter ~f:Filtering.should_generate_record records in
  let constants = List.filter ~f:Constant_code.is_generated constants in
  let types =
    List.concat
      [
        List.map classes ~f:(fun (c : gir_class) ->
            (c.class_name, c.c_type, Dk_class));
        List.map interfaces ~f:(fun (i : gir_interface) ->
            (i.interface_name, i.c_type, Dk_interface));
        List.map records ~f:(fun (r : gir_record) ->
            (r.record_name, r.c_type, Dk_record));
        List.map enums ~f:(fun (e : gir_enum) ->
            (e.enum_name, e.enum_c_type, Dk_enum));
        List.map bitfields ~f:(fun (b : gir_bitfield) ->
            (b.bitfield_name, b.bitfield_c_type, Dk_bitfield));
      ]
  in
  let di_types =
    add_all ~f:(fun (name, _, kind) -> (name, kind)) types StringMap.empty
  in
  let di_c_types =
    add_all ~f:(fun (name, c_type, _) -> (c_type, name)) types StringMap.empty
  in
  let di_constants =
    add_all
      ~f:(fun (c : gir_constant) ->
        (c.constant_name, Constant_code.ocaml_name_of_constant c.constant_name))
      constants StringMap.empty
  in
  let di_c_constants =
    add_all
      ~f:(fun (c : gir_constant) -> (c.constant_c_type, c.constant_name))
      constants StringMap.empty
  in
  let ns =
    {
      empty_namespace with
      di_types;
      di_constants;
      di_c_types;
      di_c_constants;
      di_members_listed = true;
    }
  in
  let ns =
    List.fold_left enums ~init:ns ~f:(fun ns (e : gir_enum) ->
        add_enum_members ~type_name:e.enum_name (enum_members e) ns)
  in
  List.fold_left bitfields ~init:ns ~f:(fun ns (b : gir_bitfield) ->
      add_enum_members ~type_name:b.bitfield_name (bitfield_members b) ns)

let names_of_layer (l : cross_reference_layer_members) =
  {
    dm_methods = StringMap.of_list l.crl_methods;
    dm_constructors = StringMap.of_list l.crl_constructors;
    dm_signals = StringMap.of_list l.crl_signals;
    dm_properties = StringMap.of_list l.crl_properties;
  }

let layer_of_names (n : doc_member_names) =
  {
    crl_methods = StringMap.bindings n.dm_methods;
    crl_constructors = StringMap.bindings n.dm_constructors;
    crl_signals = StringMap.bindings n.dm_signals;
    crl_properties = StringMap.bindings n.dm_properties;
  }

let add_cross_reference_members ~type_name (m : cross_reference_members) ns =
  add_type_members ~type_name
    ~members:
      { dm_l1 = names_of_layer m.crm_l1; dm_l2 = names_of_layer m.crm_l2 }
    ~methods:m.crm_c_methods ~constructors:m.crm_c_constructors ns

(* A file lists member tables for every enumeration and bitfield, so one with
   no tables at all is a file from before they were written. *)
let lists_members (ncr : generation_context_namespace_cross_references) =
  StringMap.exists
    (fun _ (entity : cross_reference_entity) ->
      Option.is_some entity.cr_members || Option.is_some entity.cr_enum_members)
    ncr.ncr_entities

let of_cross_references (ncr : generation_context_namespace_cross_references) =
  StringMap.fold
    (fun _ (entity : cross_reference_entity) acc ->
      let type_name = entity.cr_name in
      let add_type kind =
        {
          acc with
          di_types = StringMap.add type_name kind acc.di_types;
          di_c_types = StringMap.add entity.cr_c_type type_name acc.di_c_types;
        }
      in
      let with_members ns =
        Option.fold ~none:ns
          ~some:(fun members ->
            add_cross_reference_members ~type_name members ns)
          entity.cr_members
      in
      let with_enum_members ns =
        Option.fold ~none:ns
          ~some:(fun members -> add_enum_members ~type_name members ns)
          entity.cr_enum_members
      in
      match entity.cr_type with
      | Crt_Class _ -> add_type Dk_class |> with_members
      | Crt_Interface -> add_type Dk_interface |> with_members
      | Crt_Record _ -> add_type Dk_record |> with_members
      | Crt_Enum -> add_type Dk_enum |> with_enum_members
      | Crt_Bitfield -> add_type Dk_bitfield |> with_enum_members
      | Crt_Constant ->
          {
            acc with
            di_constants =
              StringMap.add type_name
                (Constant_code.ocaml_name_of_constant type_name)
                acc.di_constants;
            di_c_constants =
              StringMap.add entity.cr_c_type type_name acc.di_c_constants;
          })
    ncr.ncr_entities
    { empty_namespace with di_members_listed = lists_members ncr }

let build ~namespace ~classes ~interfaces ~records ~enums ~bitfields ~constants
    ~cross_references =
  StringMap.map of_cross_references cross_references
  |> StringMap.add namespace
       (current_namespace ~classes ~interfaces ~records ~enums ~bitfields
          ~constants)

let with_members ~(ctx : generation_context) entities =
  let namespace = ctx.namespace.namespace_name in
  let add ns =
    List.fold_left entities ~init:ns ~f:(fun ns (e : entity) ->
        add_type_members ~type_name:e.name
          ~members:(Emitted_members.names ~ctx e)
          ~methods:(method_symbols e) ~constructors:(constructor_symbols e) ns)
  in
  StringMap.update namespace (Option.map add) ctx.doc_index

(* The member tables [with_members] put in the index, so the file holds
   exactly what generating the namespace computed. *)
let cross_reference_members ~(ctx : generation_context) (e : entity) =
  let indexed =
    StringMap.find_opt ctx.namespace.namespace_name ctx.doc_index
    |> Fun.flip Option.bind (fun ns -> StringMap.find_opt e.name ns.di_members)
  in
  let { dm_l1; dm_l2 } =
    Option.fold indexed
      ~none:(lazy (Emitted_members.names ~ctx e))
      ~some:Lazy.from_val
    |> Lazy.force
  in
  {
    crm_l1 = layer_of_names dm_l1;
    crm_l2 = layer_of_names dm_l2;
    crm_c_methods = method_symbols e;
    crm_c_constructors = constructor_symbols e;
  }
