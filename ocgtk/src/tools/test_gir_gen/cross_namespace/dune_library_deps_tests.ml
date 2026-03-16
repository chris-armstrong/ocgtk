(* Cross-namespace tests - Stage 7: Dune File Library Dependencies

   Tests that generated dune files contain correct library dependencies
   for cross-namespace support. This ensures OCaml-level dependencies
   are correctly declared.

   Note: These tests validate the text output of the dune file generator.
   Since dune files are generated text (not parsed AST), we use string-based
   validation which is appropriate for this use case per test-patterns.md.
*)

open Printf

(* Helper: Check if string contains substring *)
let string_contains haystack needle =
  try
    ignore (Str.search_forward (Str.regexp_string needle) haystack 0);
    true
  with Not_found -> false

(* Helper: Assert that a string contains a substring, failing with a message if not *)
let assert_contains ~msg haystack needle =
  if not (string_contains haystack needle) then
    Alcotest.fail (sprintf "%s: expected to find '%s' in dune file" msg needle)

(* Helper: Assert that a string does NOT contain a substring *)
let assert_not_contains ~msg haystack needle =
  if string_contains haystack needle then
    Alcotest.fail
      (sprintf "%s: expected NOT to find '%s' in dune file" msg needle)

(* Stage 7 Test: Dune file includes library dependency for single namespace.
   When generating for GSK with Gdk as a dependency,
   the dune file should include ocgtk.gdk.generated in libraries. *)
let test_dune_includes_single_library_dependency () =
  (* Generate dune file with Gdk as a dependency *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gsk"
      ~stub_names:[ "ml_renderer_gen" ] ~module_names:[ "Renderer" ]
      ~package_names:[ "gsk-4.0" ] ~dependency_namespaces:[ "Gdk" ] ()
  in

  (* Verify the library dependency for Gdk is present *)
  assert_contains ~msg:"Dune file should include ocgtk.gdk.generated library"
    dune_content "ocgtk.gdk.generated"

(* Stage 7 Test: Dune file includes library dependencies for multiple namespaces.
   When generating for Gtk with Gdk and Gio as dependencies,
   the dune file should include both library dependencies. *)
let test_dune_includes_multiple_library_dependencies () =
  (* Generate dune file with multiple dependencies *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gtk"
      ~stub_names:[ "ml_button_gen" ] ~module_names:[ "Button" ]
      ~package_names:[ "gtk4" ] ~dependency_namespaces:[ "Gdk"; "Gio" ] ()
  in

  (* Verify both library dependencies are present *)
  assert_contains ~msg:"Dune file should include ocgtk.gdk.generated"
    dune_content "ocgtk.gdk.generated";
  assert_contains ~msg:"Dune file should include ocgtk.gio.generated"
    dune_content "ocgtk.gio.generated"

(* Stage 7 Test: No library dependencies when there are no dependencies.
   When generating for a namespace with no dependencies,
   no dependency library entries should be added. *)
let test_no_library_deps_when_no_dependencies () =
  (* Generate dune file with no dependencies *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gdk"
      ~stub_names:[ "ml_surface_gen" ] ~module_names:[ "Surface" ]
      ~package_names:[ "gdk-4.0" ] ~dependency_namespaces:[] ()
  in

  (* Verify only ocgtk_common is in libraries (no dependency libraries) *)
  assert_contains ~msg:"Dune file should include ocgtk_common" dune_content
    "ocgtk_common";
  (* Verify the libraries clause is exactly "(libraries ocgtk_common)" when no deps *)
  assert_contains ~msg:"Libraries clause should be minimal" dune_content
    "(libraries ocgtk_common)"

(* Stage 7 Test: Library dependencies are in libraries section.
   The dependency libraries should appear within the (libraries ...) stanza. *)
let test_library_deps_in_libraries_section () =
  (* Generate dune file with dependencies *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gsk"
      ~stub_names:[ "ml_renderer_gen" ] ~module_names:[ "Renderer" ]
      ~package_names:[ "gsk-4.0" ] ~dependency_namespaces:[ "Gdk" ] ()
  in

  (* Verify the library is in the output *)
  assert_contains ~msg:"Libraries section should contain ocgtk.gdk.generated"
    dune_content "ocgtk.gdk.generated";

  (* Verify ocgtk_common is still present *)
  assert_contains ~msg:"Libraries section should still contain ocgtk_common"
    dune_content "ocgtk_common"

(* Stage 7 Test: Library name format is correct.
   Library names should follow the pattern ocgtk.<ns>.generated *)
let test_library_name_format () =
  (* Generate dune file with mixed case namespace *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gtk"
      ~stub_names:[ "ml_button_gen" ] ~module_names:[ "Button" ]
      ~package_names:[ "gtk4" ]
      ~dependency_namespaces:[ "GdkPixbuf"; "Graphene" ]
      ()
  in

  (* Verify lowercase namespace in library name *)
  assert_contains ~msg:"Library name should use lowercase namespace"
    dune_content "ocgtk.gdkpixbuf.generated";
  assert_contains ~msg:"Library name should use lowercase namespace"
    dune_content "ocgtk.graphene.generated"

let tests =
  [
    Alcotest.test_case
      "Dune file includes library dependency for single namespace (Stage 7)"
      `Quick test_dune_includes_single_library_dependency;
    Alcotest.test_case
      "Dune file includes library dependencies for multiple namespaces (Stage \
       7)"
      `Quick test_dune_includes_multiple_library_dependencies;
    Alcotest.test_case "No library deps when no dependencies (Stage 7)" `Quick
      test_no_library_deps_when_no_dependencies;
    Alcotest.test_case "Library deps are in libraries section (Stage 7)" `Quick
      test_library_deps_in_libraries_section;
    Alcotest.test_case "Library name format is correct (Stage 7)" `Quick
      test_library_name_format;
  ]
