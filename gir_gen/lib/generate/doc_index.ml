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

let c_symbol dc_kind dc_type (c_identifier, dc_member) =
  (c_identifier, { dc_kind; dc_type; dc_member })

let enum_symbols ~enums ~bitfields =
  let members =
    List.concat_map enums ~f:(fun (e : gir_enum) ->
        List.map e.members ~f:(fun (m : gir_enum_member) ->
            c_symbol Dc_enum_member e.enum_name (m.c_identifier, m.member_name)))
  in
  let flags =
    List.concat_map bitfields ~f:(fun (b : gir_bitfield) ->
        List.map b.flags ~f:(fun (f : gir_bitfield_member) ->
            c_symbol Dc_enum_member b.bitfield_name
              (f.flag_c_identifier, f.flag_name)))
  in
  add_all ~f:Fun.id (members @ flags) StringMap.empty

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
  let di_enum_members =
    StringMap.empty
    |> add_all
         ~f:(fun (e : gir_enum) ->
           ( e.enum_name,
             variants
               (List.map e.members ~f:(fun (m : gir_enum_member) ->
                    m.member_name)) ))
         enums
    |> add_all
         ~f:(fun (b : gir_bitfield) ->
           ( b.bitfield_name,
             variants
               (List.map b.flags ~f:(fun (f : gir_bitfield_member) ->
                    f.flag_name)) ))
         bitfields
  in
  {
    empty_namespace with
    di_types;
    di_constants;
    di_enum_members;
    di_c_types;
    di_c_constants;
    di_c_symbols = enum_symbols ~enums ~bitfields;
  }

let of_cross_references (ncr : generation_context_namespace_cross_references) =
  StringMap.fold
    (fun _ (entity : cross_reference_entity) acc ->
      let add_type kind =
        {
          acc with
          di_types = StringMap.add entity.cr_name kind acc.di_types;
          di_c_types =
            StringMap.add entity.cr_c_type entity.cr_name acc.di_c_types;
        }
      in
      match entity.cr_type with
      | Crt_Class _ -> add_type Dk_class
      | Crt_Interface -> add_type Dk_interface
      | Crt_Record _ -> add_type Dk_record
      | Crt_Enum -> add_type Dk_enum
      | Crt_Bitfield -> add_type Dk_bitfield
      | Crt_Constant ->
          {
            acc with
            di_constants =
              StringMap.add entity.cr_name
                (Constant_code.ocaml_name_of_constant entity.cr_name)
                acc.di_constants;
            di_c_constants =
              StringMap.add entity.cr_c_type entity.cr_name acc.di_c_constants;
          })
    ncr.ncr_entities empty_namespace

let build ~namespace ~classes ~interfaces ~records ~enums ~bitfields ~constants
    ~cross_references =
  StringMap.map of_cross_references cross_references
  |> StringMap.add namespace
       (current_namespace ~classes ~interfaces ~records ~enums ~bitfields
          ~constants)

let member_symbols (e : entity) map =
  map
  |> add_all
       ~f:(fun (m : gir_method) ->
         c_symbol Dc_method e.name (m.c_identifier, m.method_name))
       e.methods
  |> add_all
       ~f:(fun (c : gir_constructor) ->
         c_symbol Dc_constructor e.name (c.c_identifier, c.ctor_name))
       e.constructors

let with_members ~(ctx : generation_context) entities =
  let namespace = ctx.namespace.namespace_name in
  let add ns =
    {
      ns with
      di_members =
        add_all
          ~f:(fun (e : entity) -> (e.name, Emitted_members.names ~ctx e))
          entities ns.di_members;
      di_c_symbols =
        List.fold_left entities ~init:ns.di_c_symbols ~f:(fun map e ->
            member_symbols e map);
    }
  in
  StringMap.update namespace (Option.map add) ctx.doc_index
