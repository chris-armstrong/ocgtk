(* Cross-namespace tests - Stage 6: Dune File Include Paths

   Tests that generated dune files contain correct -I flags for dependency
   namespaces. This allows the C compiler to find dependency headers during
   compilation.

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

(* Stage 6 Test: Dune file includes -I flag for dependency namespace.
   When generating for Gtk with Gdk as a dependency,
   the dune file should contain -I../../gdk/generated. *)
let test_dune_includes_dependency_include_path () =
  (* Generate dune file with Gdk as a dependency *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gtk"
      ~stub_names:[ "ml_button_gen"; "ml_window_gen" ]
      ~module_names:[ "Button"; "Window" ] ~package_names:[ "gtk4" ]
      ~dependency_namespaces:[ "Gdk" ] ()
  in

  (* Verify the include path for Gdk is present *)
  assert_contains ~msg:"Dune file should include Gdk dependency path"
    dune_content "-I../../gdk/generated"

(* Stage 6 Test: Dune file includes -I flags for multiple dependencies.
   When generating for Gtk with Gdk and Gio as dependencies,
   the dune file should contain both include paths. *)
let test_dune_includes_multiple_dependency_paths () =
  (* Generate dune file with multiple dependencies *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gtk"
      ~stub_names:[ "ml_button_gen" ] ~module_names:[ "Button" ]
      ~package_names:[ "gtk4" ] ~dependency_namespaces:[ "Gdk"; "Gio" ] ()
  in

  (* Verify both include paths are present *)
  assert_contains ~msg:"Dune file should include Gdk path" dune_content
    "-I../../gdk/generated";
  assert_contains ~msg:"Dune file should include Gio path" dune_content
    "-I../../gio/generated"

(* Stage 6 Test: No -I flags when there are no dependencies.
   When generating for a namespace with no dependencies,
   no dependency include paths should be added. *)
let test_no_include_paths_when_no_dependencies () =
  (* Generate dune file with no dependencies *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gdk"
      ~stub_names:[ "ml_surface_gen" ] ~module_names:[ "Surface" ]
      ~package_names:[ "gdk-4.0" ] ~dependency_namespaces:[] ()
  in

  (* Verify no dependency include paths are present *)
  assert_not_contains ~msg:"Dune file should not have dependency paths"
    dune_content "-I../../"

(* Stage 6 Test: Dependency paths are in flags section.
   The include paths should appear within the (flags ...) stanza. *)
let test_include_paths_in_flags_section () =
  (* Generate dune file with dependencies *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gsk"
      ~stub_names:[ "ml_renderer_gen" ] ~module_names:[ "Renderer" ]
      ~package_names:[ "gsk-4.0" ] ~dependency_namespaces:[ "Gdk"; "Gio" ] ()
  in

  (* Find the flags line and verify it contains the include paths *)
  assert_contains ~msg:"Flags section should contain Gdk path" dune_content
    "-I../../gdk/generated";

  (* Verify the include paths are on the same line as other flags *)
  let lines = String.split_on_char '\n' dune_content in
  let flags_line =
    List.find_opt
      (fun line ->
        string_contains line "(flags" && string_contains line "-fPIC")
      lines
  in
  match flags_line with
  | None -> Alcotest.fail "Could not find flags line in dune file"
  | Some line ->
      (* Verify the include path is part of the flags line *)
      if not (string_contains line "-I../../gdk/generated") then
        Alcotest.fail "Include path should be in the flags line"

(* Stage 6 Test: Include paths preserve dependency order.
   The include paths should appear in the same order as the dependency list. *)
let test_include_paths_preserve_order () =
  (* Generate dune file with dependencies in specific order *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gtk"
      ~stub_names:[ "ml_button_gen" ] ~module_names:[ "Button" ]
      ~package_names:[ "gtk4" ] ~dependency_namespaces:[ "Gsk"; "Gdk"; "Gio" ]
      ()
  in

  (* Find positions of include paths in the output *)
  let gsk_pos =
    try
      Str.search_forward
        (Str.regexp_string "-I../../gsk/generated")
        dune_content 0
    with Not_found -> Alcotest.fail "gsk include path not found"
  in
  let gdk_pos =
    try
      Str.search_forward
        (Str.regexp_string "-I../../gdk/generated")
        dune_content 0
    with Not_found -> Alcotest.fail "gdk include path not found"
  in
  let gio_pos =
    try
      Str.search_forward
        (Str.regexp_string "-I../../gio/generated")
        dune_content 0
    with Not_found -> Alcotest.fail "gio include path not found"
  in

  (* Verify order is preserved: Gsk < Gdk < Gio *)
  if not (gsk_pos < gdk_pos && gdk_pos < gio_pos) then
    Alcotest.fail
      "Include paths should preserve dependency order (Gsk < Gdk < Gio)"

let tests =
  [
    Alcotest.test_case
      "Dune file includes -I flag for dependency namespace (Stage 6)" `Quick
      test_dune_includes_dependency_include_path;
    Alcotest.test_case
      "Dune file includes -I flags for multiple dependencies (Stage 6)" `Quick
      test_dune_includes_multiple_dependency_paths;
    Alcotest.test_case "No -I flags when no dependencies (Stage 6)" `Quick
      test_no_include_paths_when_no_dependencies;
    Alcotest.test_case "Include paths are in flags section (Stage 6)" `Quick
      test_include_paths_in_flags_section;
    Alcotest.test_case "Include paths preserve dependency order (Stage 6)"
      `Quick test_include_paths_preserve_order;
  ]
