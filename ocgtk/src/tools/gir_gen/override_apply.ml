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

(* Apply version overrides to a component if present. *)
let apply_version_to_component name overrides current_version =
  match find_component_override name overrides with
  | Some comp -> (
      match comp.action with
      | Set_version v -> Some v
      | Ignore -> current_version)
  | None -> current_version

(* Filter components by ignore overrides. *)
let filter_components name overrides =
  match find_component_override name overrides with
  | Some comp -> (
      match comp.action with
      | Ignore -> false
      | Set_version _ -> true)
  | None -> true

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

(* Process classes: apply entity-level ignore and component overrides. *)

let apply_class_overrides ~(class_overrides : class_override list)
    (all_classes : gir_class list) =
  let ignored = ref [] in
  let warnings = ref [] in
  let is_ignored (cls : gir_class) =
    let ov_opt =
      List.find_opt
        (fun (ov : class_override) -> String.equal ov.class_name cls.class_name)
        class_overrides
    in
    match ov_opt with
    | Some ov ->
        if ov.class_action = Some Ignore then begin
          ignored := cls.class_name :: !ignored;
          true
        end
        else false
    | None -> false
  in
  let remaining = List.filter (fun cls -> not (is_ignored cls)) all_classes in
  let apply_to_class (cls : gir_class) : gir_class =
    match
      List.find_opt
        (fun (ov : class_override) -> String.equal ov.class_name cls.class_name)
        class_overrides
    with
    | None -> cls
    | Some ov ->
        match ov.class_action with
        | Some _ -> cls
        | None ->
          let ctors =
            List.filter
              (fun (c : gir_constructor) ->
                filter_components c.ctor_name ov.constructors)
              cls.constructors
          in
          let ctors =
            List.map
              (fun (c : gir_constructor) ->
                { c with
                  version =
                    apply_version_to_component c.ctor_name ov.constructors
                      c.version;
                })
              ctors
          in
          let meths =
            List.filter
              (fun (m : gir_method) ->
                filter_components m.method_name ov.methods)
              cls.methods
          in
          let meths =
            List.map
              (fun (m : gir_method) ->
                { m with
                  version =
                    apply_version_to_component m.method_name ov.methods
                      m.version;
                })
              meths
          in
          let props =
            List.filter
              (fun (p : gir_property) ->
                filter_components p.prop_name ov.properties)
              cls.properties
          in
          let props =
            List.map
              (fun (p : gir_property) ->
                { p with
                  version =
                    apply_version_to_component p.prop_name ov.properties
                      p.version;
                })
              props
          in
          let sigs =
            List.filter
              (fun (s : gir_signal) ->
                filter_components s.signal_name ov.signals)
              cls.signals
          in
          let sigs =
            List.map
              (fun (s : gir_signal) ->
                { s with
                  version =
                    apply_version_to_component s.signal_name ov.signals
                      s.version;
                })
              sigs
          in
          { cls with constructors = ctors; methods = meths; properties = props; signals = sigs }
  in
  let processed = List.map apply_to_class remaining in
  (* Warn about unknown component names for non-ignored classes *)
  List.iter
    (fun (ov : class_override) ->
      match ov.class_action with
      | Some _ -> () (* Entity-level action — skip component warnings *)
      | None ->
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
             (fun (cls : gir_class) -> String.equal cls.class_name ov.class_name)
             processed))
    class_overrides;
  (processed, !ignored, !warnings)

(* Process interfaces: apply entity-level ignore and component overrides. *)

let apply_interface_overrides ~(interface_overrides : interface_override list)
    (all_interfaces : gir_interface list) =
  let ignored = ref [] in
  let warnings = ref [] in
  let is_ignored (intf : gir_interface) =
    let ov_opt =
      List.find_opt
        (fun (ov : interface_override) ->
          String.equal ov.interface_name intf.interface_name)
        interface_overrides
    in
    match ov_opt with
    | Some ov ->
        if ov.interface_action = Some Ignore then begin
          ignored := intf.interface_name :: !ignored;
          true
        end
        else false
    | None -> false
  in
  let remaining = List.filter (fun intf -> not (is_ignored intf)) all_interfaces in
  let apply_to_interface (intf : gir_interface) : gir_interface =
    match
      List.find_opt
        (fun (ov : interface_override) ->
          String.equal ov.interface_name intf.interface_name)
        interface_overrides
    with
    | None -> intf
    | Some ov ->
        match ov.interface_action with
        | Some _ -> intf
        | None ->
          let meths =
            List.filter
              (fun (m : gir_method) ->
                filter_components m.method_name ov.methods)
              intf.methods
          in
          let meths =
            List.map
              (fun (m : gir_method) ->
                { m with
                  version =
                    apply_version_to_component m.method_name ov.methods
                      m.version;
                })
              meths
          in
          let props =
            List.filter
              (fun (p : gir_property) ->
                filter_components p.prop_name ov.properties)
              intf.properties
          in
          let props =
            List.map
              (fun (p : gir_property) ->
                { p with
                  version =
                    apply_version_to_component p.prop_name ov.properties
                      p.version;
                })
              props
          in
          let sigs =
            List.filter
              (fun (s : gir_signal) ->
                filter_components s.signal_name ov.signals)
              intf.signals
          in
          let sigs =
            List.map
              (fun (s : gir_signal) ->
                { s with
                  version =
                    apply_version_to_component s.signal_name ov.signals
                      s.version;
                })
              sigs
          in
          { intf with methods = meths; properties = props; signals = sigs }
  in
  let processed = List.map apply_to_interface remaining in
  List.iter
    (fun (ov : interface_override) ->
      match ov.interface_action with
      | Some _ -> ()
      | None ->
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

(* Process records: apply entity-level ignore and component overrides. *)

let apply_record_overrides ~(record_overrides : record_override list)
    (all_records : gir_record list) =
  let ignored = ref [] in
  let warnings = ref [] in
  let is_ignored (rec_ : gir_record) =
    let ov_opt =
      List.find_opt
        (fun (ov : record_override) ->
          String.equal ov.record_name rec_.record_name)
        record_overrides
    in
    match ov_opt with
    | Some ov ->
        if ov.record_action = Some Ignore then begin
          ignored := rec_.record_name :: !ignored;
          true
        end
        else false
    | None -> false
  in
  let remaining = List.filter (fun rec_ -> not (is_ignored rec_)) all_records in
  let apply_to_record (rec_ : gir_record) : gir_record =
    match
      List.find_opt
        (fun (ov : record_override) ->
          String.equal ov.record_name rec_.record_name)
        record_overrides
    with
    | None -> rec_
    | Some ov ->
        match ov.record_action with
        | Some _ -> rec_
        | None ->
          let fields =
            List.filter
              (fun (f : gir_record_field) ->
                filter_components f.field_name ov.fields)
              rec_.fields
          in
          let fields =
            List.map
              (fun (f : gir_record_field) ->
                { f with
                  field_version =
                    apply_version_to_component f.field_name ov.fields
                      f.field_version;
                })
              fields
          in
          let ctors =
            List.filter
              (fun (c : gir_constructor) ->
                filter_components c.ctor_name ov.constructors)
              rec_.constructors
          in
          let ctors =
            List.map
              (fun (c : gir_constructor) ->
                { c with
                  version =
                    apply_version_to_component c.ctor_name ov.constructors
                      c.version;
                })
              ctors
          in
          let meths =
            List.filter
              (fun (m : gir_method) ->
                filter_components m.method_name ov.methods)
              rec_.methods
          in
          let meths =
            List.map
              (fun (m : gir_method) ->
                { m with
                  version =
                    apply_version_to_component m.method_name ov.methods
                      m.version;
                })
              meths
          in
          let fns =
            List.filter
              (fun (f : gir_function) ->
                filter_components f.function_name ov.functions)
              rec_.functions
          in
          let fns =
            List.map
              (fun (f : gir_function) ->
                { f with
                  version =
                    apply_version_to_component f.function_name ov.functions
                      f.version;
                })
              fns
          in
          { rec_ with fields; constructors = ctors; methods = meths; functions = fns }
  in
  let processed = List.map apply_to_record remaining in
  List.iter
    (fun (ov : record_override) ->
      match ov.record_action with
      | Some _ -> ()
      | None ->
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

(* Process enums: apply entity-level ignore and component overrides. *)

let apply_enum_overrides ~(enum_overrides : enum_override list)
    (all_enums : gir_enum list) =
  let ignored = ref [] in
  let warnings = ref [] in
  let is_ignored (enm : gir_enum) =
    let ov_opt =
      List.find_opt
        (fun (ov : enum_override) -> String.equal ov.enum_name enm.enum_name)
        enum_overrides
    in
    match ov_opt with
    | Some ov ->
        if ov.enum_action = Some Ignore then begin
          ignored := enm.enum_name :: !ignored;
          true
        end
        else false
    | None -> false
  in
  let remaining = List.filter (fun enm -> not (is_ignored enm)) all_enums in
  let apply_to_enum (enm : gir_enum) : gir_enum =
    match
      List.find_opt
        (fun (ov : enum_override) -> String.equal ov.enum_name enm.enum_name)
        enum_overrides
    with
    | None -> enm
    | Some ov ->
        match ov.enum_action with
        | Some _ -> enm
        | None ->
          let members =
            List.filter
              (fun (m : gir_enum_member) ->
                filter_components m.member_name ov.members)
              enm.members
          in
          let members =
            List.map
              (fun (m : gir_enum_member) ->
                { m with
                  member_version =
                    apply_version_to_component m.member_name ov.members
                      m.member_version;
                })
              members
          in
          let fns =
            List.filter
              (fun (f : gir_function) ->
                filter_components f.function_name ov.functions)
              enm.functions
          in
          let fns =
            List.map
              (fun (f : gir_function) ->
                { f with
                  version =
                    apply_version_to_component f.function_name ov.functions
                      f.version;
                })
              fns
          in
          { enm with members; functions = fns }
  in
  let processed = List.map apply_to_enum remaining in
  List.iter
    (fun (ov : enum_override) ->
      match ov.enum_action with
      | Some _ -> ()
      | None ->
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

(* Process bitfields: apply entity-level ignore and component overrides. *)

let apply_bitfield_overrides ~(bitfield_overrides : bitfield_override list)
    (all_bitfields : gir_bitfield list) =
  let ignored = ref [] in
  let warnings = ref [] in
  let is_ignored (bf : gir_bitfield) =
    let ov_opt =
      List.find_opt
        (fun (ov : bitfield_override) ->
          String.equal ov.bitfield_name bf.bitfield_name)
        bitfield_overrides
    in
    match ov_opt with
    | Some ov ->
        if ov.bitfield_action = Some Ignore then begin
          ignored := bf.bitfield_name :: !ignored;
          true
        end
        else false
    | None -> false
  in
  let remaining = List.filter (fun bf -> not (is_ignored bf)) all_bitfields in
  let apply_to_bitfield (bf : gir_bitfield) : gir_bitfield =
    match
      List.find_opt
        (fun (ov : bitfield_override) ->
          String.equal ov.bitfield_name bf.bitfield_name)
        bitfield_overrides
    with
    | None -> bf
    | Some ov ->
        match ov.bitfield_action with
        | Some _ -> bf
        | None ->
          let flags =
            List.filter
              (fun (f : gir_bitfield_member) ->
                filter_components f.flag_name ov.flags)
              bf.flags
          in
          let flags =
            List.map
              (fun (f : gir_bitfield_member) ->
                { f with
                  flag_version =
                    apply_version_to_component f.flag_name ov.flags
                      f.flag_version;
                })
              flags
          in
          { bf with flags }
  in
  let processed = List.map apply_to_bitfield remaining in
  List.iter
    (fun (ov : bitfield_override) ->
      match ov.bitfield_action with
      | Some _ -> ()
      | None ->
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

(* Process standalone functions: ignore only (no version on standalone functions
   that aren't in the GIR data). *)

let apply_function_overrides ~(function_overrides : component_override list)
    (functions : gir_function list) =
  let ignored = ref [] in
  let warnings = ref [] in
  let is_ignored fn =
    match find_component_override fn.function_name function_overrides with
    | Some comp -> (
        match comp.action with
        | Ignore ->
            ignored := fn.function_name :: !ignored;
            true
        | Set_version _ -> false)
    | None -> false
  in
  let remaining =
    List.filter (fun fn -> not (is_ignored fn)) functions
  in
  (* Warn about unknown function overrides *)
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
  (remaining, !ignored, !warnings)

(* Warn about unknown entity overrides (entity names not found in parsed data).
   Always warns, even for ignored entities — catches typos like `(class Widgtet (ignore))`. *)
let check_unknown_class_names ~(class_overrides : class_override list)
    ~(classes : gir_class list) =
  List.filter_map
    (fun (ov : class_override) ->
      if
        List.exists
          (fun (cls : gir_class) -> String.equal cls.class_name ov.class_name)
          classes
      then None
      else
        Some
          (Printf.sprintf "unknown class '%s' in override" ov.class_name))
    class_overrides

let check_unknown_interface_names
    ~(interface_overrides : interface_override list)
    ~(interfaces : gir_interface list) =
  List.filter_map
    (fun (ov : interface_override) ->
      if
        List.exists
          (fun (intf : gir_interface) ->
            String.equal intf.interface_name ov.interface_name)
          interfaces
      then None
      else
        Some
          (Printf.sprintf "unknown interface '%s' in override"
             ov.interface_name))
    interface_overrides

let check_unknown_record_names ~(record_overrides : record_override list)
    ~(records : gir_record list) =
  List.filter_map
    (fun (ov : record_override) ->
      if
        List.exists
          (fun (rec_ : gir_record) ->
            String.equal rec_.record_name ov.record_name)
          records
      then None
      else
        Some
          (Printf.sprintf "unknown record '%s' in override" ov.record_name))
    record_overrides

let check_unknown_enum_names ~(enum_overrides : enum_override list)
    ~(enums : gir_enum list) =
  List.filter_map
    (fun (ov : enum_override) ->
      if
        List.exists
          (fun (enm : gir_enum) -> String.equal enm.enum_name ov.enum_name)
          enums
      then None
      else
        Some
          (Printf.sprintf "unknown enumeration '%s' in override" ov.enum_name))
    enum_overrides

let check_unknown_bitfield_names
    ~(bitfield_overrides : bitfield_override list)
    ~(bitfields : gir_bitfield list) =
  List.filter_map
    (fun (ov : bitfield_override) ->
      if
        List.exists
          (fun (bf : gir_bitfield) ->
            String.equal bf.bitfield_name ov.bitfield_name)
          bitfields
      then None
      else
        Some
          (Printf.sprintf "unknown bitfield '%s' in override"
             ov.bitfield_name))
    bitfield_overrides

let apply_overrides ~(overrides : library_overrides) ~classes:original_classes
    ~interfaces:original_interfaces ~enums:original_enums
    ~bitfields:original_bitfields ~records:original_records
    ~functions:original_functions =
  (* Apply class overrides *)
  let classes, class_ignored, class_warnings =
    apply_class_overrides ~class_overrides:overrides.classes original_classes
  in
  (* Apply interface overrides *)
  let interfaces, interface_ignored, interface_warnings =
    apply_interface_overrides ~interface_overrides:overrides.interfaces
      original_interfaces
  in
  (* Apply record overrides *)
  let records, record_ignored, record_warnings =
    apply_record_overrides ~record_overrides:overrides.records original_records
  in
  (* Apply enum overrides *)
  let enums, enum_ignored, enum_warnings =
    apply_enum_overrides ~enum_overrides:overrides.enums original_enums
  in
  (* Apply bitfield overrides *)
  let bitfields, bitfield_ignored, bitfield_warnings =
    apply_bitfield_overrides ~bitfield_overrides:overrides.bitfields
      original_bitfields
  in
  (* Apply standalone function overrides *)
  let functions, function_ignored, function_warnings =
    apply_function_overrides ~function_overrides:overrides.functions
      original_functions
  in
  (* Check for unknown entity names using the ORIGINAL (unfiltered) data.
     Ignored entities that were removed from the processed list are still
     present in the original data, so we won't get false positives. *)
  let entity_warnings =
    check_unknown_class_names ~class_overrides:overrides.classes
      ~classes:original_classes
    @ check_unknown_interface_names ~interface_overrides:overrides.interfaces
        ~interfaces:original_interfaces
    @ check_unknown_record_names ~record_overrides:overrides.records
        ~records:original_records
    @ check_unknown_enum_names ~enum_overrides:overrides.enums
        ~enums:original_enums
    @ check_unknown_bitfield_names ~bitfield_overrides:overrides.bitfields
        ~bitfields:original_bitfields
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
