(* GIR parsing and C code generation quality tests *)

open Helpers

(* ========================================================================= *)
(* Test GIR Content *)
(* ========================================================================= *)

let simple_class_gir =
  wrap_namespace
    {|
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
|}

(* ========================================================================= *)
(* Test Cases *)
(* ========================================================================= *)

let test_gir_parsing () =
  let test_gir = "/tmp/test_gir_gen.gir" in
  let output_dir = "/tmp/test_gir_output" in

  create_gir_file test_gir simple_class_gir;
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen test_gir output_dir in
  assert_true "Generator should exit successfully" (exit_code = 0);

  let c_file = stub_c_file output_dir "EventControllerKey" in
  assert_true "C file should be created" (file_exists c_file);

  let content = read_file c_file in
  let c_functions = C_parser.parse_c_code content in
  assert_true "C file should define constructor stub"
    (List.exists
       (fun (f : C_ast.c_function) ->
         f.name = "ml_gtk_event_controller_key_new")
       c_functions)

let test_c_code_generation () =
  let test_gir = "/tmp/test_gir_gen.gir" in
  let output_dir = "/tmp/test_gir_output" in

  create_gir_file test_gir simple_class_gir;
  ensure_output_dir output_dir;

  let _ = run_gir_gen test_gir output_dir in

  let c_file = stub_c_file output_dir "EventControllerKey" in
  if file_exists c_file then begin
    let content = read_file c_file in
    let c_functions = C_parser.parse_c_code content in
    assert_true "Should use CAMLparam"
      (List.exists (fun f -> C_validation.has_caml_param_macro f) c_functions);
    assert_true "Should use CAMLreturn"
      (List.exists (fun f -> C_validation.has_caml_return f) c_functions);
    (* Class converters are #define macros in the header, not functions in the stub.
       Check the header file for Val_* / *_val declarations. *)
    let header_file =
      Filename.concat (Filename.concat output_dir "generated") "gtk_decls.h"
    in
    assert_true "Should define type converter macro"
      (file_exists header_file
      &&
      let header_content = read_file header_file in
      let decls = C_validation.extract_forward_decls header_content in
      List.exists
        (fun d ->
          String.starts_with ~prefix:"Val_" d || String.ends_with ~suffix:"_val" d)
        decls)
  end else Alcotest.fail "C file not generated"

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "GIR file parsing" `Quick test_gir_parsing;
    Alcotest.test_case "C code generation" `Quick test_c_code_generation;
  ]
