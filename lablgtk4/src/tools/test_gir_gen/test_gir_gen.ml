(* GIR Generator Test Suite (Phase 5)
 *
 * Entry point for all GIR code generator tests.
 * Tests are organized into modules by feature area.
 *)

let () =
  Alcotest.run "GIR Generator"
    [
      ("Core", Core.tests);
      ("Properties", Properties.tests);
      ("Signals", Signals.tests);
      ("Enums", Enums.tests);
      ("Records", Records.tests);
      ("Edge Cases", Edge_cases.tests);
    ]
