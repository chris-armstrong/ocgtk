(* Apply parsed overrides to GIR data structures. *)

open Types
open Override_types

type apply_result = {
  classes : Types.gir_class list;
  interfaces : Types.gir_interface list;
  enums : Types.gir_enum list;
  bitfields : Types.gir_bitfield list;
  records : Types.gir_record list;
  functions : Types.gir_function list;
  ignored_entities : string list;
  warnings : string list;
}

(* Helper to find a component override by name. *)
let find_component_override name overrides =
  List.find_opt
    (fun (c : component_override) -> String.equal c.component_name name)
    overrides

(* Warn if component overrides reference names not in the component list. *)
let warn_unknown_components ~entity_name ~entity_kind ~component_kind
    ~(get_name : 'a -> string) ~(components : 'a list)
    ~(overrides : component_override list) ~(warnings : string list ref) =
  List.iter
    (fun (c : component_override) ->
      if
        not
          (List.exists
             (fun x -> String.equal (get_name x) c.component_name)
             components)
      then
        warnings :=
          Printf.sprintf "unknown %s '%s' in %s '%s'" component_kind
            c.component_name entity_kind entity_name
          :: !warnings)
    overrides

(* Generic: warn about entity-level override names not found in parsed data.
   Always checks original data (not filtered) — catches typos on ignored entities. *)
let check_unknown_entity_names ~entity_kind ~get_override_name ~get_entity_name
    overrides entities =
  List.filter_map
    (fun ov ->
      if List.exists (fun e -> String.equal (get_entity_name e) (get_override_name ov)) entities
      then None
      else
        Some
          (Printf.sprintf "unknown %s '%s' in override" entity_kind
             (get_override_name ov)))
    overrides

(* Apply component-level overrides to a single component list.
   Returns the filtered-and-versioned list. *)
let apply_components_by_name
    ~(get_name : 'a -> string)
    ~(set_version : string -> 'a -> 'a)
    ~(overrides : component_override list)
    (components : 'a list) : 'a list =
  List.filter_map
    (fun item ->
      match find_component_override (get_name item) overrides with
      | Some { action = Ignore; _ } -> None
      | Some { action = Set_version v; _ } -> Some (set_version v item)
      | None -> Some item)
    components

(* Per-entity helpers: apply component overrides to a surviving entity. *)

let apply_class_components (ov : class_override) (cls : gir_class) : gir_class =
  let constructors =
    apply_components_by_name
      ~get_name:(fun (c : gir_constructor) -> c.ctor_name)
      ~set_version:(fun v (c : gir_constructor) -> { c with version = Some v })
      ~overrides:ov.constructors cls.constructors
  in
  let methods =
    apply_components_by_name
      ~get_name:(fun (m : gir_method) -> m.method_name)
      ~set_version:(fun v (m : gir_method) -> { m with version = Some v })
      ~overrides:ov.methods cls.methods
  in
  let properties =
    apply_components_by_name
      ~get_name:(fun (p : gir_property) -> p.prop_name)
      ~set_version:(fun v (p : gir_property) -> { p with version = Some v })
      ~overrides:ov.properties cls.properties
  in
  let signals =
    apply_components_by_name
      ~get_name:(fun (s : gir_signal) -> s.signal_name)
      ~set_version:(fun v (s : gir_signal) -> { s with version = Some v })
      ~overrides:ov.signals cls.signals
  in
  { cls with constructors; methods; properties; signals }

let apply_interface_components (ov : interface_override) (intf : gir_interface)
    : gir_interface =
  let methods =
    apply_components_by_name
      ~get_name:(fun (m : gir_method) -> m.method_name)
      ~set_version:(fun v (m : gir_method) -> { m with version = Some v })
      ~overrides:ov.methods intf.methods
  in
  let properties =
    apply_components_by_name
      ~get_name:(fun (p : gir_property) -> p.prop_name)
      ~set_version:(fun v (p : gir_property) -> { p with version = Some v })
      ~overrides:ov.properties intf.properties
  in
  let signals =
    apply_components_by_name
      ~get_name:(fun (s : gir_signal) -> s.signal_name)
      ~set_version:(fun v (s : gir_signal) -> { s with version = Some v })
      ~overrides:ov.signals intf.signals
  in
  { intf with methods; properties; signals }

let apply_record_components (ov : record_override) (rec_ : gir_record)
    : gir_record =
  let fields =
    apply_components_by_name
      ~get_name:(fun (f : gir_record_field) -> f.field_name)
      ~set_version:(fun v (f : gir_record_field) -> { f with field_version = Some v })
      ~overrides:ov.fields rec_.fields
  in
  let constructors =
    apply_components_by_name
      ~get_name:(fun (c : gir_constructor) -> c.ctor_name)
      ~set_version:(fun v (c : gir_constructor) -> { c with version = Some v })
      ~overrides:ov.constructors rec_.constructors
  in
  let methods =
    apply_components_by_name
      ~get_name:(fun (m : gir_method) -> m.method_name)
      ~set_version:(fun v (m : gir_method) -> { m with version = Some v })
      ~overrides:ov.methods rec_.methods
  in
  let functions =
    apply_components_by_name
      ~get_name:(fun (f : gir_function) -> f.function_name)
      ~set_version:(fun v (f : gir_function) -> { f with version = Some v })
      ~overrides:ov.functions rec_.functions
  in
  { rec_ with fields; constructors; methods; functions }

let apply_enum_components (ov : enum_override) (enm : gir_enum) : gir_enum =
  let members =
    apply_components_by_name
      ~get_name:(fun (m : gir_enum_member) -> m.member_name)
      ~set_version:(fun v (m : gir_enum_member) -> { m with member_version = Some v })
      ~overrides:ov.members enm.members
  in
  let functions =
    apply_components_by_name
      ~get_name:(fun (f : gir_function) -> f.function_name)
      ~set_version:(fun v (f : gir_function) -> { f with version = Some v })
      ~overrides:ov.functions enm.functions
  in
  { enm with members; functions }

let apply_bitfield_components (ov : bitfield_override) (bf : gir_bitfield)
    : gir_bitfield =
  let flags =
    apply_components_by_name
      ~get_name:(fun (f : gir_bitfield_member) -> f.flag_name)
      ~set_version:(fun v (f : gir_bitfield_member) -> { f with flag_version = Some v })
      ~overrides:ov.flags bf.flags
  in
  { bf with flags }

(* Process classes: entity-level ignore/version and component overrides. *)
let apply_class_overrides ~(class_overrides : class_override list)
    (all_classes : gir_class list) =
  let ignored = ref [] in
  let warnings = ref [] in
  let process_class (cls : gir_class) =
    match
      List.find_opt
        (fun (ov : class_override) -> String.equal ov.class_name cls.class_name)
        class_overrides
    with
    | None -> Some cls
    | Some ov -> (
        match ov.class_action with
        | Some Ignore ->
            ignored := cls.class_name :: !ignored;
            None
        | Some (Set_version v) ->
            Some (apply_class_components ov { cls with version = Some v })
        | None -> Some (apply_class_components ov cls))
  in
  let processed = List.filter_map process_class all_classes in
  List.iter
    (fun (ov : class_override) ->
      match ov.class_action with
      | Some Ignore -> ()
      | Some _ | None ->
          Option.iter
            (fun (cls : gir_class) ->
              warn_unknown_components ~entity_name:ov.class_name
                ~entity_kind:"class" ~component_kind:"constructor"
                ~get_name:(fun (c : gir_constructor) -> c.ctor_name)
                ~components:cls.constructors ~overrides:ov.constructors ~warnings;
              warn_unknown_components ~entity_name:ov.class_name
                ~entity_kind:"class" ~component_kind:"method"
                ~get_name:(fun (m : gir_method) -> m.method_name)
                ~components:cls.methods ~overrides:ov.methods ~warnings;
              warn_unknown_components ~entity_name:ov.class_name
                ~entity_kind:"class" ~component_kind:"property"
                ~get_name:(fun (p : gir_property) -> p.prop_name)
                ~components:cls.properties ~overrides:ov.properties ~warnings;
              warn_unknown_components ~entity_name:ov.class_name
                ~entity_kind:"class" ~component_kind:"signal"
                ~get_name:(fun (s : gir_signal) -> s.signal_name)
                ~components:cls.signals ~overrides:ov.signals ~warnings)
            (List.find_opt
               (fun (cls : gir_class) ->
                 String.equal cls.class_name ov.class_name)
               processed))
    class_overrides;
  (processed, !ignored, !warnings)

(* Process interfaces: entity-level ignore/version and component overrides. *)
let apply_interface_overrides ~(interface_overrides : interface_override list)
    (all_interfaces : gir_interface list) =
  let ignored = ref [] in
  let warnings = ref [] in
  let process_interface (intf : gir_interface) =
    match
      List.find_opt
        (fun (ov : interface_override) ->
          String.equal ov.interface_name intf.interface_name)
        interface_overrides
    with
    | None -> Some intf
    | Some ov -> (
        match ov.interface_action with
        | Some Ignore ->
            ignored := intf.interface_name :: !ignored;
            None
        | Some (Set_version v) ->
            Some (apply_interface_components ov { intf with version = Some v })
        | None -> Some (apply_interface_components ov intf))
  in
  let processed = List.filter_map process_interface all_interfaces in
  List.iter
    (fun (ov : interface_override) ->
      match ov.interface_action with
      | Some Ignore -> ()
      | Some _ | None ->
          Option.iter
            (fun (intf : gir_interface) ->
              warn_unknown_components ~entity_name:ov.interface_name
                ~entity_kind:"interface" ~component_kind:"method"
                ~get_name:(fun (m : gir_method) -> m.method_name)
                ~components:intf.methods ~overrides:ov.methods ~warnings;
              warn_unknown_components ~entity_name:ov.interface_name
                ~entity_kind:"interface" ~component_kind:"property"
                ~get_name:(fun (p : gir_property) -> p.prop_name)
                ~components:intf.properties ~overrides:ov.properties ~warnings;
              warn_unknown_components ~entity_name:ov.interface_name
                ~entity_kind:"interface" ~component_kind:"signal"
                ~get_name:(fun (s : gir_signal) -> s.signal_name)
                ~components:intf.signals ~overrides:ov.signals ~warnings)
            (List.find_opt
               (fun (intf : gir_interface) ->
                 String.equal intf.interface_name ov.interface_name)
               processed))
    interface_overrides;
  (processed, !ignored, !warnings)

(* Process records: entity-level ignore/version and component overrides. *)
let apply_record_overrides ~(record_overrides : record_override list)
    (all_records : gir_record list) =
  let ignored = ref [] in
  let warnings = ref [] in
  let process_record (rec_ : gir_record) =
    match
      List.find_opt
        (fun (ov : record_override) ->
          String.equal ov.record_name rec_.record_name)
        record_overrides
    with
    | None -> Some rec_
    | Some ov -> (
        match ov.record_action with
        | Some Ignore ->
            ignored := rec_.record_name :: !ignored;
            None
        | Some (Set_version v) ->
            Some (apply_record_components ov { rec_ with version = Some v })
        | None -> Some (apply_record_components ov rec_))
  in
  let processed = List.filter_map process_record all_records in
  List.iter
    (fun (ov : record_override) ->
      match ov.record_action with
      | Some Ignore -> ()
      | Some _ | None ->
          Option.iter
            (fun (rec_ : gir_record) ->
              warn_unknown_components ~entity_name:ov.record_name
                ~entity_kind:"record" ~component_kind:"field"
                ~get_name:(fun (f : gir_record_field) -> f.field_name)
                ~components:rec_.fields ~overrides:ov.fields ~warnings;
              warn_unknown_components ~entity_name:ov.record_name
                ~entity_kind:"record" ~component_kind:"constructor"
                ~get_name:(fun (c : gir_constructor) -> c.ctor_name)
                ~components:rec_.constructors ~overrides:ov.constructors ~warnings;
              warn_unknown_components ~entity_name:ov.record_name
                ~entity_kind:"record" ~component_kind:"method"
                ~get_name:(fun (m : gir_method) -> m.method_name)
                ~components:rec_.methods ~overrides:ov.methods ~warnings;
              warn_unknown_components ~entity_name:ov.record_name
                ~entity_kind:"record" ~component_kind:"function"
                ~get_name:(fun (f : gir_function) -> f.function_name)
                ~components:rec_.functions ~overrides:ov.functions ~warnings)
            (List.find_opt
               (fun (rec_ : gir_record) ->
                 String.equal rec_.record_name ov.record_name)
               processed))
    record_overrides;
  (processed, !ignored, !warnings)

(* Process enums: entity-level ignore/version and component overrides. *)
let apply_enum_overrides ~(enum_overrides : enum_override list)
    (all_enums : gir_enum list) =
  let ignored = ref [] in
  let warnings = ref [] in
  let process_enum (enm : gir_enum) =
    match
      List.find_opt
        (fun (ov : enum_override) -> String.equal ov.enum_name enm.enum_name)
        enum_overrides
    with
    | None -> Some enm
    | Some ov -> (
        match ov.enum_action with
        | Some Ignore ->
            ignored := enm.enum_name :: !ignored;
            None
        | Some (Set_version v) ->
            Some (apply_enum_components ov { enm with enum_version = Some v })
        | None -> Some (apply_enum_components ov enm))
  in
  let processed = List.filter_map process_enum all_enums in
  List.iter
    (fun (ov : enum_override) ->
      match ov.enum_action with
      | Some Ignore -> ()
      | Some _ | None ->
          Option.iter
            (fun (enm : gir_enum) ->
              warn_unknown_components ~entity_name:ov.enum_name
                ~entity_kind:"enumeration" ~component_kind:"member"
                ~get_name:(fun (m : gir_enum_member) -> m.member_name)
                ~components:enm.members ~overrides:ov.members ~warnings;
              warn_unknown_components ~entity_name:ov.enum_name
                ~entity_kind:"enumeration" ~component_kind:"function"
                ~get_name:(fun (f : gir_function) -> f.function_name)
                ~components:enm.functions ~overrides:ov.functions ~warnings)
            (List.find_opt
               (fun (enm : gir_enum) -> String.equal enm.enum_name ov.enum_name)
               processed))
    enum_overrides;
  (processed, !ignored, !warnings)

(* Process bitfields: entity-level ignore/version and component overrides. *)
let apply_bitfield_overrides ~(bitfield_overrides : bitfield_override list)
    (all_bitfields : gir_bitfield list) =
  let ignored = ref [] in
  let warnings = ref [] in
  let process_bitfield (bf : gir_bitfield) =
    match
      List.find_opt
        (fun (ov : bitfield_override) ->
          String.equal ov.bitfield_name bf.bitfield_name)
        bitfield_overrides
    with
    | None -> Some bf
    | Some ov -> (
        match ov.bitfield_action with
        | Some Ignore ->
            ignored := bf.bitfield_name :: !ignored;
            None
        | Some (Set_version v) ->
            Some (apply_bitfield_components ov { bf with bitfield_version = Some v })
        | None -> Some (apply_bitfield_components ov bf))
  in
  let processed = List.filter_map process_bitfield all_bitfields in
  List.iter
    (fun (ov : bitfield_override) ->
      match ov.bitfield_action with
      | Some Ignore -> ()
      | Some _ | None ->
          Option.iter
            (fun (bf : gir_bitfield) ->
              warn_unknown_components ~entity_name:ov.bitfield_name
                ~entity_kind:"bitfield" ~component_kind:"member"
                ~get_name:(fun (f : gir_bitfield_member) -> f.flag_name)
                ~components:bf.flags ~overrides:ov.flags ~warnings)
            (List.find_opt
               (fun (bf : gir_bitfield) ->
                 String.equal bf.bitfield_name ov.bitfield_name)
               processed))
    bitfield_overrides;
  (processed, !ignored, !warnings)

(* Process standalone functions: ignore or version override. *)
let apply_function_overrides ~(function_overrides : component_override list)
    (functions : gir_function list) =
  let ignored = ref [] in
  let warnings = ref [] in
  let processed =
    List.filter_map
      (fun (fn : gir_function) ->
        match find_component_override fn.function_name function_overrides with
        | Some { action = Ignore; _ } ->
            ignored := fn.function_name :: !ignored;
            None
        | Some { action = Set_version v; _ } ->
            Some { fn with version = Some v }
        | None -> Some fn)
      functions
  in
  List.iter
    (fun (c : component_override) ->
      if
        not
          (List.exists
             (fun (fn : gir_function) ->
               String.equal fn.function_name c.component_name)
             functions)
      then
        warnings :=
          Printf.sprintf "unknown standalone function '%s'" c.component_name
          :: !warnings)
    function_overrides;
  (processed, !ignored, !warnings)

let apply_overrides ~(overrides : library_overrides) ~classes:original_classes
    ~interfaces:original_interfaces ~enums:original_enums
    ~bitfields:original_bitfields ~records:original_records
    ~functions:original_functions =
  let classes, class_ignored, class_warnings =
    apply_class_overrides ~class_overrides:overrides.classes original_classes
  in
  let interfaces, interface_ignored, interface_warnings =
    apply_interface_overrides ~interface_overrides:overrides.interfaces
      original_interfaces
  in
  let records, record_ignored, record_warnings =
    apply_record_overrides ~record_overrides:overrides.records original_records
  in
  let enums, enum_ignored, enum_warnings =
    apply_enum_overrides ~enum_overrides:overrides.enums original_enums
  in
  let bitfields, bitfield_ignored, bitfield_warnings =
    apply_bitfield_overrides ~bitfield_overrides:overrides.bitfields
      original_bitfields
  in
  let functions, function_ignored, function_warnings =
    apply_function_overrides ~function_overrides:overrides.functions
      original_functions
  in
  (* Check for unknown entity names using original (unfiltered) data so that
     ignored entities don't produce false positives. *)
  let entity_warnings =
    check_unknown_entity_names ~entity_kind:"class"
      ~get_override_name:(fun (ov : class_override) -> ov.class_name)
      ~get_entity_name:(fun (cls : gir_class) -> cls.class_name)
      overrides.classes original_classes
    @ check_unknown_entity_names ~entity_kind:"interface"
        ~get_override_name:(fun (ov : interface_override) -> ov.interface_name)
        ~get_entity_name:(fun (intf : gir_interface) -> intf.interface_name)
        overrides.interfaces original_interfaces
    @ check_unknown_entity_names ~entity_kind:"record"
        ~get_override_name:(fun (ov : record_override) -> ov.record_name)
        ~get_entity_name:(fun (rec_ : gir_record) -> rec_.record_name)
        overrides.records original_records
    @ check_unknown_entity_names ~entity_kind:"enumeration"
        ~get_override_name:(fun (ov : enum_override) -> ov.enum_name)
        ~get_entity_name:(fun (enm : gir_enum) -> enm.enum_name)
        overrides.enums original_enums
    @ check_unknown_entity_names ~entity_kind:"bitfield"
        ~get_override_name:(fun (ov : bitfield_override) -> ov.bitfield_name)
        ~get_entity_name:(fun (bf : gir_bitfield) -> bf.bitfield_name)
        overrides.bitfields original_bitfields
  in
  let ignored_entities =
    class_ignored @ interface_ignored @ record_ignored @ enum_ignored
    @ bitfield_ignored @ function_ignored
  in
  let warnings =
    class_warnings @ interface_warnings @ record_warnings @ enum_warnings
    @ bitfield_warnings @ function_warnings @ entity_warnings
  in
  {
    classes;
    interfaces;
    enums;
    bitfields;
    records;
    functions;
    ignored_entities;
    warnings;
  }
