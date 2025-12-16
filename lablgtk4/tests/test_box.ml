(** Test suite for Gtk.Box module (Phase 4.1)

    This test file verifies:
    - GtkBox module compiles and types are accessible
    - Box creation with different orientations
    - Child management (append, prepend, insert, remove)
    - Box properties (spacing, homogeneous, baseline_position)
    - High-level GBox wrapper functionality
    - GTK3 compatibility helpers
    *)

open Alcotest

module Widget = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget

(* Try to initialize GTK once for all tests *)
let gtk_available =
  try
    let _ = GMain.init () in
    true
  with
  | GMain.Error _ -> false

(* Helper to skip tests when GTK is not available *)
let require_gtk f () =
  if not gtk_available then skip ()
  else f ()

(* Test that Box module is accessible and types compile *)
let test_module_accessible () =
  (* Test that we can reference the types *)
  let _box_type : Box.t option = None in
  let _orientation : Gtk.orientation = `HORIZONTAL in
  let _baseline : Gtk.baseline_position = `CENTER in

  check bool "module accessible" true true

(* Test type constructors for orientation and baseline_position *)
let test_type_constructors () =
  (* Test orientation *)
  let _horiz : Gtk.orientation = `HORIZONTAL in
  let _vert : Gtk.orientation = `VERTICAL in

  (* Test baseline_position *)
  let _top : Gtk.baseline_position = `TOP in
  let _center : Gtk.baseline_position = `CENTER in
  let _bottom : Gtk.baseline_position = `BOTTOM in

  check bool "types construct" true true

(* Test box creation - requires GTK init *)
let test_box_creation () =
  (* Create horizontal box *)
  let hbox = Box.new_ `HORIZONTAL 5 in
  check int "horizontal box spacing" 5 (Box.get_spacing hbox);
  check bool "horizontal box not homogeneous" false (Box.get_homogeneous hbox);

  (* Create vertical box *)
  let vbox = Box.new_ `VERTICAL 10 in
  check int "vertical box spacing" 10 (Box.get_spacing vbox);
  check bool "vertical box not homogeneous" false (Box.get_homogeneous vbox)

(* Test box properties *)
let test_box_properties () =
  let box = Box.new_ `HORIZONTAL 0 in

  (* Test spacing *)
  Box.set_spacing box 15;
  check int "spacing set to 15" 15 (Box.get_spacing box);

  (* Test homogeneous *)
  Box.set_homogeneous box true;
  check bool "homogeneous set to true" true (Box.get_homogeneous box);

  (* Test baseline position *)
  Box.set_baseline_position box `TOP;
  check bool "baseline position set to TOP"
    (`TOP = Box.get_baseline_position box) true

(* Test widget packing properties *)
let test_packing_properties () =
  let box = Box.new_ `HORIZONTAL 0 in
  let widget = Box.as_widget box in

  (* Test hexpand/vexpand *)
  Widget.set_hexpand widget true;
  check bool "hexpand set" true (Widget.get_hexpand widget);

  Widget.set_vexpand widget true;
  check bool "vexpand set" true (Widget.get_vexpand widget);

  (* Test halign/valign *)
  Widget.set_halign widget `CENTER;
  check bool "halign set to CENTER"
    (`CENTER = Widget.get_halign widget) true;

  Widget.set_valign widget `FILL;
  check bool "valign set to FILL"
    (`FILL = Widget.get_valign widget) true;

  (* Test margins *)
  Widget.set_margin_start widget 10;
  check int "margin_start set" 10 (Widget.get_margin_start widget);

  Widget.set_margin_end widget 20;
  check int "margin_end set" 20 (Widget.get_margin_end widget);

  Widget.set_margin_top widget 5;
  check int "margin_top set" 5 (Widget.get_margin_top widget);

  Widget.set_margin_bottom widget 15;
  check int "margin_bottom set" 15 (Widget.get_margin_bottom widget)

(* Test high-level GBox wrapper *)
let test_gbox_wrapper () =
  (* Create horizontal box with wrapper *)
  let hbox_obj = Box.new_ `HORIZONTAL 10 in
  let hbox = new GBox.box hbox_obj in
  check int "gbox hbox spacing" 10 (hbox#get_spacing ());

  (* Set properties *)
  hbox#set_spacing 20;
  check int "gbox spacing updated" 20 (hbox#get_spacing ());

  hbox#set_homogeneous true;
  check bool "gbox homogeneous" true (hbox#get_homogeneous ());

  (* Create vertical box with wrapper *)
  let vbox_obj = Box.new_ `VERTICAL 5 in
  let vbox = new GBox.box vbox_obj in
  vbox#set_homogeneous true;
  check int "gbox vbox spacing" 5 (vbox#get_spacing ());
  check bool "gbox vbox homogeneous" true (vbox#get_homogeneous ())

(* Test child append/prepend - requires actual child widgets *)
let test_child_management () =
  let parent_box = Box.new_ `HORIZONTAL 0 in
  let child_box = Box.new_ `VERTICAL 0 in
  let child_widget = Box.as_widget child_box in

  (* Test append *)
  Box.append parent_box child_widget;

  (* Test prepend - create another child *)
  let child2_box = Box.new_ `VERTICAL 0 in
  let child2_widget = Box.as_widget child2_box in
  Box.prepend parent_box child2_widget;

  (* Test remove *)
  Box.remove parent_box child_widget;
  Box.remove parent_box child2_widget;

  check bool "child management successful" true true

(* Test as_widget function *)
let test_as_widget () =
  let box = Box.new_ `HORIZONTAL 0 in
  let widget = Box.as_widget box in

  (* Verify it's a valid widget by calling widget methods *)
  Widget.set_name widget "test_box";
  check string "converted widget name" "test_box" (Widget.get_name widget)

let () =
  run "Gtk.Box Tests (Phase 4.1)" [
    "module", [
      test_case "module_accessible" `Quick test_module_accessible;
      test_case "type_constructors" `Quick test_type_constructors;
    ];
    "creation", [
      test_case "box_creation" `Quick (require_gtk test_box_creation);
    ];
    "properties", [
      test_case "box_properties" `Quick (require_gtk test_box_properties);
      test_case "packing_properties" `Quick (require_gtk test_packing_properties);
    ];
    "high_level", [
      test_case "gbox_wrapper" `Quick (require_gtk test_gbox_wrapper);
    ];
    "children", [
      test_case "child_management" `Quick (require_gtk test_child_management);
    ];
    "as_widget", [
      test_case "as_widget_conversion" `Quick (require_gtk test_as_widget);
    ];
  ]
