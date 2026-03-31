# Known Bugs and Limitations

## Types that still prevent method and property generation

The following type categories cause methods/properties to be skipped:

1. **GObject types requiring special handling**: `GClosure*`, `GCallback`, `gssize`, `GDateTime*`, etc.
2. **Array parameters** (partially supported — string arrays work, some edge cases remain):
```xml
<parameter name="documenters" transfer-ownership="none">
  <array c:type="const char**">
    <type name="utf8" c:type="char*"/>
  </array>
</parameter>
```
3. **Callback function parameters**: `GtkListBoxSortFunc`, `GtkListBoxUpdateHeaderFunc`, etc.

---

## Methods and properties with interface parameters are suppressed [INTENTIONAL]

**Status**: ⚠️ **INTENTIONALLY SUPPRESSED** - Fixed on 2025-12-26

Methods that accept interface types as parameters are skipped during layer 2 generation. Interface types require special handling because they're implemented by multiple classes.

**Workaround**: Use layer 1 (low-level) APIs directly when interface parameters are needed.

**Future Work**: Implement proper interface parameter handling with `as_<interface>` accessor methods.

---

## Static methods (i.e. `<function>` declarations) wrappers are not generated

These are static function wrappers which operate similar to methods, but don't have an implicit self parameter. Support should be added to `c_stubs.ml` and `layer1_method.ml`.

---

## Interfaces are not fully generated, nor are virtual methods

`<interface>` elements are parsed and generated as classes, but should be generated as virtual classes with virtual methods. `<virtual-method>` elements are not parsed or generated.

---

## No support for GObject signals with parameters

Only parameterless void signals are generated. Signals with parameters or return values are skipped. See `generate/signal_gen.ml`.

---

## When a parameter type is `<varargs>`, we are not handling it correctly

`<varargs>` is not parsed, and we default it to `void`. The method is correctly suppressed, but we should handle this more gracefully and not default types.

---

## GList/GSList of interface types generates broken C stubs [KNOWN ISSUE]

**Status**: ⚠️ **KNOWN ISSUE** - Affects interface element types

When generating C stubs for GList/GSList parameters containing interface types (e.g., `GSList<Gio.File>` in `gdk_file_list_new_from_list`), the generator produces incorrect code that attempts to copy the interface struct by value.

**Root cause**: GObject interfaces don't have public struct definitions—they're opaque types accessed only via pointers. The C stub generator incorrectly treats them as value types.

**Impact**: Methods and constructors using GList/GSList of interface types are currently filtered out during generation.

**Workaround**: 
- For same-namespace class types (e.g., `Window.t`, `Texture.t`): Works correctly
- For interface types: Currently filtered out; use manual C stubs if needed

**Related**: See `filtering.ml:is_interface_type` and `list_has_interface_element` for current filtering logic.
