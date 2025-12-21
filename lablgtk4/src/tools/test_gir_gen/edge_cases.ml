(* Edge case tests *)

open Helpers

let empty_class_gir = wrap_namespace {|
    <class name="EmptyWidget" c:type="GtkEmptyWidget" parent="Widget">
    </class>
|}

let no_constructor_gir = wrap_namespace {|
    <class name="NoConstructor" c:type="GtkNoConstructor" parent="Widget">
      <method name="do_something" c:identifier="gtk_no_constructor_do_something">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
    </class>
|}

let test_empty_class () =
  let test_gir = "/tmp/test_empty_class.gir" in
  let test_filter = "/tmp/test_empty_class_filter.conf" in
  let output_dir = "/tmp/test_empty_class_output" in

  create_gir_file test_gir empty_class_gir;
  create_filter_file test_filter ["EmptyWidget"];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Empty class generator should exit successfully" (exit_code = 0);

  let mli = mli_file output_dir "empty_widget" in
  assert_true "Empty widget file should be created" (file_exists mli);

  let content = read_file mli in
  assert_contains "Should define type t" content "type t"

let test_no_constructor_class () =
  let test_gir = "/tmp/test_no_constructor.gir" in
  let test_filter = "/tmp/test_no_constructor_filter.conf" in
  let output_dir = "/tmp/test_no_constructor_output" in

  create_gir_file test_gir no_constructor_gir;
  create_filter_file test_filter ["NoConstructor"];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "No-constructor generator should exit successfully" (exit_code = 0);

  let mli = mli_file output_dir "no_constructor" in
  let content = read_file mli in

  assert_contains "Should have do_something method" content "do_something";
  if string_contains content "external new_" then
    failwith "Should not generate constructor when none defined"

let run_tests () =
  Printf.printf "\n--- Edge Case Tests ---\n";
  ignore (test "Empty class generation" test_empty_class);
  ignore (test "Class with no constructor" test_no_constructor_class)
