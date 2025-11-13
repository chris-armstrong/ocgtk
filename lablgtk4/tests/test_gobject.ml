(** GObject Binding Tests

    Tests for GObject type system functionality. Currently minimal as we
    only have enum bindings and basic Data module. Will be expanded as
    more GObject bindings are added.

    Future tests will cover:
    - Type registration
    - Object creation and destruction
    - Property get/set
    - Signal connection and emission
    - Reference counting
    - Weak references
*)

(** Test that GObject enum modules are accessible *)
let test_gobject_enums_accessible () =
  (* Test we can access GObject enum converters *)
  let _ = GobjectEnums.Conv.fundamental_type in
  let _ = GobjectEnums.Conv.signal_type in
  let _ = GobjectEnums.Conv.connect_flags in
  ()

(** Test GObject.Data.enum converter works *)
let test_data_enum () =
  (* Conv.signal_type already returns an encoder/decoder pair *)
  let (decode, encode) = GobjectEnums.Conv.signal_type in

  (* Test round-trip conversion *)
  let test_signal sig_type =
    let i = encode sig_type in
    let sig_type' = decode i in
    Alcotest.(check bool)
      (Format.asprintf "signal_type roundtrip")
      true (sig_type = sig_type')
  in

  test_signal `RUN_FIRST;
  test_signal `RUN_LAST;
  test_signal `NO_RECURSE;
  test_signal `ACTION;
  test_signal `NO_HOOKS

(** Test GObject.Data.flags converter works *)
let test_data_flags () =
  (* Conv.connect_flags already returns an encoder/decoder pair for flags *)
  let (decode, encode) = GobjectEnums.Conv.connect_flags in

  (* Test individual flag values (full bitwise OR support to be added later) *)
  let test_flag flag =
    let i = encode flag in
    let flag' = decode i in
    Alcotest.(check bool)
      (Format.asprintf "connect_flags roundtrip")
      true (flag = flag')
  in

  test_flag `AFTER;
  test_flag `SWAPPED

(** Test GType fundamental types *)
let test_fundamental_types () =
  let (decode, encode) = GobjectEnums.Conv.fundamental_type in

  (* Test basic types that every GObject system needs *)
  let test_type gtype =
    let c_val = encode gtype in
    let gtype' = decode c_val in
    Alcotest.(check bool)
      (Format.asprintf "fundamental_type roundtrip")
      true (gtype = gtype')
  in

  test_type `INVALID;
  test_type `NONE;
  test_type `BOOLEAN;
  test_type `INT;
  test_type `STRING;
  test_type `OBJECT

let () =
  Alcotest.run "GObject Bindings" [
    "Enums", [
      Alcotest.test_case "enum modules accessible" `Quick test_gobject_enums_accessible;
      Alcotest.test_case "Data.enum works" `Quick test_data_enum;
      Alcotest.test_case "Data.flags works" `Quick test_data_flags;
      Alcotest.test_case "fundamental types convert" `Quick test_fundamental_types;
    ];
  ]
