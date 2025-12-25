(* GIR Generator Test Suite (Phase 5)
 *
 * Entry point for all GIR code generator tests.
 * Tests are organized into modules by feature area.
 *)

let () =
  Alcotest.run "GIR Generator"
    [
      ("Core", Core.tests);
      ("Parser", Parser.tests);
      ("C Stubs", C_stubs_tests.tests);
      ("Nullable", Nullable_tests.tests);
      ("Error Handling", Error_handling_tests.tests);
      ("Out Params", Out_params_tests.tests);
      ("Type Conversion", Type_conversion_tests.tests);
      ("Type Definitions (ML)", Type_definition_tests.tests);
      ("Properties", Properties.tests);
      ("Signals", Signals.tests);
      ("Enums", Enums.tests);
      ("Records", Records.tests);
      ("Edge Cases", Edge_cases.tests);
    ]
