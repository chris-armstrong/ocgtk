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
