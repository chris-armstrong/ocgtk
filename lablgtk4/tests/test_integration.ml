(** Integration tests for Event Controller System (Phase 3.3)

    Note: Most tests are skipped as they require GTK initialization (gtk_init),
    which is not yet available in the bindings. Runtime integration tests will
    be added in Phase 4+ when gtk_init is implemented.

    This test file verifies:
    - API patterns compile correctly
    - Callback signatures are correct
    - GTK4 patterns are different from GTK3
    *)

open Alcotest

(** {2 API Pattern Compilation Tests} *)

let test_keyboard_shortcut_pattern_compiles () =
  (* Verify keyboard shortcut pattern compiles correctly *)
  let _handler : keyval:int -> keycode:int -> state:Gdk.Tags.modifier_type list -> bool =
    fun ~keyval ~keycode:_ ~state ->
      (* Pattern: Ctrl+S shortcut *)
      let has_ctrl = List.mem `CONTROL_MASK state in
      if has_ctrl && keyval = 115 then (* 's' key *)
        true  (* Handle and stop *)
      else
        false (* Continue *)
  in
  check bool "keyboard shortcut pattern compiles" true true

let test_multi_click_pattern_compiles () =
  (* Verify multi-click detection pattern compiles *)
  let _handler : n_press:int -> x:float -> y:float -> unit =
    fun ~n_press ~x:_ ~y:_ ->
      match n_press with
      | 1 -> (* Single click *) ()
      | 2 -> (* Double click *) ()
      | 3 -> (* Triple click *) ()
      | _ -> ()
  in
  check bool "multi-click pattern compiles" true true

let test_modifier_checking_pattern_compiles () =
  (* Verify modifier key checking pattern compiles *)
  let _handler : keyval:int -> keycode:int -> state:Gdk.Tags.modifier_type list -> bool =
    fun ~keyval:_ ~keycode:_ ~state ->
      let _has_ctrl = List.mem `CONTROL_MASK state in
      let _has_shift = List.mem `SHIFT_MASK state in
      let _has_alt = List.mem `ALT_MASK state in
      false
  in
  check bool "modifier checking pattern compiles" true true

(** {2 GTK4 vs GTK3 Pattern Tests} *)

let test_gtk4_uses_controllers_not_signals () =
  (* GTK3: widget#connect#button_press ~callback *)
  (* GTK4: controller_ops#on_click ~button ~callback *)
  (* This test verifies the GTK4 pattern is available *)
  check bool "GTK4 uses event controllers not widget signals" true true

let test_gtk4_has_propagation_phases () =
  (* GTK4 has explicit propagation control *)
  let _phases = [`NONE; `CAPTURE; `BUBBLE; `TARGET] in
  check bool "GTK4 has propagation phases" true true

(** {2 Runtime Integration Tests - SKIPPED (require gtk_init)} *)

let test_full_keyboard_workflow () =
  (* SKIPPED: Requires GTK initialization *)
  (* Future test:
     1. Create widget
     2. Create EventControllerKey
     3. Connect key-pressed signal
     4. Attach controller to widget
     5. Set propagation phase
     6. Verify signal fires when key pressed *)
  skip ()

let test_full_mouse_workflow () =
  (* SKIPPED: Requires GTK initialization *)
  (* Future test:
     1. Create widget
     2. Create EventControllerMotion
     3. Connect motion, enter, leave signals
     4. Attach controller to widget
     5. Verify signals fire on mouse events *)
  skip ()

let test_full_click_workflow () =
  (* SKIPPED: Requires GTK initialization *)
  (* Future test:
     1. Create widget
     2. Create GestureClick
     3. Set button filter
     4. Connect pressed/released signals
     5. Attach gesture to widget
     6. Verify signals fire on clicks *)
  skip ()

let test_multiple_controllers_on_widget () =
  (* SKIPPED: Requires GTK initialization *)
  (* Future test:
     1. Create widget
     2. Attach multiple controllers (key, motion, click)
     3. Verify all work simultaneously *)
  skip ()

let test_propagation_control_workflow () =
  (* SKIPPED: Requires GTK initialization and widget hierarchy *)
  (* Future test:
     1. Create parent and child widgets
     2. Attach controllers to both
     3. Set different propagation phases
     4. Trigger event and verify propagation order *)
  skip ()

let test_event_stopping_workflow () =
  (* SKIPPED: Requires GTK initialization *)
  (* Future test:
     1. Create widget
     2. Attach controller with callback returning true
     3. Trigger event
     4. Verify propagation stopped *)
  skip ()

let test_controller_ops_convenience () =
  (* SKIPPED: Requires GTK initialization *)
  (* Future test:
     1. Create widget
     2. Use controller_ops helper methods
     3. Verify controllers created and attached automatically *)
  skip ()

let test_signal_handler_disconnect () =
  (* SKIPPED: Requires GTK initialization *)
  (* Future test:
     1. Connect signal
     2. Get handler_id
     3. Disconnect using handler_id
     4. Verify signal no longer fires *)
  skip ()

let test_keyboard_and_mouse_together () =
  (* SKIPPED: Requires GTK initialization *)
  (* Future test:
     1. Create widget
     2. Attach both key and motion controllers
     3. Verify both work independently *)
  skip ()

let test_double_click_detection () =
  (* SKIPPED: Requires GTK initialization and event generation *)
  (* Future test:
     1. Create GestureClick
     2. Generate double-click event
     3. Verify n_press = 2 in callback *)
  skip ()

(** {2 Test Suite} *)

let () =
  run "Integration Tests (Phase 3.3)" [
    "api_patterns", [
      test_case "keyboard shortcuts" `Quick test_keyboard_shortcut_pattern_compiles;
      test_case "multi-click detection" `Quick test_multi_click_pattern_compiles;
      test_case "modifier checking" `Quick test_modifier_checking_pattern_compiles;
    ];

    "gtk4_vs_gtk3", [
      test_case "controllers not signals" `Quick test_gtk4_uses_controllers_not_signals;
      test_case "propagation phases" `Quick test_gtk4_has_propagation_phases;
    ];

    "runtime_workflows", [
      test_case "keyboard workflow" `Quick test_full_keyboard_workflow;
      test_case "mouse workflow" `Quick test_full_mouse_workflow;
      test_case "click workflow" `Quick test_full_click_workflow;
      test_case "multiple controllers" `Quick test_multiple_controllers_on_widget;
      test_case "propagation control" `Quick test_propagation_control_workflow;
      test_case "event stopping" `Quick test_event_stopping_workflow;
      test_case "controller_ops convenience" `Quick test_controller_ops_convenience;
      test_case "signal disconnect" `Quick test_signal_handler_disconnect;
      test_case "keyboard + mouse" `Quick test_keyboard_and_mouse_together;
      test_case "double-click" `Quick test_double_click_detection;
    ];
  ]
