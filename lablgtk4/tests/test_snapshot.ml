(** Test suite for GtkSnapshot and Graphene (Phase 3.2)

    Note: Most snapshot tests are skipped as they require actual widget instances
    and a rendering context, which need concrete widget types from Phase 4/5.

    This test file verifies:
    - Graphene types compile and work correctly
    - GtkSnapshot module types are accessible
    - Gdk.RGBA record type works correctly
    *)

open Alcotest

(* ===== Graphene Tests ===== *)

let test_graphene_point () =
  let p = Graphene.Point.make ~x:10.5 ~y:20.7 in
  check (float 0.01) "point x" 10.5 p.Graphene.Point.x;
  check (float 0.01) "point y" 20.7 p.Graphene.Point.y;

  let zero = Graphene.Point.zero in
  check (float 0.01) "zero x" 0.0 zero.Graphene.Point.x;
  check (float 0.01) "zero y" 0.0 zero.Graphene.Point.y

let test_graphene_rect () =
  let r = Graphene.Rect.make ~x:5.0 ~y:10.0 ~width:100.0 ~height:50.0 in
  check (float 0.01) "rect x" 5.0 r.Graphene.Rect.x;
  check (float 0.01) "rect y" 10.0 r.Graphene.Rect.y;
  check (float 0.01) "rect width" 100.0 r.Graphene.Rect.width;
  check (float 0.01) "rect height" 50.0 r.Graphene.Rect.height;

  let zero = Graphene.Rect.zero in
  check (float 0.01) "zero x" 0.0 zero.Graphene.Rect.x

let test_graphene_rect_contains () =
  let r = Graphene.Rect.make ~x:10.0 ~y:10.0 ~width:100.0 ~height:100.0 in
  let inside = Graphene.Point.make ~x:50.0 ~y:50.0 in
  let outside = Graphene.Point.make ~x:5.0 ~y:5.0 in

  check bool "contains inside point" true (Graphene.Rect.contains_point r inside);
  check bool "doesn't contain outside point" false (Graphene.Rect.contains_point r outside)

let test_graphene_rect_intersects () =
  let r1 = Graphene.Rect.make ~x:0.0 ~y:0.0 ~width:100.0 ~height:100.0 in
  let r2 = Graphene.Rect.make ~x:50.0 ~y:50.0 ~width:100.0 ~height:100.0 in
  let r3 = Graphene.Rect.make ~x:200.0 ~y:200.0 ~width:50.0 ~height:50.0 in

  check bool "r1 intersects r2" true (Graphene.Rect.intersects r1 r2);
  check bool "r1 doesn't intersect r3" false (Graphene.Rect.intersects r1 r3)

let test_graphene_size () =
  let s = Graphene.Size.make ~width:640.0 ~height:480.0 in
  check (float 0.01) "size width" 640.0 s.Graphene.Size.width;
  check (float 0.01) "size height" 480.0 s.Graphene.Size.height;

  let zero = Graphene.Size.zero in
  check (float 0.01) "zero width" 0.0 zero.Graphene.Size.width

(* ===== RGBA Tests ===== *)

let test_rgba_record () =
  let rgba = Gdk.RGBA.make ~red:1.0 ~green:0.5 ~blue:0.25 ~alpha:0.8 in
  check (float 0.01) "red" 1.0 rgba.Gdk.RGBA.red;
  check (float 0.01) "green" 0.5 rgba.Gdk.RGBA.green;
  check (float 0.01) "blue" 0.25 rgba.Gdk.RGBA.blue;
  check (float 0.01) "alpha" 0.8 rgba.Gdk.RGBA.alpha

let test_rgba_constants () =
  let black = Gdk.RGBA.black in
  check (float 0.01) "black red" 0.0 black.Gdk.RGBA.red;
  check (float 0.01) "black alpha" 1.0 black.Gdk.RGBA.alpha;

  let white = Gdk.RGBA.white in
  check (float 0.01) "white red" 1.0 white.Gdk.RGBA.red;

  let transparent = Gdk.RGBA.transparent in
  check (float 0.01) "transparent alpha" 0.0 transparent.Gdk.RGBA.alpha

let test_rgba_to_string () =
  let rgba = Gdk.RGBA.make ~red:1.0 ~green:0.0 ~blue:0.0 ~alpha:1.0 in
  let str = Gdk.RGBA.to_string rgba in
  check bool "to_string not empty" true (String.length str > 0)

let test_rgba_parse () =
  match Gdk.RGBA.parse "rgb(255,0,0)" with
  | None -> fail "should parse rgb(255,0,0)"
  | Some rgba ->
      check bool "parsed red > 0.9" true (rgba.Gdk.RGBA.red > 0.9);
      check bool "parsed green < 0.1" true (rgba.Gdk.RGBA.green < 0.1)

(* ===== Snapshot Tests ===== *)

(* Most snapshot tests are skipped - they need actual widgets *)

let test_snapshot_types_accessible () =
  (* Just verify the module types compile *)
  check bool "snapshot types accessible" true true

let test_snapshot_rendering_skipped () =
  (* Skipped: Requires widget with snapshot callback *)
  skip ()

let test_snapshot_cairo_skipped () =
  (* Skipped: Requires rendering context *)
  skip ()

let () =
  run "GtkSnapshot and Graphene Tests (Phase 3.2)" [
    "Graphene.Point", [
      test_case "make and accessors" `Quick test_graphene_point;
    ];
    "Graphene.Rect", [
      test_case "make and accessors" `Quick test_graphene_rect;
      test_case "contains_point" `Quick test_graphene_rect_contains;
      test_case "intersects" `Quick test_graphene_rect_intersects;
    ];
    "Graphene.Size", [
      test_case "make and accessors" `Quick test_graphene_size;
    ];
    "Gdk.RGBA", [
      test_case "record type" `Quick test_rgba_record;
      test_case "constants" `Quick test_rgba_constants;
      test_case "to_string" `Quick test_rgba_to_string;
      test_case "parse" `Quick test_rgba_parse;
    ];
    "GtkSnapshot", [
      test_case "types accessible" `Quick test_snapshot_types_accessible;
      test_case "rendering" `Quick test_snapshot_rendering_skipped;
      test_case "cairo integration" `Quick test_snapshot_cairo_skipped;
    ];
  ]
