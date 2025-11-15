(* Test suite for GIR code generator
 *
 * Tests the parsing and code generation functionality of gir_gen.ml
 *)

open Printf

(* ========================================================================= *)
(* Test Helpers *)
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

let assert_true msg cond =
  if not cond then failwith msg

let string_contains s sub =
  try
    ignore (Str.search_forward (Str.regexp_string sub) s 0);
    true
  with Not_found -> false

let assert_contains msg haystack needle =
  if not (string_contains haystack needle) then
    failwith (sprintf "%s: expected to find '%s' in output" msg needle)

let file_exists path =
  try
    let _ = Unix.stat path in
    true
  with Unix.Unix_error _ -> false

let read_file filename =
  let ic = open_in filename in
  let len = in_channel_length ic in
  let buf = Bytes.create len in
  really_input ic buf 0 len;
  close_in ic;
  Bytes.to_string buf

(* ========================================================================= *)
(* Create Test GIR File *)
(* ========================================================================= *)

let create_test_gir_file filename =
  let oc = open_out filename in
  output_string oc {|<?xml version="1.0"?>
<repository>
  <namespace name="Gtk">
    <class name="EventControllerKey"
           c:type="GtkEventControllerKey"
           parent="EventController">
      <constructor name="new" c:identifier="gtk_event_controller_key_new"/>
      <method name="forward" c:identifier="gtk_event_controller_key_forward">
        <return-value><type name="gboolean" c:type="gboolean"/></return-value>
        <parameters>
          <parameter name="widget"><type name="Widget" c:type="GtkWidget*"/></parameter>
        </parameters>
      </method>
      <method name="get_group" c:identifier="gtk_event_controller_key_get_group">
        <return-value><type name="guint" c:type="guint"/></return-value>
      </method>
    </class>
  </namespace>
</repository>
|};
  close_out oc

(* ========================================================================= *)
(* Test Cases *)
(* ========================================================================= *)

let test_gir_parsing () =
  let test_gir = "/tmp/test_gir_gen.gir" in
  let output_dir = "/tmp/test_gir_output" in

  create_test_gir_file test_gir;
  (try Unix.mkdir output_dir 0o755 with Unix.Unix_error _ -> ());

  let tools_dir = Filename.dirname Sys.argv.(0) in
  let cmd = sprintf "%s/gir_gen.exe %s %s 2>&1"
    tools_dir test_gir output_dir in

  let exit_code = Sys.command cmd in
  assert_true "Generator should exit successfully" (exit_code = 0);

  let c_file = Filename.concat output_dir "ml_event_controllers_gen.c" in
  assert_true "C file should be created" (file_exists c_file);

  let content = read_file c_file in
  assert_contains "C file should have header" content "GENERATED CODE";
  assert_contains "C file should have constructor" content "ml_gtk_event_controller_key_new"

let test_c_code_generation () =
  printf "Verifying generated C code structure\n";
  let test_gir = "/tmp/test_gir_gen.gir" in
  let output_dir = "/tmp/test_gir_output" in

  create_test_gir_file test_gir;
  (try Unix.mkdir output_dir 0o755 with Unix.Unix_error _ -> ());

  let tools_dir = Filename.dirname Sys.argv.(0) in
  let cmd = sprintf "%s/gir_gen.exe %s %s > /dev/null 2>&1"
    tools_dir test_gir output_dir in
  let _ = Sys.command cmd in

  let c_file = Filename.concat output_dir "ml_event_controllers_gen.c" in
  if file_exists c_file then begin
    let content = read_file c_file in
    assert_contains "Should use CAMLparam" content "CAMLparam";
    assert_contains "Should use CAMLreturn" content "CAMLreturn";
    assert_contains "Should define type converter macros" content
      "GtkEventController_val";
  end else
    failwith "C file not generated"

(* ========================================================================= *)
(* Main Test Runner *)
(* ========================================================================= *)

let () =
  printf "\n";
  printf "====================================\n";
  printf "GIR Generator Test Suite\n";
  printf "====================================\n\n";

  ignore (test "GIR file parsing" test_gir_parsing);
  ignore (test "C code generation" test_c_code_generation);

  printf "\n====================================\n";
  printf "Test Summary\n";
  printf "====================================\n";
  printf "Total:  %d tests\n" !test_count;
  printf "Passed: %d tests\n" !pass_count;
  printf "Failed: %d tests\n" !fail_count;

  if !fail_count = 0 then begin
    printf "\n✓ All tests passed!\n";
    exit 0
  end else begin
    printf "\n✗ Some tests failed\n";
    exit 1
  end
