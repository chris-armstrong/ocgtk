(* Shared test helpers for GIR generator test suite *)

open Printf

(* ========================================================================= *)
(* Test Framework *)
(* ========================================================================= *)

let test_count = ref 0
let pass_count = ref 0
let fail_count = ref 0

let test name f =
  incr test_count;
  printf "Test %d: %s... " !test_count name;
  flush stdout;
  try
    f ();
    incr pass_count;
    printf "✓ PASS\n";
    true
  with
  | Failure msg ->
      incr fail_count;
      printf "✗ FAIL: %s\n" msg;
      false
  | e ->
      incr fail_count;
      printf "✗ ERROR: %s\n" (Printexc.to_string e);
      false

let assert_true msg cond = if not cond then failwith msg

let string_contains s sub =
  try
    ignore (Str.search_forward (Str.regexp_string sub) s 0);
    true
  with Not_found -> false

let assert_contains msg haystack needle =
  if not (string_contains haystack needle) then
    failwith (sprintf "%s: expected to find '%s' in output" msg needle)

let assert_not_contains msg haystack needle =
  if string_contains haystack needle then
    failwith (sprintf "%s: expected NOT to find '%s' in output" msg needle)

let print_summary () =
  printf "\n====================================\n";
  printf "Test Summary\n";
  printf "====================================\n";
  printf "Total:  %d tests\n" !test_count;
  printf "Passed: %d tests\n" !pass_count;
  printf "Failed: %d tests\n" !fail_count;

  if !fail_count = 0 then begin
    printf "\n✓ All tests passed!\n";
    0
  end
  else begin
    printf "\n✗ Some tests failed\n";
    1
  end

(* ========================================================================= *)
(* File Utilities *)
(* ========================================================================= *)

let file_exists path =
  try
    let _ = Unix.stat path in
    true
  with Unix.Unix_error _ -> false

let delete_if_exists path = try Unix.unlink path with Unix.Unix_error _ -> ()

let read_file filename =
  let ic = open_in filename in
  let len = in_channel_length ic in
  let buf = Bytes.create len in
  really_input ic buf 0 len;
  close_in ic;
  Bytes.to_string buf

let generated_dir output_dir = Filename.concat output_dir "generated"

let stub_c_file output_dir class_name =
  Filename.concat (generated_dir output_dir)
    (Printf.sprintf "ml_%s_gen.c" (Gir_gen_lib.Utils.to_snake_case class_name))

let g_wrapper_file output_dir class_name =
  Filename.concat (generated_dir output_dir)
    (Printf.sprintf "g%s.ml"
       (Gir_gen_lib.Utils.module_name_of_class class_name))

let ml_file output_dir module_name =
  Filename.concat (generated_dir output_dir) (module_name ^ ".ml")

let mli_file output_dir module_name =
  Filename.concat (generated_dir output_dir) (module_name ^ ".mli")

let enum_file output_dir =
  Filename.concat (generated_dir output_dir) "gtk_enums.mli"

let enum_c_file output_dir =
  Filename.concat (generated_dir output_dir) "ml_gtk_enums_gen.c"

(* ========================================================================= *)
(* GIR XML Generation *)
(* ========================================================================= *)

(* Wrap namespace content in standard GIR repository/namespace XML boilerplate *)
let wrap_namespace ?(namespace_name="Gtk") ?(version="1.0")
                   ?(shared_library="libgtk-4.so.1")
                   ?(c_prefix="Gtk") ?(symbol_prefix="gtk")
                   content =
  sprintf {|<?xml version="1.0"?>
<repository version="1.2"
            xmlns="http://www.gtk.org/introspection/core/1.0"
            xmlns:c="http://www.gtk.org/introspection/c/1.0"
            xmlns:glib="http://www.gtk.org/introspection/glib/1.0">
  <namespace name="%s" version="%s" shared-library="%s" c:identifier-prefixes="%s" c:symbol-prefixes="%s">
%s
  </namespace>
</repository>
|} namespace_name version shared_library c_prefix symbol_prefix content

(* Create a GIR file from content (will be wrapped with repository/namespace) *)
let create_gir_file filename content =
  let oc = open_out filename in
  output_string oc content;
  close_out oc

(* Create a filter file with class names *)
let create_filter_file filename class_names =
  let oc = open_out filename in
  output_string oc "# Test filter\n";
  List.iter (fun name -> output_string oc (name ^ "\n")) class_names;
  close_out oc

(* ========================================================================= *)
(* Test Execution Helpers *)
(* ========================================================================= *)

let get_tools_dir () =
  (* When run with 'dune runtest', argv[0] might just be the basename.
     In that case, use the current working directory to find the tools dir. *)
  let test_dir = Filename.dirname Sys.argv.(0) in

  (* If argv[0] is just a basename (dirname is "."), use cwd instead *)
  if test_dir = "." then
    (* We're in _build/default/src/tools/test_gir_gen, go up one level *)
    let cwd = Sys.getcwd () in
    Filename.dirname cwd
  else
    (* We have a full path, go up one level from the test directory *)
    Filename.dirname test_dir

let run_gir_gen ?filter_file gir_file output_dir =
  let tools_dir = get_tools_dir () in
  let filter_arg = match filter_file with
    | Some f -> sprintf "-f %s " f
    | None -> ""
  in
  let cmd =
    sprintf "%s/gir_gen/main.exe %s%s %s > /dev/null 2>&1"
      tools_dir filter_arg gir_file output_dir
  in
  Sys.command cmd

let ensure_output_dir dir =
  try Unix.mkdir dir 0o755 with Unix.Unix_error _ -> ()
