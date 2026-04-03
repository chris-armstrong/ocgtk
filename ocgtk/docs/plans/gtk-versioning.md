# GTK API Versioning Plan

## Goal

Support different GTK versions (e.g. 4.0 through 4.16) from a single generated source tree using compile-time version guards, so users building on older GTK get a working subset of bindings without needing separate codegen per version.

## Decisions

- **Approach A first** (C-only guards with runtime fallback), then **Approach B** (cppo compile-time guards) later
- **Version inheritance**: YES — methods without explicit version inherit from parent class/interface version. (Note: Rust gtk-rs does NOT do this — each element carries its own GIR version independently. We diverge here intentionally.)
- **Minimum supported version**: 4.0 (namespace baseline) — guard everything with an explicit version
- **Prototype library**: Pango

## Key Facts

- **1,621** versioned elements in `Gtk-4.0.gir` (72% are `version="4.10"`)
- **16** versioned classes in GTK (AlertDialog, ColorDialog, FileDialog, etc. — all 4.10+)
- **4** versioned interfaces, **7** versioned records in GTK
- Pango: **32** versioned methods out of 454 total, versions spanning 1.2–1.52
- Most C libraries provide compile-time `*_CHECK_VERSION(major,minor,micro)` macros (GDK/GSK are exceptions — use GTK's)
- Generator currently parses `namespace_version` but ignores per-element `version` attributes

### Version-check macro mapping (VERIFIED)

| Namespace | Macro | Notes |
|-----------|-------|-------|
| Gtk | `GTK_CHECK_VERSION(M,m,u)` | `<gtk/gtkversion.h>` |
| Gdk | `GTK_CHECK_VERSION(M,m,u)` | No own macro; part of gtk4, versions in lockstep |
| Gsk | `GTK_CHECK_VERSION(M,m,u)` | No version macros at all; part of gtk4, versions in lockstep |
| Pango | `PANGO_VERSION_CHECK(M,m,u)` | `<pango/pango-utils.h>` |
| PangoCairo | `PANGO_VERSION_CHECK(M,m,u)` | Same as Pango |
| GdkPixbuf | `GDK_PIXBUF_CHECK_VERSION(M,m,u)` | `<gdk-pixbuf/gdk-pixbuf-macros.h>` |
| Gio | `GLIB_CHECK_VERSION(M,m,u)` | `<glib/gversion.h>` |
| Graphene | `GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(M,m,u)` | `<graphene-version-macros.h>` - the check macro is inverted for graphene |
| Cairo | `CAIRO_VERSION >= CAIRO_VERSION_ENCODE(M,m,u)` | No CHECK macro; use encode comparison. Only 4 versioned elements in GIR |

---

## Implementation Plan — Approach A (C-only guards)

### Phase 1: Parse version attributes from GIR ✅ DONE

**Files modified:**
- `types.ml` — `version : string option` added to all 8 types; `entity` wrapper and `entity_of_*` functions updated
- `parse/gir_parser.ml` — `get_attr "version"` at all construction sites
- `test_gir_gen/util/type_factory.ml` — New: smart constructors with `?version` optional param; tests refactored to use it

**Commits:** `f8e160ba`

### Phase 2: Version guard nesting logic ✅ DONE

Guards are applied at **two levels** — class-level and member-level — and nest naturally:

1. **Class/interface/record has a version** → wrap the entire generated `.c` file body in a class-level guard. All members inherit this guard implicitly.
2. **Member has its own version (higher than class)** → add an additional inner guard around that specific member.
3. **Member has no explicit version, class has one** → no extra guard needed (already inside class guard).
4. **Neither has a version** → no guard (available since namespace baseline).

Example for `AlertDialog` (class version 4.10) with a method added in 4.12:

```c
/* ml_alert_dialog_gen.c */
#include <gtk/gtk.h>
#include <caml/mlvalues.h>
// ... includes ...

#if GTK_CHECK_VERSION(4,10,0)

CAMLprim value ml_gtk_alert_dialog_new(value unit) {
  // constructor — no extra guard, inherits 4.10 from class
}

CAMLprim value ml_gtk_alert_dialog_get_message(value self) {
  // method — no extra guard, inherits 4.10 from class
}

#if GTK_CHECK_VERSION(4,12,0)
CAMLprim value ml_gtk_alert_dialog_some_new_method(value self) {
  // method added in 4.12 — needs its own guard inside the 4.10 block
}
#else
CAMLprim value ml_gtk_alert_dialog_some_new_method(value self) {
  (void)self;
  caml_failwith("gtk_alert_dialog_some_new_method requires GTK >= 4.12");
}
#endif

#else
/* Fallback stubs for all AlertDialog methods when GTK < 4.10 */
CAMLprim value ml_gtk_alert_dialog_new(value unit) {
  (void)unit;
  caml_failwith("GtkAlertDialog requires GTK >= 4.10");
}
CAMLprim value ml_gtk_alert_dialog_get_message(value self) {
  (void)self;
  caml_failwith("GtkAlertDialog requires GTK >= 4.10");
}
CAMLprim value ml_gtk_alert_dialog_some_new_method(value self) {
  (void)self;
  caml_failwith("GtkAlertDialog requires GTK >= 4.10");
}
#endif
```

The parser stores raw GIR `version` attributes. The generator resolves inheritance and emits the nested guards.

**Key rule**: the `#else` fallback for a class-level guard must provide fallback stubs for ALL members (regardless of their individual versions), because none of them exist if the class doesn't exist.

**Implementation notes:**
- New module `version_guard.ml` / `version_guard.mli` in `src/tools/gir_gen/`
- `guard_kind` variant: `No_guard | Class_guard of version | Member_guard of version`
- Internal `macro_kind` variant (`Standard of string | Cairo`) keeps Cairo special-case encapsulated; `Namespace` submodule not exposed in `.mli`
- `emit_c_guard namespace version ~is_opening` produces `#if MACRO(M,m,u)` or `#endif`
- Cairo emits `#if CAIRO_VERSION >= CAIRO_VERSION_ENCODE(M,m,u)` — no standard macro
- Uses `int_of_string_opt` (not `int_of_string`) per partial-function guideline
- 30 tests covering all guard rules, all 9 namespaces, and error cases

**Commits:** `35905241`

### Phase 3: Version-check macro resolution ✅ DONE (merged into Phase 2)

The namespace→macro lookup table is implemented inside `Version_guard` as a private `namespace_macro_kind` function. No separate phase needed.

### Phase 4: Emit version guards in C stub generation

**Files to modify:**
- `c_stub_helpers.ml` — Orchestration: emit class-level open/close guards and `#else` fallback block
- `c_stub_method.ml` — Emit per-method guards when method version > class version
- `c_stub_constructor.ml` — Same for constructors
- `c_stub_property.ml` — Same for property getters/setters
- `c_stub_record.ml` — Same for record methods

**Two-level guard generation:**

The C file generator needs to:
1. If class has a version: emit `#if CHECK_VERSION(...)` after includes, before first member
2. For each member: if member version > class version, wrap in inner `#if`/`#else`/`#endif`
3. If class has a version: emit `#else` with fallback stubs for ALL members, then `#endif`

For classes/records WITHOUT a version, only individual member guards are emitted (no outer wrapper).

**Fallback stub rules:**
- Must accept the same number of `value` parameters as the real stub
- Must handle bytecode variants (>5 params: `_bytecode` takes `value *argv, int argn`)
- Uses `(void)param;` to suppress unused-parameter warnings
- Calls `caml_failwith()` with a descriptive message including required version
- Class-level fallback message: `"GtkAlertDialog requires GTK >= 4.10"`
- Method-level fallback message: `"gtk_alert_dialog_foo requires GTK >= 4.12"`

### Phase 5: Prototype on Pango ✅ DONE (rolled into Phase 4 roll-out)

Pango bindings regenerated as part of full roll-out. 32 versioned methods verified to have guards.

### Phase 6: Roll out to all namespaces ✅ DONE

Run `scripts/generate-bindings.sh`, build, test — complete.

---

## Future: Approach B (cppo compile-time guards)

After Approach A is validated, layer on cppo for OCaml-side guards:

1. Add `cppo` to opam dependencies
2. Generator emits cppo `#if` / `#endif` guards in `.ml` files
3. `dune_file.ml` generates:
   - pkg-config rule to extract library version as integer (e.g. `PANGO_VERSION=14600`)
   - dune preprocessing action: `(preprocess (action (run cppo -D PANGO_VERSION=%{...} %{input-file})))`
4. Encode versions as single integer for cppo: `major * 10000 + minor * 100 + micro`
5. Generated `.ml` files use guards like `#if PANGO_VERSION >= 14600`

This gives compile-time safety — unavailable APIs simply don't exist in the module signature.

---

## Open Questions

1. **Graphene/Cairo version macros** — need to verify if they exist and their names
2. **Class-level guards for entire `.c` files** — should we wrap the entire file body, or guard each function individually? (Individual is safer — a class might have methods added at different versions)
