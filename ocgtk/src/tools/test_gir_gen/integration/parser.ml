(* Parser tests - directly test GIR XML parsing *)

open Printf
open Helpers
open Gir_gen_lib.Types

(* ========================================================================= *)
(* Parser Helper Functions *)
(* ========================================================================= *)

(* Parse a GIR XML string and return parsed components *)
let parse_gir_string xml_content =
  let temp_file = Filename.temp_file "test_parser_" ".gir" in
  create_gir_file temp_file xml_content;
  let result = Gir_gen_lib.Parse.Gir_parser.parse_gir_file temp_file [] in
  Unix.unlink temp_file;
  result

(* Helper to check if a list contains an element matching a predicate *)
let list_contains ~pred lst = List.exists pred lst

(* ========================================================================= *)
(* Class Parsing Tests *)
(* ========================================================================= *)

let test_parse_simple_class () =
  let gir_xml = wrap_namespace {|
    <class name="Button" c:type="GtkButton" parent="Widget">
      <doc>A button widget</doc>
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in

  Alcotest.(check int) "Should parse one class" 1 (List.length classes);

  let button = List.hd classes in
  Alcotest.(check string) "Class name should be Button" "Button" button.class_name;
  Alcotest.(check string) "C type should be GtkButton" "GtkButton" button.c_type;
  Alcotest.(check (option string)) "Parent should be Widget" (Some "Widget") button.parent;
  (* Note: The parser currently does not parse class-level documentation *)
  Alcotest.(check (option string)) "Doc is not parsed for classes" None button.class_doc

let test_parse_class_without_ctype () =
  let gir_xml = wrap_namespace {|
    <class name="CustomWidget" parent="Widget">
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in

  Alcotest.(check int) "Should parse one class" 1 (List.length classes);

  let widget = List.hd classes in
  (* When c:type is missing, parser should generate it as "Gtk" + name *)
  Alcotest.(check string) "C type should default to GtkCustomWidget" "GtkCustomWidget" widget.c_type

let test_parse_class_with_constructors () =
  let gir_xml = wrap_namespace {|
    <class name="Button" c:type="GtkButton" parent="Widget">
      <constructor name="new" c:identifier="gtk_button_new">
        <doc>Creates a new button</doc>
        <return-value>
          <type name="Widget" c:type="GtkWidget*"/>
        </return-value>
      </constructor>
      <constructor name="new_with_label" c:identifier="gtk_button_new_with_label">
        <return-value>
          <type name="Widget" c:type="GtkWidget*"/>
        </return-value>
        <parameters>
          <parameter name="label">
            <type name="utf8" c:type="const gchar*"/>
          </parameter>
        </parameters>
      </constructor>
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in
  let button = List.hd classes in

  Alcotest.(check int) "Should have 2 constructors" 2 (List.length button.constructors);

  let ctor_new = List.find (fun c -> c.ctor_name = "new") button.constructors in
  Alcotest.(check string) "Constructor c_identifier" "gtk_button_new" ctor_new.c_identifier;
  Alcotest.(check (option string)) "Constructor doc" (Some "Creates a new button") ctor_new.ctor_doc;
  Alcotest.(check int) "Constructor has no params" 0 (List.length ctor_new.ctor_parameters);

  let ctor_with_label = List.find (fun c -> c.ctor_name = "new_with_label") button.constructors in
  Alcotest.(check int) "Constructor has 1 param" 1 (List.length ctor_with_label.ctor_parameters);

  let param = List.hd ctor_with_label.ctor_parameters in
  Alcotest.(check string) "Param name" "label" param.param_name;
  Alcotest.(check string) "Param type name" "utf8" param.param_type.name

let test_parse_class_with_methods () =
  let gir_xml = wrap_namespace {|
    <class name="Button" c:type="GtkButton" parent="Widget">
      <method name="set_label" c:identifier="gtk_button_set_label">
        <doc>Sets the label</doc>
        <return-value>
          <type name="none" c:type="void"/>
        </return-value>
        <parameters>
          <parameter name="label">
            <type name="utf8" c:type="const gchar*"/>
          </parameter>
        </parameters>
      </method>
      <method name="get_label" c:identifier="gtk_button_get_label">
        <return-value>
          <type name="utf8" c:type="const gchar*"/>
        </return-value>
      </method>
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in
  let button = List.hd classes in

  Alcotest.(check int) "Should have 2 methods" 2 (List.length button.methods);

  let set_label = List.find (fun m -> m.method_name = "set_label") button.methods in
  Alcotest.(check string) "Method c_identifier" "gtk_button_set_label" set_label.c_identifier;
  Alcotest.(check (option string)) "Method doc" (Some "Sets the label") set_label.doc;
  Alcotest.(check string) "Return type" "none" set_label.return_type.name;
  Alcotest.(check int) "Has 1 parameter" 1 (List.length set_label.parameters);

  let get_label = List.find (fun m -> m.method_name = "get_label") button.methods in
  Alcotest.(check string) "Return type is utf8" "utf8" get_label.return_type.name;
  Alcotest.(check int) "Has no parameters" 0 (List.length get_label.parameters)

let test_parse_class_with_properties () =
  let gir_xml = wrap_namespace {|
    <class name="Button" c:type="GtkButton" parent="Widget">
      <property name="label" writable="1" readable="1">
        <doc>The button label</doc>
        <type name="utf8" c:type="gchar*"/>
      </property>
      <property name="use-underline" writable="1" readable="1" construct-only="1">
        <type name="gboolean" c:type="gboolean"/>
      </property>
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in
  let button = List.hd classes in

  Alcotest.(check int) "Should have 2 properties" 2 (List.length button.properties);

  let label_prop = List.find (fun p -> p.prop_name = "label") button.properties in
  Alcotest.(check bool) "Property is readable" true label_prop.readable;
  Alcotest.(check bool) "Property is writable" true label_prop.writable;
  Alcotest.(check bool) "Property is not construct-only" false label_prop.construct_only;
  Alcotest.(check string) "Property type" "utf8" label_prop.prop_type.name;
  (* Note: The parser currently does not parse property documentation *)
  Alcotest.(check (option string)) "Property doc is not parsed" None label_prop.prop_doc;

  let underline_prop = List.find (fun p -> p.prop_name = "use-underline") button.properties in
  Alcotest.(check bool) "Property is construct-only" true underline_prop.construct_only

let test_parse_class_with_signals () =
  let gir_xml = wrap_namespace {|
    <class name="Button" c:type="GtkButton" parent="Widget">
      <glib:signal name="clicked" when="first">
        <doc>Emitted when clicked</doc>
        <return-value transfer-ownership="none">
          <type name="none" c:type="void"/>
        </return-value>
        <parameters/>
      </glib:signal>
      <glib:signal name="activate" when="last">
        <return-value transfer-ownership="none">
          <type name="none" c:type="void"/>
        </return-value>
        <parameters>
          <parameter name="data">
            <type name="gpointer" c:type="gpointer"/>
          </parameter>
        </parameters>
      </glib:signal>
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in
  let button = List.hd classes in

  Alcotest.(check int) "Should have 2 signals" 2 (List.length button.signals);

  let clicked = List.find (fun s -> s.signal_name = "clicked") button.signals in
  Alcotest.(check string) "Signal return type" "none" clicked.return_type.name;
  Alcotest.(check int) "Signal has no parameters" 0 (List.length clicked.sig_parameters);

  let activate = List.find (fun s -> s.signal_name = "activate") button.signals in
  Alcotest.(check int) "Signal has 1 parameter" 1 (List.length activate.sig_parameters)

(* ========================================================================= *)
(* Interface Parsing Tests *)
(* ========================================================================= *)

let test_parse_interface () =
  let gir_xml = wrap_namespace {|
    <interface name="Editable" c:type="GtkEditable" c:symbol-prefix="editable">
      <method name="get_text" c:identifier="gtk_editable_get_text">
        <return-value>
          <type name="utf8" c:type="const gchar*"/>
        </return-value>
      </method>
      <property name="text" readable="1" writable="1">
        <type name="utf8" c:type="gchar*"/>
      </property>
    </interface>
  |}
  in

  let (_, _, _, interfaces, _, _, _) = parse_gir_string gir_xml in

  Alcotest.(check int) "Should parse one interface" 1 (List.length interfaces);

  let editable = List.hd interfaces in
  Alcotest.(check string) "Interface name" "Editable" editable.interface_name;
  Alcotest.(check string) "Interface c_type" "GtkEditable" editable.c_type;
  Alcotest.(check int) "Interface has 1 method" 1 (List.length editable.methods);
  Alcotest.(check int) "Interface has 1 property" 1 (List.length editable.properties)

let test_parse_interface_without_ctype () =
  let gir_xml = wrap_namespace {|
    <interface name="CustomInterface" c:symbol-prefix="custom">
    </interface>
  |}
  in

  let (_, _, _, interfaces, _, _, _) = parse_gir_string gir_xml in
  let iface = List.hd interfaces in

  (* When c:type is missing, parser should generate it as "Gtk" + name *)
  Alcotest.(check string) "C type should default" "GtkCustomInterface" iface.c_type

(* ========================================================================= *)
(* Enum Parsing Tests *)
(* ========================================================================= *)

let test_parse_enum () =
  let gir_xml = wrap_namespace {|
    <enumeration name="Orientation" c:type="GtkOrientation">
      <doc>Orientation enum</doc>
      <member name="horizontal" value="0" c:identifier="GTK_ORIENTATION_HORIZONTAL">
        <doc>Horizontal orientation</doc>
      </member>
      <member name="vertical" value="1" c:identifier="GTK_ORIENTATION_VERTICAL">
        <doc>Vertical orientation</doc>
      </member>
    </enumeration>
  |}
  in

  let (_, _, _, _, enums, _, _) = parse_gir_string gir_xml in

  Alcotest.(check int) "Should parse one enum" 1 (List.length enums);

  let orientation = List.hd enums in
  Alcotest.(check string) "Enum name" "Orientation" orientation.enum_name;
  Alcotest.(check string) "Enum c_type" "GtkOrientation" orientation.enum_c_type;
  Alcotest.(check int) "Enum has 2 members" 2 (List.length orientation.members);

  let horizontal = List.find (fun m -> m.member_name = "horizontal") orientation.members in
  Alcotest.(check int) "Member value" 0 horizontal.member_value;
  Alcotest.(check string) "Member c_identifier" "GTK_ORIENTATION_HORIZONTAL" horizontal.c_identifier

let test_parse_enum_missing_ctype () =
  let gir_xml = wrap_namespace {|
    <enumeration name="TestEnum">
      <member name="value1" value="0" c:identifier="TEST_VALUE1"/>
    </enumeration>
  |}
  in

  let (_, _, _, _, enums, _, _) = parse_gir_string gir_xml in

  (* Enum without c:type should be skipped *)
  Alcotest.(check int) "Should skip enum without c:type" 0 (List.length enums)

(* ========================================================================= *)
(* Bitfield Parsing Tests *)
(* ========================================================================= *)

let test_parse_bitfield () =
  let gir_xml = wrap_namespace {|
    <bitfield name="StateFlags" c:type="GtkStateFlags">
      <member name="normal" value="0" c:identifier="GTK_STATE_FLAG_NORMAL"/>
      <member name="active" value="1" c:identifier="GTK_STATE_FLAG_ACTIVE"/>
      <member name="prelight" value="2" c:identifier="GTK_STATE_FLAG_PRELIGHT"/>
      <member name="selected" value="4" c:identifier="GTK_STATE_FLAG_SELECTED"/>
    </bitfield>
  |}
  in

  let (_, _, _, _, _, bitfields, _) = parse_gir_string gir_xml in

  Alcotest.(check int) "Should parse one bitfield" 1 (List.length bitfields);

  let state_flags = List.hd bitfields in
  Alcotest.(check string) "Bitfield name" "StateFlags" state_flags.bitfield_name;
  Alcotest.(check string) "Bitfield c_type" "GtkStateFlags" state_flags.bitfield_c_type;
  Alcotest.(check int) "Bitfield has 4 flags" 4 (List.length state_flags.flags);

  let selected = List.find (fun f -> f.flag_name = "selected") state_flags.flags in
  Alcotest.(check int) "Flag value" 4 selected.flag_value;
  Alcotest.(check string) "Flag c_identifier" "GTK_STATE_FLAG_SELECTED" selected.flag_c_identifier

(* ========================================================================= *)
(* Record Parsing Tests *)
(* ========================================================================= *)

let test_parse_record () =
  let gir_xml = wrap_namespace {|
    <record name="Rectangle" c:type="GtkRectangle" glib:type-name="GtkRectangle" glib:get-type="gtk_rectangle_get_type">
      <doc>A rectangle structure</doc>
      <field name="x" readable="1" writable="1">
        <type name="gint" c:type="gint"/>
      </field>
      <field name="y" readable="1" writable="1">
        <type name="gint" c:type="gint"/>
      </field>
      <method name="contains_point" c:identifier="gtk_rectangle_contains_point">
        <return-value>
          <type name="gboolean" c:type="gboolean"/>
        </return-value>
        <parameters>
          <parameter name="x">
            <type name="gint" c:type="gint"/>
          </parameter>
          <parameter name="y">
            <type name="gint" c:type="gint"/>
          </parameter>
        </parameters>
      </method>
    </record>
  |}
  in

  let (_, _, _, _, _, _, records) = parse_gir_string gir_xml in

  Alcotest.(check int) "Should parse one record" 1 (List.length records);

  let rectangle = List.hd records in
  Alcotest.(check string) "Record name" "Rectangle" rectangle.record_name;
  Alcotest.(check string) "Record c_type" "GtkRectangle" rectangle.c_type;
  Alcotest.(check (option string)) "Record glib_type_name" (Some "GtkRectangle") rectangle.glib_type_name;
  Alcotest.(check (option string)) "Record glib_get_type" (Some "gtk_rectangle_get_type") rectangle.glib_get_type;
  Alcotest.(check int) "Record has 2 fields" 2 (List.length rectangle.fields);
  Alcotest.(check int) "Record has 1 method" 1 (List.length rectangle.methods);

  let x_field = List.find (fun f -> f.field_name = "x") rectangle.fields in
  Alcotest.(check bool) "Field is readable" true x_field.readable;
  Alcotest.(check bool) "Field is writable" true x_field.writable

let test_parse_opaque_record () =
  let gir_xml = wrap_namespace {|
    <record name="OpaqueData" c:type="GtkOpaqueData" opaque="1">
    </record>
  |}
  in

  let (_, _, _, _, _, _, records) = parse_gir_string gir_xml in
  let opaque = List.hd records in

  Alcotest.(check bool) "Record should be opaque" true opaque.opaque

(* ========================================================================= *)
(* Parameter Parsing Tests *)
(* ========================================================================= *)

let test_parse_nullable_parameters () =
  let gir_xml = wrap_namespace {|
    <class name="Widget" c:type="GtkWidget">
      <method name="set_parent" c:identifier="gtk_widget_set_parent">
        <return-value>
          <type name="none" c:type="void"/>
        </return-value>
        <parameters>
          <parameter name="parent" nullable="1">
            <type name="Widget" c:type="GtkWidget*"/>
          </parameter>
        </parameters>
      </method>
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in
  let widget = List.hd classes in
  let method_ = List.hd widget.methods in
  let param = List.hd method_.parameters in

  Alcotest.(check bool) "Parameter should be nullable" true param.nullable

let test_parse_parameter_directions () =
  let gir_xml = wrap_namespace {|
    <class name="Widget" c:type="GtkWidget">
      <method name="get_size" c:identifier="gtk_widget_get_size">
        <return-value>
          <type name="none" c:type="void"/>
        </return-value>
        <parameters>
          <parameter name="width" direction="out">
            <type name="gint" c:type="gint*"/>
          </parameter>
          <parameter name="height" direction="out">
            <type name="gint" c:type="gint*"/>
          </parameter>
        </parameters>
      </method>
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in
  let widget = List.hd classes in
  let method_ = List.hd widget.methods in

  Alcotest.(check int) "Should have 2 out parameters" 2 (List.length method_.parameters);

  let width = List.find (fun p -> p.param_name = "width") method_.parameters in
  Alcotest.(check bool) "Width is out parameter"
    (width.direction = Gir_gen_lib.Types.Out) true

let test_parse_throws_attribute () =
  let gir_xml = wrap_namespace {|
    <class name="File" c:type="GtkFile">
      <constructor name="new_for_path" c:identifier="gtk_file_new_for_path" throws="1">
        <return-value>
          <type name="File" c:type="GtkFile*"/>
        </return-value>
        <parameters>
          <parameter name="path">
            <type name="utf8" c:type="const gchar*"/>
          </parameter>
        </parameters>
      </constructor>
      <method name="read" c:identifier="gtk_file_read" throws="1">
        <return-value>
          <type name="utf8" c:type="gchar*"/>
        </return-value>
      </method>
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in
  let file = List.hd classes in

  let ctor = List.hd file.constructors in
  Alcotest.(check bool) "Constructor throws" true ctor.throws;

  let method_ = List.hd file.methods in
  Alcotest.(check bool) "Method throws" true method_.throws

(* ========================================================================= *)
(* Type Parsing Tests *)
(* ========================================================================= *)

let test_parse_type_with_ctype () =
  let gir_xml = wrap_namespace {|
    <class name="Label" c:type="GtkLabel">
      <method name="set_text" c:identifier="gtk_label_set_text">
        <return-value>
          <type name="none" c:type="void"/>
        </return-value>
        <parameters>
          <parameter name="text">
            <type name="utf8" c:type="const gchar*"/>
          </parameter>
        </parameters>
      </method>
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in
  let label = List.hd classes in
  let method_ = List.hd label.methods in
  let param = List.hd method_.parameters in

  Alcotest.(check string) "Type name" "utf8" param.param_type.name;
  Alcotest.(check (option string)) "Type c:type" (Some "const gchar*") param.param_type.c_type

let test_parse_type_without_ctype () =
  let gir_xml = wrap_namespace {|
    <class name="CustomWidget" c:type="GtkCustomWidget">
      <method name="do_something" c:identifier="gtk_custom_widget_do_something">
        <return-value>
          <type name="none"/>
        </return-value>
      </method>
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in
  let widget = List.hd classes in
  let method_ = List.hd widget.methods in

  Alcotest.(check string) "Return type name" "none" method_.return_type.name;
  Alcotest.(check (option string)) "Return type c:type should be None" None method_.return_type.c_type

(* ========================================================================= *)
(* Namespace Parsing Tests *)
(* ========================================================================= *)

let test_parse_namespace () =
  let gir_xml = wrap_namespace
    ~namespace_name:"CustomLib"
    ~version:"2.0"
    ~shared_library:"libcustom-2.0.so"
    ~c_prefix:"Custom"
    ~symbol_prefix:"custom"
    {|
    <class name="Widget" c:type="CustomWidget">
    </class>
  |}
  in

  let (_, namespace, _, _, _, _, _) = parse_gir_string gir_xml in

  Alcotest.(check string) "Namespace name" "CustomLib" namespace.namespace_name;
  Alcotest.(check string) "Namespace version" "2.0" namespace.namespace_version;
  Alcotest.(check string) "Shared library" "libcustom-2.0.so" namespace.namespace_shared_library;
  Alcotest.(check string) "C identifier prefixes" "Custom" namespace.namespace_c_identifier_prefixes;
  Alcotest.(check string) "C symbol prefixes" "custom" namespace.namespace_c_symbol_prefixes

(* ========================================================================= *)
(* Edge Cases and Missing Values *)
(* ========================================================================= *)

let test_parse_empty_class () =
  let gir_xml = wrap_namespace {|
    <class name="EmptyWidget" c:type="GtkEmptyWidget">
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in
  let empty = List.hd classes in

  Alcotest.(check int) "No constructors" 0 (List.length empty.constructors);
  Alcotest.(check int) "No methods" 0 (List.length empty.methods);
  Alcotest.(check int) "No properties" 0 (List.length empty.properties);
  Alcotest.(check int) "No signals" 0 (List.length empty.signals)

let test_parse_multiple_classes () =
  let gir_xml = wrap_namespace {|
    <class name="Button" c:type="GtkButton">
    </class>
    <class name="Label" c:type="GtkLabel">
    </class>
    <class name="Entry" c:type="GtkEntry">
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in

  Alcotest.(check int) "Should parse 3 classes" 3 (List.length classes);

  assert_true "Should contain Button"
    (list_contains ~pred:(fun c -> c.class_name = "Button") classes);
  assert_true "Should contain Label"
    (list_contains ~pred:(fun c -> c.class_name = "Label") classes);
  assert_true "Should contain Entry"
    (list_contains ~pred:(fun c -> c.class_name = "Entry") classes)

let test_parse_mixed_types () =
  let gir_xml = wrap_namespace {|
    <class name="Button" c:type="GtkButton">
    </class>
    <interface name="Editable" c:type="GtkEditable" c:symbol-prefix="editable">
    </interface>
    <enumeration name="Orientation" c:type="GtkOrientation">
      <member name="horizontal" value="0" c:identifier="GTK_ORIENTATION_HORIZONTAL"/>
    </enumeration>
    <bitfield name="StateFlags" c:type="GtkStateFlags">
      <member name="normal" value="0" c:identifier="GTK_STATE_FLAG_NORMAL"/>
    </bitfield>
    <record name="Rectangle" c:type="GtkRectangle">
    </record>
  |}
  in

  let (_, _, classes, interfaces, enums, bitfields, records) = parse_gir_string gir_xml in

  Alcotest.(check int) "Should have 1 class" 1 (List.length classes);
  Alcotest.(check int) "Should have 1 interface" 1 (List.length interfaces);
  Alcotest.(check int) "Should have 1 enum" 1 (List.length enums);
  Alcotest.(check int) "Should have 1 bitfield" 1 (List.length bitfields);
  Alcotest.(check int) "Should have 1 record" 1 (List.length records)

let test_parse_method_with_many_parameters () =
  let gir_xml = wrap_namespace {|
    <class name="TestClass" c:type="GtkTestClass">
      <method name="complex_method" c:identifier="gtk_test_class_complex_method">
        <return-value>
          <type name="gboolean" c:type="gboolean"/>
        </return-value>
        <parameters>
          <parameter name="p1"><type name="gint" c:type="gint"/></parameter>
          <parameter name="p2"><type name="gint" c:type="gint"/></parameter>
          <parameter name="p3"><type name="gint" c:type="gint"/></parameter>
          <parameter name="p4"><type name="gint" c:type="gint"/></parameter>
          <parameter name="p5"><type name="gint" c:type="gint"/></parameter>
          <parameter name="p6"><type name="gint" c:type="gint"/></parameter>
          <parameter name="p7"><type name="gint" c:type="gint"/></parameter>
          <parameter name="p8"><type name="gint" c:type="gint"/></parameter>
        </parameters>
      </method>
    </class>
  |}
  in

  let (_, _, classes, _, _, _, _) = parse_gir_string gir_xml in
  let test_class = List.hd classes in
  let method_ = List.hd test_class.methods in

  Alcotest.(check int) "Should parse all 8 parameters" 8 (List.length method_.parameters);

  (* Verify all parameters are correctly parsed *)
  for i = 1 to 8 do
    let param_name = sprintf "p%d" i in
    assert_true (sprintf "Should have parameter %s" param_name)
      (list_contains ~pred:(fun p -> p.param_name = param_name) method_.parameters)
  done

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    (* Class tests *)
    Alcotest.test_case "Parse simple class" `Quick test_parse_simple_class;
    Alcotest.test_case "Parse class without c:type" `Quick test_parse_class_without_ctype;
    Alcotest.test_case "Parse class with constructors" `Quick test_parse_class_with_constructors;
    Alcotest.test_case "Parse class with methods" `Quick test_parse_class_with_methods;
    Alcotest.test_case "Parse class with properties" `Quick test_parse_class_with_properties;
    Alcotest.test_case "Parse class with signals" `Quick test_parse_class_with_signals;

    (* Interface tests *)
    Alcotest.test_case "Parse interface" `Quick test_parse_interface;
    Alcotest.test_case "Parse interface without c:type" `Quick test_parse_interface_without_ctype;

    (* Enum tests *)
    Alcotest.test_case "Parse enum" `Quick test_parse_enum;
    Alcotest.test_case "Parse enum missing c:type" `Quick test_parse_enum_missing_ctype;

    (* Bitfield tests *)
    Alcotest.test_case "Parse bitfield" `Quick test_parse_bitfield;

    (* Record tests *)
    Alcotest.test_case "Parse record" `Quick test_parse_record;
    Alcotest.test_case "Parse opaque record" `Quick test_parse_opaque_record;

    (* Parameter tests *)
    Alcotest.test_case "Parse nullable parameters" `Quick test_parse_nullable_parameters;
    Alcotest.test_case "Parse parameter directions" `Quick test_parse_parameter_directions;
    Alcotest.test_case "Parse throws attribute" `Quick test_parse_throws_attribute;

    (* Type tests *)
    Alcotest.test_case "Parse type with c:type" `Quick test_parse_type_with_ctype;
    Alcotest.test_case "Parse type without c:type" `Quick test_parse_type_without_ctype;

    (* Namespace tests *)
    Alcotest.test_case "Parse namespace" `Quick test_parse_namespace;

    (* Edge cases *)
    Alcotest.test_case "Parse empty class" `Quick test_parse_empty_class;
    Alcotest.test_case "Parse multiple classes" `Quick test_parse_multiple_classes;
    Alcotest.test_case "Parse mixed types" `Quick test_parse_mixed_types;
    Alcotest.test_case "Parse method with many parameters" `Quick test_parse_method_with_many_parameters;
  ]
