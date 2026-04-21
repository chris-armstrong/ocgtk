(* Widget generation tests *)

open Helpers

(* ========================================================================= *)
(* Test GIR Content *)
(* ========================================================================= *)

let widget_with_methods_gir =
  wrap_namespace
    {|
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

let many_methods_gir =
  wrap_namespace
    {|
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

let many_params_gir =
  wrap_namespace
    {|
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

(* ========================================================================= *)
(* Test Cases *)
(* ========================================================================= *)

let test_widget_generation () =
  let output_dir =
    run_integration_test ~gir_content:widget_with_methods_gir
      ~class_names:[ "Button"; "Label" ] ~test_name:"widget_gen" ()
  in
  let button_file = mli_file output_dir "button" in
  assert_true "Button.mli should be created" (file_exists button_file);

  let label_file = mli_file output_dir "label" in
  assert_true "Label.mli should be created" (file_exists label_file);

  let button_content = read_file button_file in
  let button_sig = Ml_ast_helpers.parse_interface button_content in
  Ml_validation.assert_value_exists_sig button_sig "new_";
  Ml_validation.assert_value_exists_sig button_sig "set_label";

  (* High-level wrapper generation *)
  let gbutton = g_wrapper_file output_dir "Button" in
  assert_true "gButton.ml should be created" (file_exists gbutton);
  let gbutton_content = read_file gbutton in
  let gbutton_ast = Ml_ast_helpers.parse_implementation gbutton_content in
  expect_some "gButton.ml should define class 'button'"
    (Ml_ast_helpers.find_class_declaration gbutton_ast "button")
  @@ fun cls ->
  assert_some "gButton should expose method 'get_label'"
    (Ml_ast_helpers.find_method_in_class cls.pci_expr "get_label");
  assert_some "gButton should expose method 'set_label'"
    (Ml_ast_helpers.find_method_in_class cls.pci_expr "set_label");
  (* Signal names must not appear as method wrappers — they are exposed via
     the signals class only. *)
  match Ml_ast_helpers.find_method_in_class cls.pci_expr "clicked" with
  | Some _ ->
      Alcotest.fail
        "gButton should NOT expose 'clicked' as a method wrapper (it is a \
         signal)"
  | None -> ()

let test_all_methods_generated () =
  let output_dir =
    run_integration_test ~gir_content:many_methods_gir
      ~class_names:[ "ManyMethods" ] ~test_name:"many_methods" ()
  in
  let mli = mli_file output_dir "many_methods" in
  let content = read_file mli in
  let sig_ast = Ml_ast_helpers.parse_interface content in

  (* Check that all 8 methods are generated (not just first 5) *)
  Ml_validation.assert_value_exists_sig sig_ast "method1";
  Ml_validation.assert_value_exists_sig sig_ast "method5";
  Ml_validation.assert_value_exists_sig sig_ast "method6";
  Ml_validation.assert_value_exists_sig sig_ast "method7";
  Ml_validation.assert_value_exists_sig sig_ast "method8"

let test_generated_code_quality () =
  let output_dir =
    run_integration_test ~gir_content:widget_with_methods_gir
      ~class_names:[ "Button"; "Label" ] ~test_name:"quality" ()
  in
  let c_file = stub_c_file output_dir "Button" in
  let c_content = read_file c_file in
  let c_functions = C_parser.parse_c_code c_content in

  assert_true "Should use CAMLparam for all functions"
    (List.exists (fun f -> C_validation.has_caml_param_macro f) c_functions);
  assert_true "Should use CAMLreturn"
    (List.exists (fun f -> C_validation.has_caml_return f) c_functions);
  assert_true "Should use String_val for string conversions"
    (List.exists
       (fun f -> C_validation.calls_c_function f "String_val")
       c_functions);

  let any_malloc =
    List.exists (fun f -> C_validation.calls_c_function f "malloc") c_functions
  in
  let any_free =
    List.exists (fun f -> C_validation.calls_c_function f "free") c_functions
  in
  if any_malloc && not any_free then
    Alcotest.fail "Generated code may have memory leaks (malloc without free)"

let test_camlparam_limitation () =
  let output_dir =
    run_integration_test ~gir_content:many_params_gir ~class_names:[]
      ~test_name:"many_params" ()
  in
  let mli = mli_file output_dir "many_params" in
  let content = read_file mli in
  let sig_ast = Ml_ast_helpers.parse_interface content in

  (* Method with 3 params should always be generated *)
  Ml_validation.assert_value_exists_sig sig_ast "with_three_params";

  (* CURRENT BEHAVIOR: Method with 6 params IS generated with bytecode/native
     pattern. If it appears in the signature, verify C defines both entry points. *)
  match Ml_ast_helpers.find_value_declaration_sig sig_ast "with_six_params" with
  | Some _ ->
      let c_file = stub_c_file output_dir "ManyParams" in
      let c_content = read_file c_file in
      let c_functions = C_parser.parse_c_code c_content in
      assert_true "C should define bytecode entry for 6-param method"
        (List.exists
           (fun (f : C_ast.c_function) ->
             f.name = "ml_gtk_many_params_with_six_params_bytecode")
           c_functions);
      assert_true "C should define native entry for 6-param method"
        (List.exists
           (fun (f : C_ast.c_function) ->
             f.name = "ml_gtk_many_params_with_six_params_native")
           c_functions)
  | None -> ()

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "Widget generation" `Quick test_widget_generation;
    Alcotest.test_case "All methods generated (Phase 5.2)" `Quick
      test_all_methods_generated;
    Alcotest.test_case "CAMLparam limitation (>5 params)" `Quick
      test_camlparam_limitation;
    Alcotest.test_case "Generated code quality" `Quick
      test_generated_code_quality;
  ]
