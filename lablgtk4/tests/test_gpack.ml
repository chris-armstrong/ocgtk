(**************************************************************************)
(*                Lablgtk4                                                *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License as published by the Free Software Foundation         *)
(*    version 2, with the exception described in file COPYING which       *)
(*    comes with the library.                                             *)
(*                                                                        *)
(**************************************************************************)

(** Tests for GPack convenience module (Phase 4.5) *)

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


(* Test box packing conveniences *)

let test_hbox_pack_empty () =
  try
    let _ = GMain.init () in
    let box = GPack.hbox_pack [] in
    check int "spacing" 0 box#spacing;
    check bool "homogeneous" false box#homogeneous
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_hbox_pack_with_widgets () =
  try
    let _ = GMain.init () in
    let widget1 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let widget2 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let widget3 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in

    let box = GPack.hbox_pack ~spacing:10 ~homogeneous:true
                [widget1; widget2; widget3] in

    check int "spacing" 10 box#spacing;
    check bool "homogeneous" true box#homogeneous
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_vbox_pack_empty () =
  try
    let _ = GMain.init () in
    let box = GPack.vbox_pack [] in
    check int "spacing" 0 box#spacing;
    check bool "homogeneous" false box#homogeneous
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_vbox_pack_with_widgets () =
  try
    let _ = GMain.init () in
    let widget1 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let widget2 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in

    let box = GPack.vbox_pack ~spacing:5 [widget1; widget2] in

    check int "spacing" 5 box#spacing;
    check bool "homogeneous" false box#homogeneous
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test grid packing conveniences *)

let test_grid_attach_empty () =
  try
    let _ = GMain.init () in
    let grid = GPack.grid_attach [] in
    check int "row_spacing" 0 grid#row_spacing;
    check int "column_spacing" 0 grid#column_spacing
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_grid_attach_with_widgets () =
  try
    let _ = GMain.init () in
    let widget1 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let widget2 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let widget3 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in

    let grid = GPack.grid_attach
                 ~row_spacing:5
                 ~column_spacing:10
                 ~row_homogeneous:true
                 ~column_homogeneous:false
                 [
                   (widget1, 0, 0, 1, 1);
                   (widget2, 1, 0, 1, 1);
                   (widget3, 0, 1, 2, 1);
                 ] in

    check int "row_spacing" 5 grid#row_spacing;
    check int "column_spacing" 10 grid#column_spacing;
    check bool "row_homogeneous" true grid#row_homogeneous;
    check bool "column_homogeneous" false grid#column_homogeneous
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test paned conveniences *)

let test_hpaned_empty () =
  try
    let _ = GMain.init () in
    let _paned = GPack.hpaned () in
    ()
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_hpaned_with_children () =
  try
    let _ = GMain.init () in
    let child1 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let child2 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in

    let paned = GPack.hpaned ~start_child:child1 ~end_child:child2 ~position:100 () in

    check int "position" 100 paned#position
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_vpaned_empty () =
  try
    let _ = GMain.init () in
    let _paned = GPack.vpaned () in
    ()
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_vpaned_with_children () =
  try
    let _ = GMain.init () in
    let child1 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let child2 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in

    let paned = GPack.vpaned ~start_child:child1 ~end_child:child2 ~position:200 () in

    check int "position" 200 paned#position
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test notebook conveniences *)

let test_notebook_empty () =
  try
    let _ = GMain.init () in
    let nb = GPack.notebook [] in
    check int "n_pages" 0 nb#n_pages;
    check bool "show_tabs" true nb#show_tabs;
    check bool "show_border" true nb#show_border
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_notebook_with_pages () =
  try
    let _ = GMain.init () in
    let page1 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let page2 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let page3 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in

    let nb = GPack.notebook
               ~show_tabs:false
               ~show_border:false
               [
                 (page1, None);
                 (page2, None);
                 (page3, None);
               ] in

    check int "n_pages" 3 nb#n_pages;
    check bool "show_tabs" false nb#show_tabs;
    check bool "show_border" false nb#show_border
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test complex composition *)

let test_composition_hbox_in_vbox () =
  try
    let _ = GMain.init () in
    let widget1 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let widget2 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let widget3 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let widget4 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in

    let hbox = GPack.hbox_pack ~spacing:5 [widget1; widget2] in
    let hbox_as_widget = new GObj.widget (hbox#as_widget) in
    let vbox = GPack.vbox_pack ~spacing:10 [hbox_as_widget; widget3; widget4] in

    check int "vbox_spacing" 10 vbox#spacing;
    check int "hbox_spacing" 5 hbox#spacing
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_composition_grid_in_paned () =
  try
    let _ = GMain.init () in
    let widget1 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let widget2 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let widget3 = new GObj.widget (Fixed.as_widget (Fixed.create ())) in

    let grid = GPack.grid_attach [(widget1, 0, 0, 1, 1); (widget2, 1, 0, 1, 1)] in
    let grid_as_widget = new GObj.widget (grid#as_widget) in
    let _paned = GPack.hpaned ~start_child:grid_as_widget ~end_child:widget3 () in

    ()
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test suite *)

(* Test window convenience *)

let test_window_convenience () =
  try
    let _ = GMain.init () in
    let box = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let window = GPack.window ~title:"Test" ~width:400 ~height:300 box in

    check string "GPack window title" "Test" window#title;
    let (w, h) = window#get_default_size in
    check int "GPack window width" 400 w;
    check int "GPack window height" 300 h
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* Test scrolled window convenience *)

let test_scrolled_convenience () =
  try
    let _ = GMain.init () in
    let box = new GObj.widget (Fixed.as_widget (Fixed.create ())) in
    let sw = GPack.scrolled ~hpolicy:`ALWAYS ~vpolicy:`AUTOMATIC box in

    let (h, v) = sw#policy in
    check bool "GPack scrolled hpolicy" (`ALWAYS = h) true;
    check bool "GPack scrolled vpolicy" (`AUTOMATIC = v) true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let () =
  run "GPack Module Tests (Phase 4.5)" [
    "Box Packing", [
      test_case "hbox_pack empty" `Quick (require_gtk test_hbox_pack_empty);
      test_case "hbox_pack with widgets" `Quick (require_gtk test_hbox_pack_with_widgets);
      test_case "vbox_pack empty" `Quick (require_gtk test_vbox_pack_empty);
      test_case "vbox_pack with widgets" `Quick (require_gtk test_vbox_pack_with_widgets);
    ];
    "Grid Packing", [
      test_case "grid_attach empty" `Quick (require_gtk test_grid_attach_empty);
      test_case "grid_attach with widgets" `Quick (require_gtk test_grid_attach_with_widgets);
    ];
    "Paned Conveniences", [
      test_case "hpaned empty" `Quick (require_gtk test_hpaned_empty);
      test_case "hpaned with children" `Quick (require_gtk test_hpaned_with_children);
      test_case "vpaned empty" `Quick (require_gtk test_vpaned_empty);
      test_case "vpaned with children" `Quick (require_gtk test_vpaned_with_children);
    ];
    "Notebook Conveniences", [
      test_case "notebook empty" `Quick (require_gtk test_notebook_empty);
      test_case "notebook with pages" `Quick (require_gtk test_notebook_with_pages);
    ];
    "Window and Scrolled_window Conveniences (Phase 4.2)", [
      test_case "window convenience" `Quick (require_gtk test_window_convenience);
      test_case "scrolled window convenience" `Quick (require_gtk test_scrolled_convenience);
    ];
    "Complex Composition", [
      test_case "hbox in vbox" `Quick (require_gtk test_composition_hbox_in_vbox);
      test_case "grid in paned" `Quick (require_gtk test_composition_grid_in_paned);
    ];
  ]
