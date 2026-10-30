(* Runtime tests for ocgdkpixbuf across the package boundary with ocgio:
   a Pixbuf used as an Ocgio icon (inherited class type), and a PNG round
   trip through Ocgio memory streams. *)

open Ocgdkpixbuf

let get = function
  | Ok v -> v
  | Error e -> Alcotest.failf "GError: %s" (Ocglib.GError.message e)

let make () =
  let p = Pixbuf.new_ `RGB false 8 4 3 in
  p#fill (Ocglib.UInt32.of_int 0xff0000ff);
  p

let test_new () =
  let p = make () in
  Alcotest.(check (list int))
    "width, height, channels" [ 4; 3; 3 ]
    [ p#get_width (); p#get_height (); p#get_n_channels () ]

let test_as_gio_icon () =
  let p = make () in
  let icon = (p :> Ocgio.Icon.icon_t) in
  Alcotest.(check bool) "icon equals itself" true (icon#equal (Some icon));
  ignore (icon#hash ())

let test_png_round_trip () =
  let p = make () in
  let out = Ocgio.Memory_output_stream.new_resizable () in
  let ok =
    get
      (p#save_to_streamv
         (out :> Ocgio.Output_stream.output_stream_t)
         "png" None None None)
  in
  Alcotest.(check bool) "saved" true ok;
  ignore (get (out#close None));
  let bytes = out#steal_as_bytes () in
  let input = Ocgio.Memory_input_stream.new_from_bytes bytes in
  let q =
    get
      (Pixbuf.new_from_stream (input :> Ocgio.Input_stream.input_stream_t) None)
  in
  Alcotest.(check (pair int int))
    "size after round trip" (4, 3)
    (q#get_width (), q#get_height ());
  Gc.full_major ()

let () =
  Alcotest.run "ocgdkpixbuf"
    [
      ( "cross-package",
        [
          Alcotest.test_case "Pixbuf.new_" `Quick test_new;
          Alcotest.test_case "Pixbuf as Ocgio.Icon" `Quick test_as_gio_icon;
          Alcotest.test_case "PNG through Ocgio memory streams" `Quick
            test_png_round_trip;
        ] );
    ]
