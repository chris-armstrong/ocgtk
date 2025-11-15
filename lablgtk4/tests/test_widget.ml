(** Test suite for Gtk.Widget module (Phase 3.1)

    Note: Most tests are skipped as they require actual widget instances,
    which need container support (Phase 4) and concrete widget types (Phase 5).

    This test file verifies:
    - Module compiles and types are accessible
    - Basic type definitions are correct
    *)

open Alcotest

(* Test that module is accessible and types compile *)
let test_module_accessible () =
  (* Test that we can reference the types *)
  let _widget_type : Gtk.widget option = None in
  let _requisition : Gtk.requisition = { width = 0; height = 0 } in
  let _allocation : Gtk.allocation = { x = 0; y = 0; width = 100; height = 100 } in

  (* Test align type *)
  let _align : Gtk.align = `FILL in

  (* Test size_request_mode *)
  let _mode : Gtk.size_request_mode = `HEIGHT_FOR_WIDTH in

  (* Test state_flags *)
  let _flags : Gtk.state_flags list = [`NORMAL; `FOCUSED; `ACTIVE] in

  check bool "module accessible" true true

(* Test type constructors *)
let test_type_constructors () =
  (* Test requisition *)
  let req = { Gtk.width = 100; Gtk.height = 50 } in
  check int "requisition width" 100 req.width;
  check int "requisition height" 50 req.height;

  (* Test allocation *)
  let alloc = { Gtk.x = 10; Gtk.y = 20; Gtk.width = 200; Gtk.height = 100 } in
  check int "allocation x" 10 alloc.x;
  check int "allocation y" 20 alloc.y;
  check int "allocation width" 200 alloc.width;
  check int "allocation height" 100 alloc.height

(* Widget creation tests - SKIPPED: requires actual widgets from Phase 4+ *)
let test_widget_creation () =
  skip ()

(* Visibility tests - SKIPPED: requires actual widgets *)
let test_visibility () =
  skip ()

(* Size request tests - SKIPPED: requires actual widgets *)
let test_size_request () =
  skip ()

(* CSS class tests - SKIPPED: requires actual widgets *)
let test_css_classes () =
  skip ()

(* Focus tests - SKIPPED: requires actual widgets *)
let test_focus () =
  skip ()

(* State flags tests - SKIPPED: requires actual widgets *)
let test_state_flags () =
  skip ()

(* Parent/root tests - SKIPPED: requires actual widgets and containers *)
let test_parent_root () =
  skip ()

(* Queue draw/resize tests - SKIPPED: requires actual widgets *)
let test_queue_operations () =
  skip ()

let () =
  run "Gtk.Widget Tests (Phase 3.1)" [
    "module", [
      test_case "module_accessible" `Quick test_module_accessible;
      test_case "type_constructors" `Quick test_type_constructors;
    ];
    "creation", [
      test_case "widget_creation" `Quick test_widget_creation;
    ];
    "visibility", [
      test_case "show/hide" `Quick test_visibility;
    ];
    "size", [
      test_case "size_request" `Quick test_size_request;
    ];
    "css", [
      test_case "css_classes" `Quick test_css_classes;
    ];
    "focus", [
      test_case "focusable" `Quick test_focus;
    ];
    "state", [
      test_case "state_flags" `Quick test_state_flags;
    ];
    "hierarchy", [
      test_case "parent_root" `Quick test_parent_root;
    ];
    "queue", [
      test_case "queue_operations" `Quick test_queue_operations;
    ];
  ]
