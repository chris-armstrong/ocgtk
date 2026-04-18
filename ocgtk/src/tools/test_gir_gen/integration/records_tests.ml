(* Record type support tests *)

open Helpers

let record_gir =
  wrap_namespace
    {|
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
  create_filter_file test_filter [ "RecordUser" ];
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
  let c_functions = C_parser.parse_c_code c_content in

  assert_true "Should use Val_GtkTestRecord conversion"
    (List.exists
       (fun (f : C_ast.c_function) ->
         C_validation.uses_correct_return_macro f "Val_GtkTestRecord")
       c_functions);
  assert_true "Should use GtkTestRecord_val conversion"
    (List.exists
       (fun (f : C_ast.c_function) ->
         C_validation.calls_c_function f "GtkTestRecord_val")
       c_functions);

  let mli = mli_file output_dir "record_user" in
  assert_true "record_user.mli should be created" (file_exists mli)

let test_non_opaque_record_functions () =
  let test_gir = "/tmp/test_non_opaque_record.gir" in
  let test_filter = "/tmp/test_non_opaque_filter.conf" in
  let output_dir = "/tmp/test_non_opaque_output" in

  let gir_content =
    wrap_namespace
      {|
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
  |}
  in

  create_gir_file test_gir gir_content;
  create_filter_file test_filter [ "WidgetClass" ];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Non-opaque record generator should exit successfully"
    (exit_code = 0);

  let header_file =
    Filename.concat (Filename.concat output_dir "generated") "gtk_decls.h"
  in
  assert_true "gtk_decls.h should exist" (file_exists header_file);
  let header_content = read_file header_file in

  (* Forward declarations exist for GtkWidgetClass_val and Val_GtkWidgetClass *)
  C_validation.assert_forward_decl_exists header_content "GtkWidgetClass_val" "";
  C_validation.assert_forward_decl_exists header_content "GtkWidgetClass" "Val_";
  (* No macro definition for non-opaque records *)
  C_validation.assert_forward_decl_not_exists header_content "GtkWidgetClass("
    "#define "

let test_non_opaque_vs_opaque_records () =
  let test_gir = "/tmp/test_opaque_vs_non_opaque.gir" in
  let test_filter = "/tmp/test_opaque_filter.conf" in
  let output_dir = "/tmp/test_opaque_output" in

  let gir_content =
    wrap_namespace
      {|
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
  |}
  in

  create_gir_file test_gir gir_content;
  create_filter_file test_filter [ "OpaqueRecord"; "NonOpaqueRecord" ];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Should generate successfully" (exit_code = 0);

  let header_file =
    Filename.concat (Filename.concat output_dir "generated") "gtk_decls.h"
  in
  let header_content = read_file header_file in

  C_validation.assert_forward_decl_exists header_content "GtkOpaqueRecord_val" "";
  C_validation.assert_forward_decl_exists header_content "GtkOpaqueRecord" "Val_";
  C_validation.assert_forward_decl_exists header_content "GtkNonOpaqueRecord_val" "";
  C_validation.assert_forward_decl_exists header_content "GtkNonOpaqueRecord" "Val_"

let test_non_opaque_record_in_property () =
  let test_gir = "/tmp/test_non_opaque_prop.gir" in
  let test_filter = "/tmp/test_non_opaque_prop_filter.conf" in
  let output_dir = "/tmp/test_non_opaque_prop_output" in

  let gir_content =
    wrap_namespace
      {|
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
  |}
  in

  create_gir_file test_gir gir_content;
  create_filter_file test_filter [ "RectWidget" ];
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
  assert_true "Should generate successfully" (exit_code = 0);

  let c_file = stub_c_file output_dir "RectWidget" in
  let c_content = read_file c_file in
  let c_functions = C_parser.parse_c_code c_content in

  assert_true "Property getter should use Val_GtkRectangle"
    (List.exists
       (fun (f : C_ast.c_function) ->
         C_validation.calls_c_function f "Val_GtkRectangle")
       c_functions);
  assert_true "Property setter should use GtkRectangle_val"
    (List.exists
       (fun (f : C_ast.c_function) ->
         C_validation.calls_c_function f "GtkRectangle_val")
       c_functions)

let tests =
  [
    Alcotest.test_case "Record type support" `Quick test_record_support;
    Alcotest.test_case "Non-opaque record functions" `Quick
      test_non_opaque_record_functions;
    Alcotest.test_case "Opaque vs non-opaque records" `Quick
      test_non_opaque_vs_opaque_records;
    Alcotest.test_case "Non-opaque record in property" `Quick
      test_non_opaque_record_in_property;
  ]
