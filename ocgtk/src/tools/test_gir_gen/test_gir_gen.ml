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
      ("Accessor Methods (ML)", Accessor_method_tests.tests);
      ("Signatures (ML)", Signature_tests.tests);
      ("Properties", Properties.tests);
      ("Signals", Signals.tests);
      ("Enums", Enums.tests);
      ("Records", Records.tests);
      ("Edge Cases", Edge_cases.tests);
      ("Layer2 Method Wrappers", Method_wrapper_tests.tests);
      ("Cross-Namespace", Cross_namespace_tests.tests);
      ("No External Enum Decls (Stage 2)", No_external_enum_decls_tests.tests);
      ( "No External Bitfield Decls (Stage 3)",
        No_external_bitfield_decls_tests.tests );
      ("Dependency Includes (Stage 4)", Dependency_includes_tests.tests);
      ("Dependency Exclusion (Stage 4)", Dependency_exclusion_tests.tests);
      ("C Stub Header Include (Stage 5)", C_stub_include_tests.tests);
      ("Dune Include Paths (Stage 6)", Dune_include_paths_tests.tests);
      ("Dune Relative Paths (Stage 6)", Dune_relative_path_tests.tests);
      ("Dune Library Dependencies (Stage 7)", Dune_library_deps_tests.tests);
      ("Dune Dependency Order (Stage 7)", Dune_dependency_order_tests.tests);
    ]
