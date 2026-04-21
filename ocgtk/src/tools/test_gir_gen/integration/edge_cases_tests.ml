(* Edge case tests *)

open Helpers

let empty_class_gir =
  wrap_namespace
    {|
    <class name="EmptyWidget" c:type="GtkEmptyWidget" parent="Widget">
    </class>
|}

let no_constructor_gir =
  wrap_namespace
    {|
    <class name="NoConstructor" c:type="GtkNoConstructor" parent="Widget">
      <method name="do_something" c:identifier="gtk_no_constructor_do_something">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
    </class>
|}

let test_empty_class () =
  let output_dir =
    run_integration_test ~gir_content:empty_class_gir
      ~class_names:[ "EmptyWidget" ] ~test_name:"empty_class" ()
  in
  let mli = mli_file output_dir "empty_widget" in
  assert_true "Empty widget file should be created" (file_exists mli);

  let content = read_file mli in
  let sig_ast = Ml_ast_helpers.parse_interface content in
  Ml_validation.assert_type_exists_sig sig_ast "t"

let test_no_constructor_class () =
  let output_dir =
    run_integration_test ~gir_content:no_constructor_gir
      ~class_names:[ "NoConstructor" ] ~test_name:"no_constructor" ()
  in
  let mli = mli_file output_dir "no_constructor" in
  let content = read_file mli in
  let sig_ast = Ml_ast_helpers.parse_interface content in

  Ml_validation.assert_value_exists_sig sig_ast "do_something";
  Ml_validation.assert_no_value_matching_sig sig_ast
    (fun name ->
      String.length name >= 4 && String.equal (String.sub name 0 4) "new_")
    "new_*"

let tests =
  [
    Alcotest.test_case "Empty class generation" `Quick test_empty_class;
    Alcotest.test_case "Class with no constructor" `Quick
      test_no_constructor_class;
  ]
