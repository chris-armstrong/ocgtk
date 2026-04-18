(* Shared fixtures for override test suites. *)

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

let write_temp_file content =
  let tmp = Filename.temp_file "test_gir" ".gir" in
  let oc = open_out tmp in
  output_string oc content;
  close_out oc;
  tmp
