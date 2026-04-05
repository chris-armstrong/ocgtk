(* Tests for Override_types construction and equality. *)

open Gir_gen_lib.Override_types

let test_override_action_ignore () =
  let a = Ignore in
  match a with Ignore -> () | Set_version _ -> Alcotest.fail "Expected Ignore"

let test_override_action_version () =
  let a = Set_version "4.10" in
  match a with
  | Set_version v -> Alcotest.(check string) "version" "4.10" v
  | Ignore -> Alcotest.fail "Expected Set_version"

let test_override_action_eq () =
  Alcotest.(check bool) "ignore eq" true (equal_override_action Ignore Ignore);
  Alcotest.(check bool) "version eq" true
    (equal_override_action (Set_version "4.10") (Set_version "4.10"));
  Alcotest.(check bool) "version neq" false
    (equal_override_action (Set_version "4.10") (Set_version "4.12"));
  Alcotest.(check bool) "ignore neq version" false
    (equal_override_action Ignore (Set_version "4.10"))

let test_component_override_construction () =
  let c = { component_name = "foo"; action = Ignore } in
  Alcotest.(check string) "name" "foo" c.component_name;
  Alcotest.(check bool) "action" true (equal_override_action c.action Ignore)

let test_component_override_eq () =
  let c1 = { component_name = "foo"; action = Ignore } in
  let c2 = { component_name = "foo"; action = Ignore } in
  let c3 = { component_name = "bar"; action = Ignore } in
  Alcotest.(check bool) "eq" true (equal_component_override c1 c2);
  Alcotest.(check bool) "neq" false (equal_component_override c1 c3)

let test_class_override_construction () =
  let c =
    {
      class_name = "Widget";
      class_action = Some Ignore;
      constructors = [];
      methods = [ { component_name = "foo"; action = Ignore } ];
      properties = [];
      signals = [];
    }
  in
  Alcotest.(check string) "name" "Widget" c.class_name;
  Alcotest.(check int) "methods" 1 (List.length c.methods);
  Alcotest.(check bool) "action" true (Option.is_some c.class_action)

let test_interface_override_construction () =
  let i =
    {
      interface_name = "Actionable";
      interface_action = None;
      methods = [];
      properties = [ { component_name = "action_name"; action = Set_version "4.12" } ];
      signals = [];
    }
  in
  Alcotest.(check string) "name" "Actionable" i.interface_name;
  Alcotest.(check int) "properties" 1 (List.length i.properties)

let test_record_override_construction () =
  let r =
    {
      record_name = "TextIter";
      record_action = None;
      fields = [ { component_name = "user_data"; action = Ignore } ];
      constructors = [];
      methods = [];
      functions = [];
    }
  in
  Alcotest.(check string) "name" "TextIter" r.record_name;
  Alcotest.(check int) "fields" 1 (List.length r.fields)

let test_enum_override_construction () =
  let e =
    {
      enum_name = "RGBA";
      enum_action = None;
      members = [ { component_name = "RED"; action = Ignore } ];
      functions = [];
    }
  in
  Alcotest.(check string) "name" "RGBA" e.enum_name;
  Alcotest.(check int) "members" 1 (List.length e.members)

let test_bitfield_override_construction () =
  let b =
    {
      bitfield_name = "StateFlags";
      bitfield_action = Some (Set_version "4.10");
      flags = [ { component_name = "ACTIVE"; action = Ignore } ];
    }
  in
  Alcotest.(check string) "name" "StateFlags" b.bitfield_name;
  Alcotest.(check int) "flags" 1 (List.length b.flags)

let test_library_overrides_construction () =
  let ov =
    {
      library_name = "Gtk";
      classes = [];
      interfaces = [];
      records = [];
      enums = [];
      bitfields = [];
      functions = [ { component_name = "gtk_show_uri"; action = Ignore } ];
    }
  in
  Alcotest.(check string) "library" "Gtk" ov.library_name;
  Alcotest.(check int) "functions" 1 (List.length ov.functions)

let test_library_overrides_eq () =
  let ov1 =
    {
      library_name = "Gtk";
      classes = [ { class_name = "Widget"; class_action = Some Ignore;
        constructors = []; methods = []; properties = []; signals = [] } ];
      interfaces = [];
      records = [];
      enums = [];
      bitfields = [];
      functions = [];
    }
  in
  let ov2 = ov1 in
  let ov3 =
    { ov1 with library_name = "Gdk" }
  in
  Alcotest.(check bool) "eq" true (equal_library_overrides ov1 ov2);
  Alcotest.(check bool) "neq" false (equal_library_overrides ov1 ov3)

let test_suite =
  [
    ("override_action_ignore", `Quick, test_override_action_ignore);
    ("override_action_version", `Quick, test_override_action_version);
    ("override_action_eq", `Quick, test_override_action_eq);
    ("component_override_construction", `Quick, test_component_override_construction);
    ("component_override_eq", `Quick, test_component_override_eq);
    ("class_override_construction", `Quick, test_class_override_construction);
    ("interface_override_construction", `Quick, test_interface_override_construction);
    ("record_override_construction", `Quick, test_record_override_construction);
    ("enum_override_construction", `Quick, test_enum_override_construction);
    ("bitfield_override_construction", `Quick, test_bitfield_override_construction);
    ("library_overrides_construction", `Quick, test_library_overrides_construction);
    ("library_overrides_eq", `Quick, test_library_overrides_eq);
  ]
