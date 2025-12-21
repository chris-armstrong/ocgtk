(* Core GIR parsing and code generation tests *)

open Printf
open Helpers

(* ========================================================================= *)
(* Test GIR Content *)
(* ========================================================================= *)

let simple_class_gir = wrap_namespace {|
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

let widget_with_methods_gir = wrap_namespace {|
    <class name="Button" c:type="GtkButton" parent="Widget">
      <constructor name="new" c:identifier="gtk_button_new"/>
      <method name="set_label" c:identifier="gtk_button_set_label">
        <return-value><type name="none" c:type="void"/></return-value>
        <parameters>
          <parameter name="label"><type name="utf8" c:type="const gchar*"/></parameter>
        </parameters>
      </method>
      <method name="get_label" c:identifier="gtk_button_get_label">
        <return-value><type name="utf8" c:type="const gchar*"/></return-value>
      </method>
      <glib:signal name="clicked" when="first">
        <return-value transfer-ownership="none"><type name="none" c:type="void"/></return-value>
        <parameters/>
      </glib:signal>
      <glib:signal name="activate" when="last">
        <return-value transfer-ownership="none"><type name="none" c:type="void"/></return-value>
        <parameters/>
      </glib:signal>
    </class>
    <class name="Label" c:type="GtkLabel" parent="Widget">
      <constructor name="new" c:identifier="gtk_label_new"/>
      <method name="set_text" c:identifier="gtk_label_set_text">
        <return-value><type name="none" c:type="void"/></return-value>
        <parameters>
          <parameter name="str"><type name="utf8" c:type="const gchar*"/></parameter>
        </parameters>
      </method>
    </class>
|}

let many_methods_gir = wrap_namespace {|
    <class name="ManyMethods" c:type="GtkManyMethods" parent="Widget">
      <constructor name="new" c:identifier="gtk_many_methods_new"/>
      <method name="method1" c:identifier="gtk_many_methods_method1">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method2" c:identifier="gtk_many_methods_method2">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method3" c:identifier="gtk_many_methods_method3">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method4" c:identifier="gtk_many_methods_method4">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method5" c:identifier="gtk_many_methods_method5">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method6" c:identifier="gtk_many_methods_method6">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method7" c:identifier="gtk_many_methods_method7">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method8" c:identifier="gtk_many_methods_method8">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
    </class>
|}

let many_params_gir = wrap_namespace {|
    <class name="ManyParams" c:type="GtkManyParams" parent="Widget">
      <constructor name="new" c:identifier="gtk_many_params_new"/>
      <method name="with_six_params" c:identifier="gtk_many_params_with_six_params">
        <return-value><type name="none" c:type="void"/></return-value>
        <parameters>
          <parameter name="arg1"><type name="gint" c:type="gint"/></parameter>
          <parameter name="arg2"><type name="gint" c:type="gint"/></parameter>
          <parameter name="arg3"><type name="gint" c:type="gint"/></parameter>
          <parameter name="arg4"><type name="gint" c:type="gint"/></parameter>
          <parameter name="arg5"><type name="gint" c:type="gint"/></parameter>
          <parameter name="arg6"><type name="gint" c:type="gint"/></parameter>
        </parameters>
      </method>
      <method name="with_three_params" c:identifier="gtk_many_params_with_three_params">
        <return-value><type name="none" c:type="void"/></return-value>
        <parameters>
          <parameter name="arg1"><type name="gint" c:type="gint"/></parameter>
          <parameter name="arg2"><type name="gint" c:type="gint"/></parameter>
          <parameter name="arg3"><type name="gint" c:type="gint"/></parameter>
        </parameters>
      </method>
    </class>
|}

let nullable_params_gir = wrap_namespace {|
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
  assert_contains "C file should have header" content "GENERATED CODE";
  assert_contains "C file should have constructor" content
    "ml_gtk_event_controller_key_new"

let test_c_code_generation () =
  printf "Verifying generated C code structure\n";
  let test_gir = "/tmp/test_gir_gen.gir" in
  let output_dir = "/tmp/test_gir_output" in

  create_gir_file test_gir simple_class_gir;
  ensure_output_dir output_dir;

  let _ = run_gir_gen test_gir output_dir in

  let c_file = stub_c_file output_dir "EventControllerKey" in
  if file_exists c_file then begin
    let content = read_file c_file in
    assert_contains "Should use CAMLparam" content "CAMLparam";
    assert_contains "Should use CAMLreturn" content "CAMLreturn";
    assert_contains "Should define type converter macros" content
      "GtkEventControllerKey_val"
  end
  else failwith "C file not generated"

let test_widget_generation () =
  let test_gir = "/tmp/test_widget_gen.gir" in
  let test_filter = "/tmp/test_widget_filter.conf" in
  let output_dir = "/tmp/test_widget_output" in

  create_gir_file test_gir widget_with_methods_gir;
  create_filter_file test_filter ["Button"; "Label"];
  ensure_output_dir output_dir;
  delete_if_exists (mli_file output_dir "button");
  delete_if_exists (ml_file output_dir "button");
  delete_if_exists (g_wrapper_file output_dir "Button");

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Widget generator should exit successfully" (exit_code = 0);

  let button_file = mli_file output_dir "button" in
  assert_true "Button.mli should be created" (file_exists button_file);

  let label_file = mli_file output_dir "label" in
  assert_true "Label.mli should be created" (file_exists label_file);

  let button_content = read_file button_file in
  assert_contains "Button should have constructor" button_content
    "external new_";
  assert_contains "Button should have set_label" button_content "set_label";

  (* High-level wrapper generation *)
  let gbutton = g_wrapper_file output_dir "Button" in
  assert_true "gButton.ml should be created" (file_exists gbutton);
  let gbutton_content = read_file gbutton in
  assert_contains "gButton should define skeleton" gbutton_content
    "class button";
  assert_contains "gButton should expose property getter" gbutton_content
    "method get_label";
  assert_contains "gButton should expose property setter" gbutton_content
    "method set_label";
  assert_not_contains
    "gButton should not expose method wrapper that overlaps signal"
    gbutton_content "method clicked"

let test_all_methods_generated () =
  let test_gir = "/tmp/test_many_methods.gir" in
  let test_filter = "/tmp/test_many_methods_filter.conf" in
  let output_dir = "/tmp/test_many_methods_output" in

  create_gir_file test_gir many_methods_gir;
  create_filter_file test_filter ["ManyMethods"];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Many methods generator should exit successfully" (exit_code = 0);

  let mli = mli_file output_dir "many_methods" in
  let content = read_file mli in

  (* Check that all 8 methods are generated (not just first 5) *)
  assert_contains "Method 1 should be generated" content "method1";
  assert_contains "Method 5 should be generated" content "method5";
  assert_contains "Method 6 should be generated (beyond old 5-method limit)"
    content "method6";
  assert_contains "Method 7 should be generated" content "method7";
  assert_contains "Method 8 should be generated" content "method8"

let test_camlparam_limitation () =
  let test_gir = "/tmp/test_many_params.gir" in
  let output_dir = "/tmp/test_many_params_output" in

  create_gir_file test_gir many_params_gir;
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen test_gir output_dir in
  assert_true "CAMLparam test should exit successfully" (exit_code = 0);

  let mli = mli_file output_dir "many_params" in
  let content = read_file mli in

  (* Method with 3 params should be generated *)
  assert_contains "Method with 3 params should be generated" content
    "with_three_params";

  (* CURRENT BEHAVIOR: Method with 6 params IS generated with bytecode/native pattern *)
  if string_contains content "with_six_params" then begin
    (* Verify it uses bytecode/native pattern *)
    assert_contains "Method with 6 params should use bytecode/native pattern"
      content "ml_gtk_many_params_with_six_params_bytecode";
    assert_contains "Method with 6 params should use bytecode/native pattern"
      content "ml_gtk_many_params_with_six_params_native"
  end
  else
    (* If skipped, that's also acceptable *)
    printf
      "Note: Method with 6 params was skipped (acceptable per Phase 5.3 spec)\n"

let test_nullable_parameters () =
  let test_gir = "/tmp/test_nullable_gen.gir" in
  let test_filter = "/tmp/test_nullable_filter.conf" in
  let output_dir = "/tmp/test_nullable_output" in

  create_gir_file test_gir nullable_params_gir;
  create_filter_file test_filter ["TestWidget"];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Nullable generator should exit successfully" (exit_code = 0);

  let mli = mli_file output_dir "test_widget" in
  let content = read_file mli in

  (* Check OCaml interface uses option types *)
  assert_contains "Constructor should have string option parameter" content
    "string option";

  (* Check C code uses option-aware conversions *)
  let c_file = stub_c_file output_dir "TestWidget" in
  let c_content = read_file c_file in
  assert_contains "C should use option helper for string" c_content
    "String_option_val"

let test_generated_code_quality () =
  let test_gir = "/tmp/test_quality.gir" in
  let test_filter = "/tmp/test_quality_filter.conf" in
  let output_dir = "/tmp/test_quality_output" in

  create_gir_file test_gir widget_with_methods_gir;
  create_filter_file test_filter ["Button"; "Label"];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Code quality test should exit successfully" (exit_code = 0);

  (* Verify generated C code has proper memory management *)
  let c_file = stub_c_file output_dir "Button" in
  let c_content = read_file c_file in

  (* Check for proper CAMLparam/CAMLlocal usage *)
  assert_contains "Should use CAMLparam for all functions" c_content "CAMLparam";
  assert_contains "Should use CAMLreturn" c_content "CAMLreturn";

  (* Check that all string conversions are safe *)
  assert_contains "Should use String_val" c_content "String_val";

  (* Verify no obvious memory leaks *)
  if
    string_contains c_content "malloc" && not (string_contains c_content "free")
  then failwith "Generated code may have memory leaks (malloc without free)"

let test_help_output () =
  let tools_dir = get_tools_dir () in
  let cmd = sprintf "%s/gir_gen/main.exe --help 2>&1" tools_dir in
  let ic = Unix.open_process_in cmd in
  let output = Buffer.create 1024 in
  (try
     while true do
       Buffer.add_string output (input_line ic);
       Buffer.add_char output '\n'
     done
   with End_of_file -> ());
  let _ = Unix.close_process_in ic in
  let help_text = Buffer.contents output in
  assert_contains "Help should mention filter option" help_text "--filter";
  assert_contains "Help should mention GIR_FILE argument" help_text "GIR_FILE";
  assert_contains "Help should show examples" help_text "EXAMPLES"

(* ========================================================================= *)
(* Test Runner *)
(* ========================================================================= *)

let run_tests () =
  printf "\n--- Core Functionality Tests ---\n";
  ignore (test "GIR file parsing" test_gir_parsing);
  ignore (test "C code generation" test_c_code_generation);
  ignore (test "Widget generation" test_widget_generation);
  ignore (test "All methods generated (Phase 5.2)" test_all_methods_generated);
  ignore (test "CAMLparam limitation (>5 params)" test_camlparam_limitation);
  ignore (test "Nullable parameters (Phase 5.3)" test_nullable_parameters);
  ignore (test "Generated code quality" test_generated_code_quality);
  ignore (test "Help output" test_help_output)
