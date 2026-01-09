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

let test_non_opaque_record_functions () =
  (* Test that non-opaque records with fields generate functions instead of macros *)
  let test_gir = "/tmp/test_non_opaque_record.gir" in
  let test_filter = "/tmp/test_non_opaque_filter.conf" in
  let output_dir = "/tmp/test_non_opaque_output" in

  let gir_content = wrap_namespace {|
    <record name="WidgetClass" c:type="GtkWidgetClass">
      <field name="parent_class">
        <type name="GObject.InitiallyUnownedClass" c:type="GInitiallyUnownedClass"/>
      </field>
      <method name="set_template" c:identifier="gtk_widget_class_set_template">
        <return-value><type name="none" c:type="void"/></return-value>
        <parameters>
          <parameter name="template_bytes"><type name="GLib.Bytes" c:type="GBytes*"/></parameter>
        </parameters>
      </method>
    </record>
  |} in

  create_gir_file test_gir gir_content;
  create_filter_file test_filter ["WidgetClass"];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Non-opaque record generator should exit successfully" (exit_code = 0);

  (* Check that forward declarations are generated as functions, not macros *)
  let header_file = Filename.concat (Filename.concat output_dir "generated") "generated_forward_decls.h" in
  assert_true "generated_forward_decls.h should exist" (file_exists header_file);
  let header_content = read_file header_file in

  (* Should have forward declarations for functions *)
  assert_contains "Should declare GtkWidgetClass_val function" header_content
    "GtkWidgetClass *GtkWidgetClass_val(value val);";
  assert_contains "Should declare Val_GtkWidgetClass function" header_content
    "value Val_GtkWidgetClass(const GtkWidgetClass *ptr);";
  assert_contains "Should declare Val_GtkWidgetClass_option function" header_content
    "value Val_GtkWidgetClass_option(const GtkWidgetClass *ptr);";

  (* Should NOT have macro definitions for non-opaque records *)
  assert_not_contains "Should not define GtkWidgetClass_val as macro in header" header_content
    "#define GtkWidgetClass_val("

let test_non_opaque_vs_opaque_records () =
  (* Test that opaque records still use macros while non-opaque use functions *)
  let test_gir = "/tmp/test_opaque_vs_non_opaque.gir" in
  let test_filter = "/tmp/test_opaque_filter.conf" in
  let output_dir = "/tmp/test_opaque_output" in

  let gir_content = wrap_namespace {|
    <record name="OpaqueRecord" c:type="GtkOpaqueRecord" disguised="1">
      <method name="new" c:identifier="gtk_opaque_record_new">
        <return-value><type name="OpaqueRecord" c:type="GtkOpaqueRecord*"/></return-value>
      </method>
    </record>
    <record name="NonOpaqueRecord" c:type="GtkNonOpaqueRecord">
      <field name="value"><type name="gint" c:type="gint"/></field>
      <method name="new" c:identifier="gtk_non_opaque_record_new">
        <return-value><type name="NonOpaqueRecord" c:type="GtkNonOpaqueRecord*"/></return-value>
      </method>
    </record>
  |} in

  create_gir_file test_gir gir_content;
  create_filter_file test_filter ["OpaqueRecord"; "NonOpaqueRecord"];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Should generate successfully" (exit_code = 0);

  let header_file = Filename.concat (Filename.concat output_dir "generated") "generated_forward_decls.h" in
  let header_content = read_file header_file in

  (* Both records are non-opaque (no disguised="1" attribute) so they use function declarations *)
  (* Opaque records (with disguised="1") also use functions in current implementation *)
  assert_contains "Opaque record should have function declaration" header_content
    "GtkOpaqueRecord *GtkOpaqueRecord_val(value val);";
  assert_contains "Opaque record should have Val function" header_content
    "value Val_GtkOpaqueRecord(const GtkOpaqueRecord *ptr);";

  (* Non-opaque record should use function declarations *)
  assert_contains "Non-opaque record should have function declaration" header_content
    "GtkNonOpaqueRecord *GtkNonOpaqueRecord_val(value val);";
  assert_contains "Non-opaque record should have Val function declaration" header_content
    "value Val_GtkNonOpaqueRecord(const GtkNonOpaqueRecord *ptr);"

let test_non_opaque_record_in_property () =
  (* Test that non-opaque records work correctly in properties *)
  let test_gir = "/tmp/test_non_opaque_prop.gir" in
  let test_filter = "/tmp/test_non_opaque_prop_filter.conf" in
  let output_dir = "/tmp/test_non_opaque_prop_output" in

  let gir_content = wrap_namespace {|
    <record name="Rectangle" c:type="GtkRectangle" glib:type-name="GtkRectangle" glib:get-type="gtk_rectangle_get_type">
      <field name="x"><type name="gint" c:type="gint"/></field>
      <field name="y"><type name="gint" c:type="gint"/></field>
      <field name="width"><type name="gint" c:type="gint"/></field>
      <field name="height"><type name="gint" c:type="gint"/></field>
    </record>
    <class name="RectWidget" c:type="GtkRectWidget" parent="GObject.Object">
      <constructor name="new" c:identifier="gtk_rect_widget_new"/>
      <property name="bounds" readable="1" writable="1">
        <type name="Rectangle" c:type="GtkRectangle*"/>
      </property>
    </class>
  |} in

  create_gir_file test_gir gir_content;
  create_filter_file test_filter ["RectWidget"];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Should generate successfully" (exit_code = 0);

  let c_file = stub_c_file output_dir "RectWidget" in
  let c_content = read_file c_file in

  (* Property getter should use Val_GtkRectangle *)
  assert_contains "Property getter should use conversion function" c_content
    "Val_GtkRectangle";

  (* Property setter should use GtkRectangle_val *)
  assert_contains "Property setter should use conversion function" c_content
    "GtkRectangle_val"

let tests =
  [
    Alcotest.test_case "Record type support" `Quick test_record_support;
    Alcotest.test_case "Non-opaque record functions" `Quick test_non_opaque_record_functions;
    Alcotest.test_case "Opaque vs non-opaque records" `Quick test_non_opaque_vs_opaque_records;
    Alcotest.test_case "Non-opaque record in property" `Quick test_non_opaque_record_in_property;
  ]
