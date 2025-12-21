(* GIR Generator Test Suite (Phase 5)
 *
 * Entry point for all GIR code generator tests.
 * Tests are organized into modules by feature area.
 *)

open Printf

let () =
  printf "\n";
  printf "====================================\n";
  printf "GIR Generator Test Suite (Phase 5)\n";
  printf "====================================\n";

  (* Run all test suites *)
  Core.run_tests ();
  Properties.run_tests ();
  Signals.run_tests ();
  Enums.run_tests ();
  Records.run_tests ();
  Edge_cases.run_tests ();

  (* Print summary and exit *)
  exit (Helpers.print_summary ())
