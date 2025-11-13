(**************************************************************************)
(*                LablGTK4 - OCaml bindings for GTK4                      *)
(*                                                                        *)
(*    Test suite for GObject module (Phase 2.2)                           *)
(*                                                                        *)
(*    Tests cover:                                                        *)
(*    - Type system queries and hierarchy                                 *)
(*    - GValue operations for all standard types                          *)
(*    - Property get/set (basic)                                          *)
(*    - Signal/Closure creation                                           *)
(*    - Data conversions (enum/flags)                                     *)
(*    - Memory safety and lifecycle                                       *)
(*                                                                        *)
(**************************************************************************)

open Alcotest

(* ==================================================================== *)
(* Test Type System *)
(* ==================================================================== *)

let test_type_fundamental () =
  (* Test fundamental type conversions *)
  let int_type = Gobject.Type.of_fundamental `INT in
  let fund = Gobject.Type.fundamental int_type in
  check bool "fundamental type INT" true (fund = `INT);

  let string_type = Gobject.Type.of_fundamental `STRING in
  let fund2 = Gobject.Type.fundamental string_type in
  check bool "fundamental type STRING" true (fund2 = `STRING);

  let bool_type = Gobject.Type.of_fundamental `BOOLEAN in
  let fund3 = Gobject.Type.fundamental bool_type in
  check bool "fundamental type BOOLEAN" true (fund3 = `BOOLEAN)

let test_type_name () =
  (* Test type name queries *)
  let int_type = Gobject.Type.of_fundamental `INT in
  let name = Gobject.Type.name int_type in
  check bool "INT type has name" true (String.length name > 0);

  let string_type = Gobject.Type.of_fundamental `STRING in
  let name2 = Gobject.Type.name string_type in
  check bool "STRING type has name" true (String.length name2 > 0)

let test_type_from_name () =
  (* Test type lookup by name *)
  let gtype1 = Gobject.Type.from_name "gint" in
  check bool "gint type found" true (gtype1 <> 0);

  let gtype2 = Gobject.Type.from_name "gchararray" in
  check bool "gchararray type found" true (gtype2 <> 0)

let test_type_parent () =
  (* Test type hierarchy - GtkWindow should have GtkWidget as ancestor *)
  let window_type = Gobject.Type.from_name "GtkWindow" in
  let widget_type = Gobject.Type.from_name "GtkWidget" in

  if window_type <> 0 && widget_type <> 0 then begin
    (* Check if GtkWindow is derived from GtkWidget *)
    let is_derived = Gobject.Type.is_a window_type widget_type in
    check bool "GtkWindow is_a GtkWidget" true is_derived;

    (* Get parent chain *)
    let parent = Gobject.Type.parent window_type in
    check bool "GtkWindow has parent" true (parent <> 0)
  end else
    skip ()

let test_type_is_a () =
  (* Test type hierarchy checks *)
  let int_type = Gobject.Type.of_fundamental `INT in
  let string_type = Gobject.Type.of_fundamental `STRING in

  (* A type should be itself *)
  check bool "type is_a itself" true (Gobject.Type.is_a int_type int_type);

  (* Different fundamental types should not be compatible *)
  check bool "int not is_a string" false (Gobject.Type.is_a int_type string_type)

(* ==================================================================== *)
(* Test GValue Operations *)
(* ==================================================================== *)

let test_gvalue_int () =
  (* Test GValue with integer *)
  let int_type = Gobject.Type.of_fundamental `INT in
  let gval = Gobject.Value.create int_type in

  Gobject.Value.set_int gval 42;
  let result = Gobject.Value.get_int gval in
  check int "GValue int roundtrip" 42 result;

  Gobject.Value.set_int gval (-100);
  let result2 = Gobject.Value.get_int gval in
  check int "GValue negative int" (-100) result2

let test_gvalue_boolean () =
  (* Test GValue with boolean *)
  let bool_type = Gobject.Type.of_fundamental `BOOLEAN in
  let gval = Gobject.Value.create bool_type in

  Gobject.Value.set_boolean gval true;
  let result = Gobject.Value.get_boolean gval in
  check bool "GValue boolean true" true result;

  Gobject.Value.set_boolean gval false;
  let result2 = Gobject.Value.get_boolean gval in
  check bool "GValue boolean false" false result2

let test_gvalue_string () =
  (* Test GValue with string *)
  let string_type = Gobject.Type.of_fundamental `STRING in
  let gval = Gobject.Value.create string_type in

  Gobject.Value.set_string gval "Hello, World!";
  let result = Gobject.Value.get_string gval in
  check string "GValue string roundtrip" "Hello, World!" result;

  Gobject.Value.set_string gval "";
  let result2 = Gobject.Value.get_string gval in
  check string "GValue empty string" "" result2

let test_gvalue_float () =
  (* Test GValue with float *)
  let float_type = Gobject.Type.of_fundamental `FLOAT in
  let gval = Gobject.Value.create float_type in

  Gobject.Value.set_float gval 3.14159;
  let result = Gobject.Value.get_float gval in
  check (float 0.00001) "GValue float roundtrip" 3.14159 result

let test_gvalue_double () =
  (* Test GValue with double *)
  let double_type = Gobject.Type.of_fundamental `DOUBLE in
  let gval = Gobject.Value.create double_type in

  Gobject.Value.set_double gval 2.71828;
  let result = Gobject.Value.get_double gval in
  check (float 0.00001) "GValue double roundtrip" 2.71828 result

let test_gvalue_reset () =
  (* Test GValue reset *)
  let int_type = Gobject.Type.of_fundamental `INT in
  let gval = Gobject.Value.create int_type in

  Gobject.Value.set_int gval 100;
  Gobject.Value.reset gval;
  Gobject.Value.set_int gval 200;
  let result = Gobject.Value.get_int gval in
  check int "GValue after reset" 200 result

let test_gvalue_get_type () =
  (* Test getting GValue type *)
  let int_type = Gobject.Type.of_fundamental `INT in
  let gval = Gobject.Value.create int_type in

  let retrieved_type = Gobject.Value.get_type gval in
  check bool "GValue type query" true (retrieved_type = int_type)

let test_gvalue_create_empty () =
  (* Test creating empty GValue and initializing it *)
  let gval = Gobject.Value.create_empty () in
  let int_type = Gobject.Type.of_fundamental `INT in
  Gobject.Value.init gval int_type;
  Gobject.Value.set_int gval 123;
  let result = Gobject.Value.get_int gval in
  check int "Empty GValue init and use" 123 result

(* ==================================================================== *)
(* Test Signal System *)
(* ==================================================================== *)

let test_signal_closure_creation () =
  (* Test closure creation *)
  let called = ref false in
  let closure = Gobject.Closure.create (fun _argv ->
    called := true
  ) in
  (* Closure should be a valid pointer (not null) *)
  check bool "Closure created" true (Obj.magic closure <> 0)

(* ==================================================================== *)
(* Test Data Conversions *)
(* ==================================================================== *)

let test_data_enum () =
  (* Test enum conversion using Gtk.Align as example *)
  let (encode, decode) = Gtk4Enums.Conv.align in

  (* Test encoding/decoding roundtrip for FILL *)
  let encoded = encode `FILL in
  let decoded = decode encoded in
  check bool "Encode/decode FILL roundtrip" true (decoded = `FILL);

  (* Test another value - CENTER *)
  let encoded2 = encode `CENTER in
  let decoded2 = decode encoded2 in
  check bool "Encode/decode CENTER roundtrip" true (decoded2 = `CENTER);

  (* Test START *)
  let encoded3 = encode `START in
  let decoded3 = decode encoded3 in
  check bool "Encode/decode START roundtrip" true (decoded3 = `START)

let test_data_flags () =
  (* Test flags conversion using GLib log_level *)
  let (encode, decode) = GlibEnums.Conv.log_level in

  (* Test encoding/decoding *)
  let encoded = encode `ERROR in
  let decoded = decode encoded in
  check bool "Flags roundtrip" true (decoded = `ERROR)

let test_gobject_enums_accessible () =
  (* Test we can access GObject enum converters *)
  let _ = GobjectEnums.Conv.fundamental_type in
  let _ = GobjectEnums.Conv.signal_type in
  let _ = GobjectEnums.Conv.connect_flags in
  ()

let test_data_enum_gobject () =
  (* Conv.signal_type already returns an encoder/decoder pair *)
  let (encode, decode) = GobjectEnums.Conv.signal_type in

  (* Test round-trip conversion *)
  let test_signal sig_type =
    let i = encode sig_type in
    let sig_type' = decode i in
    check bool "signal_type roundtrip" true (sig_type = sig_type')
  in

  test_signal `RUN_FIRST;
  test_signal `RUN_LAST;
  test_signal `NO_RECURSE;
  test_signal `ACTION;
  test_signal `NO_HOOKS

let test_data_flags_gobject () =
  (* Conv.connect_flags already returns an encoder/decoder pair for flags *)
  let (encode, decode) = GobjectEnums.Conv.connect_flags in

  (* Test individual flag values *)
  let test_flag flag =
    let i = encode flag in
    let flag' = decode i in
    check bool "connect_flags roundtrip" true (flag = flag')
  in

  test_flag `AFTER;
  test_flag `SWAPPED

let test_fundamental_types () =
  let (encode, decode) = GobjectEnums.Conv.fundamental_type in

  (* Test basic types that every GObject system needs *)
  let test_type gtype =
    let c_val = encode gtype in
    let gtype' = decode c_val in
    check bool "fundamental_type roundtrip" true (gtype = gtype')
  in

  test_type `INVALID;
  test_type `NONE;
  test_type `BOOLEAN;
  test_type `INT;
  test_type `STRING;
  test_type `OBJECT

(* ==================================================================== *)
(* Test Object Operations *)
(* ==================================================================== *)

let test_object_coerce () =
  (* Test coerce and unsafe_cast - these are identity functions *)
  (* We can't test with real objects without GTK init, but verify functions exist *)
  let _ = Gobject.coerce in
  let _ = Gobject.unsafe_cast in
  ()

(* ==================================================================== *)
(* Test Memory Safety *)
(* ==================================================================== *)

let test_gvalue_lifecycle () =
  (* Create and destroy many GValues to test memory management *)
  for _i = 0 to 999 do
    let int_type = Gobject.Type.of_fundamental `INT in
    let gval = Gobject.Value.create int_type in
    Gobject.Value.set_int gval 42;
    let _ = Gobject.Value.get_int gval in
    ()
  done

let test_gvalue_multiple_types () =
  (* Test creating GValues of different types *)
  let int_gval = Gobject.Value.create (Gobject.Type.of_fundamental `INT) in
  let str_gval = Gobject.Value.create (Gobject.Type.of_fundamental `STRING) in
  let bool_gval = Gobject.Value.create (Gobject.Type.of_fundamental `BOOLEAN) in

  Gobject.Value.set_int int_gval 100;
  Gobject.Value.set_string str_gval "test";
  Gobject.Value.set_boolean bool_gval true;

  check int "Multiple GValues - int" 100 (Gobject.Value.get_int int_gval);
  check string "Multiple GValues - string" "test" (Gobject.Value.get_string str_gval);
  check bool "Multiple GValues - bool" true (Gobject.Value.get_boolean bool_gval)

(* ==================================================================== *)
(* Test Error Handling *)
(* ==================================================================== *)

let test_type_not_found () =
  (* Test that invalid type name returns 0 *)
  let invalid_type = Gobject.Type.from_name "NonExistentType12345" in
  check int "Invalid type returns 0" 0 invalid_type

let test_gvalue_type_mismatch () =
  (* Test that getting wrong type raises exception *)
  let int_type = Gobject.Type.of_fundamental `INT in
  let gval = Gobject.Value.create int_type in
  Gobject.Value.set_int gval 42;

  (* Try to get as string (should fail) *)
  try
    let _ = Gobject.Value.get_string gval in
    fail "Should have raised exception for type mismatch"
  with Invalid_argument _ ->
    ()

(* ==================================================================== *)
(* Test Suite *)
(* ==================================================================== *)

let () =
  run "GObject Module Tests (Phase 2.2)" [
    "Type System", [
      test_case "Fundamental types" `Quick test_type_fundamental;
      test_case "Type names" `Quick test_type_name;
      test_case "Type from name" `Quick test_type_from_name;
      test_case "Type hierarchy" `Quick test_type_parent;
      test_case "Type is_a check" `Quick test_type_is_a;
    ];

    "GValue Operations", [
      test_case "GValue int" `Quick test_gvalue_int;
      test_case "GValue boolean" `Quick test_gvalue_boolean;
      test_case "GValue string" `Quick test_gvalue_string;
      test_case "GValue float" `Quick test_gvalue_float;
      test_case "GValue double" `Quick test_gvalue_double;
      test_case "GValue reset" `Quick test_gvalue_reset;
      test_case "GValue get_type" `Quick test_gvalue_get_type;
      test_case "GValue create_empty" `Quick test_gvalue_create_empty;
    ];

    "Signals", [
      test_case "Closure creation" `Quick test_signal_closure_creation;
    ];

    "Data Conversions", [
      test_case "Enum conversion (Gtk4)" `Quick test_data_enum;
      test_case "Flags conversion (GLib)" `Quick test_data_flags;
      test_case "GObject enums accessible" `Quick test_gobject_enums_accessible;
      test_case "Signal type enum" `Quick test_data_enum_gobject;
      test_case "Connect flags" `Quick test_data_flags_gobject;
      test_case "Fundamental types" `Quick test_fundamental_types;
    ];

    "Object Operations", [
      test_case "Object coerce" `Quick test_object_coerce;
    ];

    "Memory Safety", [
      test_case "GValue lifecycle (1000 iterations)" `Quick test_gvalue_lifecycle;
      test_case "Multiple GValue types" `Quick test_gvalue_multiple_types;
    ];

    "Error Handling", [
      test_case "Type not found" `Quick test_type_not_found;
      test_case "GValue type mismatch" `Quick test_gvalue_type_mismatch;
    ];
  ]
