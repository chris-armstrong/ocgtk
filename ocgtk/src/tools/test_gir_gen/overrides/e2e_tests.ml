(* End-to-end smoke test for the override pipeline.
 *
 * Parses a synthetic GIR XML string, applies programmatic overrides
 * (ignore Button class, ignore Widget.create method), and asserts on
 * the apply_overrides result.
 *)

open Gir_gen_lib.Override_types

(* Minimal synthetic GIR XML with two classes and a few methods. *)
let synthetic_gir_xml =
  {|<?xml version="1.0"?>
<repository version="1.2"
  xmlns="http://www.gtk.org/introspection/core/1.0"
  xmlns:c="http://www.gtk.org/introspection/c/1.0"
  xmlns:glib="http://www.gtk.org/introspection/glib/1.0">
  <namespace name="Gtk" version="4.0"
             shared-library="libgtk-4.so.1"
             c:identifier-prefixes="Gtk"
             c:symbol-prefixes="gtk">
    <class name="Widget"
           c:type="GtkWidget"
           glib:type-name="GtkWidget"
           glib:get-type="gtk_widget_get_type"
           parent="GObject.Object">
      <constructor name="new" c:identifier="gtk_widget_new" introspectable="1">
        <return-value transfer-ownership="none">
          <type name="Widget" c:type="GtkWidget*"/>
        </return-value>
      </constructor>
      <method name="create" c:identifier="gtk_widget_create" introspectable="1">
        <return-value transfer-ownership="none">
          <type name="none" c:type="void"/>
        </return-value>
      </method>
      <method name="show" c:identifier="gtk_widget_show" introspectable="1">
        <return-value transfer-ownership="none">
          <type name="none" c:type="void"/>
        </return-value>
      </method>
    </class>
    <class name="Button"
           c:type="GtkButton"
           glib:type-name="GtkButton"
           glib:get-type="gtk_button_get_type"
           parent="Widget">
      <constructor name="new" c:identifier="gtk_button_new" introspectable="1">
        <return-value transfer-ownership="none">
          <type name="Button" c:type="GtkButton*"/>
        </return-value>
      </constructor>
    </class>
  </namespace>
</repository>|}

(* Write [content] to a fresh temporary file and return its path. *)
let write_temp_file content =
  let tmp = Filename.temp_file "test_override_e2e" ".gir" in
  let oc = open_out tmp in
  output_string oc content;
  close_out oc;
  tmp

(* Programmatic overrides: ignore Button, ignore Widget.create *)
let test_overrides =
  {
    library_name = "Gtk";
    classes =
      [
        {
          class_name = "Button";
          class_action = Some Ignore;
          constructors = [];
          methods = [];
          properties = [];
          signals = [];
        };
        {
          class_name = "Widget";
          class_action = None;
          constructors = [];
          methods = [ { component_name = "create"; action = Ignore } ];
          properties = [];
          signals = [];
        };
      ];
    interfaces = [];
    records = [];
    enums = [];
    bitfields = [];
    functions = [];
  }

(* E2E test: parse synthetic GIR, apply overrides, check results. *)
let test_e2e_ignore_class_and_method () =
  let tmp = write_temp_file synthetic_gir_xml in
  Fun.protect
    ~finally:(fun () -> Sys.remove tmp)
    (fun () ->
      let ( _repository,
            _namespace,
            classes,
            interfaces,
            enums,
            bitfields,
            records ) =
        Gir_gen_lib.Parse.Gir_parser.parse_gir_file tmp []
      in
      let result =
        Gir_gen_lib.Override_apply.apply_overrides ~overrides:test_overrides
          ~classes ~interfaces ~enums ~bitfields ~records ~functions:[]
      in

      (* Button should be absent from classes *)
      let button_present =
        List.exists
          (fun (c : Gir_gen_lib.Types.gir_class) ->
            String.equal c.class_name "Button")
          result.classes
      in
      Alcotest.(check bool) "Button absent from classes" false button_present;

      (* Button should appear in ignored_entities *)
      let button_ignored =
        List.exists (fun s -> String.equal s "Button") result.ignored_entities
      in
      Alcotest.(check bool) "Button in ignored_entities" true button_ignored;

      (* Widget should still be present *)
      let widget_opt =
        List.find_opt
          (fun (c : Gir_gen_lib.Types.gir_class) ->
            String.equal c.class_name "Widget")
          result.classes
      in
      Alcotest.(check bool)
        "Widget present in classes" true
        (Option.is_some widget_opt);

      (* Widget.create should be absent from Widget's methods *)
      let widget = Option.get widget_opt in
      let create_present =
        List.exists
          (fun (m : Gir_gen_lib.Types.gir_method) ->
            String.equal m.method_name "create")
          widget.methods
      in
      Alcotest.(check bool)
        "Widget.create absent from methods" false create_present;

      (* Widget.show should still be present *)
      let show_present =
        List.exists
          (fun (m : Gir_gen_lib.Types.gir_method) ->
            String.equal m.method_name "show")
          widget.methods
      in
      Alcotest.(check bool) "Widget.show present in methods" true show_present;

      (* No warnings — all override names exist in the parsed GIR *)
      Alcotest.(check int) "no warnings" 0 (List.length result.warnings))

let test_suite =
  [
    ( "e2e: ignore class and method via parsed GIR",
      `Quick,
      test_e2e_ignore_class_and_method );
  ]
