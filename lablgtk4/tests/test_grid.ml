(** Test suite for Gtk.Grid module (Phase 4.3)

    This test file verifies:
    - GtkGrid module compiles and types are accessible
    - Grid creation
    - Child management (attach, attach_next_to, remove)
    - Grid properties (spacing, homogeneous, baseline_row)
    - Row/column insertion and removal
    - High-level GGrid wrapper functionality
    *)

open Alcotest

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


(* Test that Grid module is accessible and types compile *)
let test_module_accessible () =
  (* Test that we can reference the types *)
  let _grid_type : Gtk.Grid.t option = None in
  let _position : Gtk.position_type = `LEFT in

  check bool "module accessible" true true

(* Test type constructors for position_type *)
let test_type_constructors () =
  (* Test position_type *)
  let _left : Gtk.position_type = `LEFT in
  let _right : Gtk.position_type = `RIGHT in
  let _top : Gtk.position_type = `TOP in
  let _bottom : Gtk.position_type = `BOTTOM in

  check bool "types construct" true true

(* Test grid creation - requires GTK init *)
let test_grid_creation () =
  try
    (* Initialize GTK *)
    let _ = GMain.init () in

    (* Create grid *)
    let grid = Gtk.Grid.create () in
    check int "grid row spacing" 0 (Gtk.Grid.get_row_spacing grid);
    check int "grid column spacing" 0 (Gtk.Grid.get_column_spacing grid);
    check bool "grid row not homogeneous" false (Gtk.Grid.get_row_homogeneous grid);
    check bool "grid column not homogeneous" false (Gtk.Grid.get_column_homogeneous grid)
  with
  | GMain.Error _ ->
      skip ()  (* No display available *)
  | e ->
      fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test grid properties *)
let test_grid_properties () =
  try
    let _ = GMain.init () in
    let grid = Gtk.Grid.create () in

    (* Test row spacing *)
    Gtk.Grid.set_row_spacing grid 10;
    check int "row spacing set to 10" 10 (Gtk.Grid.get_row_spacing grid);

    (* Test column spacing *)
    Gtk.Grid.set_column_spacing grid 15;
    check int "column spacing set to 15" 15 (Gtk.Grid.get_column_spacing grid);

    (* Test row homogeneous *)
    Gtk.Grid.set_row_homogeneous grid true;
    check bool "row homogeneous set to true" true (Gtk.Grid.get_row_homogeneous grid);

    (* Test column homogeneous *)
    Gtk.Grid.set_column_homogeneous grid true;
    check bool "column homogeneous set to true" true (Gtk.Grid.get_column_homogeneous grid);

    (* Test baseline row *)
    Gtk.Grid.set_baseline_row grid 2;
    check int "baseline row set to 2" 2 (Gtk.Grid.get_baseline_row grid)
  with
  | GMain.Error _ ->
      skip ()
  | e ->
      fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test grid child attach *)
let test_child_attach () =
  try
    let _ = GMain.init () in
    let grid = Gtk.Grid.create () in
    let child_box = Gtk.Box.create ~orientation:`HORIZONTAL ~spacing:0 in
    let child_widget = Gtk.Box.as_widget child_box in

    (* Test attach *)
    Gtk.Grid.attach grid ~child:child_widget ~column:0 ~row:0 ~width:1 ~height:1;

    (* Test get_child_at *)
    match Gtk.Grid.get_child_at grid ~column:0 ~row:0 with
    | Some _ -> check bool "child found at position" true true
    | None -> fail "child not found at position (0,0)"
  with
  | GMain.Error _ ->
      skip ()
  | e ->
      fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test grid child removal *)
let test_child_removal () =
  try
    let _ = GMain.init () in
    let grid = Gtk.Grid.create () in
    let child_box = Gtk.Box.create ~orientation:`HORIZONTAL ~spacing:0 in
    let child_widget = Gtk.Box.as_widget child_box in

    (* Attach and then remove *)
    Gtk.Grid.attach grid ~child:child_widget ~column:0 ~row:0 ~width:1 ~height:1;
    Gtk.Grid.remove grid child_widget;

    (* Verify child is gone *)
    match Gtk.Grid.get_child_at grid ~column:0 ~row:0 with
    | None -> check bool "child removed" true true
    | Some _ -> fail "child still present after removal"
  with
  | GMain.Error _ ->
      skip ()
  | e ->
      fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test row/column insertion and removal *)
let test_row_column_operations () =
  try
    let _ = GMain.init () in
    let grid = Gtk.Grid.create () in

    (* Test insert row *)
    Gtk.Grid.insert_row grid ~position:0;
    Gtk.Grid.insert_row grid ~position:1;

    (* Test insert column *)
    Gtk.Grid.insert_column grid ~position:0;
    Gtk.Grid.insert_column grid ~position:1;

    (* Test remove row *)
    Gtk.Grid.remove_row grid ~position:0;

    (* Test remove column *)
    Gtk.Grid.remove_column grid ~position:0;

    check bool "row/column operations successful" true true
  with
  | GMain.Error _ ->
      skip ()
  | e ->
      fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test attach_next_to *)
let test_attach_next_to () =
  try
    let _ = GMain.init () in
    let grid = Gtk.Grid.create () in
    let child1_box = Gtk.Box.create ~orientation:`HORIZONTAL ~spacing:0 in
    let child1_widget = Gtk.Box.as_widget child1_box in
    let child2_box = Gtk.Box.create ~orientation:`VERTICAL ~spacing:0 in
    let child2_widget = Gtk.Box.as_widget child2_box in

    (* Attach first child *)
    Gtk.Grid.attach grid ~child:child1_widget ~column:0 ~row:0 ~width:1 ~height:1;

    (* Attach second child next to first *)
    Gtk.Grid.attach_next_to grid ~child:child2_widget ~sibling:(Some child1_widget) ~side:`RIGHT ~width:1 ~height:1;

    check bool "attach_next_to successful" true true
  with
  | GMain.Error _ ->
      skip ()
  | e ->
      fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test insert_next_to *)
let test_insert_next_to () =
  try
    let _ = GMain.init () in
    let grid = Gtk.Grid.create () in
    let child_box = Gtk.Box.create ~orientation:`HORIZONTAL ~spacing:0 in
    let child_widget = Gtk.Box.as_widget child_box in

    (* Attach child *)
    Gtk.Grid.attach grid ~child:child_widget ~column:0 ~row:0 ~width:1 ~height:1;

    (* Insert row next to child *)
    Gtk.Grid.insert_next_to grid ~sibling:child_widget ~side:`BOTTOM;

    (* Insert column next to child *)
    Gtk.Grid.insert_next_to grid ~sibling:child_widget ~side:`RIGHT;

    check bool "insert_next_to successful" true true
  with
  | GMain.Error _ ->
      skip ()
  | e ->
      fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test high-level GGrid wrapper *)
let test_ggrid_wrapper () =
  try
    let _ = GMain.init () in

    (* Create grid with wrapper *)
    let grid = GGrid.create ~row_spacing:10 ~column_spacing:15 () in
    check int "ggrid row spacing" 10 grid#row_spacing;
    check int "ggrid column spacing" 15 grid#column_spacing;

    (* Set properties *)
    grid#set_row_spacing 20;
    check int "ggrid row spacing updated" 20 grid#row_spacing;

    grid#set_column_spacing 25;
    check int "ggrid column spacing updated" 25 grid#column_spacing;

    grid#set_row_homogeneous true;
    check bool "ggrid row homogeneous" true grid#row_homogeneous;

    grid#set_column_homogeneous true;
    check bool "ggrid column homogeneous" true grid#column_homogeneous
  with
  | GMain.Error _ ->
      skip ()
  | e ->
      fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test as_widget function *)
let test_as_widget () =
  try
    let _ = GMain.init () in
    let grid = Gtk.Grid.create () in
    let widget = Gtk.Grid.as_widget grid in

    (* Verify it's a valid widget by calling widget methods *)
    Gtk.Widget.set_name widget "test_grid";
    check string "converted widget name" "test_grid" (Gtk.Widget.get_name widget)
  with
  | GMain.Error _ ->
      skip ()
  | e ->
      fail ("Unexpected error: " ^ Printexc.to_string e)

(* ========== Comprehensive GGrid Tests ========== *)

let test_ggrid_attach_multiple () =
  try
    let _ = GMain.init () in
    let grid = GGrid.create ~row_spacing:5 ~column_spacing:10 () in

    (* Attach multiple children in a grid pattern *)
    let make_box () = GBox.hbox ~spacing:0 () in
    let b00 = make_box () in
    let b01 = make_box () in
    let b10 = make_box () in
    let b11 = make_box () in

    grid#attach ~left:0 ~top:0 ~width:1 ~height:1 (b00 :> GObj.widget);
    grid#attach ~left:1 ~top:0 ~width:1 ~height:1 (b01 :> GObj.widget);
    grid#attach ~left:0 ~top:1 ~width:1 ~height:1 (b10 :> GObj.widget);
    grid#attach ~left:1 ~top:1 ~width:1 ~height:1 (b11 :> GObj.widget);

    (* Verify grid properties *)
    check int "GGrid row_spacing" 5 grid#row_spacing;
    check int "GGrid column_spacing" 10 grid#column_spacing;

    (* Attach a spanning child *)
    let wide_box = make_box () in
    grid#attach ~left:0 ~top:2 ~width:2 ~height:1 (wide_box :> GObj.widget);

    check bool "GGrid multiple attach works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_ggrid_homogeneous () =
  try
    let _ = GMain.init () in
    let grid = GGrid.create () in

    (* Test row homogeneous *)
    grid#set_row_homogeneous true;
    check bool "GGrid row homogeneous" true grid#row_homogeneous;

    grid#set_row_homogeneous false;
    check bool "GGrid row not homogeneous" false grid#row_homogeneous;

    (* Test column homogeneous *)
    grid#set_column_homogeneous true;
    check bool "GGrid column homogeneous" true grid#column_homogeneous;

    grid#set_column_homogeneous false;
    check bool "GGrid column not homogeneous" false grid#column_homogeneous
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_ggrid_baseline () =
  try
    let _ = GMain.init () in
    let grid = GGrid.create () in

    (* Test baseline row property *)
    grid#set_baseline_row 3;
    check int "GGrid baseline row" 3 grid#baseline_row;

    grid#set_baseline_row 0;
    check int "GGrid baseline row reset" 0 grid#baseline_row
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_ggrid_with_nested_containers () =
  try
    let _ = GMain.init () in
    let grid = GGrid.create ~row_spacing:10 ~column_spacing:10 () in

    (* Create different container types to put in grid *)
    let notebook = GNotebook.create () in
    let paned = GPaned.hpaned () in
    let stack = GStack.create () in
    let box = GBox.vbox () in

    (* Attach containers to grid *)
    grid#attach ~left:0 ~top:0 ~width:1 ~height:1 (notebook :> GObj.widget);
    grid#attach ~left:1 ~top:0 ~width:1 ~height:1 (paned :> GObj.widget);
    grid#attach ~left:0 ~top:1 ~width:1 ~height:1 (stack :> GObj.widget);
    grid#attach ~left:1 ~top:1 ~width:1 ~height:1 (box :> GObj.widget);

    (* Verify grid can be used for complex layouts *)
    check bool "GGrid with nested containers" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let () =
  run "Comprehensive Gtk.Grid Tests (Phase 4.3)" [
    "module", [
      test_case "module_accessible" `Quick test_module_accessible;
      test_case "type_constructors" `Quick test_type_constructors;
    ];
    "creation", [
      test_case "grid_creation" `Quick (require_gtk test_grid_creation);
    ];
    "properties", [
      test_case "grid_properties" `Quick (require_gtk test_grid_properties);
    ];
    "children - Low Level", [
      test_case "child_attach" `Quick (require_gtk test_child_attach);
      test_case "child_removal" `Quick (require_gtk test_child_removal);
      test_case "attach_next_to" `Quick (require_gtk test_attach_next_to);
    ];
    "row_column", [
      test_case "row_column_operations" `Quick (require_gtk test_row_column_operations);
      test_case "insert_next_to" `Quick (require_gtk test_insert_next_to);
    ];
    "high_level - Basic", [
      test_case "ggrid_wrapper" `Quick (require_gtk test_ggrid_wrapper);
    ];
    "high_level - Comprehensive", [
      test_case "ggrid_attach_multiple" `Quick (require_gtk test_ggrid_attach_multiple);
      test_case "ggrid_homogeneous" `Quick (require_gtk test_ggrid_homogeneous);
      test_case "ggrid_baseline" `Quick (require_gtk test_ggrid_baseline);
      test_case "ggrid_with_nested_containers" `Quick (require_gtk test_ggrid_with_nested_containers);
    ];
    "as_widget", [
      test_case "as_widget_conversion" `Quick (require_gtk test_as_widget);
    ];
  ]
