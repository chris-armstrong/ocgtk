(* Simple test to verify GTK4 enum conversions work *)

let () =
  (* Test that we can use the enum types *)
  let align : Gtk4Enums.align = `CENTER in
  let orientation : Gtk4Enums.orientation = `HORIZONTAL in
  let pack : Gtk4Enums.pack_type = `START in

  (* Test that the conversion functions exist *)
  let (decode_align, encode_align) = Gtk4Enums.Conv.align in
  let (decode_orient, encode_orient) = Gtk4Enums.Conv.orientation in
  let (decode_pack, encode_pack) = Gtk4Enums.Conv.pack_type in

  (* Test round-trip conversion for align *)
  let align_int = encode_align align in
  let align_back = decode_align align_int in
  assert (align = align_back);

  (* Test round-trip conversion for orientation *)
  let orient_int = encode_orient orientation in
  let orient_back = decode_orient orient_int in
  assert (orientation = orient_back);

  (* Test round-trip conversion for pack_type *)
  let pack_int = encode_pack pack in
  let pack_back = decode_pack pack_int in
  assert (pack = pack_back);

  (* Test all align values *)
  let test_align v =
    let i = encode_align v in
    let v' = decode_align i in
    assert (v = v');
    Printf.printf "✓ Align %s: %d\n%!"
      (match v with `FILL -> "FILL" | `START -> "START" | `END -> "END"
                  | `CENTER -> "CENTER" | `BASELINE -> "BASELINE") i
  in
  test_align `FILL;
  test_align `START;
  test_align `END;
  test_align `CENTER;
  test_align `BASELINE;

  (* Test all orientation values *)
  let test_orient v =
    let i = encode_orient v in
    let v' = decode_orient i in
    assert (v = v');
    Printf.printf "✓ Orientation %s: %d\n%!"
      (match v with `HORIZONTAL -> "HORIZONTAL" | `VERTICAL -> "VERTICAL") i
  in
  test_orient `HORIZONTAL;
  test_orient `VERTICAL;

  print_endline "\n✅ All enum conversion tests passed!"
