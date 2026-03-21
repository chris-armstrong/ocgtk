# Known Bugs and Limitations

## GIR Parser and Code Generator Issues

### 1. Missing Type Mapping for `GMenuModel*` (Gio Namespace) [FIXED]

**Status**: ✅ **FIXED** — Gio is now a fully generated library with cross-namespace type resolution. `GMenuModel*` resolves via cross-references to `Ocgtk_gio.Gio.Wrappers.Menu_model.t`.

---

### 2. Properties Without Explicit Methods Are Not Generated [FIXED]

**Status**: ✅ **FIXED** - Parser bug fixed on 2025-12-18

The `parse_property` function's `parse_prop_contents` recursive parser had a missing recursive call after `<doc>` elements. Fix: added `parse_prop_contents ()` after `element_data ()`.

---

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
4. **GLib collection types**: `GList`, `GSList` (partially supported via `GPtrArray`)

---

## Layer 1 polymorphism support does not use extensible variants

Layer 1 variant types are generated as closed variants with a constructor for each class in their
inheritance chain i.e.

```ocaml
type t = [`button | `widget | `initially_unowned] Gobject.obj
```

This means if we want to coerce the type to a superclass, we have to use `Obj.magic` in the `as_<class_name>` converter. If we instead used an open variant type, this would become unnecessary:

```ocaml
type 'a t = ([> `button | `widget | `initially_unowned] as 'a) Gobject.obj
```

---

## Methods and properties with interface parameters are suppressed [INTENTIONAL]

**Status**: ⚠️ **INTENTIONALLY SUPPRESSED** - Fixed on 2025-12-26

Methods that accept interface types as parameters are skipped during layer 2 generation. Interface types require special handling because they're implemented by multiple classes.

**Workaround**: Use layer 1 (low-level) APIs directly when interface parameters are needed.

**Future Work**: Implement proper interface parameter handling with `as_<interface>` accessor methods.

---

## Cross-namespace enum/bitfield types are suppressed [FIXED]

**Status**: ✅ **FIXED** — 2026-03-18

Cross-namespace enum/bitfield types now generate correctly. The filtering functions (`is_cross_namespace_enum_or_bitfield`, `method_has_cross_namespace_types`, `constructor_has_cross_namespace_types`) and the `external_enums`/`external_bitfields` context fields have been completely removed. Type resolution uses `cross_references` for all cross-namespace types.

---

## Val_x and X_val conversion macros per-library sharing [FIXED]

**Status**: ✅ **FIXED** — Each library now generates `<ns>_decls.h` with its own converters. Dependent libraries include them via `#include "<dep>_decls.h"`. The old `generated_forward_decls.h` no longer exists.

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
