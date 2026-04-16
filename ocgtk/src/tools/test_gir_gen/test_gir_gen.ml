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
      ("C Validation", C_validation_tests.tests);
      ("C Stubs", C_stubs_tests.tests);
      ("Header Naming", Header_naming_tests.tests);
      ("Header Generation", Header_generation_tests.tests);
      ("Nullable", Nullable_tests.tests);
      ("Error Handling", Error_handling_tests.tests);
      ("Out Params", Out_params_tests.tests);
      ("Arrays", Array_tests.tests);
      ("Type Conversion", Type_conversion_tests.tests);
      ("Type Definitions (ML)", Type_definition_tests.tests);
      ("External Declarations (ML)", External_decl_tests.tests);
      ("Signatures (ML)", Signature_tests.tests);
      ("Properties", Properties.tests);
      ("Signals", Signals.tests);
      ("Enums", Enums.tests);
      ("Records", Records.tests);
      ("Edge Cases", Edge_cases.tests);
      ("Layer2 Method Wrappers", Method_wrapper_tests.tests);
      ("Constructor Wrappers", Constructor_wrapper_tests.tests);
      ("Cross-Namespace", Cross_namespace_tests.tests);
      ("No External Enum Decls (Stage 2)", No_external_enum_decls_tests.tests);
      ( "No External Bitfield Decls (Stage 3)",
        No_external_bitfield_decls_tests.tests );
      ("Dependency Includes (Stage 4)", Dependency_includes_tests.tests);
      ("Dependency Exclusion (Stage 4)", Dependency_exclusion_tests.tests);
      ("C Stub Header Include (Stage 5)", C_stub_include_tests.tests);
      ("Integration Tests (Stage 8)", Integration_tests.tests);
      ("Compilation Tests (Stage 8)", Compilation_tests.tests);
      ("classify_type + Array Resolution (Phase 6)", Classify_type_tests.tests);
      ("Version Guard", Version_guard_tests.test_suite);
      ("C Stub Version Guards", C_stub_version_guard_tests.test_suite);
      ("Override Types", Types_tests.test_suite);
      ("Override Parser", Parser_tests.test_suite);
      ("Override Parser Roundtrip", Parser_tests.test_suite_roundtrip);
      ("Override Apply", Apply_tests.test_suite);
      ("Override Extractor", Extractor_tests.test_suite);
      ("Override E2E", E2e_tests.test_suite);
      ("Override Integration", Overrides_integration_tests.test_suite);
      ("Enum Member Version Guards", Enum_member_version_tests.test_suite);
      ("Interface Parsing", Test_interface_parsing.test_suite);
      ("From GObject Generation", Test_from_gobject_gen.test_suite);
      ("Interface Inheritance (Phase 4)", Test_interface_inheritance.test_suite);
      ( "Interface Method Types (Phase 7)",
        Test_interface_method_types.test_suite );
    ]
