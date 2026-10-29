(* Emitted_members — see emitted_members.mli for the contract. *)

open StdLabels
open Types
module StringSet = Common.StringSet

let l1_methods ~ctx ~entity_kind methods =
  List.filter methods ~f:(fun meth ->
      not (Filtering.should_skip_method_binding ~ctx ~entity_kind meth))

let constructors ~ctx ctors =
  List.filter ctors ~f:(Filtering.should_generate_constructor ~ctx)

type accessors = { prop : gir_property; getter : bool; setter : bool }

let has_setter (prop : gir_property) = prop.writable && not prop.construct_only

let l1_properties ~ctx ~methods properties =
  List.filter_map properties ~f:(fun (prop : gir_property) ->
      if
        Filtering.should_generate_property ~ctx ~class_name:() ~methods prop
        && (prop.readable || has_setter prop)
      then Some { prop; getter = prop.readable; setter = has_setter prop }
      else None)

let classified_signals ~ctx signals =
  List.map signals ~f:(fun signal -> (signal, Signal_gen.classify ~ctx signal))

let signals ~ctx signals =
  List.filter_map (classified_signals ~ctx signals) ~f:(fun (_, emission) ->
      Result.to_option emission)

type l2_method = { meth : gir_method; name : string; conflict : bool }
type l2 = { l2_methods : l2_method list; l2_properties : accessors list }

(* Each layer 2 method name is declared once: a later method, or a property
   accessor, whose name an ancestor, an interface or an earlier member already
   declares is dropped. *)
let l2_method_list ~ctx ~class_name ~c_type ~entity_kind ~conflicting seen
    methods =
  List.fold_left methods ~init:(seen, []) ~f:(fun (seen, acc) meth ->
      if Class_gen_helpers.should_skip_method ~ctx ~entity_kind meth then
        (seen, acc)
      else
        let name =
          Class_gen_helpers.ocaml_method_name ~class_name ~c_type meth
        in
        if StringSet.mem name seen then (seen, acc)
        else
          ( StringSet.add name seen,
            { meth; name; conflict = StringSet.mem name conflicting } :: acc ))

let l2_property_list ~ctx ~methods seen properties =
  List.fold_left properties ~init:(seen, [])
    ~f:(fun (seen, acc) (prop : gir_property) ->
      if
        not
          (Filtering.should_generate_property ~ctx ~class_name:() ~methods prop)
      then (seen, acc)
      else
        let snake = Utils.ocaml_property_name prop.prop_name in
        let set_snake = "set_" ^ snake in
        if StringSet.mem snake seen && StringSet.mem set_snake seen then
          (seen, acc)
        else
          let getter = prop.readable && not (StringSet.mem snake seen) in
          let setter = has_setter prop && not (StringSet.mem set_snake seen) in
          let seen = StringSet.add snake seen in
          let seen =
            if has_setter prop then StringSet.add set_snake seen else seen
          in
          let acc =
            if getter || setter then { prop; getter; setter } :: acc else acc
          in
          (seen, acc))

let l2 ~ctx ~class_name ~c_type ~entity_kind ~methods ~properties =
  let conflicting =
    Class_gen_conflict_detection.detect_method_conflicts ~ctx ~class_name
      ~c_type ~methods
  in
  let seen =
    Class_gen_conflict_detection.collect_inherited_method_names ~ctx ~class_name
  in
  let seen, l2_methods =
    l2_method_list ~ctx ~class_name ~c_type ~entity_kind ~conflicting seen
      methods
  in
  let _, l2_properties = l2_property_list ~ctx ~methods seen properties in
  { l2_methods = List.rev l2_methods; l2_properties = List.rev l2_properties }

let l2_getter_name (prop : gir_property) =
  Utils.ocaml_property_name prop.prop_name |> Utils.sanitize_identifier

let l2_setter_name (prop : gir_property) =
  "set_" ^ Utils.ocaml_property_name prop.prop_name |> Utils.sanitize_identifier

(* Names *)

let of_list pairs =
  List.fold_left pairs ~init:StringMap.empty ~f:(fun map (key, value) ->
      if StringMap.mem key map then map else StringMap.add key value map)

let claiming ~field methods prop_name =
  List.find_map methods ~f:(fun (meth : gir_method) ->
      match field meth with
      | Some p when String.equal p prop_name -> Some meth.method_name
      | Some _ | None -> None)

(* The accessor a property reference links to, from the methods the layer
   emits ([method_names]) and the generated accessors ([getter], [setter]). *)
let property_target ~methods ~method_names ~getter ~setter (prop : gir_property)
    =
  let claimed field =
    claiming ~field methods prop.prop_name
    |> Fun.flip Option.bind (fun name -> StringMap.find_opt name method_names)
  in
  List.find_map ~f:Fun.id
    [
      claimed (fun (m : gir_method) -> m.get_property);
      getter prop;
      claimed (fun (m : gir_method) -> m.set_property);
      setter prop;
    ]

let property_names ~methods ~method_names ~getter ~setter properties =
  List.filter_map properties ~f:(fun (prop : gir_property) ->
      property_target ~methods ~method_names ~getter ~setter prop
      |> Option.map (fun target -> (prop.prop_name, target)))
  |> of_list

let signal_names emissions =
  List.map emissions ~f:(fun (e : Signal_gen.signal_emission) ->
      (e.signal.signal_name, e.method_name))
  |> of_list

let constructor_names ctors =
  List.map ctors ~f:(fun (c : gir_constructor) ->
      (c.ctor_name, Utils.ocaml_constructor_name ~class_name:"" c))
  |> of_list

let lookup_accessor accessors ~emitted ~name (prop : gir_property) =
  List.find_opt accessors ~f:(fun a ->
      String.equal a.prop.prop_name prop.prop_name)
  |> Fun.flip Option.bind (fun a ->
      if emitted a then Some (name a.prop) else None)

let l1_names ~ctx (entity : entity) =
  let ctx = Module_paths.raw_library_ctx ctx in
  let entity_kind = Filtering.entity_kind_of_entity entity in
  let methods = l1_methods ~ctx ~entity_kind entity.methods in
  let method_names =
    List.map methods ~f:(fun (m : gir_method) ->
        ( m.method_name,
          Utils.ocaml_function_name ~class_name:entity.name
            ~c_type:entity.c_type m.method_name ))
    |> of_list
  in
  let accessors =
    l1_properties ~ctx ~methods:entity.methods entity.properties
  in
  let snake (prop : gir_property) = Utils.ocaml_property_name prop.prop_name in
  {
    dm_methods = method_names;
    dm_constructors = constructor_names (constructors ~ctx entity.constructors);
    dm_signals = signal_names (signals ~ctx entity.signals);
    dm_properties =
      property_names ~methods:entity.methods ~method_names
        ~getter:
          (lookup_accessor accessors
             ~emitted:(fun a -> a.getter)
             ~name:(fun p -> "get_" ^ snake p))
        ~setter:
          (lookup_accessor accessors
             ~emitted:(fun a -> a.setter)
             ~name:(fun p -> "set_" ^ snake p))
        entity.properties;
  }

let l2_names ~ctx (entity : entity) =
  let ctx = Module_paths.main_library_ctx ctx in
  let { l2_methods; l2_properties } =
    l2 ~ctx ~class_name:entity.name ~c_type:entity.c_type
      ~entity_kind:(Filtering.entity_kind_of_entity entity)
      ~methods:entity.methods ~properties:entity.properties
  in
  let method_names =
    List.filter_map l2_methods ~f:(fun m ->
        if m.conflict then None else Some (m.meth.method_name, m.name))
    |> of_list
  in
  {
    dm_methods = method_names;
    dm_constructors = constructor_names (constructors ~ctx entity.constructors);
    dm_signals = signal_names (signals ~ctx entity.signals);
    dm_properties =
      property_names ~methods:entity.methods ~method_names
        ~getter:
          (lookup_accessor l2_properties
             ~emitted:(fun a -> a.getter)
             ~name:l2_getter_name)
        ~setter:
          (lookup_accessor l2_properties
             ~emitted:(fun a -> a.setter)
             ~name:l2_setter_name)
        entity.properties;
  }

let names ~ctx entity =
  { dm_l1 = l1_names ~ctx entity; dm_l2 = l2_names ~ctx entity }
