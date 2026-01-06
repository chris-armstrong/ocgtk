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

### 2. Properties Without Explicit Methods Are Not Generated [FIXED]

**Status**: ✅ **FIXED** - Parser bug fixed on 2025-12-18

**Impact**: GObject properties defined in GIR without corresponding `<method>` elements were not getting accessor functions generated.

**Root Cause**: **Parser Bug** in `src/tools/gir_gen/parse/gir_parser.ml`

The `parse_property` function's `parse_prop_contents` recursive parser had a bug where it didn't continue parsing after encountering a `<doc>` element. After calling `element_data()` to read the documentation text, it failed to recursively call `parse_prop_contents()` again, causing the parser to exit prematurely and only extract the first property from each class.

**Fix Applied**:
Added the missing recursive call in `src/tools/gir_gen/parse/gir_parser.ml`:
```ocaml
| `El_start ((_, "doc"), _) ->
  doc := element_data ();
  parse_prop_contents ()  (* <-- This line was missing *)
```

**Verification**:
After the fix, PasswordEntry now correctly extracts all 4 properties (previously only extracted 1):
- `activates-default` ✅
- `extra-menu` ✅ (parsed but not generated due to missing GMenuModel* type mapping)
- `placeholder-text` ✅
- `show-peek-icon` ✅

Properties with valid type mappings (`activates-default`, `placeholder-text`, `show-peek-icon`) are now correctly generated using `g_object_get_property` / `g_object_set_property` via the existing property generation infrastructure in `c_stubs.ml` lines 668-818 and `ml_interface.ml` lines 230-273.

**Remaining Issue**:
Properties using types from other namespaces (like `GMenuModel*` from Gio) still cannot be generated due to missing type mappings (see Issue #1: Missing Type Mapping for GMenuModel*).

---

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
```

## Methods and properties with interface parameters are suppressed [INTENTIONAL]

**Status**: ⚠️ **INTENTIONALLY SUPPRESSED** - Fixed on 2025-12-26

**Impact**: Methods that accept interface types as parameters and properties that have interface types are not generated in layer 2 (high-level wrapper) classes.

**Affected**:
- Methods like `Widget_class.set_template_scope` (takes `BuilderScope` interface)
- Methods like `Selection_filter_model.set_model` (takes `SelectionModel` interface)
- Properties with interface types

**Root Cause**: Interface types require special handling because they're implemented by multiple classes. The layer 2 generator was trying to pass high-level object wrappers (e.g., `GBuilder_scope.builder_scope` which is an OCaml object) where the layer 1 API expects a variant type (e.g., `Builder_scope.t = [`builder_scope] Gobject.obj`).

**Workaround**: Use layer 1 (low-level) APIs directly when interface parameters are needed.

**Fix Applied**:
- Added interface parameter detection in `src/tools/gir_gen/generate/class_gen.ml` (lines 250-278, 479-508)
- Methods with interface parameters are now skipped during layer 2 generation
- Added interface type detection in `src/tools/gir_gen/generate/filtering.ml` (lines 30-39)
- Properties with interface types are now skipped during generation

**Future Work**: Implement proper interface parameter handling by:
1. Creating proper type coercion from high-level objects to layer 1 interface types
2. Adding `as_<interface>` accessor methods for interface conversions
3. Supporting interface-typed properties with proper wrapping

---

## Cross-namespace enum/bitfield types are suppressed [INTENTIONAL]

**Status**: ⚠️ **INTENTIONALLY SUPPRESSED** - Fixed on 2025-12-26

**Impact**: Methods and constructors that use enum or bitfield types from external namespaces are not generated in either layer 1 (low-level FFI) or layer 2 (high-level wrapper) classes.

**Example**:
- `EventController.get_current_event_state()` returns `Gdk.ModifierType` (from Gdk namespace) but is being generated in Gtk namespace
- `KeyvalTrigger.new_()` takes `Gdk.ModifierType` as a parameter

**Affected**:
- Constructors with Gdk, Gio, Pango, GdkPixbuf, Gsk, or Graphene enum/bitfield parameters when generating Gtk bindings
- Methods with Gdk, Gio, Pango, GdkPixbuf, Gsk, or Graphene enum/bitfield parameters or return types when generating Gtk bindings

**Root Cause**: The type qualification system currently only handles same-namespace types correctly. Cross-namespace enums/bitfields result in incorrect type names like `Gtk_enums.modifiertype` (wrong namespace) instead of `Gdk_enums.modifiertype` (correct namespace).

**Workaround**: None currently available. These methods are completely suppressed from generation.

**Fix Applied**:
- Added utility functions in `src/tools/gir_gen/generate/filtering.ml`:
  - `is_cross_namespace_enum_or_bitfield` - Checks if a type name refers to an external namespace enum/bitfield
  - `method_has_cross_namespace_types` - Checks methods for cross-namespace types
  - `constructor_has_cross_namespace_types` - Checks constructors for cross-namespace types
- Layer 1 (low-level FFI) generation in `src/tools/gir_gen/generate/ml_interface.ml`:
  - Constructors with cross-namespace types are skipped (line 176-177)
  - Methods with cross-namespace types are skipped (line 242, 249)
- Layer 2 (high-level wrapper) generation in `src/tools/gir_gen/generate/class_gen.ml`:
  - Methods with cross-namespace types are skipped using the utility function
- Uses `ctx.external_enums` and `ctx.external_bitfields` to detect cross-namespace types
- Handles both "ModifierType" and "Gdk.ModifierType" name formats

**Future Work**: Implement proper cross-namespace type support by:
1. Enhancing type mapping to correctly qualify external namespace types
2. Ensuring external namespace enum modules are properly imported/referenced
3. Adding proper namespace prefix resolution in type generation
4. Re-enabling cross-namespace type generation once proper qualification is in place

---

## Val_x and X_val conversion macros not being added to generated_forward_decls.h for all types

Some types like GtkBuilderScope and GtkSelectionModel are not having Val_GtkBuilderScope and GtkBuilderScope_val macros generated in generated_forward_decls.h for use by other ml_*_gen.c files, resulting in `warning: implicit generation of function`.

## Val_x and X_val macros need to be generated per-library and shared

We are currently generating the Val_x and X_val macros for each library and its dependencies - ideally we'd generate one per library in a header and share it based on recursive library dependencies (which we could figure out from the <repository> and <namespace> tags in the GIR)

## Static methods (i.e.  <function> declarations) wrappers are not generated

These are static function wrappers which operate similar to methods, but don't have an implicit self parameter. We should add support to c_stubs.ml and ml_interface.ml for them. 

## Interfaces are not generated, nor are virtual methods

<interface> elements are not being parsed and generated. They should be generated as virtual classes in OCaml.

<virtual-method> elements are not being parsed and generated either. They must be virtual methods (as they are handled by their subclasses) and make their owning class virtual.

## No support for GObject signals

<signal> elements are not being parsed and generated.

