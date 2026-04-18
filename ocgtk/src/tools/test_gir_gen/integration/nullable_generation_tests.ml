(* Nullable parameter generation tests *)

open Helpers

(* ========================================================================= *)
(* Test GIR Content *)
(* ========================================================================= *)

let nullable_params_gir =
  wrap_namespace
    {|
    <class name="TestWidget" c:type="GtkTestWidget" parent="Widget">
      <constructor name="new" c:identifier="gtk_test_widget_new">
        <parameters>
          <parameter name="label" nullable="1">
            <type name="utf8" c:type="const gchar*"/>
          </parameter>
        </parameters>
      </constructor>
      <method name="set_group" c:identifier="gtk_test_widget_set_group">
        <return-value><type name="none" c:type="void"/></return-value>
        <parameters>
          <parameter name="group" nullable="1">
            <type name="Widget" c:type="GtkWidget*"/>
          </parameter>
        </parameters>
      </method>
    </class>
|}

(* ========================================================================= *)
(* Test Cases *)
(* ========================================================================= *)

let test_nullable_parameters () =
  let test_gir = "/tmp/test_nullable_gen.gir" in
  let test_filter = "/tmp/test_nullable_filter.conf" in
  let output_dir = "/tmp/test_nullable_output" in

  create_gir_file test_gir nullable_params_gir;
  create_filter_file test_filter [ "TestWidget" ];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Nullable generator should exit successfully" (exit_code = 0);

  let mli = mli_file output_dir "test_widget" in
  let content = read_file mli in
  let sig_ast = Ml_ast_helpers.parse_interface content in

  (* Check OCaml interface has a value declaration with a string option parameter *)
  let all_vals = Ml_ast_helpers.get_all_value_declarations_sig sig_ast in
  let has_string_option_param =
    List.exists
      (fun (_, ct) ->
        List.exists Ml_ast_helpers.is_string_option_type
          (Ml_ast_helpers.get_param_types ct))
      all_vals
  in
  assert_true "Constructor should have string option parameter"
    has_string_option_param;

  (* Check C code uses option-aware conversions *)
  let c_file = stub_c_file output_dir "TestWidget" in
  let c_content = read_file c_file in
  let c_functions = C_parser.parse_c_code c_content in
  assert_true "C should use String_option_val helper for nullable string"
    (List.exists
       (fun f -> C_validation.calls_c_function f "String_option_val")
       c_functions)

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "Nullable parameters (Phase 5.3)" `Quick
      test_nullable_parameters;
  ]
