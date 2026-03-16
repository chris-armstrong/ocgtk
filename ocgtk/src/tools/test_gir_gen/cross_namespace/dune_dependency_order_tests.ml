(* Cross-namespace tests - Stage 7: Dune File Dependency Order

   Tests that library dependencies in generated dune files are listed
   in correct dependency order (dependencies before dependents).
   This ensures proper OCaml compilation order.

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

(* Helper: Find the position of a substring in a string *)
let find_position haystack needle =
  try Some (Str.search_forward (Str.regexp_string needle) haystack 0)
  with Not_found -> None

(* Helper: Assert that a string contains a substring, failing with a message if not *)
let assert_contains ~msg haystack needle =
  if not (string_contains haystack needle) then
    Alcotest.fail (sprintf "%s: expected to find '%s' in dune file" msg needle)

(* Stage 7 Test: Dependencies are listed before ocgtk_common.
   In the (libraries ...) clause, dependency libraries should appear
   before ocgtk_common since they are the dependencies and ocgtk_common
   is the common infrastructure. *)
let test_dependencies_listed_before_common () =
  (* Generate dune file with dependencies *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gtk"
      ~stub_names:[ "ml_button_gen" ] ~module_names:[ "Button" ]
      ~package_names:[ "gtk4" ] ~dependency_namespaces:[ "Gdk"; "Gio" ] ()
  in

  (* Find positions of dependency libraries and ocgtk_common *)
  let gdk_pos = find_position dune_content "ocgtk.gdk.generated" in
  let gio_pos = find_position dune_content "ocgtk.gio.generated" in
  let common_pos = find_position dune_content "ocgtk_common" in

  (* Verify all elements are found *)
  (match gdk_pos with
  | None -> Alcotest.fail "ocgtk.gdk.generated not found in dune file"
  | Some _ -> ());
  (match gio_pos with
  | None -> Alcotest.fail "ocgtk.gio.generated not found in dune file"
  | Some _ -> ());
  (match common_pos with
  | None -> Alcotest.fail "ocgtk_common not found in dune file"
  | Some _ -> ());

  (* Verify dependencies come before ocgtk_common *)
  match (gdk_pos, gio_pos, common_pos) with
  | Some gdk, Some gio, Some common ->
      if not (gdk < common && gio < common) then
        Alcotest.fail
          "Dependencies should be listed before ocgtk_common in libraries \
           clause"
  | _ ->
      (* This case is already handled above *)
      ()

(* Stage 7 Test: Multiple dependencies preserve input order.
   When multiple dependencies are provided, they should appear
   in the libraries clause in the same order. *)
let test_multiple_dependencies_preserve_order () =
  (* Generate dune file with dependencies in specific order *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gtk"
      ~stub_names:[ "ml_button_gen" ] ~module_names:[ "Button" ]
      ~package_names:[ "gtk4" ] ~dependency_namespaces:[ "Gsk"; "Gdk"; "Gio" ]
      ()
  in

  (* Find positions of each library *)
  let gsk_pos = find_position dune_content "ocgtk.gsk.generated" in
  let gdk_pos = find_position dune_content "ocgtk.gdk.generated" in
  let gio_pos = find_position dune_content "ocgtk.gio.generated" in

  (* Verify all libraries are found *)
  (match gsk_pos with
  | None -> Alcotest.fail "ocgtk.gsk.generated not found"
  | Some _ -> ());
  (match gdk_pos with
  | None -> Alcotest.fail "ocgtk.gdk.generated not found"
  | Some _ -> ());
  (match gio_pos with
  | None -> Alcotest.fail "ocgtk.gio.generated not found"
  | Some _ -> ());

  (* Verify order is preserved: Gsk < Gdk < Gio *)
  match (gsk_pos, gdk_pos, gio_pos) with
  | Some gsk, Some gdk, Some gio ->
      if not (gsk < gdk && gdk < gio) then
        Alcotest.fail
          "Dependencies should preserve input order (Gsk < Gdk < Gio)"
  | _ -> ()

(* Stage 7 Test: Single dependency comes before common.
   With a single dependency, it should be listed before ocgtk_common. *)
let test_single_dependency_before_common () =
  (* Generate dune file with single dependency *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gsk"
      ~stub_names:[ "ml_renderer_gen" ] ~module_names:[ "Renderer" ]
      ~package_names:[ "gsk-4.0" ] ~dependency_namespaces:[ "Gdk" ] ()
  in

  (* Find positions *)
  let gdk_pos = find_position dune_content "ocgtk.gdk.generated" in
  let common_pos = find_position dune_content "ocgtk_common" in

  (* Verify order: dependency before common *)
  match (gdk_pos, common_pos) with
  | Some gdk, Some common ->
      if not (gdk < common) then
        Alcotest.fail "Single dependency should be listed before ocgtk_common"
  | None, _ -> Alcotest.fail "ocgtk.gdk.generated not found"
  | _, None -> Alcotest.fail "ocgtk_common not found"

(* Stage 7 Test: GTK example with complete dependency chain.
   GTK depends on GSK which depends on GDK which depends on GIO.
   All should be listed in order before ocgtk_common. *)
let test_gtk_complete_dependency_chain () =
  (* Generate dune file for GTK with complete dependency chain *)
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~lib_name:"Gtk"
      ~stub_names:[ "ml_button_gen" ] ~module_names:[ "Button" ]
      ~package_names:[ "gtk4" ] ~dependency_namespaces:[ "Gsk"; "Gdk"; "Gio" ]
      ()
  in

  (* Find all library positions *)
  let gsk_pos = find_position dune_content "ocgtk.gsk.generated" in
  let gdk_pos = find_position dune_content "ocgtk.gdk.generated" in
  let gio_pos = find_position dune_content "ocgtk.gio.generated" in
  let common_pos = find_position dune_content "ocgtk_common" in

  (* Verify all are present *)
  assert_contains ~msg:"Should include ocgtk.gsk.generated" dune_content
    "ocgtk.gsk.generated";
  assert_contains ~msg:"Should include ocgtk.gdk.generated" dune_content
    "ocgtk.gdk.generated";
  assert_contains ~msg:"Should include ocgtk.gio.generated" dune_content
    "ocgtk.gio.generated";
  assert_contains ~msg:"Should include ocgtk_common" dune_content "ocgtk_common";

  (* Verify all dependencies come before ocgtk_common *)
  match (gsk_pos, gdk_pos, gio_pos, common_pos) with
  | Some gsk, Some gdk, Some gio, Some common ->
      if not (gsk < common && gdk < common && gio < common) then
        Alcotest.fail "All dependencies should be listed before ocgtk_common"
  | _ ->
      (* This shouldn't happen if assert_contains passed, but be safe *)
      Alcotest.fail "Could not find all expected libraries"

let tests =
  [
    Alcotest.test_case "Dependencies are listed before ocgtk_common (Stage 7)"
      `Quick test_dependencies_listed_before_common;
    Alcotest.test_case "Multiple dependencies preserve input order (Stage 7)"
      `Quick test_multiple_dependencies_preserve_order;
    Alcotest.test_case "Single dependency comes before common (Stage 7)" `Quick
      test_single_dependency_before_common;
    Alcotest.test_case "GTK complete dependency chain order (Stage 7)" `Quick
      test_gtk_complete_dependency_chain;
  ]
