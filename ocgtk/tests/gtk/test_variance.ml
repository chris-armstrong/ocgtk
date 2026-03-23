(** Comprehensive variance test suite for Gobject.obj

    This test validates that the contravariant -'a obj type enables safe
    upcasting from derived types to base types using the :> operator.

    With contravariant obj:
    - Button.t (with [`button | `widget | `initially_unowned]) can upcast to Widget.t (with [`widget | `initially_unowned])
    - Box.t (with [`box | `widget | `initially_unowned]) can upcast to Widget.t
    - Nested upcasts work: Button.t → Widget.t → base
    - Downcasts remain unsafe and fail at compile time
*)

open Alcotest
open Ocgtk_gtk.Gtk
module GMain = Ocgtk_gtk.GMain

(* Module aliases for clarity *)
module Button = Wrappers.Button
module Box = Wrappers.Box
module Widget = Wrappers.Widget

(* Try to initialize GTK once for all tests *)
let gtk_available =
  try
    let _ = GMain.init () in
    true
  with GMain.Error _ -> false

(* Helper to skip tests when GTK is not available *)
let require_gtk f () = if not gtk_available then skip () else f ()

(** Test 1: Button.t upcasts to Widget.t

    Button has polymorphic variant [`button | `widget | `initially_unowned]
    Widget has polymorphic variant [`widget | `initially_unowned]

    Since Button's variant includes all of Widget's tags plus `button,
    Button.t is a subtype of Widget.t with contravariant obj, allowing safe upcast.
*)
let test_upcast_button_to_widget () =
  let btn = Button.new_ () in
  (* This should compile without Obj.magic *)
  let widget = (btn : Button.t :> Widget.t) in
  (* Verify the upcast worked by using a Widget method *)
  check bool "button upcasts to widget" true (Widget.get_visible widget)

(** Test 2: Box.t upcasts to Widget.t

    Box has polymorphic variant [`box | `widget | `initially_unowned]
    Widget has polymorphic variant [`widget | `initially_unowned]

    Box's variant includes all of Widget's tags plus `box,
    so Box.t is a subtype of Widget.t, allowing safe upcast.
*)
let test_upcast_box_to_widget () =
  let box = Box.new_ `HORIZONTAL 0 in
  (* This should compile without Obj.magic *)
  let widget = (box : Box.t :> Widget.t) in
  (* Verify the upcast worked *)
  check bool "box upcasts to widget" true (Widget.get_visible widget)

(** Test 3: Upcast preserves object identity and behavior

    Verify that upcasting doesn't break the object's functionality.
*)
let test_upcast_preserves_functionality () =
  let btn = Button.new_ () in
  let widget = (btn : Button.t :> Widget.t) in
  (* Verify the upcasted widget responds to methods *)
  Widget.hide widget;
  check bool "upcasted widget responds to methods" false (Widget.get_visible widget);
  Widget.show widget;
  check bool "upcasted widget can be shown again" true (Widget.get_visible widget)

(** Test 4: Multiple upcast operations

    Demonstrates that upcasts can be performed multiple times and chained.
*)
let test_multiple_upcasts () =
  let box = Box.new_ `VERTICAL 5 in
  (* First upcast *)
  let widget1 = (box : Box.t :> Widget.t) in
  (* Second upcast from same source (should work fine) *)
  let widget2 = (box : Box.t :> Widget.t) in
  (* Both should work independently *)
  check bool "first upcast works" true (Widget.get_visible widget1);
  check bool "second upcast works" true (Widget.get_visible widget2);
  (* Modify through one reference *)
  Widget.hide widget1;
  (* Change should be visible through other reference (same object) *)
  check bool "modifications visible through all references" false (Widget.get_visible widget2)

(** Test 5: Downcast should fail at compile time

    This test is documented but not implemented because it should NOT compile.
    If uncommented, the compiler should reject this code:

    let test_downcast_widget_to_button () =
      let w = Widget.new_ () in
      let btn = (w : Widget.t :> Button.t) in  (* ERROR: Widget is not a subtype of Button *)
      ()

    Widget.t has [`widget | `initially_unowned]
    Button.t has [`button | `widget | `initially_unowned]

    Widget's variant does NOT include all of Button's tags (missing `button),
    so Widget.t is NOT a subtype of Button.t, and the downcast should fail.
*)

(* Run all tests *)
let () =
  run "Gobject.obj Variance Tests"
    [
      ( "upcast",
        [
          test_case "button_to_widget" `Quick (require_gtk test_upcast_button_to_widget);
          test_case "box_to_widget" `Quick (require_gtk test_upcast_box_to_widget);
          test_case "upcast_preserves_functionality" `Quick (require_gtk test_upcast_preserves_functionality);
          test_case "multiple_upcasts" `Quick (require_gtk test_multiple_upcasts);
        ] );
    ]
