(* Record type support tests *)

open Helpers

let record_gir = wrap_namespace {|
    <record name="TestRecord" c:type="GtkTestRecord" glib:type-name="GtkTestRecord" glib:get-type="gtk_test_record_get_type">
      <field name="width"><type name="gint" c:type="gint"/></field>
    </record>
    <record name="OpaqueRec" c:type="GtkOpaqueRec" disguised="1"/>
    <class name="RecordUser" c:type="GtkRecordUser" parent="Widget">
      <constructor name="new" c:identifier="gtk_record_user_new"/>
      <method name="set_boxed" c:identifier="gtk_record_user_set_boxed">
        <return-value><type name="none" c:type="void"/></return-value>
        <parameters>
          <parameter name="value"><type name="TestRecord" c:type="GtkTestRecord*"/></parameter>
        </parameters>
      </method>
      <method name="get_boxed" c:identifier="gtk_record_user_get_boxed">
        <return-value><type name="TestRecord" c:type="GtkTestRecord*"/></return-value>
      </method>
      <method name="get_nullable_boxed" c:identifier="gtk_record_user_get_nullable_boxed">
        <return-value><type name="TestRecord" c:type="GtkTestRecord*" nullable="1"/></return-value>
      </method>
      <method name="set_nullable_boxed" c:identifier="gtk_record_user_set_nullable_boxed">
        <return-value><type name="none" c:type="void"/></return-value>
        <parameters>
          <parameter name="value" nullable="1"><type name="TestRecord" c:type="GtkTestRecord*"/></parameter>
        </parameters>
      </method>
      <property name="opaque-prop" readable="1" writable="1">
        <type name="OpaqueRec" c:type="GtkOpaqueRec*" nullable="1"/>
      </property>
    </class>
|}

let test_record_support () =
  let test_gir = "/tmp/test_record_gen.gir" in
  let test_filter = "/tmp/test_record_filter.conf" in
  let output_dir = "/tmp/test_record_output" in

  create_gir_file test_gir record_gir;
  create_filter_file test_filter ["RecordUser"];
  ensure_output_dir output_dir;

  let _, _, classes, _, _, _, records =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file test_gir []
  in
  assert_true "Should parse two records" (List.length records = 2);
  assert_true "Should parse RecordUser class"
    (List.exists
       (fun (c : Gir_gen_lib.Types.gir_class) -> c.class_name = "RecordUser")
       classes);

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Record generator should exit successfully" (exit_code = 0);

  let c_file = stub_c_file output_dir "RecordUser" in
  assert_true "RecordUser C file should be created" (file_exists c_file);
  let c_content = read_file c_file in
  assert_contains "Should use record conversion macro" c_content
    "Val_GtkTestRecord";
  assert_contains "Should convert record pointer in setter" c_content
    "GtkTestRecord_val";

  let mli = mli_file output_dir "record_user" in
  assert_true "record_user.mli should be created" (file_exists mli)

let run_tests () =
  Printf.printf "\n--- Record Tests ---\n";
  ignore (test "Record type support" test_record_support)
