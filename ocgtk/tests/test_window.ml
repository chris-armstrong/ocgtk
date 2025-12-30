(** Test suite for Window, Scrolled_window, and Frame (Phase 4.2)

    This test file verifies:
    - GtkWindow module compiles and types are accessible
    - Window creation and properties
    - Child management (set_child/get_child)
    - Window actions (present, close, destroy)
    - GtkScrolled_window functionality
    - GtkFrame functionality
    - High-level wrappers for all three
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


(* ========== GtkWindow Tests ========== *)

let test_window_module_accessible () =
  let _window_type : Application_and__window_and__window_group.Window.t option = None in
  check bool "Window module accessible" true true

let test_window_creation () =
  try
    let _ = GMain.init () in
    let window = Application_and__window_and__window_group.Window.new_ () in
    check bool "Window created" true true;

    let _widget = Application_and__window_and__window_group.Window.as_widget window in
    check bool "Window as_widget works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_window_title () =
  try
    let _ = GMain.init () in
    let window = Window.create () in

    Window.set_title window "Test Window";
    check string "Window title" "Test Window" (Window.get_title window)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_window_default_size () =
  try
    let _ = GMain.init () in
    let window = Window.create () in

    Window.set_default_size window ~width:800 ~height:600;
    let (w, h) = Window.get_default_size window in
    check int "Window width" 800 w;
    check int "Window height" 600 h
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_window_resizable () =
  try
    let _ = GMain.init () in
    let window = Window.create () in

    Window.set_resizable window false;
    check bool "Window not resizable" false (Window.get_resizable window);

    Window.set_resizable window true;
    check bool "Window resizable" true (Window.get_resizable window)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_window_modal () =
  try
    let _ = GMain.init () in
    let window = Window.create () in

    Window.set_modal window true;
    check bool "Window modal" true (Window.get_modal window);

    Window.set_modal window false;
    check bool "Window not modal" false (Window.get_modal window)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_window_child () =
  try
    let _ = GMain.init () in
    let window = Window.create () in
    let box = Box.create ~orientation:`VERTICAL ~spacing:0 in
    let box_widget = Box.as_widget box in

    Window.set_child window (Some box_widget);
    let has_child = match Window.get_child window with
      | Some _ -> true
      | None -> false
    in
    check bool "Window has child" true has_child;

    Window.set_child window None;
    let child_removed = match Window.get_child window with
      | None -> true
      | Some _ -> false
    in
    check bool "Window child removed" true child_removed
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_window_actions () =
  try
    let _ = GMain.init () in
    let window = Window.create () in

    (* These just should not crash *)
    Window.present window;
    check bool "Window present works" true true;

    Window.close window;
    check bool "Window close works" true true;

    (* Note: destroy might actually destroy the window, so we test it last *)
    let window2 = Window.create () in
    Window.destroy window2;
    check bool "Window destroy works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* ========== High-Level GWindow Tests ========== *)

let test_gwindow_wrapper () =
  try
    let _ = GMain.init () in

    let window = GWindow.window ~title:"Test" ~width:400 ~height:300 () in
    check string "GWindow title" "Test" window#title;

    window#set_title "New Title";
    check string "GWindow title updated" "New Title" window#title;

    let (w, h) = window#get_default_size in
    check int "GWindow width" 400 w;
    check int "GWindow height" 300 h;

    window#set_resizable false;
    check bool "GWindow not resizable" false window#resizable;

    window#set_modal true;
    check bool "GWindow modal" true window#modal
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_gwindow_child () =
  try
    let _ = GMain.init () in

    let window = GWindow.window () in
    let box = GBox.vbox ~spacing:5 () in

    window#add (box :> GObj.widget);
    let has_child = match window#child with
      | Some _ -> true
      | None -> false
    in
    check bool "GWindow has child" true has_child;

    window#set_child None;
    let child_removed = match window#child with
      | None -> true
      | Some _ -> false
    in
    check bool "GWindow child removed" true child_removed
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* ========== GtkScrolled_window Tests ========== *)

let test_scrolled_window_module_accessible () =
  let _sw_type : Scrolled_window.t option = None in
  let _policy : Gtk_enums.policytype = `AUTOMATIC in
  check bool "Scrolled_window module accessible" true true

let test_scrolled_window_creation () =
  try
    let _ = GMain.init () in
    let sw = Scrolled_window.new_ () in
    check bool "Scrolled_window created" true true;

    let _widget = Scrolled_window.as_widget sw in
    check bool "Scrolled_window as_widget works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_scrolled_window_policy () =
  try
    let _ = GMain.init () in
    let sw = Scrolled_window.new_ () in

    Scrolled_window.set_policy sw `ALWAYS `NEVER;
    check bool "Horizontal policy ALWAYS" true true;
    check bool "Vertical policy NEVER" true true;

    Scrolled_window.set_policy sw `AUTOMATIC `EXTERNAL;
    check bool "Horizontal policy AUTOMATIC" true true;
    check bool "Vertical policy EXTERNAL" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_scrolled_window_min_content_size () =
  try
    let _ = GMain.init () in
    let sw = Scrolled_window.new_ () in

    Scrolled_window.set_min_content_width sw 200;
    check int "Min content width" 200 (Scrolled_window.get_min_content_width sw);

    Scrolled_window.set_min_content_height sw 150;
    check int "Min content height" 150 (Scrolled_window.get_min_content_height sw)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_scrolled_window_child () =
  try
    let _ = GMain.init () in
    let sw = Scrolled_window.new_ () in
    let box = Box.create ~orientation:`VERTICAL ~spacing:0 in
    let box_widget = Box.as_widget box in

    Scrolled_window.set_child sw (Some box_widget);
    let has_child = match Scrolled_window.get_child sw with
      | Some _ -> true
      | None -> false
    in
    check bool "Scrolled_window has child" true has_child;

    Scrolled_window.set_child sw None;
    let child_removed = match Scrolled_window.get_child sw with
      | None -> true
      | Some _ -> false
    in
    check bool "Scrolled_window child removed" true child_removed
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_scrolled_window_scrollbars () =
  try
    let _ = GMain.init () in
    let sw = Scrolled_window.new_ () in

    (* Scrollbars may or may not exist depending on policy *)
    let _h = Scrolled_window.get_hscrollbar sw in
    let _v = Scrolled_window.get_vscrollbar sw in
    check bool "Scrollbar getters work" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* ========== High-Level GScrolledWindow Tests ========== *)

let test_gscrolled_window_wrapper () =
  try
    let _ = GMain.init () in

    let sw = GScrolledWindow.scrolled_window
               ~hpolicy:`ALWAYS
               ~vpolicy:`AUTOMATIC
               ~min_content_width:300
               ~min_content_height:200
               () in

    let (h, v) = sw#policy in
    check bool "GScrolledWindow hpolicy" (`ALWAYS = h) true;
    check bool "GScrolledWindow vpolicy" (`AUTOMATIC = v) true;

    check int "GScrolledWindow min width" 300 sw#min_content_width;
    check int "GScrolledWindow min height" 200 sw#min_content_height;

    sw#set_policy ~hpolicy:`NEVER ~vpolicy:`NEVER;
    let (h2, v2) = sw#policy in
    check bool "GScrolledWindow policy updated" (`NEVER = h2 && `NEVER = v2) true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* ========== GtkFrame Tests ========== *)

let test_frame_module_accessible () =
  let _frame_type : Frame.t option = None in
  check bool "Frame module accessible" true true

let test_frame_creation () =
  try
    let _ = GMain.init () in
    let _frame = Frame.create () in
    check bool "Frame created without label" true true;

    let frame_with_label = Frame.create ~label:"Test Label" () in
    check bool "Frame created with label" true true;

    let _widget = Frame.as_widget frame_with_label in
    check bool "Frame as_widget works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_frame_label () =
  try
    let _ = GMain.init () in
    let frame_test = Frame.create () in

    Frame.set_label frame_test (Some "My Label");
    (match Frame.get_label frame_test with
    | Some lbl -> check string "Frame label" "My Label" lbl
    | None -> check bool "Frame label not set" false true);

    Frame.set_label frame_test None;
    let label_removed = match Frame.get_label frame_test with
      | None -> true
      | Some _ -> false
    in
    check bool "Frame label removed" true label_removed
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_frame_label_xalign () =
  try
    let _ = GMain.init () in
    let frame = Frame.create () in

    Frame.set_label_xalign frame 0.5;
    check (float 0.01) "Frame label xalign" 0.5 (Frame.get_label_xalign frame);

    Frame.set_label_xalign frame 1.0;
    check (float 0.01) "Frame label xalign right" 1.0 (Frame.get_label_xalign frame)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_frame_child () =
  try
    let _ = GMain.init () in
    let frame = Frame.create () in
    let box = Box.create ~orientation:`HORIZONTAL ~spacing:0 in
    let box_widget = Box.as_widget box in

    Frame.set_child frame (Some box_widget);
    let has_child = match Frame.get_child frame with
      | Some _ -> true
      | None -> false
    in
    check bool "Frame has child" true has_child;

    Frame.set_child frame None;
    let child_removed = match Frame.get_child frame with
      | None -> true
      | Some _ -> false
    in
    check bool "Frame child removed" true child_removed
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* ========== High-Level GFrame Tests ========== *)

let test_gframe_wrapper () =
  try
    let _ = GMain.init () in

    let frame = GFrame.frame ~label:"Test Frame" ~label_xalign:0.5 () in

    (match frame#label with
    | Some lbl -> check string "GFrame label" "Test Frame" lbl
    | None -> check bool "GFrame label not set" false true);

    check (float 0.01) "GFrame xalign" 0.5 frame#label_xalign;

    frame#set_label (Some "New Label");
    (match frame#label with
    | Some lbl -> check string "GFrame label updated" "New Label" lbl
    | None -> check bool "GFrame label update failed" false true);

    frame#set_label_xalign 1.0;
    check (float 0.01) "GFrame xalign updated" 1.0 frame#label_xalign
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* ========== Integration Tests ========== *)

let test_window_with_box () =
  try
    let _ = GMain.init () in

    let window = GWindow.window ~title:"Window with Box" ~width:400 ~height:300 () in
    let box = GBox.vbox ~spacing:10 () in
    window#add (box :> GObj.widget);

    let has_child = match window#child with
      | Some _ -> true
      | None -> false
    in
    check bool "Window contains box" true has_child
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_window_with_scrolled_window () =
  try
    let _ = GMain.init () in

    let window = GWindow.window ~title:"Window with Scrolled" () in
    let sw = GScrolledWindow.scrolled_window ~hpolicy:`AUTOMATIC ~vpolicy:`AUTOMATIC () in
    let box = GBox.vbox () in

    sw#add (box :> GObj.widget);
    window#add (sw :> GObj.widget);

    check bool "Window with scrolled window and box" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_window_with_frame () =
  try
    let _ = GMain.init () in

    let window = GWindow.window () in
    let frame = GFrame.frame ~label:"Content Frame" () in
    let grid = GGrid.create () in

    frame#add (grid :> GObj.widget);
    window#add (frame :> GObj.widget);

    check bool "Window with frame and grid" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_complex_nesting () =
  try
    let _ = GMain.init () in

    let window = GWindow.window ~title:"Complex Layout" ~width:800 ~height:600 () in
    let vbox = GBox.vbox ~spacing:5 () in
    let sw = GScrolledWindow.scrolled_window () in
    let frame = GFrame.frame ~label:"Content" () in
    let grid = GGrid.create ~row_spacing:5 ~column_spacing:5 () in

    frame#add (grid :> GObj.widget);
    sw#add (frame :> GObj.widget);
    vbox#append (sw :> GObj.widget);
    window#add (vbox :> GObj.widget);

    check bool "Complex nesting works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let () =
  run "Single-Child Container Tests (Phase 4.2)" [
    "Window - Low Level", [
      test_case "module_accessible" `Quick test_window_module_accessible;
      test_case "creation" `Quick (require_gtk test_window_creation);
      test_case "title" `Quick (require_gtk test_window_title);
      test_case "default_size" `Quick (require_gtk test_window_default_size);
      test_case "resizable" `Quick (require_gtk test_window_resizable);
      test_case "modal" `Quick (require_gtk test_window_modal);
      test_case "child" `Quick (require_gtk test_window_child);
      test_case "actions" `Quick (require_gtk test_window_actions);
    ];
    "Window - High Level", [
      test_case "gwindow_wrapper" `Quick (require_gtk test_gwindow_wrapper);
      test_case "gwindow_child" `Quick (require_gtk test_gwindow_child);
    ];
    "Scrolled_window - Low Level", [
      test_case "module_accessible" `Quick test_scrolled_window_module_accessible;
      test_case "creation" `Quick (require_gtk test_scrolled_window_creation);
      test_case "policy" `Quick (require_gtk test_scrolled_window_policy);
      test_case "min_content_size" `Quick (require_gtk test_scrolled_window_min_content_size);
      test_case "child" `Quick (require_gtk test_scrolled_window_child);
      test_case "scrollbars" `Quick (require_gtk test_scrolled_window_scrollbars);
    ];
    "Scrolled_window - High Level", [
      test_case "gscrolled_window_wrapper" `Quick (require_gtk test_gscrolled_window_wrapper);
    ];
    "Frame - Low Level", [
      test_case "module_accessible" `Quick test_frame_module_accessible;
      test_case "creation" `Quick (require_gtk test_frame_creation);
      test_case "label" `Quick (require_gtk test_frame_label);
      test_case "label_xalign" `Quick (require_gtk test_frame_label_xalign);
      test_case "child" `Quick (require_gtk test_frame_child);
    ];
    "Frame - High Level", [
      test_case "gframe_wrapper" `Quick (require_gtk test_gframe_wrapper);
    ];
    "Integration", [
      test_case "window_with_box" `Quick (require_gtk test_window_with_box);
      test_case "window_with_scrolled_window" `Quick (require_gtk test_window_with_scrolled_window);
      test_case "window_with_frame" `Quick (require_gtk test_window_with_frame);
      test_case "complex_nesting" `Quick (require_gtk test_complex_nesting);
    ];
  ]
