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

let current_namespace ~classes ~interfaces ~records ~enums ~bitfields ~constants
    =
  let di_types =
    StringMap.empty
    |> add_all
         ~f:(fun (c : gir_class) -> (c.class_name, Dk_class))
         (List.filter ~f:Filtering.should_generate_class classes)
    |> add_all
         ~f:(fun (i : gir_interface) -> (i.interface_name, Dk_interface))
         (List.filter ~f:Filtering.should_generate_interface interfaces)
    |> add_all
         ~f:(fun (r : gir_record) -> (r.record_name, Dk_record))
         (List.filter ~f:Filtering.should_generate_record records)
    |> add_all ~f:(fun (e : gir_enum) -> (e.enum_name, Dk_enum)) enums
    |> add_all
         ~f:(fun (b : gir_bitfield) -> (b.bitfield_name, Dk_bitfield))
         bitfields
  in
  let di_constants =
    add_all
      ~f:(fun (c : gir_constant) ->
        (c.constant_name, Constant_code.ocaml_name_of_constant c.constant_name))
      (List.filter ~f:Constant_code.is_generated constants)
      StringMap.empty
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
  { empty_namespace with di_types; di_constants; di_enum_members }

let of_cross_references (ncr : generation_context_namespace_cross_references) =
  StringMap.fold
    (fun _ (entity : cross_reference_entity) acc ->
      let add_type kind =
        { acc with di_types = StringMap.add entity.cr_name kind acc.di_types }
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
          })
    ncr.ncr_entities empty_namespace

let build ~namespace ~classes ~interfaces ~records ~enums ~bitfields ~constants
    ~cross_references =
  StringMap.map of_cross_references cross_references
  |> StringMap.add namespace
       (current_namespace ~classes ~interfaces ~records ~enums ~bitfields
          ~constants)

let with_members ~(ctx : generation_context) entities =
  let namespace = ctx.namespace.namespace_name in
  let add ns =
    {
      ns with
      di_members =
        add_all
          ~f:(fun (e : entity) -> (e.name, Emitted_members.names ~ctx e))
          entities ns.di_members;
    }
  in
  StringMap.update namespace (Option.map add) ctx.doc_index
