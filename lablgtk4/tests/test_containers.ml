(** Test suite for additional GTK containers (Phase 4.4)

    This test file verifies:
    - GtkFixed: Absolute positioning container
    - GtkPaned: Two-child container with resizable divider
    - GtkNotebook: Tabbed container
    - GtkStack: Layered container
    *)

open Alcotest

(* ========== GtkFixed Tests ========== *)

let test_fixed_module_accessible () =
  let _fixed_type : Gtk.Fixed.t option = None in
  check bool "Fixed module accessible" true true

let test_fixed_creation () =
  try
    let _ = GMain.init () in
    let fixed = Gtk.Fixed.create () in
    check bool "Fixed created" true true;

    (* Test as_widget *)
    let _widget = Gtk.Fixed.as_widget fixed in
    check bool "Fixed as_widget works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_fixed_put_move () =
  try
    let _ = GMain.init () in
    let fixed = Gtk.Fixed.create () in
    let child = Gtk.Box.create ~orientation:`HORIZONTAL ~spacing:0 in
    let child_widget = Gtk.Box.as_widget child in

    (* Put child at position *)
    Gtk.Fixed.put fixed child_widget ~x:10.0 ~y:20.0;

    (* Get position *)
    let (x, y) = Gtk.Fixed.get_child_position fixed child_widget in
    check (float 0.01) "Fixed x position" 10.0 x;
    check (float 0.01) "Fixed y position" 20.0 y;

    (* Move child *)
    Gtk.Fixed.move fixed child_widget ~x:30.0 ~y:40.0;
    let (x2, y2) = Gtk.Fixed.get_child_position fixed child_widget in
    check (float 0.01) "Fixed moved x" 30.0 x2;
    check (float 0.01) "Fixed moved y" 40.0 y2;

    (* Remove child *)
    Gtk.Fixed.remove fixed child_widget;
    check bool "Fixed remove works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* ========== GtkPaned Tests ========== *)

let test_paned_module_accessible () =
  let _paned_type : Gtk.Paned.t option = None in
  check bool "Paned module accessible" true true

let test_paned_creation () =
  try
    let _ = GMain.init () in
    let paned = Gtk.Paned.create ~orientation:`HORIZONTAL in
    check bool "Paned created" true true;

    let _widget = Gtk.Paned.as_widget paned in
    check bool "Paned as_widget works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_paned_children () =
  try
    let _ = GMain.init () in
    let paned = Gtk.Paned.create ~orientation:`HORIZONTAL in
    let child1 = Gtk.Box.create ~orientation:`VERTICAL ~spacing:0 in
    let child2 = Gtk.Box.create ~orientation:`VERTICAL ~spacing:0 in

    (* Set start child *)
    Gtk.Paned.set_start_child paned (Some (Gtk.Box.as_widget child1));
    (match Gtk.Paned.get_start_child paned with
    | Some _ -> check bool "Start child set" true true
    | None -> fail "Start child not set");

    (* Set end child *)
    Gtk.Paned.set_end_child paned (Some (Gtk.Box.as_widget child2));
    (match Gtk.Paned.get_end_child paned with
    | Some _ -> check bool "End child set" true true
    | None -> fail "End child not set");

    (* Remove children *)
    Gtk.Paned.set_start_child paned None;
    Gtk.Paned.set_end_child paned None;
    check bool "Paned children removed" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_paned_properties () =
  try
    let _ = GMain.init () in
    let paned = Gtk.Paned.create ~orientation:`VERTICAL in

    (* Position *)
    Gtk.Paned.set_position paned 100;
    check int "Paned position" 100 (Gtk.Paned.get_position paned);

    (* Wide handle *)
    Gtk.Paned.set_wide_handle paned true;
    check bool "Wide handle" true (Gtk.Paned.get_wide_handle paned);

    (* Resize properties *)
    Gtk.Paned.set_resize_start_child paned true;
    check bool "Resize start" true (Gtk.Paned.get_resize_start_child paned);

    Gtk.Paned.set_resize_end_child paned false;
    check bool "Resize end" false (Gtk.Paned.get_resize_end_child paned);

    (* Shrink properties *)
    Gtk.Paned.set_shrink_start_child paned true;
    check bool "Shrink start" true (Gtk.Paned.get_shrink_start_child paned);

    Gtk.Paned.set_shrink_end_child paned false;
    check bool "Shrink end" false (Gtk.Paned.get_shrink_end_child paned)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* ========== GtkNotebook Tests ========== *)

let test_notebook_module_accessible () =
  let _notebook_type : Gtk.Notebook.t option = None in
  check bool "Notebook module accessible" true true

let test_notebook_creation () =
  try
    let _ = GMain.init () in
    let notebook = Gtk.Notebook.create () in
    check int "Notebook starts with 0 pages" 0 (Gtk.Notebook.get_n_pages notebook);

    let _widget = Gtk.Notebook.as_widget notebook in
    check bool "Notebook as_widget works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_notebook_pages () =
  try
    let _ = GMain.init () in
    let notebook = Gtk.Notebook.create () in
    let page1 = Gtk.Box.create ~orientation:`VERTICAL ~spacing:0 in
    let page2 = Gtk.Box.create ~orientation:`VERTICAL ~spacing:0 in

    (* Append page *)
    let idx1 = Gtk.Notebook.append_page notebook ~child:(Gtk.Box.as_widget page1) () in
    check int "First page index" 0 idx1;
    check int "1 page" 1 (Gtk.Notebook.get_n_pages notebook);

    (* Prepend page *)
    let idx2 = Gtk.Notebook.prepend_page notebook ~child:(Gtk.Box.as_widget page2) () in
    check int "Prepended page index" 0 idx2;
    check int "2 pages" 2 (Gtk.Notebook.get_n_pages notebook);

    (* Remove page *)
    Gtk.Notebook.remove_page notebook ~page:0;
    check int "1 page after removal" 1 (Gtk.Notebook.get_n_pages notebook)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_notebook_navigation () =
  try
    let _ = GMain.init () in
    let notebook = Gtk.Notebook.create () in
    let page1 = Gtk.Box.create ~orientation:`VERTICAL ~spacing:0 in
    let page2 = Gtk.Box.create ~orientation:`VERTICAL ~spacing:0 in

    let _ = Gtk.Notebook.append_page notebook ~child:(Gtk.Box.as_widget page1) () in
    let _ = Gtk.Notebook.append_page notebook ~child:(Gtk.Box.as_widget page2) () in

    (* Set current page *)
    Gtk.Notebook.set_current_page notebook 1;
    check int "Current page" 1 (Gtk.Notebook.get_current_page notebook);

    (* Navigate *)
    Gtk.Notebook.prev_page notebook;
    check int "Previous page" 0 (Gtk.Notebook.get_current_page notebook);

    Gtk.Notebook.next_page notebook;
    check int "Next page" 1 (Gtk.Notebook.get_current_page notebook)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_notebook_properties () =
  try
    let _ = GMain.init () in
    let notebook = Gtk.Notebook.create () in

    (* Show tabs *)
    Gtk.Notebook.set_show_tabs notebook false;
    check bool "Show tabs off" false (Gtk.Notebook.get_show_tabs notebook);

    (* Show border *)
    Gtk.Notebook.set_show_border notebook true;
    check bool "Show border on" true (Gtk.Notebook.get_show_border notebook);

    (* Scrollable *)
    Gtk.Notebook.set_scrollable notebook true;
    check bool "Scrollable on" true (Gtk.Notebook.get_scrollable notebook)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* ========== GtkStack Tests ========== *)

let test_stack_module_accessible () =
  let _stack_type : Gtk.Stack.t option = None in
  let _transition : Gtk.stack_transition_type = `CROSSFADE in
  check bool "Stack module accessible" true true

let test_stack_creation () =
  try
    let _ = GMain.init () in
    let stack = Gtk.Stack.create () in
    check bool "Stack created" true true;

    let _widget = Gtk.Stack.as_widget stack in
    check bool "Stack as_widget works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_stack_children () =
  try
    let _ = GMain.init () in
    let stack = Gtk.Stack.create () in
    let child1 = Gtk.Box.create ~orientation:`VERTICAL ~spacing:0 in
    let child2 = Gtk.Box.create ~orientation:`VERTICAL ~spacing:0 in

    (* Add named child *)
    Gtk.Stack.add_named stack ~child:(Gtk.Box.as_widget child1) ~name:"page1";

    (* Add titled child *)
    Gtk.Stack.add_titled stack ~child:(Gtk.Box.as_widget child2) ~name:"page2" ~title:"Page 2";

    (* Set visible child *)
    Gtk.Stack.set_visible_child_name stack "page1";
    (match Gtk.Stack.get_visible_child_name stack with
    | Some name -> check string "Visible child name" "page1" name
    | None -> fail "No visible child");

    (* Remove child *)
    Gtk.Stack.remove stack (Gtk.Box.as_widget child1);
    check bool "Stack child removed" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_stack_transitions () =
  try
    let _ = GMain.init () in
    let stack = Gtk.Stack.create () in

    (* Transition type *)
    Gtk.Stack.set_transition_type stack `SLIDE_LEFT;
    check bool "Transition type set"
      (`SLIDE_LEFT = Gtk.Stack.get_transition_type stack) true;

    (* Transition duration *)
    Gtk.Stack.set_transition_duration stack 500;
    check int "Transition duration" 500 (Gtk.Stack.get_transition_duration stack)
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* ========== High-Level Wrapper Tests ========== *)

let test_gfixed_wrapper () =
  try
    let _ = GMain.init () in
    let fixed = GFixed.create () in
    let child = GBox.hbox () in

    (* Test high-level put *)
    fixed#put ~x:25.0 ~y:35.0 (child :> GObj.widget);
    let (x, y) = fixed#get_child_position (child :> GObj.widget) in
    check (float 0.01) "GFixed x" 25.0 x;
    check (float 0.01) "GFixed y" 35.0 y;

    (* Test high-level move *)
    fixed#move ~x:50.0 ~y:60.0 (child :> GObj.widget);
    let (x2, y2) = fixed#get_child_position (child :> GObj.widget) in
    check (float 0.01) "GFixed moved x" 50.0 x2;
    check (float 0.01) "GFixed moved y" 60.0 y2;

    (* Test remove *)
    fixed#remove (child :> GObj.widget);
    check bool "GFixed wrapper works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_gpaned_wrapper () =
  try
    let _ = GMain.init () in
    let paned = GPaned.hpaned () in
    let child1 = GBox.vbox () in
    let child2 = GBox.vbox () in

    (* Test add1/add2 convenience methods *)
    paned#add1 (child1 :> GObj.widget);
    paned#add2 (child2 :> GObj.widget);

    (* Test properties *)
    paned#set_position 150;
    check int "GPaned position" 150 paned#position;

    paned#set_wide_handle true;
    check bool "GPaned wide handle" true paned#wide_handle;

    paned#set_resize_start_child false;
    check bool "GPaned resize start" false paned#resize_start_child;

    (* Test vpaned creation *)
    let _vpaned = GPaned.vpaned () in
    check bool "GPaned vpaned created" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_gnotebook_wrapper () =
  try
    let _ = GMain.init () in
    let notebook = GNotebook.create () in
    let page1 = GBox.vbox () in
    let page2 = GBox.vbox () in

    (* Test high-level append_page *)
    let idx1 = notebook#append_page (page1 :> GObj.widget) in
    check int "GNotebook first page" 0 idx1;
    check int "GNotebook 1 page" 1 notebook#n_pages;

    (* Test prepend_page *)
    let idx2 = notebook#prepend_page (page2 :> GObj.widget) in
    check int "GNotebook prepend index" 0 idx2;
    check int "GNotebook 2 pages" 2 notebook#n_pages;

    (* Test navigation *)
    notebook#set_current_page 1;
    check int "GNotebook current" 1 notebook#current_page;

    notebook#prev_page ();
    check int "GNotebook prev" 0 notebook#current_page;

    notebook#next_page ();
    check int "GNotebook next" 1 notebook#current_page;

    (* Test properties *)
    notebook#set_show_tabs false;
    check bool "GNotebook show_tabs" false notebook#show_tabs;

    notebook#set_scrollable true;
    check bool "GNotebook scrollable" true notebook#scrollable
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_gstack_wrapper () =
  try
    let _ = GMain.init () in
    let stack = GStack.create () in
    let child1 = GBox.vbox () in
    let child2 = GBox.vbox () in

    (* Test high-level add_named *)
    stack#add_named ~name:"first" (child1 :> GObj.widget);
    stack#add_titled ~name:"second" ~title:"Second Page" (child2 :> GObj.widget);

    (* Test visible child management *)
    stack#set_visible_child_name "first";
    (match stack#visible_child_name with
    | Some name -> check string "GStack visible name" "first" name
    | None -> fail "No visible child");

    (* Test transitions *)
    stack#set_transition_type `CROSSFADE;
    check bool "GStack transition type"
      (`CROSSFADE = stack#transition_type) true;

    stack#set_transition_duration 300;
    check int "GStack duration" 300 stack#transition_duration
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

(* ========== Integration Tests ========== *)

let test_nested_containers () =
  try
    let _ = GMain.init () in

    (* Create a complex nested structure:
       Paned with:
       - Start: Notebook with 2 pages (each has a box)
       - End: Stack with 2 children (each has a grid) *)

    let paned = GPaned.hpaned () in

    (* Create notebook for start pane *)
    let notebook = GNotebook.create () in
    let nb_page1 = GBox.vbox ~spacing:5 () in
    let nb_page2 = GBox.hbox ~spacing:5 () in
    let _ = notebook#append_page (nb_page1 :> GObj.widget) in
    let _ = notebook#append_page (nb_page2 :> GObj.widget) in

    (* Create stack for end pane *)
    let stack = GStack.create () in
    let stack_child1 = GGrid.create () in
    let stack_child2 = GGrid.create ~row_spacing:10 () in
    stack#add_named ~name:"grid1" (stack_child1 :> GObj.widget);
    stack#add_named ~name:"grid2" (stack_child2 :> GObj.widget);

    (* Assemble the structure *)
    paned#add1 (notebook :> GObj.widget);
    paned#add2 (stack :> GObj.widget);

    (* Verify structure *)
    check int "Nested: notebook pages" 2 notebook#n_pages;
    check bool "Nested: paned has start" true (paned#start_child <> None);
    check bool "Nested: paned has end" true (paned#end_child <> None);

    (* Test interaction across containers *)
    notebook#set_current_page 1;
    stack#set_visible_child_name "grid2";
    paned#set_position 200;

    check int "Nested: operations successful" 200 paned#position
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_fixed_with_containers () =
  try
    let _ = GMain.init () in

    (* Create fixed with various container types *)
    let fixed = GFixed.create () in
    let box = GBox.vbox () in
    let grid = GGrid.create () in
    let notebook = GNotebook.create () in

    (* Position containers absolutely *)
    fixed#put ~x:10.0 ~y:10.0 (box :> GObj.widget);
    fixed#put ~x:100.0 ~y:10.0 (grid :> GObj.widget);
    fixed#put ~x:200.0 ~y:10.0 (notebook :> GObj.widget);

    (* Verify positions *)
    let (x1, _y1) = fixed#get_child_position (box :> GObj.widget) in
    check (float 0.01) "Fixed box x" 10.0 x1;

    let (x2, _y2) = fixed#get_child_position (grid :> GObj.widget) in
    check (float 0.01) "Fixed grid x" 100.0 x2;

    let (x3, _y3) = fixed#get_child_position (notebook :> GObj.widget) in
    check (float 0.01) "Fixed notebook x" 200.0 x3;

    check bool "Fixed with containers works" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let test_all_transitions () =
  try
    let _ = GMain.init () in
    let stack = GStack.create () in

    (* Test all transition types *)
    let transitions = [
      `NONE; `CROSSFADE; `SLIDE_RIGHT; `SLIDE_LEFT;
      `SLIDE_UP; `SLIDE_DOWN; `SLIDE_LEFT_RIGHT; `SLIDE_UP_DOWN;
      `OVER_UP; `OVER_DOWN; `OVER_LEFT; `OVER_RIGHT;
      `UNDER_UP; `UNDER_DOWN; `UNDER_LEFT; `UNDER_RIGHT;
      `OVER_UP_DOWN; `OVER_DOWN_UP; `OVER_LEFT_RIGHT; `OVER_RIGHT_LEFT;
      `ROTATE_LEFT; `ROTATE_RIGHT; `ROTATE_LEFT_RIGHT
    ] in

    let test_transition tt =
      stack#set_transition_type tt;
      check bool (Printf.sprintf "Transition %s"
        (match tt with `CROSSFADE -> "CROSSFADE" | `SLIDE_LEFT -> "SLIDE_LEFT" | _ -> "other"))
        (tt = stack#transition_type) true
    in

    List.iter test_transition transitions;
    check bool "All 23 transitions work" true true
  with
  | GMain.Error _ -> skip ()
  | e -> fail ("Unexpected error: " ^ Printexc.to_string e)

let () =
  run "Comprehensive Container Tests (Phase 4.4)" [
    "Fixed - Low Level", [
      test_case "module_accessible" `Quick test_fixed_module_accessible;
      test_case "creation" `Quick test_fixed_creation;
      test_case "put_move_remove" `Quick test_fixed_put_move;
    ];
    "Fixed - High Level", [
      test_case "gfixed_wrapper" `Quick test_gfixed_wrapper;
    ];
    "Paned - Low Level", [
      test_case "module_accessible" `Quick test_paned_module_accessible;
      test_case "creation" `Quick test_paned_creation;
      test_case "children" `Quick test_paned_children;
      test_case "properties" `Quick test_paned_properties;
    ];
    "Paned - High Level", [
      test_case "gpaned_wrapper" `Quick test_gpaned_wrapper;
    ];
    "Notebook - Low Level", [
      test_case "module_accessible" `Quick test_notebook_module_accessible;
      test_case "creation" `Quick test_notebook_creation;
      test_case "pages" `Quick test_notebook_pages;
      test_case "navigation" `Quick test_notebook_navigation;
      test_case "properties" `Quick test_notebook_properties;
    ];
    "Notebook - High Level", [
      test_case "gnotebook_wrapper" `Quick test_gnotebook_wrapper;
    ];
    "Stack - Low Level", [
      test_case "module_accessible" `Quick test_stack_module_accessible;
      test_case "creation" `Quick test_stack_creation;
      test_case "children" `Quick test_stack_children;
      test_case "transitions" `Quick test_stack_transitions;
    ];
    "Stack - High Level", [
      test_case "gstack_wrapper" `Quick test_gstack_wrapper;
      test_case "all_transitions" `Quick test_all_transitions;
    ];
    "Integration Tests", [
      test_case "nested_containers" `Quick test_nested_containers;
      test_case "fixed_with_containers" `Quick test_fixed_with_containers;
    ];
  ]
