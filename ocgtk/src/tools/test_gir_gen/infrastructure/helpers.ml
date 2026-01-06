(* Shared test helpers for GIR generator test suite *)

open Printf

(* ========================================================================= *)
(* Alcotest Assertion Helpers *)
(* ========================================================================= *)

let string_contains s sub =
  try
    ignore (Str.search_forward (Str.regexp_string sub) s 0);
    true
  with Not_found -> false

let assert_true msg cond = Alcotest.(check bool) msg true cond

let assert_contains msg haystack needle =
  if not (string_contains haystack needle) then
    Alcotest.fail (sprintf "%s: expected to find '%s' in output" msg needle)

let assert_not_contains msg haystack needle =
  if string_contains haystack needle then
    Alcotest.fail (sprintf "%s: expected NOT to find '%s' in output" msg needle)

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
let wrap_namespace ?(namespace_name = "Gtk") ?(version = "1.0")
    ?(shared_library = "libgtk-4.so.1") ?(c_prefix = "Gtk")
    ?(symbol_prefix = "gtk") content =
  sprintf
    {|<?xml version="1.0"?>
<repository version="1.2"
            xmlns="http://www.gtk.org/introspection/core/1.0"
            xmlns:c="http://www.gtk.org/introspection/c/1.0"
            xmlns:glib="http://www.gtk.org/introspection/glib/1.0">
  <namespace name="%s" version="%s" shared-library="%s" c:identifier-prefixes="%s" c:symbol-prefixes="%s">
%s
  </namespace>
</repository>
|}
    namespace_name version shared_library c_prefix symbol_prefix content

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

(* Command execution result with captured output *)
type command_result = {
  exit_code : int;
  stdout : string;
  stderr : string;
  log_file : string option;
}

(* Execute command with captured stdout/stderr *)
let run_command_with_output ?(log_dir = None) cmd =
  let tmp_stdout = Filename.temp_file "test_stdout_" ".txt" in
  let tmp_stderr = Filename.temp_file "test_stderr_" ".txt" in

  (* Redirect stdout and stderr to temp files *)
  let cmd_with_redirect = sprintf "%s > %s 2> %s" cmd tmp_stdout tmp_stderr in

  let exit_code = Sys.command cmd_with_redirect in
  let stdout = read_file tmp_stdout in
  let stderr = read_file tmp_stderr in

  (* Optionally save to permanent log file *)
  let log_file =
    match log_dir with
    | Some dir ->
        (* Ensure log directory exists *)
        (try Unix.mkdir dir 0o755 with Unix.Unix_error _ -> ());
        let timestamp = string_of_float (Unix.time ()) in
        let prefix = sprintf "test_%s_" timestamp in
        let log_path = Filename.temp_file ~temp_dir:dir prefix ".log" in
        let oc = open_out log_path in
        fprintf oc "Command: %s\n\n" cmd;
        fprintf oc "Exit code: %d\n\n" exit_code;
        fprintf oc "=== STDOUT ===\n%s\n\n" stdout;
        fprintf oc "=== STDERR ===\n%s\n" stderr;
        close_out oc;
        Some log_path
    | None -> None
  in

  (* Clean up temp files *)
  Unix.unlink tmp_stdout;
  Unix.unlink tmp_stderr;

  { exit_code; stdout; stderr; log_file }

let run_gir_gen ?filter_file gir_file output_dir =
  let tools_dir = get_tools_dir () in
  let filter_arg =
    match filter_file with Some f -> sprintf "-f %s " f | None -> ""
  in
  let cmd =
    sprintf "%s/gir_gen/main.exe %s%s %s" tools_dir filter_arg gir_file
      output_dir
  in
  let result =
    run_command_with_output ~log_dir:(Some "/tmp/gir_gen_test_logs") cmd
  in

  if result.exit_code <> 0 then begin
    (* Show preview of stderr (first 20 lines) in test output *)
    let stderr_lines = String.split_on_char '\n' result.stderr in
    let preview_lines =
      let rec take n lst =
        match (n, lst) with
        | 0, _ | _, [] -> []
        | n, x :: xs -> x :: take (n - 1) xs
      in
      take 20 stderr_lines
    in
    let error_preview = String.concat "\n" preview_lines in
    let log_info =
      match result.log_file with
      | Some path -> sprintf "\n\nFull log saved to: %s" path
      | None -> ""
    in
    Alcotest.fail
      (sprintf "gir_gen command failed (exit code %d)\n\nStderr preview:\n%s%s"
         result.exit_code error_preview log_info)
  end;

  result.exit_code

let ensure_output_dir dir =
  try Unix.mkdir dir 0o755 with Unix.Unix_error _ -> ()

(* ========================================================================= *)
(* Test Context Creation *)
(* ========================================================================= *)

(* Create a minimal generation context for testing C stub generation *)
let create_test_context () =
  let open Gir_gen_lib.Types in
  let namespace =
    {
      namespace_name = "Gtk";
      namespace_version = "4.0";
      namespace_shared_library = "libgtk-4.so.1";
      namespace_c_identifier_prefixes = "Gtk";
      namespace_c_symbol_prefixes = "gtk";
    }
  in

  let repository =
    {
      repository_c_includes = [];
      repository_includes = [];
      repository_packages = [];
    }
  in

  (* Add Widget class to context so type mappings work *)
  let widget_class =
    {
      class_name = "Widget";
      c_type = "GtkWidget";
      parent = None;
      implements = [];
      constructors = [];
      methods = [];
      properties = [];
      signals = [];
      class_doc = None;
    }
  in

  (* Add TextDirection enum to context *)
  let text_direction_enum =
    {
      enum_name = "TextDirection";
      enum_c_type = "GtkTextDirection";
      members = [];
      enum_doc = None;
      functions = [];
    }
  in

  {
    namespace;
    repository;
    classes = [ widget_class ];
    interfaces = [];
    enums = [ text_direction_enum ];
    bitfields = [];
    records = [];
    external_enums = [];
    external_bitfields = [];
    hierarchy_map = Hashtbl.create 0;
    module_groups = Hashtbl.create 0;
    current_cycle_classes = [];
  }

(* Create a test context with hierarchy detection configured *)
let create_test_context_with_hierarchy () =
  let open Gir_gen_lib.Types in
  let ctx = create_test_context () in

  (* Add Widget hierarchy info *)
  Hashtbl.add ctx.hierarchy_map "Widget"
    {
      gir_root = "Widget";
      hierarchy = WidgetHierarchy;
      layer2_module = "GWidget";
      class_type_name = "widget_skel";
      accessor_method = "as_widget";
      layer1_base_type = "Widget.t";
      base_conversion_method = "Widget.as_widget";
    };

  (* Add Button hierarchy info (inherits from Widget) *)
  Hashtbl.add ctx.hierarchy_map "Button"
    {
      gir_root = "Widget";
      hierarchy = WidgetHierarchy;
      layer2_module = "GWidget";
      class_type_name = "widget_skel";
      accessor_method = "as_widget";
      layer1_base_type = "Widget.t";
      base_conversion_method = "Widget.as_widget";
    };

  (* Add Entry hierarchy info (deep hierarchy) *)
  Hashtbl.add ctx.hierarchy_map "Entry"
    {
      gir_root = "Widget";
      hierarchy = WidgetHierarchy;
      layer2_module = "GWidget";
      class_type_name = "widget_skel";
      accessor_method = "as_widget";
      layer1_base_type = "Widget.t";
      base_conversion_method = "Widget.as_widget";
    };

  (* Add intermediate classes in Entry hierarchy *)
  Hashtbl.add ctx.hierarchy_map "InitiallyUnowned"
    {
      gir_root = "Object";
      hierarchy = WidgetHierarchy;
      layer2_module = "GObject";
      class_type_name = "object_skel";
      accessor_method = "as_object";
      layer1_base_type = "Object.t";
      base_conversion_method = "Object.as_object";
    };

  Hashtbl.add ctx.hierarchy_map "Object"
    {
      gir_root = "Object";
      hierarchy = WidgetHierarchy;
      layer2_module = "GObject";
      class_type_name = "object_skel";
      accessor_method = "as_object";
      layer1_base_type = "Object.t";
      base_conversion_method = "Object.as_object";
    };

  ctx

(* ========================================================================= *)
(* C Code Inspection Helpers *)
(* ========================================================================= *)

(* Log generated C code to test output for debugging *)
let log_generated_c_code test_name c_code =
  Printf.printf "\n========================================\n";
  Printf.printf "Generated C Code for: %s\n" test_name;
  Printf.printf "========================================\n";
  Printf.printf "%s\n" c_code;
  Printf.printf "========================================\n\n"
