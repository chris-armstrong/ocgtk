(* Property generation tests *)

open Printf
open Helpers

let properties_gir = wrap_namespace {|
    <class name="TestWidget" c:type="GtkTestWidget" parent="Widget">
      <constructor name="new" c:identifier="gtk_test_widget_new"/>
      <property name="read-only-prop" readable="1">
        <type name="utf8" c:type="const gchar*"/>
      </property>
      <property name="read-write-prop" readable="1" writable="1">
        <type name="gboolean" c:type="gboolean"/>
      </property>
      <property name="construct-only-prop" readable="1" writable="1" construct-only="1">
        <type name="gint" c:type="gint"/>
      </property>
    </class>
|}

let properties_only_gir = wrap_namespace {|
    <class name="PropertiesOnly" c:type="GtkPropertiesOnly" parent="Widget">
      <property name="label" readable="1" writable="1">
        <type name="utf8" c:type="const gchar*"/>
      </property>
      <property name="active" readable="1" writable="1">
        <type name="gboolean" c:type="gboolean"/>
      </property>
    </class>
|}

let test_property_generation () =
  let test_gir = "/tmp/test_property_gen.gir" in
  let test_filter = "/tmp/test_property_filter.conf" in
  let output_dir = "/tmp/test_property_output" in

  create_gir_file test_gir properties_gir;
  create_filter_file test_filter ["TestWidget"];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Property generator should exit successfully" (exit_code = 0);

  let widget_file = mli_file output_dir "test_widget" in
  assert_true "TestWidget.mli should be created" (file_exists widget_file);

  let content = read_file widget_file in
  assert_contains "Should generate getter for read-only property" content
    "get_read_only_prop";
  if string_contains content "set_read_only_prop" then
    failwith "Should not generate setter for read-only property";

  assert_contains "Should generate getter for read-write property" content
    "get_read_write_prop";
  assert_contains "Should generate setter for read-write property" content
    "set_read_write_prop";

  assert_contains "Should generate getter for construct-only property" content
    "get_construct_only_prop";
  if string_contains content "set_construct_only_prop" then
    failwith "Should not generate setter for construct-only property";

  assert_contains "Bool property should have bool type" content "t -> bool";
  assert_contains "Int property should have int type" content "t -> int"

let test_c_property_generation () =
  let test_gir = "/tmp/test_c_property_gen.gir" in
  let test_filter = "/tmp/test_c_property_filter.conf" in
  let output_dir = "/tmp/test_c_property_output" in

  create_gir_file test_gir properties_gir;
  create_filter_file test_filter ["TestWidget"];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "C property generator should exit successfully" (exit_code = 0);

  let c_file = stub_c_file output_dir "TestWidget" in
  assert_true "C file should be created" (file_exists c_file);

  let c_content = read_file c_file in
  assert_contains "C getter for read-only property" c_content
    "ml_gtk_test_widget_get_read_only_prop";
  assert_contains "C getter should use g_object_get" c_content "g_object_get";

  assert_contains "C setter for read-write property" c_content
    "ml_gtk_test_widget_set_read_write_prop";
  assert_contains "C setter should use g_object_set" c_content "g_object_set";

  assert_contains "C code should use CAMLparam" c_content "CAMLparam";
  assert_contains "C code should use CAMLreturn" c_content "CAMLreturn";

  assert_contains "C getter for construct-only property" c_content
    "ml_gtk_test_widget_get_construct_only_prop";
  if string_contains c_content "ml_gtk_test_widget_set_construct_only_prop" then
    failwith "Should not generate C setter for construct-only property"

let test_properties_only_class () =
  let test_gir = "/tmp/test_properties_only.gir" in
  let test_filter = "/tmp/test_properties_only_filter.conf" in
  let output_dir = "/tmp/test_properties_only_output" in

  create_gir_file test_gir properties_only_gir;
  create_filter_file test_filter ["PropertiesOnly"];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Properties-only generator should exit successfully"
    (exit_code = 0);

  let mli = mli_file output_dir "properties_only" in
  let content = read_file mli in

  assert_contains "Should have label getter" content "get_label";
  assert_contains "Should have label setter" content "set_label";
  assert_contains "Should have active getter" content "get_active";
  assert_contains "Should have active setter" content "set_active"

let run_tests () =
  printf "\n--- Property Tests ---\n";
  ignore (test "Property generation" test_property_generation);
  ignore (test "C property generation (Phase 5.2)" test_c_property_generation);
  ignore (test "Properties-only class" test_properties_only_class)
