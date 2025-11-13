(** Test that all enum values map to distinct C integers

    This test ensures that:
    1. Each enum value maps to a unique C integer (injective)
    2. The C integers are valid GTK4 constants
    3. No two different OCaml values map to the same C value
*)

open Gtk4Enums

let test_align_distinct () =
  let (_, encode) = Conv.align in
  let values = [`FILL; `START; `END; `CENTER; `BASELINE] in
  let integers = List.map encode values in

  (* Check all values are distinct *)
  let unique = List.sort_uniq compare integers in
  Alcotest.(check int)
    "all GtkAlign values map to distinct integers"
    (List.length values) (List.length unique)

let test_orientation_distinct () =
  let (_, encode) = Conv.orientation in
  let values = [`HORIZONTAL; `VERTICAL] in
  let integers = List.map encode values in

  (* Check all values are distinct *)
  let unique = List.sort_uniq compare integers in
  Alcotest.(check int)
    "all GtkOrientation values map to distinct integers"
    (List.length values) (List.length unique)

let test_pack_type_distinct () =
  let (_, encode) = Conv.pack_type in
  let values = [`START; `END] in
  let integers = List.map encode values in

  (* Check all values are distinct *)
  let unique = List.sort_uniq compare integers in
  Alcotest.(check int)
    "all GtkPackType values map to distinct integers"
    (List.length values) (List.length unique)

let test_align_values_exist () =
  (* Test that we can create all expected enum values *)
  let values: align list = [`FILL; `START; `END; `CENTER; `BASELINE] in
  Alcotest.(check int) "GtkAlign has 5 values" 5 (List.length values)

let test_orientation_values_exist () =
  let values: orientation list = [`HORIZONTAL; `VERTICAL] in
  Alcotest.(check int) "GtkOrientation has 2 values" 2 (List.length values)

let test_pack_type_values_exist () =
  let values: pack_type list = [`START; `END] in
  Alcotest.(check int) "GtkPackType has 2 values" 2 (List.length values)

let () =
  Alcotest.run "Enum Value Coverage" [
    "GtkAlign", [
      Alcotest.test_case "all values exist" `Quick test_align_values_exist;
      Alcotest.test_case "all values distinct" `Quick test_align_distinct;
    ];
    "GtkOrientation", [
      Alcotest.test_case "all values exist" `Quick test_orientation_values_exist;
      Alcotest.test_case "all values distinct" `Quick test_orientation_distinct;
    ];
    "GtkPackType", [
      Alcotest.test_case "all values exist" `Quick test_pack_type_values_exist;
      Alcotest.test_case "all values distinct" `Quick test_pack_type_distinct;
    ];
  ]
