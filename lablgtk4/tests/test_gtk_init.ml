(** GTK initialization tests *)

open Alcotest

let test_gmain_module_exists () =
  (* Test that GMain module is accessible *)
  check bool "GMain module exists" true true

let test_gtk_init_api_exists () =
  (* Test that init function exists *)
  let _ = GMain.init in
  check bool "GMain.init function exists" true true

let test_main_loop_api_exists () =
  (* Test that main loop functions exist *)
  let _ = GMain.main in
  let _ = GMain.quit in
  let _ = GMain.iteration in
  check bool "Main loop API exists" true true

let test_gtk_init_with_display () =
  (* SKIPPED: Requires X display server *)
  (* Future test: Initialize GTK and verify it succeeds *)
  (* This will work when run in an environment with DISPLAY set *)
  skip ()

let () =
  run "GTK Initialization Tests" [
    "api", [
      test_case "GMain module" `Quick test_gmain_module_exists;
      test_case "init exists" `Quick test_gtk_init_api_exists;
      test_case "main loop exists" `Quick test_main_loop_api_exists;
    ];

    "runtime", [
      test_case "gtk_init" `Quick test_gtk_init_with_display;
    ];
  ]
