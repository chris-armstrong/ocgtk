(* Tests for Phase 2: from_gobject C stub generation.
 *
 * Verifies:
 *   1. Utility functions gtype_macro_of_type_name and cast_macro_of_type_name
 *      in Gir_gen_lib.Utils.
 *   2. Real GIR file content: GtkEditable glib_type_name maps to GTK_TYPE_EDITABLE.
 *   3. Generated C file content: gir_gen.exe emits the from_gobject function
 *      for interfaces that have glib:type-name, and omits it when absent.
 *)

open Printf

(* ========================================================================= *)
(* Helpers *)
(* ========================================================================= *)

let contains haystack needle =
  let hn = String.length needle in
  let hlen = String.length haystack in
  if hn = 0 then true
  else
    let rec loop i =
      if i + hn > hlen then false
      else if String.sub haystack i hn = needle then true
      else loop (i + 1)
    in
    loop 0

let assert_contains ~label ~expected actual =
  if not (contains actual expected) then
    Alcotest.failf "%s: expected substring %S in:\n%s" label expected actual

let assert_not_contains ~label ~unexpected actual =
  if contains actual unexpected then
    Alcotest.failf "%s: unexpected substring %S found in:\n%s" label unexpected actual

let read_file path =
  let ic = open_in path in
  let len = in_channel_length ic in
  let buf = Bytes.create len in
  really_input ic buf 0 len;
  close_in ic;
  Bytes.to_string buf

let write_temp_file ~suffix content =
  let tmp = Filename.temp_file "test_from_gobject" suffix in
  let oc = open_out tmp in
  output_string oc content;
  close_out oc;
  tmp

(** Wrap namespace content in a minimal GIR repository envelope. *)
let make_gir_xml ?(namespace_name = "Gtk") ?(version = "4.0")
    ?(shared_library = "libgtk-4.so.1") ?(c_prefix = "Gtk")
    ?(symbol_prefix = "gtk") body =
  sprintf
    {|<?xml version="1.0"?>
<repository version="1.2"
  xmlns="http://www.gtk.org/introspection/core/1.0"
  xmlns:c="http://www.gtk.org/introspection/c/1.0"
  xmlns:glib="http://www.gtk.org/introspection/glib/1.0">
  <namespace name="%s" version="%s"
             shared-library="%s"
             c:identifier-prefixes="%s"
             c:symbol-prefixes="%s">
    %s
  </namespace>
</repository>|}
    namespace_name version shared_library c_prefix symbol_prefix body

let get_tools_dir () =
  let test_dir = Filename.dirname Sys.argv.(0) in
  if test_dir = "." then
    Filename.dirname (Sys.getcwd ())
  else
    Filename.dirname test_dir

(** Run gir_gen.exe generate on a GIR file, writing output to a temp dir.
    Returns the path of the generated C stub for the given snake_case entity name. *)
let run_gir_gen_and_get_c_file gir_content entity_snake =
  let gir_file = write_temp_file ~suffix:".gir" gir_content in
  let output_dir = Filename.temp_file "test_from_gobject_out" "" in
  (* Replace temp file with temp dir *)
  Sys.remove output_dir;
  Unix.mkdir output_dir 0o755;
  let generated_dir = Filename.concat output_dir "generated" in

  let tools_dir = get_tools_dir () in
  let gir_gen = sprintf "%s/gir_gen/gir_gen.exe" tools_dir in
  let tmp_stdout = Filename.temp_file "gir_gen_stdout" ".txt" in
  let tmp_stderr = Filename.temp_file "gir_gen_stderr" ".txt" in
  let cmd =
    sprintf "%s generate %s %s > %s 2> %s"
      gir_gen gir_file output_dir tmp_stdout tmp_stderr
  in
  let exit_code = Sys.command cmd in
  let stderr_content = read_file tmp_stderr in
  Sys.remove tmp_stdout;
  Sys.remove tmp_stderr;
  Sys.remove gir_file;

  if exit_code <> 0 then begin
    (* Clean up before failing *)
    (try
       let files = Sys.readdir generated_dir in
       Array.iter (fun f -> Sys.remove (Filename.concat generated_dir f)) files;
       Unix.rmdir generated_dir
     with _ -> ());
    (try Unix.rmdir output_dir with _ -> ());
    Alcotest.failf "gir_gen.exe failed (exit %d):\n%s" exit_code stderr_content
  end;

  let c_file =
    Filename.concat generated_dir (sprintf "ml_%s_gen.c" entity_snake)
  in
  let content =
    if Sys.file_exists c_file then
      read_file c_file
    else
      Alcotest.failf "Expected C file not found: %s" c_file
  in

  (* Cleanup *)
  (try
     let files = Sys.readdir generated_dir in
     Array.iter (fun f -> Sys.remove (Filename.concat generated_dir f)) files;
     Unix.rmdir generated_dir
   with _ -> ());
  (try
     let files = Sys.readdir output_dir in
     Array.iter (fun f -> Sys.remove (Filename.concat output_dir f)) files;
     Unix.rmdir output_dir
   with _ -> ());

  content

(* ========================================================================= *)
(* 1. Utility function tests *)
(* ========================================================================= *)

let test_gtype_macro_gtk_editable () =
  Alcotest.(check string) "GtkEditable → GTK_TYPE_EDITABLE"
    "GTK_TYPE_EDITABLE"
    (Gir_gen_lib.Utils.gtype_macro_of_type_name "GtkEditable")

let test_gtype_macro_gtk_selection_model () =
  Alcotest.(check string) "GtkSelectionModel → GTK_TYPE_SELECTION_MODEL"
    "GTK_TYPE_SELECTION_MODEL"
    (Gir_gen_lib.Utils.gtype_macro_of_type_name "GtkSelectionModel")

let test_gtype_macro_gdk_paintable () =
  Alcotest.(check string) "GdkPaintable → GDK_TYPE_PAINTABLE"
    "GDK_TYPE_PAINTABLE"
    (Gir_gen_lib.Utils.gtype_macro_of_type_name "GdkPaintable")

let test_gtype_macro_gtk_orientable () =
  Alcotest.(check string) "GtkOrientable → GTK_TYPE_ORIENTABLE"
    "GTK_TYPE_ORIENTABLE"
    (Gir_gen_lib.Utils.gtype_macro_of_type_name "GtkOrientable")

let test_cast_macro_gtk_editable () =
  Alcotest.(check string) "GtkEditable → GTK_EDITABLE"
    "GTK_EDITABLE"
    (Gir_gen_lib.Utils.cast_macro_of_type_name "GtkEditable")

let test_cast_macro_gtk_selection_model () =
  Alcotest.(check string) "GtkSelectionModel → GTK_SELECTION_MODEL"
    "GTK_SELECTION_MODEL"
    (Gir_gen_lib.Utils.cast_macro_of_type_name "GtkSelectionModel")

let test_cast_macro_gdk_paintable () =
  Alcotest.(check string) "GdkPaintable → GDK_PAINTABLE"
    "GDK_PAINTABLE"
    (Gir_gen_lib.Utils.cast_macro_of_type_name "GdkPaintable")

let test_cast_macro_gtk_orientable () =
  Alcotest.(check string) "GtkOrientable → GTK_ORIENTABLE"
    "GTK_ORIENTABLE"
    (Gir_gen_lib.Utils.cast_macro_of_type_name "GtkOrientable")

(* ========================================================================= *)
(* 2. Real GIR file: GtkEditable glib_type_name round-trips through utility  *)
(* ========================================================================= *)

let real_gir_file = "/usr/share/gir-1.0/Gtk-4.0.gir"

let test_editable_gtype_macro_from_real_gir () =
  let _repo, _ns, _classes, interfaces, _enums, _bitfields, _records =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file real_gir_file []
  in
  let editable =
    match
      List.find_opt
        (fun (i : Gir_gen_lib.Types.gir_interface) ->
          String.equal i.interface_name "Editable")
        interfaces
    with
    | None -> Alcotest.fail "Editable not found in parsed interfaces"
    | Some i -> i
  in
  let type_name =
    match editable.glib_type_name with
    | None -> Alcotest.fail "GtkEditable has no glib_type_name"
    | Some n -> n
  in
  let result = Gir_gen_lib.Utils.gtype_macro_of_type_name type_name in
  Alcotest.(check string) "GtkEditable → GTK_TYPE_EDITABLE" "GTK_TYPE_EDITABLE" result

(* ========================================================================= *)
(* 3. Generated file content tests (via gir_gen.exe)                         *)
(* ========================================================================= *)

(* Synthetic GIR with one interface that HAS glib:type-name *)
let gir_with_type_name =
  make_gir_xml
    {|<interface name="MyIface"
               c:type="GtkMyIface"
               glib:type-name="GtkMyIface"
               glib:get-type="gtk_my_iface_get_type">
    </interface>|}

(* Synthetic GIR with one interface that has NO glib:type-name *)
let gir_without_type_name =
  make_gir_xml
    {|<interface name="MyIface"
               c:type="GtkMyIface">
    </interface>|}

let test_from_gobject_present_when_type_name_set () =
  let content = run_gir_gen_and_get_c_file gir_with_type_name "my_iface" in
  assert_contains ~label:"function name"
    ~expected:"ml_gtk_my_iface_from_gobject" content;
  assert_contains ~label:"g_type_is_a call"
    ~expected:"g_type_is_a" content;
  assert_contains ~label:"gtype macro"
    ~expected:"GTK_TYPE_MY_IFACE" content;
  assert_contains ~label:"caml_failwith"
    ~expected:"caml_failwith" content

let test_from_gobject_absent_when_no_type_name () =
  let content = run_gir_gen_and_get_c_file gir_without_type_name "my_iface" in
  assert_not_contains ~label:"no from_gobject function"
    ~unexpected:"from_gobject" content;
  assert_not_contains ~label:"no g_type_is_a"
    ~unexpected:"g_type_is_a" content

(* Synthetic GIR with a versioned interface (version="4.12") *)
let gir_versioned_interface =
  make_gir_xml
    {|<interface name="MyIface"
               c:type="GtkMyIface"
               glib:type-name="GtkMyIface"
               glib:get-type="gtk_my_iface_get_type"
               version="4.12">
    </interface>|}

let test_from_gobject_inside_version_guard () =
  let content = run_gir_gen_and_get_c_file gir_versioned_interface "my_iface" in
  assert_contains ~label:"version guard present"
    ~expected:"GTK_CHECK_VERSION(4,12,0)" content;
  assert_contains ~label:"from_gobject function present"
    ~expected:"ml_gtk_my_iface_from_gobject" content;
  (* Verify ordering: GTK_CHECK_VERSION must appear before the from_gobject function *)
  let guard_pos =
    let needle = "GTK_CHECK_VERSION(4,12,0)" in
    let hn = String.length needle in
    let hlen = String.length content in
    let rec loop i =
      if i + hn > hlen then -1
      else if String.sub content i hn = needle then i
      else loop (i + 1)
    in
    loop 0
  in
  let fn_pos =
    let needle = "ml_gtk_my_iface_from_gobject" in
    let hn = String.length needle in
    let hlen = String.length content in
    let rec loop i =
      if i + hn > hlen then -1
      else if String.sub content i hn = needle then i
      else loop (i + 1)
    in
    loop 0
  in
  if guard_pos < 0 then
    Alcotest.fail "GTK_CHECK_VERSION(4,12,0) not found in output";
  if fn_pos < 0 then
    Alcotest.fail "ml_gtk_my_iface_from_gobject not found in output";
  if not (guard_pos < fn_pos) then
    Alcotest.failf
      "Expected GTK_CHECK_VERSION (pos %d) before ml_gtk_my_iface_from_gobject (pos %d)"
      guard_pos fn_pos

(* ========================================================================= *)
(* Test suite *)
(* ========================================================================= *)

let test_suite =
  [
    (* Utility: gtype_macro_of_type_name *)
    ( "gtype_macro: GtkEditable → GTK_TYPE_EDITABLE",
      `Quick,
      test_gtype_macro_gtk_editable );
    ( "gtype_macro: GtkSelectionModel → GTK_TYPE_SELECTION_MODEL",
      `Quick,
      test_gtype_macro_gtk_selection_model );
    ( "gtype_macro: GdkPaintable → GDK_TYPE_PAINTABLE",
      `Quick,
      test_gtype_macro_gdk_paintable );
    ( "gtype_macro: GtkOrientable → GTK_TYPE_ORIENTABLE",
      `Quick,
      test_gtype_macro_gtk_orientable );
    (* Utility: cast_macro_of_type_name *)
    ( "cast_macro: GtkEditable → GTK_EDITABLE",
      `Quick,
      test_cast_macro_gtk_editable );
    ( "cast_macro: GtkSelectionModel → GTK_SELECTION_MODEL",
      `Quick,
      test_cast_macro_gtk_selection_model );
    ( "cast_macro: GdkPaintable → GDK_PAINTABLE",
      `Quick,
      test_cast_macro_gdk_paintable );
    ( "cast_macro: GtkOrientable → GTK_ORIENTABLE",
      `Quick,
      test_cast_macro_gtk_orientable );
    (* Real GIR *)
    ( "real GIR: GtkEditable glib_type_name → GTK_TYPE_EDITABLE",
      `Slow,
      test_editable_gtype_macro_from_real_gir );
    (* Generated file content *)
    ( "generated: from_gobject present when glib:type-name set",
      `Quick,
      test_from_gobject_present_when_type_name_set );
    ( "generated: from_gobject absent when no glib:type-name",
      `Quick,
      test_from_gobject_absent_when_no_type_name );
    ( "generated: versioned interface wraps from_gobject in GTK_CHECK_VERSION guard",
      `Quick,
      test_from_gobject_inside_version_guard );
  ]
