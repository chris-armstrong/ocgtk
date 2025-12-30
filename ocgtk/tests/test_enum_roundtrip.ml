(** Test round-trip conversions for GTK4 enums

    This test ensures that converting OCaml enum values to C integers
    and back produces the same value (bijection property).
*)

open Gtk4Enums

let test_align_roundtrip () =
  let (decode, encode) = Conv.align in
  let test_value v =
    let i = encode v in
    let v' = decode i in
    Alcotest.(check (of_pp (fun fmt -> function
      | `FILL -> Format.fprintf fmt "FILL"
      | `START -> Format.fprintf fmt "START"
      | `END -> Format.fprintf fmt "END"
      | `CENTER -> Format.fprintf fmt "CENTER"
      | `BASELINE -> Format.fprintf fmt "BASELINE")))
      (Format.asprintf "roundtrip %a" (fun fmt -> function
        | `FILL -> Format.fprintf fmt "FILL"
        | `START -> Format.fprintf fmt "START"
        | `END -> Format.fprintf fmt "END"
        | `CENTER -> Format.fprintf fmt "CENTER"
        | `BASELINE -> Format.fprintf fmt "BASELINE") v)
      v v'
  in
  test_value `FILL;
  test_value `START;
  test_value `END;
  test_value `CENTER;
  test_value `BASELINE

let test_orientation_roundtrip () =
  let (decode, encode) = Conv.orientation in
  let test_value v =
    let i = encode v in
    let v' = decode i in
    Alcotest.(check (of_pp (fun fmt -> function
      | `HORIZONTAL -> Format.fprintf fmt "HORIZONTAL"
      | `VERTICAL -> Format.fprintf fmt "VERTICAL")))
      (Format.asprintf "roundtrip %a" (fun fmt -> function
        | `HORIZONTAL -> Format.fprintf fmt "HORIZONTAL"
        | `VERTICAL -> Format.fprintf fmt "VERTICAL") v)
      v v'
  in
  test_value `HORIZONTAL;
  test_value `VERTICAL

let test_pack_type_roundtrip () =
  let (decode, encode) = Conv.pack_type in
  let test_value v =
    let i = encode v in
    let v' = decode i in
    Alcotest.(check (of_pp (fun fmt -> function
      | `START -> Format.fprintf fmt "START"
      | `END -> Format.fprintf fmt "END")))
      (Format.asprintf "roundtrip %a" (fun fmt -> function
        | `START -> Format.fprintf fmt "START"
        | `END -> Format.fprintf fmt "END") v)
      v v'
  in
  test_value `START;
  test_value `END

let () =
  Alcotest.run "Enum Round-trip Conversions" [
    "GtkAlign", [
      Alcotest.test_case "round-trip all values" `Quick test_align_roundtrip;
    ];
    "GtkOrientation", [
      Alcotest.test_case "round-trip all values" `Quick test_orientation_roundtrip;
    ];
    "GtkPackType", [
      Alcotest.test_case "round-trip all values" `Quick test_pack_type_roundtrip;
    ];
  ]
