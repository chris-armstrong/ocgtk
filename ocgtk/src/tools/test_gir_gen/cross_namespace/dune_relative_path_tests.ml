(* Cross-namespace tests - Stage 6: Dune Relative Path Tests

   Tests that the include paths in generated dune files use the correct
   relative path format: ../../<dep>/generated

   Note: These tests validate the path format produced by the
   include_path_of_namespace helper function.
*)

open Printf

(* Helper: Check if string contains substring *)
let string_contains haystack needle =
  try
    ignore (Str.search_forward (Str.regexp_string needle) haystack 0);
    true
  with Not_found -> false

(* Stage 6 Test: include_path_of_namespace produces correct format.
   The helper function should map 'Gdk' -> '-I../../gdk/generated'. *)
let test_include_path_format () =
  let path = Gir_gen_lib.Generate.Dune_file.include_path_of_namespace "Gdk" in
  Alcotest.(check string)
    "Include path should be -I../../gdk/generated" "-I../../gdk/generated" path

(* Stage 6 Test: include_path_of_namespace handles lowercase conversion.
   The namespace name should be lowercased in the path. *)
let test_include_path_lowercase () =
  let path = Gir_gen_lib.Generate.Dune_file.include_path_of_namespace "GDK" in
  Alcotest.(check string)
    "Namespace should be lowercased" "-I../../gdk/generated" path;

  let path2 = Gir_gen_lib.Generate.Dune_file.include_path_of_namespace "Gtk" in
  Alcotest.(check string) "Gtk should become gtk" "-I../../gtk/generated" path2

(* Stage 6 Test: include_path_of_namespace handles various namespaces.
   Verify correct path generation for common GTK-related namespaces. *)
let test_include_path_various_namespaces () =
  let test_cases =
    [
      ("Gtk", "-I../../gtk/generated");
      ("Gdk", "-I../../gdk/generated");
      ("Gio", "-I../../gio/generated");
      ("Gsk", "-I../../gsk/generated");
      ("Pango", "-I../../pango/generated");
      ("Graphene", "-I../../graphene/generated");
    ]
  in

  List.iter
    (fun (ns, expected) ->
      let actual =
        Gir_gen_lib.Generate.Dune_file.include_path_of_namespace ns
      in
      Alcotest.(check string)
        (sprintf "Namespace %s should produce %s" ns expected)
        expected actual)
    test_cases

(* Stage 6 Test: Relative path goes up two directories.
   From src/<ns>/generated/ to src/<dep>/generated/ requires ../../<dep>/generated. *)
let test_relative_path_depth () =
  (* The path should start with -I../../ not -I../ or -I../../../ *)
  let path = Gir_gen_lib.Generate.Dune_file.include_path_of_namespace "Gdk" in

  (* Verify it starts with -I../../ *)
  if not (String.starts_with ~prefix:"-I../../" path) then
    Alcotest.fail "Include path should start with -I../../";

  (* Verify it does NOT have three levels up (../../../) *)
  if string_contains path "../../../" then
    Alcotest.fail "Include path should not have three levels up";

  (* Verify it does NOT have only one level up (../) *)
  let after_prefix = String.sub path 7 (String.length path - 7) in
  (* After -I../../ we should have gdk/generated, not start with ../ *)
  if String.starts_with ~prefix:"../" after_prefix then
    Alcotest.fail "Include path should not have relative path going further up"

(* Stage 6 Test: Path ends with /generated.
   The include path should always end with /generated. *)
let test_path_ends_with_generated () =
  let path = Gir_gen_lib.Generate.Dune_file.include_path_of_namespace "Gdk" in

  if not (String.ends_with ~suffix:"/generated" path) then
    Alcotest.fail "Include path should end with /generated";

  (* Verify the complete expected format *)
  Alcotest.(check string) "Complete path format" "-I../../gdk/generated" path

(* Stage 6 Test: library_name_of_namespace produces correct format.
   The helper function should map 'Gdk' -> 'ocgtk.gdk.generated'. *)
let test_library_name_format () =
  let lib_name =
    Gir_gen_lib.Generate.Dune_file.library_name_of_namespace "Gdk"
  in
  Alcotest.(check string)
    "Library name should be ocgtk.gdk.generated" "ocgtk.gdk.generated" lib_name

(* Stage 6 Test: library_name_of_namespace handles lowercase conversion.
   The namespace name should be lowercased in the library name. *)
let test_library_name_lowercase () =
  let lib_name =
    Gir_gen_lib.Generate.Dune_file.library_name_of_namespace "GDK"
  in
  Alcotest.(check string)
    "Namespace should be lowercased" "ocgtk.gdk.generated" lib_name

let tests =
  [
    Alcotest.test_case
      "include_path_of_namespace produces correct format (Stage 6)" `Quick
      test_include_path_format;
    Alcotest.test_case
      "include_path_of_namespace handles lowercase conversion (Stage 6)" `Quick
      test_include_path_lowercase;
    Alcotest.test_case
      "include_path_of_namespace handles various namespaces (Stage 6)" `Quick
      test_include_path_various_namespaces;
    Alcotest.test_case "Relative path goes up two directories (Stage 6)" `Quick
      test_relative_path_depth;
    Alcotest.test_case "Path ends with /generated (Stage 6)" `Quick
      test_path_ends_with_generated;
    Alcotest.test_case
      "library_name_of_namespace produces correct format (Stage 6)" `Quick
      test_library_name_format;
    Alcotest.test_case "library_name_of_namespace handles lowercase (Stage 6)"
      `Quick test_library_name_lowercase;
  ]
