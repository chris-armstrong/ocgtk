(* GIR Generator Integration Test Suite
 *
 * Tests that spawn gir_gen.exe as a subprocess or depend on its output.
 * Separated from the unit/pipeline suite so that unit tests can run
 * independently of gir_gen.exe being built.
 *)

let () =
  Alcotest.run "GIR Generator Integration"
    [
      (* Layer 2 — interface tests that call gir_gen.exe *)
      ("Interface Inheritance (Phase 4)", Interface_inheritance_tests.test_suite);
      ( "Interface Method Types (Phase 7)",
        Interface_method_types_tests.test_suite );
      (* Interface C stubs — from_gobject generation (calls gir_gen.exe) *)
      ("From GObject Generation", From_gobject_tests.test_suite);
      (* Cross-namespace regression test (calls gir_gen.exe) *)
      ("Cross-Namespace", C_stub_tests.tests);
      (* Integration — end-to-end subprocess *)
      ("GIR Parsing", Gir_parsing_tests.tests);
      ("Widget Generation", Widget_generation_tests.tests);
      ("Nullable Generation", Nullable_generation_tests.tests);
      ("CLI", Cli_tests.tests);
      ("GIR Parser", Gir_parser_tests.tests);
      ("Signals", Signals_tests.tests);
      ("Enums", Enums_tests.tests);
      ("Records", Records_tests.tests);
      ("Properties", Properties_tests.tests);
      ("Edge Cases", Edge_cases_tests.tests);
    ]
