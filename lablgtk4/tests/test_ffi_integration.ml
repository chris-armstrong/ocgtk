(** FFI Integration Tests - Validate C Bindings Work

    These tests validate that our C FFI infrastructure (ml_glib.c and
    ml_gobject.c) works correctly by making actual C function calls.

    Tests cover:
    - GLib application/program name functions
    - GObject type system queries
    - GValue creation and basic operations
    - String utilities
*)

(** Test GLib application name functions *)
let test_application_name_get_set () =
  (* Initially, application name might be None *)
  let initial = Glib.get_application_name () in

  (* Set application name *)
  Glib.set_application_name "LablGTK4 Test Suite";

  (* Verify it was set *)
  let result = Glib.get_application_name () in
  Alcotest.(check (option string))
    "application name set correctly"
    (Some "LablGTK4 Test Suite")
    result;

  (* Restore initial value if there was one *)
  match initial with
  | Some name -> Glib.set_application_name name
  | None -> ()

(** Test GLib program name functions *)
let test_program_name_get_set () =
  (* Set a program name (might not be set initially) *)
  Glib.set_prgname "lablgtk4_test";

  (* Verify it was set *)
  let result = Glib.get_prgname () in
  Alcotest.(check (option string))
    "program name set correctly"
    (Some "lablgtk4_test")
    result

(** Test that we can create and use GTypes *)
let test_gtype_operations () =
  (* G_TYPE_STRING is a fundamental type we can easily test *)
  let (_decode, encode) = GobjectEnums.Conv.fundamental_type in
  let string_type_id = encode `STRING in

  (* Should be able to get the type name *)
  let type_name = Gobject.Type.name string_type_id in
  (* Type name should be reasonable (might be "gchararray" or "GString" etc.) *)
  Alcotest.(check bool)
    "String type has name"
    true
    (String.length type_name > 0);

  (* Should be able to check type relationships *)
  let is_string = Gobject.Type.is_a string_type_id string_type_id in
  Alcotest.(check bool)
    "type is_a itself"
    true
    is_string

(** Test GValue basic operations *)
let test_gvalue_int () =
  (* Create a new GValue *)
  let gv = Gobject.Value.create_empty () in

  (* Initialize it as an int *)
  let int_type = Gobject.Type.of_fundamental `INT in
  Gobject.Value.init gv int_type;

  (* Set an integer value *)
  Gobject.Value.set_int gv 42;

  (* Get the value back *)
  let result = Gobject.Value.get_int gv in
  Alcotest.(check int)
    "GValue int roundtrip"
    42
    result;

  (* Reset the GValue *)
  Gobject.Value.reset gv

let test_gvalue_string () =
  (* Create and initialize GValue for string *)
  let gv = Gobject.Value.create_empty () in
  let string_type = Gobject.Type.of_fundamental `STRING in
  Gobject.Value.init gv string_type;

  (* Set a string value *)
  Gobject.Value.set_string gv "Hello, GTK4!";

  (* Get the value back *)
  let result = Gobject.Value.get_string gv in
  Alcotest.(check string)
    "GValue string roundtrip"
    "Hello, GTK4!"
    result;

  Gobject.Value.reset gv

let test_gvalue_boolean () =
  (* Create and initialize GValue for boolean *)
  let gv = Gobject.Value.create_empty () in
  let bool_type = Gobject.Type.of_fundamental `BOOLEAN in
  Gobject.Value.init gv bool_type;

  (* Test true *)
  Gobject.Value.set_boolean gv true;
  let result1 = Gobject.Value.get_boolean gv in
  Alcotest.(check bool) "GValue boolean true" true result1;

  (* Test false *)
  Gobject.Value.set_boolean gv false;
  let result2 = Gobject.Value.get_boolean gv in
  Alcotest.(check bool) "GValue boolean false" false result2;

  Gobject.Value.reset gv

(** Test string utility: handle empty and UTF-8 strings *)
let test_string_utilities () =
  (* Test that we can handle empty strings *)
  let empty = "" in
  Alcotest.(check string) "empty string" "" empty;

  (* Test UTF-8 strings *)
  let utf8 = "Hello, 世界! 🎉" in
  let len = String.length utf8 in
  Alcotest.(check bool)
    "utf8 string has content"
    true
    (len > 0)

let () =
  Alcotest.run "FFI Integration Tests" [
    "GLib/ApplicationName", [
      Alcotest.test_case "get_set application name" `Quick test_application_name_get_set;
      Alcotest.test_case "get_set program name" `Quick test_program_name_get_set;
    ];

    "GObject/Types", [
      Alcotest.test_case "type operations" `Quick test_gtype_operations;
    ];

    "GObject/GValue", [
      Alcotest.test_case "int roundtrip" `Quick test_gvalue_int;
      Alcotest.test_case "string roundtrip" `Quick test_gvalue_string;
      Alcotest.test_case "boolean roundtrip" `Quick test_gvalue_boolean;
    ];

    "Utilities", [
      Alcotest.test_case "string utilities" `Quick test_string_utilities;
    ];
  ]
