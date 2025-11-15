(** Tests for GTK4 Event Controller System *)

open Alcotest

let test_controller_creation () =
  (* Test that we can create controllers without crashing *)
  let key_ctrl = EventControllerKey.new_ () in
  check bool "key controller created" true (key_ctrl <> Obj.magic 0);

  let motion_ctrl = EventControllerMotion.new_ () in
  check bool "motion controller created" true (motion_ctrl <> Obj.magic 0);

  let click = GestureClick.new_ () in
  check bool "click gesture created" true (click <> Obj.magic 0)

let test_button_selection () =
  let click = GestureClick.new_ () in
  GestureClick.set_button click 1;  (* Primary button *)
  check int "button set" 1 (GestureClick.get_button click);

  GestureClick.set_button click 0;  (* All buttons *)
  check int "button all" 0 (GestureClick.get_button click)

let test_signal_connection () =
  (* Test that we can connect signals without crashing *)
  let click = GestureClick.new_ () in
  let pressed_count = ref 0 in

  let _sig_id = GestureClick.connect_pressed click
    ~callback:(fun ~n_press ~x ~y ->
      pressed_count := !pressed_count + 1
    ) in

  (* Note: Can't test signal emission without widget and event loop *)
  check int "signal connected" 0 !pressed_count

let test_propagation_phase () =
  let key_ctrl = EventControllerKey.new_ () in

  (* Test setting propagation phase *)
  EventController.Base.set_propagation_phase key_ctrl `CAPTURE;
  let phase = EventController.Base.get_propagation_phase key_ctrl in
  check bool "propagation phase set to CAPTURE"
    true
    (phase = `CAPTURE);

  EventController.Base.set_propagation_phase key_ctrl `BUBBLE;
  let phase = EventController.Base.get_propagation_phase key_ctrl in
  check bool "propagation phase set to BUBBLE"
    true
    (phase = `BUBBLE)

let test_propagation_limit () =
  let motion_ctrl = EventControllerMotion.new_ () in

  (* Test setting propagation limit *)
  EventController.Base.set_propagation_limit motion_ctrl `SAME_NATIVE;
  let limit = EventController.Base.get_propagation_limit motion_ctrl in
  check bool "propagation limit set"
    true
    (limit = `SAME_NATIVE)

let () =
  run "Event Controller Tests" [
    "creation", [
      test_case "controllers" `Quick test_controller_creation
    ];
    "properties", [
      test_case "button_selection" `Quick test_button_selection;
      test_case "propagation_phase" `Quick test_propagation_phase;
      test_case "propagation_limit" `Quick test_propagation_limit;
    ];
    "signals", [
      test_case "connection" `Quick test_signal_connection
    ];
  ]
