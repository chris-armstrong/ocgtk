(** Test suite for Window, ScrolledWindow, and Frame (Phase 4.2)

    This test file verifies:
    - GtkWindow module compiles and types are accessible
    - Window creation and properties
    - Child management (set_child/get_child)
    - Window actions (present, close, destroy)
    - GtkScrolledWindow functionality
    - GtkFrame functionality
    - High-level wrappers for all three
    *)

open Alcotest

(* ========== GtkWindow Tests ========== *)

let test_window_module_accessible () =
  let _window_type : Gtk.Window.t option = None in
  check bool "Window module accessible" true true

let test_window_creation () =
  try
    let _ = GMain.init () in
    let window = Gtk.Window.create () in
    check bool "Window created" true true;

    let _widget = Gtk.Window.as_widget window in
    check bool "Window as_widget works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_window_title () =
  try
    let _ = GMain.init () in
    let window = Gtk.Window.create () in

    Gtk.Window.set_title window "Test Window";
    check string "Window title" "Test Window" (Gtk.Window.get_title window)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_window_default_size () =
  try
    let _ = GMain.init () in
    let window = Gtk.Window.create () in

    Gtk.Window.set_default_size window ~width:800 ~height:600;
    let (w, h) = Gtk.Window.get_default_size window in
    check int "Window width" 800 w;
    check int "Window height" 600 h
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_window_resizable () =
  try
    let _ = GMain.init () in
    let window = Gtk.Window.create () in

    Gtk.Window.set_resizable window false;
    check bool "Window not resizable" false (Gtk.Window.get_resizable window);

    Gtk.Window.set_resizable window true;
    check bool "Window resizable" true (Gtk.Window.get_resizable window)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_window_modal () =
  try
    let _ = GMain.init () in
    let window = Gtk.Window.create () in

    Gtk.Window.set_modal window true;
    check bool "Window modal" true (Gtk.Window.get_modal window);

    Gtk.Window.set_modal window false;
    check bool "Window not modal" false (Gtk.Window.get_modal window)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_window_child () =
  try
    let _ = GMain.init () in
    let window = Gtk.Window.create () in
    let box = Gtk.Box.create ~orientation:`VERTICAL ~spacing:0 in
    let box_widget = Gtk.Box.as_widget box in

    Gtk.Window.set_child window (Some box_widget);
    let has_child = match Gtk.Window.get_child window with
      | Some _ -> true
      | None -> false
    in
    check bool "Window has child" true has_child;

    Gtk.Window.set_child window None;
    let child_removed = match Gtk.Window.get_child window with
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
    let window = Gtk.Window.create () in

    (* These just should not crash *)
    Gtk.Window.present window;
    check bool "Window present works" true true;

    Gtk.Window.close window;
    check bool "Window close works" true true;

    (* Note: destroy might actually destroy the window, so we test it last *)
    let window2 = Gtk.Window.create () in
    Gtk.Window.destroy window2;
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

(* ========== GtkScrolledWindow Tests ========== *)

let test_scrolled_window_module_accessible () =
  let _sw_type : Gtk.ScrolledWindow.t option = None in
  let _policy : Gtk.ScrolledWindow.policy_type = `AUTOMATIC in
  check bool "ScrolledWindow module accessible" true true

let test_scrolled_window_creation () =
  try
    let _ = GMain.init () in
    let sw = Gtk.ScrolledWindow.create () in
    check bool "ScrolledWindow created" true true;

    let _widget = Gtk.ScrolledWindow.as_widget sw in
    check bool "ScrolledWindow as_widget works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_scrolled_window_policy () =
  try
    let _ = GMain.init () in
    let sw = Gtk.ScrolledWindow.create () in

    Gtk.ScrolledWindow.set_policy sw ~hpolicy:`ALWAYS ~vpolicy:`NEVER;
    let (h, v) = Gtk.ScrolledWindow.get_policy sw in
    check bool "Horizontal policy ALWAYS" (`ALWAYS = h) true;
    check bool "Vertical policy NEVER" (`NEVER = v) true;

    Gtk.ScrolledWindow.set_policy sw ~hpolicy:`AUTOMATIC ~vpolicy:`EXTERNAL;
    let (h2, v2) = Gtk.ScrolledWindow.get_policy sw in
    check bool "Horizontal policy AUTOMATIC" (`AUTOMATIC = h2) true;
    check bool "Vertical policy EXTERNAL" (`EXTERNAL = v2) true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_scrolled_window_min_content_size () =
  try
    let _ = GMain.init () in
    let sw = Gtk.ScrolledWindow.create () in

    Gtk.ScrolledWindow.set_min_content_width sw 200;
    check int "Min content width" 200 (Gtk.ScrolledWindow.get_min_content_width sw);

    Gtk.ScrolledWindow.set_min_content_height sw 150;
    check int "Min content height" 150 (Gtk.ScrolledWindow.get_min_content_height sw)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_scrolled_window_child () =
  try
    let _ = GMain.init () in
    let sw = Gtk.ScrolledWindow.create () in
    let box = Gtk.Box.create ~orientation:`VERTICAL ~spacing:0 in
    let box_widget = Gtk.Box.as_widget box in

    Gtk.ScrolledWindow.set_child sw (Some box_widget);
    let has_child = match Gtk.ScrolledWindow.get_child sw with
      | Some _ -> true
      | None -> false
    in
    check bool "ScrolledWindow has child" true has_child;

    Gtk.ScrolledWindow.set_child sw None;
    let child_removed = match Gtk.ScrolledWindow.get_child sw with
      | None -> true
      | Some _ -> false
    in
    check bool "ScrolledWindow child removed" true child_removed
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_scrolled_window_scrollbars () =
  try
    let _ = GMain.init () in
    let sw = Gtk.ScrolledWindow.create () in

    (* Scrollbars may or may not exist depending on policy *)
    let _h = Gtk.ScrolledWindow.get_hscrollbar sw in
    let _v = Gtk.ScrolledWindow.get_vscrollbar sw in
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
  let _frame_type : Gtk.Frame.t option = None in
  check bool "Frame module accessible" true true

let test_frame_creation () =
  try
    let _ = GMain.init () in
    let _frame = Gtk.Frame.create () in
    check bool "Frame created without label" true true;

    let frame_with_label = Gtk.Frame.create ~label:"Test Label" () in
    check bool "Frame created with label" true true;

    let _widget = Gtk.Frame.as_widget frame_with_label in
    check bool "Frame as_widget works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_frame_label () =
  try
    let _ = GMain.init () in
    let frame_test = Gtk.Frame.create () in

    Gtk.Frame.set_label frame_test (Some "My Label");
    (match Gtk.Frame.get_label frame_test with
    | Some lbl -> check string "Frame label" "My Label" lbl
    | None -> check bool "Frame label not set" false true);

    Gtk.Frame.set_label frame_test None;
    let label_removed = match Gtk.Frame.get_label frame_test with
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
    let frame = Gtk.Frame.create () in

    Gtk.Frame.set_label_xalign frame 0.5;
    check (float 0.01) "Frame label xalign" 0.5 (Gtk.Frame.get_label_xalign frame);

    Gtk.Frame.set_label_xalign frame 1.0;
    check (float 0.01) "Frame label xalign right" 1.0 (Gtk.Frame.get_label_xalign frame)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_frame_child () =
  try
    let _ = GMain.init () in
    let frame = Gtk.Frame.create () in
    let box = Gtk.Box.create ~orientation:`HORIZONTAL ~spacing:0 in
    let box_widget = Gtk.Box.as_widget box in

    Gtk.Frame.set_child frame (Some box_widget);
    let has_child = match Gtk.Frame.get_child frame with
      | Some _ -> true
      | None -> false
    in
    check bool "Frame has child" true has_child;

    Gtk.Frame.set_child frame None;
    let child_removed = match Gtk.Frame.get_child frame with
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
      test_case "creation" `Quick test_window_creation;
      test_case "title" `Quick test_window_title;
      test_case "default_size" `Quick test_window_default_size;
      test_case "resizable" `Quick test_window_resizable;
      test_case "modal" `Quick test_window_modal;
      test_case "child" `Quick test_window_child;
      test_case "actions" `Quick test_window_actions;
    ];
    "Window - High Level", [
      test_case "gwindow_wrapper" `Quick test_gwindow_wrapper;
      test_case "gwindow_child" `Quick test_gwindow_child;
    ];
    "ScrolledWindow - Low Level", [
      test_case "module_accessible" `Quick test_scrolled_window_module_accessible;
      test_case "creation" `Quick test_scrolled_window_creation;
      test_case "policy" `Quick test_scrolled_window_policy;
      test_case "min_content_size" `Quick test_scrolled_window_min_content_size;
      test_case "child" `Quick test_scrolled_window_child;
      test_case "scrollbars" `Quick test_scrolled_window_scrollbars;
    ];
    "ScrolledWindow - High Level", [
      test_case "gscrolled_window_wrapper" `Quick test_gscrolled_window_wrapper;
    ];
    "Frame - Low Level", [
      test_case "module_accessible" `Quick test_frame_module_accessible;
      test_case "creation" `Quick test_frame_creation;
      test_case "label" `Quick test_frame_label;
      test_case "label_xalign" `Quick test_frame_label_xalign;
      test_case "child" `Quick test_frame_child;
    ];
    "Frame - High Level", [
      test_case "gframe_wrapper" `Quick test_gframe_wrapper;
    ];
    "Integration", [
      test_case "window_with_box" `Quick test_window_with_box;
      test_case "window_with_scrolled_window" `Quick test_window_with_scrolled_window;
      test_case "window_with_frame" `Quick test_window_with_frame;
      test_case "complex_nesting" `Quick test_complex_nesting;
    ];
  ]
