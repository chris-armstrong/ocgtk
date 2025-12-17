# Known Bugs and Limitations

## GIR Parser and Code Generator Issues

### 1. Missing Type Mapping for `GMenuModel*` (Gio Namespace)

**Impact**: Methods and properties that use `Gio.MenuModel` types are being skipped during code generation.

**Affected Classes**: Multiple widgets including:
- PasswordEntry
- Entry
- Label
- Text
- And many others with menu-related functionality

**Missing Methods/Properties**:
- `get_extra_menu()` / `set_extra_menu()` methods
- `extra-menu` properties
- `get_menubar()` / `set_menubar()` methods
- `get_header_menu()` / `set_header_menu()` methods
- `menu-model` properties

**Root Cause**: The type mapping system in `src/tools/gir_gen/type_mappings.ml` does not include a mapping for `GMenuModel*` (from the Gio namespace). When the generator encounters this type, it skips the method with a warning:
```
Skipping method set_extra_menu: unknown parameter type GMenuModel* for parameter model
Skipping method get_extra_menu: unknown return type GMenuModel*
```

**Example - PasswordEntry**:
```ocaml
(* Currently missing from password_entry.mli: *)
(* external get_extra_menu : t -> Gio.MenuModel.t option *)
(* external set_extra_menu : t -> Gio.MenuModel.t option -> unit *)
```

**Workaround**: None currently available. Users cannot access menu-related functionality through the OCaml bindings.

**Fix Required**: Add type mappings for Gio namespace types, particularly:
- `GMenuModel*`
- Other Gio types that may be referenced by GTK widgets

---

### 2. Properties Without Explicit Methods Are Not Generated

**Impact**: GObject properties defined in GIR without corresponding `<method>` elements do not get accessor functions generated.

**Affected Properties**: Properties that are defined as `<property>` elements but lack explicit `<method name="get_*">` and `<method name="set_*">` elements in the GIR XML.

**Example - PasswordEntry**:

From `/usr/share/gir-1.0/Gtk-4.0.gir`:
```xml
<class name="PasswordEntry">
  <!-- This property has NO corresponding <method> elements -->
  <property name="activates-default" writable="1">
    <type name="gboolean" c:type="gboolean"/>
  </property>

  <!-- This property has NO corresponding <method> elements -->
  <property name="placeholder-text" writable="1">
    <type name="utf8" c:type="gchar*"/>
  </property>

  <!-- This property HAS corresponding methods, so it's generated -->
  <property name="show-peek-icon" writable="1"
            setter="set_show_peek_icon"
            getter="get_show_peek_icon">
    <type name="gboolean"/>
  </property>
  <method name="get_show_peek_icon" ...>
  <method name="set_show_peek_icon" ...>
</class>
```

**Current Behavior**:
- `show-peek-icon` → ✓ Generated (has `<method>` elements)
- `activates-default` → ✗ NOT generated (no `<method>` elements)
- `placeholder-text` → ✗ NOT generated (no `<method>` elements)

**Root Cause**: The code generator has infrastructure to generate property accessors from `<property>` elements directly:
- `src/tools/gir_gen/generate/c_stubs.ml` lines 851-859
- `src/tools/gir_gen/generate/ml_interface.ml` lines 230-273

However, these code paths are either:
1. Not being reached, OR
2. Properties without methods are being filtered out before reaching the generation code

The generator primarily creates bindings from `<method>` elements, not standalone `<property>` elements.

**Comparison - Adjustment Class**:
The Adjustment class works correctly because it has BOTH property and method definitions:
```xml
<class name="Adjustment">
  <property name="value" .../>
  <method name="get_value" .../>  <!-- Explicit method -->
  <method name="set_value" .../>  <!-- Explicit method -->
</class>
```

**Impact on PasswordEntry**: Users cannot access the following properties through the OCaml bindings:
```ocaml
(* Missing from password_entry.mli: *)
(* external get_activates_default : t -> bool *)
(* external set_activates_default : t -> bool -> unit *)
(* external get_placeholder_text : t -> string option *)
(* external set_placeholder_text : t -> string option -> unit *)
```

**Workaround**:
- For PasswordEntry, these properties can be accessed through inherited Entry functionality if using Entry widgets directly
- Alternatively, use GObject property access functions (g_object_get/set) via FFI if absolutely necessary

**Fix Required**:
1. Ensure properties without explicit methods are passed to the property generation code
2. Generate C stubs using `g_object_get_property` / `g_object_set_property` for properties lacking dedicated getter/setter methods
3. Update the filtering logic to include properties that have valid type mappings, regardless of whether they have associated methods

---

### 3. Parser Status

**The GIR parser (`src/tools/gir_gen/parse/gir_parser.ml`) is working correctly.**

It successfully parses:
- All `<method>` elements (4 methods for PasswordEntry)
- All `<property>` elements (4 properties for PasswordEntry)
- All `<signal>` elements
- All `<constructor>` elements

The issue is in the **code generation phase**, not the parsing phase.

---

## Investigation Summary

**Date**: 2025-12-18

**Investigation Method**:
1. Examined GTK GIR file at `/usr/share/gir-1.0/Gtk-4.0.gir`
2. Ran code generator with debug output to identify skip messages
3. Compared generated code with GIR definitions
4. Analyzed multiple widget classes (PasswordEntry, Entry, Label, Adjustment) to identify patterns

**Key Findings**:
- PasswordEntry has 4 methods in GIR, but only 2 are generated (50% loss)
- PasswordEntry has 4 properties in GIR, but only 1 has accessors generated (75% loss)
- The same issues affect many other GTK widgets
- Type mapping gaps and property generation logic are the root causes

## Non-class/record/interface types and types from other libraries prevent method and property generation

There are a number of types which are skipped by gir_gen in `type_mapping.ml` which prevent property and method generation:
1. Types from other libraries such as GDK or GIO e.g.
```
Skipping method set_logo: unknown parameter type GdkPaintable* for parameter logo
Skipping method set_menubar: unknown parameter type GMenuModel* for parameter menubar
```
```xml
        <return-value transfer-ownership="none" nullable="1">
          <doc xml:space="preserve"
               filename="gtk/gtkapplication.c"
               line="886">the menubar for windows of `application`</doc>
          <type name="Gio.MenuModel" c:type="GMenuModel*"/>
        </return-value>
```
```xml
        <return-value transfer-ownership="none">
          <doc xml:space="preserve"
               filename="gtk/gtkapplication.c"
               line="759">a `GList` of `GtkWindow`
  instances</doc>
          <type name="GLib.List" c:type="GList*">
            <type name="Window"/>
          </type>
        </return-value>
```

2. array parameters e.g. "documenters" e.g.

```xml
          <parameter name="documenters" transfer-ownership="none">
            <doc xml:space="preserve"
                 filename="gtk/gtkaboutdialog.c"
                 line="1463">the authors of the documentation
  of the application</doc>
            <array c:type="const char**">
              <type name="utf8" c:type="char*"/>
            </array>
          </parameter>
```          
```xml
      <property name="authors"
                writable="1"
                transfer-ownership="none"
                setter="set_authors"
                getter="get_authors">
        <attribute name="org.gtk.Property.get"
                   value="gtk_about_dialog_get_authors"/>
        <attribute name="org.gtk.Property.set"
                   value="gtk_about_dialog_set_authors"/>
        <doc xml:space="preserve"
             filename="gtk/gtkaboutdialog.c"
             line="509">The authors of the program, as a `NULL`-terminated array of strings.

Each string may contain email addresses and URLs, which will be displayed
as links, see the introduction for more details.</doc>
        <array>
          <type name="utf8"/>
        </array>
      </property>
```

3. GObject types which require special handling like GClosure*, GCallback, gssize, GDateTime*, etc.
4. Callback function parameters e.g. GtkListBoxSortFunc, GtkListBoxUpdateHeaderFunc

```
Skipping method set_sort_func: unknown parameter type GtkListBoxSortFunc for parameter sort_func
Skipping method set_header_func: unknown parameter type GtkListBoxUpdateHeaderFunc for parameter update_header
Skipping method set_filter_func: unknown parameter type GtkListBoxFilterFunc for parameter filter_func
Skipping method selected_foreach: unknown parameter type GtkListBoxForeachFunc for parameter func
```
```xml
    <callback name="ListBoxSortFunc" c:type="GtkListBoxSortFunc">
      <doc xml:space="preserve"
           filename="gtk/gtklistbox.h"
           line="84">Compare two rows to determine which should be first.</doc>
      <source-position filename="gtk/gtklistbox.h" line="95"/>
      <return-value transfer-ownership="none">
        <doc xml:space="preserve"
             filename="gtk/gtklistbox.h"
             line="92">&lt; 0 if @row1 should be before @row2, 0 if they are
  equal and &gt; 0 otherwise</doc>
        <type name="gint" c:type="int"/>
      </return-value>
      <parameters>
        <parameter name="row1" transfer-ownership="none">
          <doc xml:space="preserve"
               filename="gtk/gtklistbox.h"
               line="86">the first row</doc>
          <type name="ListBoxRow" c:type="GtkListBoxRow*"/>
        </parameter>
        <parameter name="row2" transfer-ownership="none">
          <doc xml:space="preserve"
               filename="gtk/gtklistbox.h"
               line="87">the second row</doc>
          <type name="ListBoxRow" c:type="GtkListBoxRow*"/>
        </parameter>
        <parameter name="user_data"
                   transfer-ownership="none"
                   nullable="1"
                   allow-none="1"
                   closure="2">
          <doc xml:space="preserve"
               filename="gtk/gtklistbox.h"
               line="88">user data</doc>
          <type name="gpointer" c:type="gpointer"/>
        </parameter>
      </parameters>
    </callback>
    <callback name="ListBoxUpdateHeaderFunc"
              c:type="GtkListBoxUpdateHeaderFunc">
      <doc xml:space="preserve"
           filename="gtk/gtklistbox.h"
           line="99">Whenever @row changes or which row is before @row changes this
is called, which lets you update the header on @row.

You may remove or set a new one via [method@Gtk.ListBoxRow.set_header]
or just change the state of the current header widget.</doc>
      <source-position filename="gtk/gtklistbox.h" line="111"/>
      <return-value transfer-ownership="none">
        <type name="none" c:type="void"/>
      </return-value>
      <parameters>
        <parameter name="row" transfer-ownership="none">
          <doc xml:space="preserve"
               filename="gtk/gtklistbox.h"
               line="101">the row to update</doc>
          <type name="ListBoxRow" c:type="GtkListBoxRow*"/>
        </parameter>
        <parameter name="before"
                   transfer-ownership="none"
                   nullable="1"
                   allow-none="1">
          <doc xml:space="preserve"
               filename="gtk/gtklistbox.h"
               line="102">the row before @row, or %NULL if it is first</doc>
          <type name="ListBoxRow" c:type="GtkListBoxRow*"/>
        </parameter>
        <parameter name="user_data"
                   transfer-ownership="none"
                   nullable="1"
                   allow-none="1"
                   closure="2">
          <doc xml:space="preserve"
               filename="gtk/gtklistbox.h"
               line="103">user data</doc>
          <type name="gpointer" c:type="gpointer"/>
        </parameter>
      </parameters>
    </callback>
```

## Layer 1 polymorphism support does not use extensible variants

Layer 1 variant types are generated as closed variants with a constructor for each class in their
inheritence chain i.e.

type t = [`button | `widget | `initially_unowned] Gobject.obj

This means if we want to coerce the type to a superclass, we have to use Obj.magic in the `as_<class_name>` converter i.e.:

```ocaml
let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj
```

If we instead used an open variant type, this would become unnecessary, and we would simply
be able to pass objects of type `t` as-is, and remove the `as_<class_name>` functions.

It would require:

* defining `t` as an open variant e.g.:

type 'a t = ([> `button | `widget | `initially_unowned] as 'a) Gobject.obj

* updating generated layer 1 wrapper types with an 'a parameter

```
(** Create a new Button *)
external new_from_icon_name : string -> 'a t = "ml_gtk_button_new_from_icon_name"
(** Sets the text of the label of the button to @label.

This will also clear any previously set labels. *)
external set_label : 'a t -> string -> unit = "ml_gtk_button_set_label"
````



