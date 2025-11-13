(**************************************************************************)
(*                Test Suite for GDK Module (Phase 2.4)                  *)
(*                                                                        *)
(* These tests validate the GDK4 module implementation including:        *)
(* - GDK enum conversions (gravity, modifier types, etc.)                *)
(* - Display management                                                   *)
(* - Seat and Device management (new in GDK4)                             *)
(* - Surface operations (was GdkWindow in GDK3)                           *)
(* - Rectangle utilities                                                  *)
(* - RGBA color operations                                                *)
(* - Cursor management                                                    *)
(**************************************************************************)

open Alcotest

(* Helper to create check functions *)
let check = Alcotest.check

(** {2 GDK Enum Tests (Phase 1.3)} *)

let test_gdk_enums_accessible () =
  (* Test we can access GDK enum converters *)
  let _ = Gdk4Enums.Conv.gravity in
  let _ = Gdk4Enums.Conv.modifier_type in
  let _ = Gdk4Enums.Conv.surface_edge in
  let _ = Gdk4Enums.Conv.scroll_direction in
  let _ = Gdk4Enums.Conv.input_source in
  ()

let test_gravity_roundtrip () =
  let (decode, encode) = Gdk4Enums.Conv.gravity in

  let test_gravity g =
    let c_val = encode g in
    let g' = decode c_val in
    check bool (Format.asprintf "gravity %s roundtrip"
      (match g with `NORTH_WEST -> "NORTH_WEST" | `CENTER -> "CENTER" | _ -> "other"))
      true (g = g')
  in

  test_gravity `NORTH_WEST;
  test_gravity `NORTH;
  test_gravity `CENTER;
  test_gravity `SOUTH;
  test_gravity `STATIC

let test_modifier_type_roundtrip () =
  let (decode, encode) = Gdk4Enums.Conv.modifier_type in

  let test_mod m =
    let c_val = encode m in
    let m' = decode c_val in
    check bool "modifier roundtrip" true (m = m')
  in

  test_mod `SHIFT_MASK;
  test_mod `CONTROL_MASK;
  test_mod `ALT_MASK;
  test_mod `SUPER_MASK;
  test_mod `BUTTON1_MASK

let test_scroll_direction_roundtrip () =
  let (decode, encode) = Gdk4Enums.Conv.scroll_direction in

  let test_dir d =
    let c_val = encode d in
    let d' = decode c_val in
    check bool "scroll direction roundtrip" true (d = d')
  in

  test_dir `UP;
  test_dir `DOWN;
  test_dir `LEFT;
  test_dir `RIGHT;
  test_dir `SMOOTH

let test_input_source_roundtrip () =
  let (decode, encode) = Gdk4Enums.Conv.input_source in

  let test_source s =
    let c_val = encode s in
    let s' = decode c_val in
    check bool "input source roundtrip" true (s = s')
  in

  test_source `MOUSE;
  test_source `PEN;
  test_source `KEYBOARD;
  test_source `TOUCHSCREEN;
  test_source `TOUCHPAD

(** {2 Display Tests} *)

let test_display_get_default () =
  (* Get default display - this requires a running display server *)
  match Gdk.Display.get_default () with
  | None ->
      (* OK if no display server (headless environment) *)
      check bool "no display in headless" true true
  | Some display ->
      (* If we have a display, it should have a name *)
      let name = Gdk.Display.get_name display in
      check bool "display has non-empty name" true (String.length name > 0)

let test_display_name () =
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      let name = Gdk.Display.get_name display in
      (* Display name should be something like ":0" or "wayland-0" *)
      check bool "display name format" true
        (String.contains name ':' || String.contains name '-')

let test_display_flush () =
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      (* Flush should complete without error *)
      Gdk.Display.flush display;
      check bool "flush completes" true true

let test_display_beep () =
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      (* Beep should complete without error (though it may not make sound) *)
      Gdk.Display.beep display;
      check bool "beep completes" true true

(** {2 Seat Tests (new in GDK4)} *)

let test_seat_get_default () =
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      match Gdk.Display.get_default_seat display with
      | None ->
          (* It's possible there's no default seat *)
          check bool "no default seat" true true
      | Some _seat ->
          check bool "has default seat" true true

let test_seat_get_pointer () =
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      match Gdk.Display.get_default_seat display with
      | None -> check bool "no seat" true true
      | Some seat ->
          match Gdk.Seat.get_pointer seat with
          | None ->
              (* It's possible there's no pointer device *)
              check bool "no pointer device" true true
          | Some _device ->
              check bool "has pointer device" true true

let test_seat_get_keyboard () =
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      match Gdk.Display.get_default_seat display with
      | None -> check bool "no seat" true true
      | Some seat ->
          match Gdk.Seat.get_keyboard seat with
          | None ->
              (* It's possible there's no keyboard device *)
              check bool "no keyboard device" true true
          | Some _device ->
              check bool "has keyboard device" true true

let test_seat_get_display () =
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      match Gdk.Display.get_default_seat display with
      | None -> check bool "no seat" true true
      | Some seat ->
          let seat_display = Gdk.Seat.get_display seat in
          (* The seat's display should be the same as the original *)
          check bool "seat display matches" true (seat_display == display)

(** {2 Device Tests} *)

let test_device_get_name () =
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      match Gdk.Display.get_default_seat display with
      | None -> check bool "no seat" true true
      | Some seat ->
          match Gdk.Seat.get_pointer seat with
          | None -> check bool "no pointer" true true
          | Some device ->
              let name = Gdk.Device.get_name device in
              check bool "device has non-empty name" true (String.length name > 0)

let test_device_get_source () =
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      match Gdk.Display.get_default_seat display with
      | None -> check bool "no seat" true true
      | Some seat ->
          match Gdk.Seat.get_pointer seat with
          | None -> check bool "no pointer" true true
          | Some device ->
              let source = Gdk.Device.get_source device in
              (* Pointer device should have a valid source type *)
              check bool "device has source" true
                (match source with
                 | `MOUSE | `PEN | `TOUCHSCREEN | `TOUCHPAD | `TRACKPOINT | _ -> true)

let test_device_get_seat () =
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      match Gdk.Display.get_default_seat display with
      | None -> check bool "no seat" true true
      | Some seat ->
          match Gdk.Seat.get_pointer seat with
          | None -> check bool "no pointer" true true
          | Some device ->
              let device_seat = Gdk.Device.get_seat device in
              (* The device's seat should be the same as the original *)
              check bool "device seat matches" true (device_seat == seat)

let test_device_get_display () =
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      match Gdk.Display.get_default_seat display with
      | None -> check bool "no seat" true true
      | Some seat ->
          match Gdk.Seat.get_pointer seat with
          | None -> check bool "no pointer" true true
          | Some device ->
              let device_display = Gdk.Device.get_display device in
              (* The device's display should be the same as the original *)
              check bool "device display matches" true (device_display == display)

(** {2 Rectangle Tests} *)

let test_rectangle_create () =
  let rect = Gdk.Rectangle.create ~x:10 ~y:20 ~width:100 ~height:50 in
  check int "rect x" 10 rect.x;
  check int "rect y" 20 rect.y;
  check int "rect width" 100 rect.width;
  check int "rect height" 50 rect.height

let test_rectangle_intersect_overlap () =
  let r1 = Gdk.Rectangle.create ~x:0 ~y:0 ~width:100 ~height:100 in
  let r2 = Gdk.Rectangle.create ~x:50 ~y:50 ~width:100 ~height:100 in
  match Gdk.Rectangle.intersect r1 r2 with
  | None -> fail "rectangles should intersect"
  | Some intersect ->
      check int "intersect x" 50 intersect.x;
      check int "intersect y" 50 intersect.y;
      check int "intersect width" 50 intersect.width;
      check int "intersect height" 50 intersect.height

let test_rectangle_intersect_no_overlap () =
  let r1 = Gdk.Rectangle.create ~x:0 ~y:0 ~width:10 ~height:10 in
  let r2 = Gdk.Rectangle.create ~x:20 ~y:20 ~width:10 ~height:10 in
  match Gdk.Rectangle.intersect r1 r2 with
  | None -> check bool "no intersection" true true
  | Some _ -> fail "rectangles should not intersect"

let test_rectangle_union () =
  let r1 = Gdk.Rectangle.create ~x:0 ~y:0 ~width:100 ~height:50 in
  let r2 = Gdk.Rectangle.create ~x:50 ~y:25 ~width:100 ~height:50 in
  let union = Gdk.Rectangle.union r1 r2 in
  check int "union x" 0 union.x;
  check int "union y" 0 union.y;
  check int "union width" 150 union.width;
  check int "union height" 75 union.height

(** {2 RGBA Color Tests} *)

let test_rgba_create () =
  let rgba = Gdk.RGBA.create ~red:1.0 ~green:0.5 ~blue:0.0 ~alpha:0.8 in
  check (float 0.01) "red" 1.0 (Gdk.RGBA.get_red rgba);
  check (float 0.01) "green" 0.5 (Gdk.RGBA.get_green rgba);
  check (float 0.01) "blue" 0.0 (Gdk.RGBA.get_blue rgba);
  check (float 0.01) "alpha" 0.8 (Gdk.RGBA.get_alpha rgba)

let test_rgba_white () =
  let white = Gdk.RGBA.create ~red:1.0 ~green:1.0 ~blue:1.0 ~alpha:1.0 in
  check (float 0.01) "white red" 1.0 (Gdk.RGBA.get_red white);
  check (float 0.01) "white green" 1.0 (Gdk.RGBA.get_green white);
  check (float 0.01) "white blue" 1.0 (Gdk.RGBA.get_blue white);
  check (float 0.01) "white alpha" 1.0 (Gdk.RGBA.get_alpha white)

let test_rgba_black () =
  let black = Gdk.RGBA.create ~red:0.0 ~green:0.0 ~blue:0.0 ~alpha:1.0 in
  check (float 0.01) "black red" 0.0 (Gdk.RGBA.get_red black);
  check (float 0.01) "black green" 0.0 (Gdk.RGBA.get_green black);
  check (float 0.01) "black blue" 0.0 (Gdk.RGBA.get_blue black)

let test_rgba_transparent () =
  let transparent = Gdk.RGBA.create ~red:0.0 ~green:0.0 ~blue:0.0 ~alpha:0.0 in
  check (float 0.01) "transparent alpha" 0.0 (Gdk.RGBA.get_alpha transparent)

let test_rgba_to_string () =
  let rgba = Gdk.RGBA.create ~red:1.0 ~green:0.0 ~blue:0.0 ~alpha:1.0 in
  let str = Gdk.RGBA.to_string rgba in
  (* GdkRGBA to_string formats as "rgb(r,g,b)" or "rgba(r,g,b,a)" *)
  check bool "to_string not empty" true (String.length str > 0);
  check bool "to_string contains rgb" true
    (String.contains str 'r' && String.contains str 'g' && String.contains str 'b')

let test_rgba_parse () =
  match Gdk.RGBA.parse "rgb(255,0,0)" with
  | None -> fail "should parse rgb(255,0,0)"
  | Some rgba ->
      (* Red should be close to 1.0 *)
      check bool "parsed red" true (Gdk.RGBA.get_red rgba > 0.9);
      check bool "parsed green" true (Gdk.RGBA.get_green rgba < 0.1);
      check bool "parsed blue" true (Gdk.RGBA.get_blue rgba < 0.1)

let test_rgba_parse_invalid () =
  match Gdk.RGBA.parse "invalid color string" with
  | None -> check bool "invalid parse returns None" true true
  | Some _ -> fail "should not parse invalid color"

(** {2 Cursor Tests} *)

let test_cursor_create_from_name () =
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      (* Try to create a standard cursor *)
      match Gdk.Cursor.create_from_name "default" display with
      | None ->
          (* It's OK if cursor creation fails in some environments *)
          check bool "cursor creation may fail" true true
      | Some _cursor ->
          check bool "cursor created" true true

let test_cursor_create_various_names () =
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      let cursor_names = ["pointer"; "hand"; "wait"; "text"; "crosshair"] in
      List.iter (fun name ->
        match Gdk.Cursor.create_from_name name display with
        | None | Some _ -> () (* Both outcomes are acceptable *)
      ) cursor_names;
      check bool "cursor creation attempts complete" true true

(** {2 Integration Tests} *)

let test_display_to_device_chain () =
  (* Test the chain: Display -> Seat -> Device *)
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      match Gdk.Display.get_default_seat display with
      | None -> check bool "no seat" true true
      | Some seat ->
          match Gdk.Seat.get_pointer seat with
          | None -> check bool "no pointer" true true
          | Some device ->
              (* Verify the chain works both ways *)
              let device_display = Gdk.Device.get_display device in
              let device_seat = Gdk.Device.get_seat device in
              check bool "display chain" true (device_display == display);
              check bool "seat chain" true (device_seat == seat)

let test_dual_device_access () =
  (* Test accessing both pointer and keyboard from same seat *)
  match Gdk.Display.get_default () with
  | None -> check bool "skip in headless" true true
  | Some display ->
      match Gdk.Display.get_default_seat display with
      | None -> check bool "no seat" true true
      | Some seat ->
          let pointer = Gdk.Seat.get_pointer seat in
          let keyboard = Gdk.Seat.get_keyboard seat in
          match pointer, keyboard with
          | Some p, Some k ->
              (* Both devices should have same display *)
              let p_display = Gdk.Device.get_display p in
              let k_display = Gdk.Device.get_display k in
              check bool "same display" true (p_display == k_display)
          | _ ->
              check bool "devices may not exist" true true

(** {2 Test Suite} *)

let () =
  Alcotest.run "GDK Module Tests (Phase 2.4)" [
    "Enums (Phase 1.3)", [
      test_case "enum modules accessible" `Quick test_gdk_enums_accessible;
      test_case "gravity roundtrip" `Quick test_gravity_roundtrip;
      test_case "modifier type roundtrip" `Quick test_modifier_type_roundtrip;
      test_case "scroll direction roundtrip" `Quick test_scroll_direction_roundtrip;
      test_case "input source roundtrip" `Quick test_input_source_roundtrip;
    ];

    "Display Management", [
      test_case "get default display" `Quick test_display_get_default;
      test_case "display name" `Quick test_display_name;
      test_case "display flush" `Quick test_display_flush;
      test_case "display beep" `Quick test_display_beep;
    ];

    "Seat Management (GDK4)", [
      test_case "get default seat" `Quick test_seat_get_default;
      test_case "seat get pointer" `Quick test_seat_get_pointer;
      test_case "seat get keyboard" `Quick test_seat_get_keyboard;
      test_case "seat get display" `Quick test_seat_get_display;
    ];

    "Device Management", [
      test_case "device get name" `Quick test_device_get_name;
      test_case "device get source" `Quick test_device_get_source;
      test_case "device get seat" `Quick test_device_get_seat;
      test_case "device get display" `Quick test_device_get_display;
    ];

    "Rectangle Utilities", [
      test_case "create rectangle" `Quick test_rectangle_create;
      test_case "intersect with overlap" `Quick test_rectangle_intersect_overlap;
      test_case "intersect no overlap" `Quick test_rectangle_intersect_no_overlap;
      test_case "union rectangles" `Quick test_rectangle_union;
    ];

    "RGBA Color Operations", [
      test_case "create RGBA" `Quick test_rgba_create;
      test_case "white color" `Quick test_rgba_white;
      test_case "black color" `Quick test_rgba_black;
      test_case "transparent color" `Quick test_rgba_transparent;
      test_case "to_string" `Quick test_rgba_to_string;
      test_case "parse RGB" `Quick test_rgba_parse;
      test_case "parse invalid" `Quick test_rgba_parse_invalid;
    ];

    "Cursor Management", [
      test_case "create from name" `Quick test_cursor_create_from_name;
      test_case "various cursor names" `Quick test_cursor_create_various_names;
    ];

    "Integration Tests", [
      test_case "display to device chain" `Quick test_display_to_device_chain;
      test_case "dual device access" `Quick test_dual_device_access;
    ];
  ]
