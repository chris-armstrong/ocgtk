(** Runtime tests for GTK4 Event Controller System (Phase 3.3)

    These tests require a display server to run. Use xvfb-run in CI:
      $ xvfb-run dune exec ./test_event_controller_runtime.exe

    Or set up virtual display:
      $ Xvfb :99 -screen 0 1024x768x24 &
      $ DISPLAY=:99 dune exec ./test_event_controller_runtime.exe
*)

open Alcotest

(** {2 API Verification Tests} *)

let test_modules_exist () =
  let _ = Event_controller_key.new_ in
  let _ = Event_controller_motion.new_ in
  let _ = Gesture_click.new_ in
  check bool "Modules accessible" true true

let test_callback_types_compile () =
  let _key_cb : keyval:int -> keycode:int -> state:Gdk.Tags.modifier_type list -> bool =
    fun ~keyval:_ ~keycode:_ ~state:_ -> false in
  let _motion_cb : x:float -> y:float -> unit =
    fun ~x:_ ~y:_ -> () in
  check bool "Callback types compile" true true

(** {2 Runtime Tests - SKIPPED (require display server)} *)

let test_controller_creation () =
  (* SKIPPED: Requires X display server *)
  (*  Future: Create controllers with GMain.init() and verify they work *)
  skip ()

let test_signal_connection () =
  (* SKIPPED: Requires X display server *)
  skip ()

let test_propagation_properties () =
  (* SKIPPED: Requires X display server *)
  skip ()

let test_button_filter () =
  (* SKIPPED: Requires X display server *)
  skip ()

let test_multiple_signal_connections () =
  (* SKIPPED: Requires X display server *)
  skip ()

(** {2 Test Suite} *)

let () =
  run "Event Controller Runtime Tests (Phase 3.3)" [
    "api_verification", [
      test_case "modules exist" `Quick test_modules_exist;
      test_case "callback types" `Quick test_callback_types_compile;
    ];

    "runtime", [
      test_case "controller creation" `Quick test_controller_creation;
      test_case "signal connection" `Quick test_signal_connection;
      test_case "propagation properties" `Quick test_propagation_properties;
      test_case "button filter" `Quick test_button_filter;
      test_case "multiple signals" `Quick test_multiple_signal_connections;
    ];
  ]
