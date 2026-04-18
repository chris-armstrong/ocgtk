(* GIR Generator Test Suite (Phase 5)
 *
 * Entry point for all GIR code generator tests.
 * Tests are organized into modules by feature area.
 *)

let () =
  Alcotest.run "GIR Generator"
    [
      (* Layer 0 — C Stub Generation *)
      ("C Stubs", Generation_tests.tests);
      ("Header Naming", Header_naming_tests.tests);
      ("Header Generation", Header_generation_tests.tests);
      ("C Validation", C_validation_tests.tests);
      ("Nullable", Nullable_tests.tests);
      ("Error Handling", Error_handling_tests.tests);
      ("Out Params", Out_params_tests.tests);
      ("Arrays", Array_tests.tests);
      ("Type Conversion", Type_conversion_tests.tests);
      ("C Stub Version Guards", C_stub_version_guard_tests.test_suite);
      (* Layer 1 — ML Generation *)
      ("Type Definitions (ML)", Type_definition_tests.tests);
      ("External Declarations (ML)", External_decl_tests.tests);
      ("Signatures (ML)", Signature_tests.tests);
      (* Layer 2 — Class Generation *)
      ("Layer2 Method Wrappers", Method_wrapper_tests.tests);
      ("Constructor Wrappers", Constructor_wrapper_tests.tests);
      ("Signal Wrappers", Signal_wrapper_tests.tests);
      ("Interface Inheritance (Phase 4)", Interface_inheritance_tests.test_suite);
      ( "Interface Method Types (Phase 7)",
        Interface_method_types_tests.test_suite );
      (* Interface Parsing *)
      ("Interface Parsing", Parsing_tests.test_suite);
      ("From GObject Generation", From_gobject_tests.test_suite);
      (* Integration — End-to-end subprocess *)
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
      (* Cross-namespace *)
      ("Cross-Namespace", C_stub_tests.tests);
      ("C Stub Header Include (Stage 5)", C_stub_include_tests.tests);
      ("classify_type + Array Resolution (Phase 6)", Classify_type_tests.tests);
      ("Dependency Includes (Stage 4)", Dependency_includes_tests.tests);
      ("Dependency Exclusion (Stage 4)", Dependency_exclusion_tests.tests);
      ("No External Enum Decls (Stage 2)", No_external_enum_decls_tests.tests);
      ( "No External Bitfield Decls (Stage 3)",
        No_external_bitfield_decls_tests.tests );
      ("Header Pipeline Tests (Stage 8)", Header_pipeline_tests.tests);
      ("Compilation Tests (Stage 8)", Compilation_tests.tests);
      (* Override system *)
      ("Override Types", Types_tests.test_suite);
      ("Override Parser", Parser_tests.test_suite);
      ("Override Parser Roundtrip", Parser_tests.test_suite_roundtrip);
      ("Override Apply", Apply_tests.test_suite);
      ("Override Extractor", Extractor_tests.test_suite);
      ("Override Apply (parsed GIR)", Apply_with_parsed_gir_tests.test_suite);
      ("Override Pipeline", Pipeline_tests.test_suite);
      ("Version Guard", Version_guard_tests.test_suite);
      ("Enum Member Version Guards", Enum_member_version_tests.test_suite);
    ]
