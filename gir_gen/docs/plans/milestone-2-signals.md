# Milestone 2: Signal Handling with Parameters

**Status: DRAFT**
**Created: 2026-04-27**
**Branch: `feat/milestone-2-signals`**

## Overview

GTK 4 signals are the primary event-delivery mechanism: keyboard input, mouse
clicks, window-lifecycle events, and widget-state changes are all expressed as
signals carrying typed parameters and (often) a non-void return value. The
generator currently emits only the trivial subset — void return, zero
parameters — via `Gobject.Signal.connect_simple`, leaving most of the
event-handling surface either unreachable or dependent on hand-written
`Gobject.Closure` wiring inside example apps.

This milestone fills that gap. Signals with primitive parameters and signals
with `gboolean`/`gint`/`gint64`/`gdouble`/`utf8` return values become
first-class generated methods on the existing `*_signals` classes, and a new
form-example app demonstrates the four most common signal patterns end-to-end.

### Goal

Signals that carry typed parameters or non-void returns are generated as
usable OCaml callbacks on top of the existing `Gobject.Closure` runtime,
unlocking keyboard handling, mouse events, window-lifecycle control, and
event-driven UI patterns.

### Non-goals

- Detailed signals (`notify::property-name`) — handled as part of
  signal-flag work in Phase 7 (capture and decode the `detailed` flag,
  expose `~detail` on connect).
- Signals whose parameters are `<callback>` types — depends on
  `<callback>` parsing in Milestone 4.
- Signals that take `GArray`, `GVariant` *as a return type*, struct-by-value,
  or `va_list` parameters — long tail; punt to Milestone 4.
- Boxed iter/path return/parameter types (`Gtk.TextIter`, `Gtk.TreeIter`,
  `Gtk.TreePath`, `Gdk.EventSequence`, `GLib.Error`) — captured as Phase 9
  but explicitly deferred to Milestone 3/4.
- Cleaning up *every* hand-written closure in `examples/` (we update those
  whose signatures become covered by the generator and leave the rest).

---

## Current State

### Coverage

GTK-4.0 signal census across all 7 GIR files (462 signals total; 466 once
non-existent files are excluded):

| Category | ~Count | Covered today? | Covered after this milestone? |
|----------|-------:|----------------|-------------------------------|
| A. void return, 0 params (`changed`, `activate` on Entry, etc.) | ~27 | ✅ via `connect_simple` | ✅ unchanged |
| B. void return, primitive params (`response`, `icon-press`, `pressed`) | ~95 | ❌ | ✅ |
| C. void return, GObject* params (`page-added`, `child-notify`) | ~25 | ❌ | ✅ |
| D. bool return, 0 or primitive params (`close-request`, `key-pressed`, `state-set`, `activate-link`) | ~68 | ❌ | ✅ |
| E. bool return, GObject* params | ~18 | ❌ | ✅ |
| F. non-bool/void return (string, int, GObject*) | ~35 | ❌ | partially — int, int64, string only |
| G. detailed (`notify::*`) | ~2 + every property | ❌ | ✅ via Phase 7 |
| H. hard cases (GArray/GVariant return/callback/struct-by-value/boxed iter) | ~76 | ❌ | ❌ deferred (Phase 9) |

Expected GTK signal coverage: **~141 → ~268 (≈77%)**, plus analogous gains
in Gdk/Gio/Pango.

### Signal-param type census

Across **466 signals** in the seven GIR files, primitive-type breakdown:

```
gint    48   guint   28   gint64  2   gboolean 105   gdouble 57   utf8 53
gpointer 2   (GIR-bug cases tagging a primitive c:type as gpointer)
[zero]  occurrences of: gint8/16/32, guint8/16/32/64, glong, gulong, gchar,
        guchar, gsize, gssize, goffset, gunichar, gunichar2
```

Top non-primitive types: `Gtk.TextIter` (13), `Gtk.TreeIter` (12),
`Gtk.TreePath` (11), `GtkWidget`/`GObject` (~20 combined — already supported
via `get_object`), `GLib.Variant` (9), enum/flags (~50 combined),
`Gdk.EventSequence` (6), `GLib.Error` (2), `GLib.Array` (1).

### What already works

- **Parser.** `Gir_parser.parse_signal` (`gir_gen/lib/parse/gir_parser.ml:613-664`)
  extracts parameters and return type into `Types.gir_signal`
  (`gir_gen/lib/types.ml:69-77`). The parser is **not** the limiting factor
  for the closure body. It does, however, drop `when`/`action`/`no-recurse`/
  `no-hooks`/`detailed` attributes — Phase 7 fixes that.
- **Generic closure dispatch.** `ml_closure_marshal`
  (`ocgtk/src/common/ml_gobject.c:569-637`) handles arbitrary-arity calls,
  exposes parameters via `argv`, and copies a non-void return value back
  to GLib (`ml_gobject.c:629-633`). **Verified by direct read.**
- **Per-enum/bitfield C converters.** `Val_<EnumName>` and `<EnumName>_val`
  are emitted by `c_stub_enum.ml:51-53` and `c_stub_bitfield.ml:37-39,84-86`
  for every enum/bitfield in every namespace. Method bindings call them
  inline (e.g. `ml_device_gen.c:134`: `CAMLreturn(Val_GdkModifierType(result));`).
- **Hand-written precedent.** `ocgtk/examples/calculator/calc_ui.ml:179-187`
  wires `key-pressed` (bool return + 3 primitive params, but skipping the
  flags-typed `state` param) and `ocgtk/examples/login_form.ml:7-15` wires
  `close-request` (bool return, no params).
- **Tests.** `gir_gen/test/class_generation/signal_wrapper_tests.ml`
  validates signal-class generation via Ppxlib AST inspection.

### What's missing — verified gaps

1. **Generator filter.** `Signal_gen.generate_signal_class`
   (`gir_gen/lib/generate/signal_gen.ml:119-122`) partitions every signal
   with any parameter or non-void return into a `skipped` list and logs
   a stderr warning. **This is the one functional gate.**

2. **Per-signal closure emission.** `signal_gen.ml:139-143` only knows how
   to emit a `Gobject.Signal.connect_simple` line. There is no code path
   for `Gobject.Closure.create (fun argv -> …)`.

3. **Type → marshaller mapping.** `Type_mappings.find_type_mapping_for_gir_type`
   (`gir_gen/lib/type_mappings.ml:674`) resolves GIR types for methods, but
   has no helper that maps a GIR parameter type to "the right
   `Gobject.Value.get_*` call". This is a small new module.

4. **Enum/bitfield converters are C-only.** **Critical correction to the
   first draft of this plan.** Every namespace's `<ns>/dune` declares
   `(modules_without_implementation <ns>_enums)` (verified in all 9 dune
   files, e.g. `ocgtk/src/gdk/dune:35`, `ocgtk/src/gtk/dune:39`). The
   `<ns>_enums.mli` exists but the corresponding `.ml` does **not**:
   ```
   $ ls ocgtk/src/gdk/generated/gdk_enums*
   ocgtk/src/gdk/generated/gdk_enums.mli
   ocgtk/src/gdk/generated/ml_gdk_enums_gen.c
   ```
   `Val_GdkModifierType` (`ml_gdk_enums_gen.c:1381`) and `GdkModifierType_val`
   (`ml_gdk_enums_gen.c:1472`) are **C-only** — there is no OCaml-callable
   `modifiertype_of_int` or equivalent anywhere in the repo
   (`grep -rn modifiertype_of_int ocgtk/` → 0 hits). Method stubs handle
   conversion entirely in C; Closure-based signal callbacks running in
   OCaml have no exposed bridge.

5. **GValue OCaml wrappers.** `Gobject.Value.get_*/set_*`
   (`ocgtk/src/common/gobject.mli:135-150`) exposes only `int`, `uint`,
   `boolean`, `string`, `float`, `double`, `object`, `gtype`. **No
   `get_enum`, `get_flags`, `get_variant`, `get_int64` exist** — the
   underlying C accessors do (e.g. `g_value_get_flags`), but no
   `ml_g_value_get_*` wrapper covers them.

6. **Form example.** No app today demonstrates all four target patterns
   (keyboard, close-confirm, input validation, link click) in a single
   file.

---

## Architecture

### Strategy 1 — `connect_simple` (unchanged)

For signals that return void and take zero parameters:

```ocaml
method on_changed ~callback =
  Gobject.Signal.connect_simple obj ~name:"changed" ~callback ~after:false
```

### Strategy 2 — `Closure`-based dispatch

For all other supported signals. The OCaml-side callback receives typed
arguments and (for non-void signals) returns the typed result. Concrete
example for `EventControllerKey::key-pressed`
(`gboolean (guint keyval, guint keycode, GdkModifierType state)`):

```ocaml
method on_key_pressed
    ~(callback :
        keyval:int ->
        keycode:int ->
        state:Gdk_enums.modifiertype ->
        bool) =
  let closure =
    Gobject.Closure.create (fun argv ->
        let keyval  = Gobject.Value.get_uint
                        (Gobject.Closure.nth argv ~pos:1) in
        let keycode = Gobject.Value.get_uint
                        (Gobject.Closure.nth argv ~pos:2) in
        let state   = Ocgtk_gdk.Gdk_enums.modifiertype_get_value
                        (Gobject.Closure.nth argv ~pos:3) in
        let result  = callback ~keyval ~keycode ~state in
        Gobject.Value.set_boolean (Gobject.Closure.result argv) result)
  in
  Gobject.Signal.connect obj ~name:"key-pressed" ~callback:closure
    ~after:false
```

Notes on the shape:
- `pos:0` is the sender (instance) — params start at `pos:1`. (Confirmed
  by `calc_ui.ml:181` extracting `keyval` at `pos:1`.)
- Param names from GIR map directly to labelled OCaml arguments. Reserved
  keywords (`type`, `class`, `method`, etc.) get a trailing underscore
  via the same logic as `Signal_gen.sanitize_signal_name`
  (`signal_gen.ml:66-74`).
- For non-void signals, generator emits `Signal.connect` rather than
  `Signal.connect_simple`.
- Enum/flags conversion goes through the **per-type GValue helper**
  (e.g. `Gdk_enums.modifiertype_get_value`) introduced in Phase 1a —
  *not* through a nonexistent `Modifier_type.of_int` chain.

### Per-type GValue helper layer

Because enum/bitfield converters are C-only today, we extend the
enum/bitfield C-stub generator to emit, for every enum and bitfield
across all 9 namespaces, a pair of GValue-aware wrappers alongside the
existing `Val_<T>` / `<T>_val` functions:

```c
/* In ml_<ns>_enums_gen.c, alongside existing Val_GdkModifierType */
CAMLprim value ml_g_value_get_GdkModifierType(value gv_val) {
    CAMLparam1(gv_val);
    GValue *gv = GValue_val(gv_val);
    if (!G_VALUE_HOLDS_FLAGS(gv))
        caml_invalid_argument(
            "g_value_get_GdkModifierType: not a flags value");
    CAMLreturn(Val_GdkModifierType(
        (GdkModifierType)g_value_get_flags(gv)));
}

CAMLprim value ml_g_value_set_GdkModifierType(value gv_val, value list) {
    CAMLparam2(gv_val, list);
    g_value_set_flags(GValue_val(gv_val), GdkModifierType_val(list));
    CAMLreturn(Val_unit);
}
```

(The enum variant uses `G_VALUE_HOLDS_ENUM` and `g_value_get_enum` / `g_value_set_enum`.)

These per-type wrappers are exposed on the OCaml side via `external`
declarations in `<ns>_enums.ml` (which today does not exist — see
Phase 1a step (3) for the dune lift):

```ocaml
external modifiertype_get_value : Gobject.g_value -> modifiertype
  = "ml_g_value_get_GdkModifierType"
external modifiertype_set_value : Gobject.g_value -> modifiertype -> unit
  = "ml_g_value_set_GdkModifierType"
```

Cost across the 9 namespaces: ~100 enums + ~50 bitfields ≈ 300 small C
wrappers, all uniform; zero hand-maintained.

### Param-type → marshaller mapping

The `Signal_marshaller` module (Phase 1b) takes `Types.gir_type` and
context and returns one of three branches:

```ocaml
type marshaller =
  { ocaml_type    : string                                   (* "int", "Gdk_enums.modifiertype", … *)
  ; getter_expr   : argv:string -> pos:int -> string        (* OCaml expression yielding the value *)
  ; setter_expr   : argv:string -> value_var:string -> string
  }

type result =
  | Supported   of marshaller
  | Unsupported of string  (* reason — logged in stderr skip message *)
```

**Supported (Phase 1b — no new runtime work)**

| GIR type | `ocaml_type` | getter | setter | Notes |
|----------|--------------|--------|--------|-------|
| `gboolean` | `bool` | `Gobject.Value.get_boolean` | `set_boolean` | |
| `gint`, `gint8`, `gint16`, `gint32` | `int` | `Gobject.Value.get_int` | `set_int` | All flatten to `G_TYPE_INT`. |
| `guint`, `guint8`, `guint16`, `guint32`, `gunichar` | `int` | `Gobject.Value.get_uint` | `set_uint` | All flatten to `G_TYPE_UINT`. |
| `gdouble`, `gfloat` | `float` | `Gobject.Value.get_double`/`get_float` | `set_double`/`set_float` | |
| `utf8`, `filename`, `gchar*` | `string` | `Gobject.Value.get_string` | `set_string` | |
| GObject (class/interface) | `<NS>.<Cls>.t Gobject.obj` (or `option`) | `Gobject.Value.get_object` | `set_object` | Nullable params yield `option`. |
| `none`/void | `unit` | n/a | n/a | |

**Supported (Phase 1a — new runtime wrappers)**

| GIR type | `ocaml_type` | getter | setter | Source |
|----------|--------------|--------|--------|--------|
| Enum (`<NS>.<EnumName>`) | `<NS>_enums.<enumname>` | `<NS>_enums.<enumname>_get_value` | `<NS>_enums.<enumname>_set_value` | per-enum, generated alongside `Val_<EnumName>` |
| Bitfield (`<NS>.<FlagsName>`) | `<NS>_enums.<flagsname>` | `<NS>_enums.<flagsname>_get_value` | `<NS>_enums.<flagsname>_set_value` | per-bitfield, generated alongside `Val_<FlagsName>` |
| `GLib.Variant` | `Gvariant.t` | `Gobject.Value.get_variant` | `set_variant` | new generic wrapper |
| `gint64` | `Int64.t` | `Gobject.Value.get_int64` | `set_int64` | new generic wrapper; 2 signals depend |

**Deferred — no signal usage** (fall through to skipped log)

| GIR type | Why deferred |
|----------|--------------|
| `glong`, `gulong`, `guint64`, `gchar`, `guchar`, `gsize`, `gssize`, `goffset` | Zero signal usage; add when needed. |
| `gpointer` | 2 GIR-bug cases tagging primitives as `gpointer`; not pursuing. |

**Unsupported — long-tail GValue categories**

| GIR type | Why deferred |
|----------|--------------|
| `<callback>` | Depends on `<callback>` parsing — Milestone 4. |
| `GLib.Array` | 1 signal; no standalone GArray binding either — Milestone 4. |
| Boxed iter/path types (`TextIter`, `TreeIter`, `TreePath`, `GError`, `EventSequence`) | 36+ signal-param refs across tree-model and text-buffer signals — Phase 9 (deferred to Milestone 3/4). |
| `<param>` (GParamSpec), opaque struct-by-value | Negligible; defer indefinitely. |

When `Signal_marshaller.value_getter` returns `Unsupported`, the
generator logs the skip on stderr (preserving today's diagnostic) and
omits the signal from the generated `*_signals` class — never silently
emitted with wrong types.

### Cross-namespace type qualification

Existing infrastructure: `Type_mappings.map_cross_reference_to_type_mapping`
(`gir_gen/lib/type_mappings.ml:29`) resolves cross-namespace types for
methods. Signal generation reuses `generation_context` so the same
resolver applies. The new wrinkle is the qualified path for the per-type
GValue helper:

- `Gdk.ModifierType` referenced from a `Gtk` signal generator emits
  `Ocgtk_gdk.Gdk_enums.modifiertype_get_value`. The
  `Utils.external_namespace_to_module_name` helper
  (`gir_gen/lib/utils.ml`, "returns `Ocgtk_<ns>.<Ns>`") gives the wrapper
  prefix; we append `_enums.<lower-name>_get_value` / `_set_value`.

---

## Phases

Each phase is independently testable and ships behind a working build.
Tests are added in the same phase as the production change. Every phase
section below names the **files to modify** with line numbers, **validation
outputs** the implementer should inspect after the change, and **test
cases** with concrete assertions.

### Phase 1a — Runtime: per-type enum/flags GValue wrappers + variant + int64

**Goal.** Make `Gdk.ModifierType` (flags), GTK enums, `GLib.Variant`, and
`gint64` parameters reachable from a closure callback.

**Files to modify**

| File | Line | Change |
|------|------|--------|
| `ocgtk/src/common/ml_gobject.c` | new code after line 440 | Add 6 new C wrappers: `ml_g_value_get_int64`, `ml_g_value_set_int64`, `ml_g_value_get_variant`, `ml_g_value_set_variant`, `ml_g_value_get_enum`, `ml_g_value_set_enum`, `ml_g_value_get_flags`, `ml_g_value_set_flags`. Last four are *generic* (return raw `int`/`Int64`) — used directly only by generator-internal code paths if needed; per-type wrappers (below) are the public face. |
| `ocgtk/src/common/gobject.ml` | extend `module Value` block (lines 145-178) | Add `external get_int64 / set_int64 / get_variant / set_variant`. |
| `ocgtk/src/common/gobject.mli` | extend `module Value` (lines 117-151) | Add matching `val` lines: `val get_int64 : t -> Int64.t`, `val set_int64 : t -> Int64.t -> unit`, `val get_variant : t -> Gvariant.t`, `val set_variant : t -> Gvariant.t -> unit`. |
| `gir_gen/lib/generate/c_stub_enum.ml` | after line 53 (alongside `Val_<T>` / `<T>_val` prototypes) | For each enum, emit two additional C functions in both the prototype list and the implementation: `value ml_g_value_get_<EnumName>(value gv)` and `value ml_g_value_set_<EnumName>(value gv, value v)`. |
| `gir_gen/lib/generate/c_stub_bitfield.ml` | after lines 39 and 86 (both prototype emissions) | Same — for each bitfield, emit `ml_g_value_get_<FlagsName>` and `ml_g_value_set_<FlagsName>` using `g_value_get_flags`/`g_value_set_flags`. |
| `gir_gen/lib/generate/enum_code.ml` | currently emits the `.mli` only; extend to also emit `.ml` | Generate a `<ns>_enums.ml` containing `external <type>_get_value : Gobject.g_value -> <type> = "ml_g_value_get_<CType>"` and `external <type>_set_value : Gobject.g_value -> <type> -> unit = "ml_g_value_set_<CType>"` for every enum/bitfield. Add corresponding `val` lines to the `.mli` emission. |
| `ocgtk/src/<ns>/dune` (×9) | line 30/35/37/39 (varies — see grep below) | **Remove** `(modules_without_implementation <ns>_enums)`. Locations: `cairo/dune:30`, `gdkpixbuf/dune:30`, `gdk/dune:35`, `gio/dune:37`, `graphene/dune:30`, `gsk/dune:30`, `gtk/dune:39`, `pango/dune:30`. |
| `ocgtk/src/<ns>/dune` (×9) | parent `library` stanza | Generated `<ns>_enums` will need access to `Ocgtk_common.Gobject`. The dependency is already present in every namespace's `(libraries …)`; verify (`grep "ocgtk.common" ocgtk/src/*/dune`). |

**Validation outputs**

After regeneration via `bash scripts/generate-bindings.sh`, the implementer
must confirm:

1. `ocgtk/src/gdk/generated/gdk_enums.ml` **exists** and contains:
   ```ocaml
   external modifiertype_get_value :
     Gobject.g_value -> modifiertype = "ml_g_value_get_GdkModifierType"
   external modifiertype_set_value :
     Gobject.g_value -> modifiertype -> unit = "ml_g_value_set_GdkModifierType"
   ```

2. `ocgtk/src/gdk/generated/ml_gdk_enums_gen.c` contains, after the existing
   `Val_GdkModifierType`/`GdkModifierType_val` block, both
   `ml_g_value_get_GdkModifierType` and `ml_g_value_set_GdkModifierType`,
   each calling through to `Val_GdkModifierType`/`GdkModifierType_val`.

3. `dune build` succeeds across all 9 namespaces with no link errors —
   confirms the OCaml `external` declarations match the C symbols.

4. Spot-check a random non-bitfield enum (e.g.
   `ocgtk/src/gtk/generated/gtk_enums.ml` — `align_get_value`,
   `orientation_get_value`) to verify the generator handles enum and
   bitfield branches symmetrically.

5. `grep -c "external .*_get_value" ocgtk/src/*/generated/*_enums.ml`
   should equal the total enum + bitfield count (≈ 150 per the existing
   `Val_*` count).

**Test cases**

In `ocgtk/tests/test_signal_value_enum_flags.ml` (new file; add to
`ocgtk/tests/dune`):

| # | Name | Setup | Assertion |
|---|------|-------|-----------|
| 1 | `enum round-trip via per-type helper` | `Gobject.Value.create (g_type_for "GtkOrientation"); Gtk_enums.orientation_set_value v `VERTICAL` | `Gtk_enums.orientation_get_value v = `VERTICAL` |
| 2 | `flags round-trip via per-type helper` | Same with `Gdk.ModifierType` and `[`SHIFT_MASK; `CONTROL_MASK]` | round-trip preserves all bits |
| 3 | `flags empty list` | Set with `[]`, get | returns `[]` |
| 4 | `variant round-trip` | `Gvariant.new_string "hello"` set, get | `Gvariant.get_string` matches |
| 5 | `int64 round-trip` | `Value.set_int64 v Int64.max_int` | `Value.get_int64 v = Int64.max_int` |
| 6 | `negative — wrong type` | `set_int v 5; get_flags` (raw helper) | raises `Invalid_argument` |
| 7 | `negative — wrong type via per-type helper` | Set int GValue, call `modifiertype_get_value` | raises `Invalid_argument` from `G_VALUE_HOLDS_FLAGS` check |

Existing test pattern for reference: `ocgtk/tests/test_gobj.ml` (alcotest;
GTK init via `GMain.init` not required for pure GValue tests).

**Exit criteria.** `xvfb-run dune test --root=. ocgtk/` green; all 9
regenerated `<ns>_enums.ml` files present and exposed in the namespace
module; total wrapper count matches the per-type C converter count.

---

### Phase 1b — `Signal_marshaller` helper module

**Goal.** Pure function from `Types.gir_type` to printable
getter/setter expressions.

**Files to create / modify**

| File | Change |
|------|--------|
| `gir_gen/lib/generate/signal_marshaller.ml` (new) | Pure module returning `Supported of marshaller \| Unsupported of string`. Dispatches on `Type_mappings.classify_type` (`type_mappings.ml:630`) plus a `is_glib_variant` predicate. For enum/bitfield types, calls the cross-namespace resolver and returns `<NS>_enums.<lower>_get_value`. |
| `gir_gen/lib/generate/signal_marshaller.mli` (new) | Public signature. |
| `gir_gen/lib/generate/dune` | Add `signal_marshaller` to library. |

**Validation outputs**

After Phase 1b alone (Phase 2 not yet in), `signal_marshaller` is unused
by the generator pipeline; only the unit test exercises it. Validate via
the test output below.

**Test cases**

In `gir_gen/test/class_generation/signal_marshaller_tests.ml` (new):

| # | GIR type | Expected `ocaml_type` | Expected `getter_expr` substring |
|---|----------|----------------------|-----------------------------------|
| 1 | `gboolean` | `"bool"` | `Gobject.Value.get_boolean` |
| 2 | `gint` | `"int"` | `Gobject.Value.get_int` |
| 3 | `guint` | `"int"` | `Gobject.Value.get_uint` |
| 4 | `gint64` | `"Int64.t"` | `Gobject.Value.get_int64` |
| 5 | `gdouble` | `"float"` | `Gobject.Value.get_double` |
| 6 | `utf8` | `"string"` | `Gobject.Value.get_string` |
| 7 | Enum `Gtk.Orientation` (same-NS) | `"Gtk_enums.orientation"` | `Gtk_enums.orientation_get_value` |
| 8 | Bitfield `Gdk.ModifierType` (cross-NS, from Gtk ctx) | `"Ocgtk_gdk.Gdk_enums.modifiertype"` | `Ocgtk_gdk.Gdk_enums.modifiertype_get_value` |
| 9 | `GLib.Variant` | `"Gvariant.t"` | `Gobject.Value.get_variant` |
| 10 | GObject class `GtkWidget` (same-NS) | `"Gtk.Widget.t Gobject.obj"` | `Gobject.Value.get_object` |
| 11 | Cross-NS GObject (Gio.File from Gtk) | `"Ocgtk_gio.Gio.File.t Gobject.obj"` | `Gobject.Value.get_object` |
| 12 | `GLib.Array` | n/a | returns `Unsupported "GArray not yet supported"` |
| 13 | `Gtk.TextIter` (boxed) | n/a | returns `Unsupported "boxed type Gtk.TextIter not yet supported"` |
| 14 | `<callback>` type | n/a | returns `Unsupported "callback parameters require Milestone 4"` |
| 15 | `none` (void) | `"unit"` | n/a (return-only path) |

Use the existing `Helpers.assert_contains` style from
`gir_gen/test/integration/` adapted to call `signal_marshaller` directly
with a fabricated `gir_type` value (no GIR file parsing). Construct types
via `Type_factory` (`gir_gen/test/type_factory.ml`) where possible.

**Exit criteria.** All 15 test cases pass; `dune test --root=. gir_gen/`
green; the module is independently importable and has no production
callers yet.

---

### Phase 2 — Generator: signals with primitive params and non-void returns

**Goal.** Replace `signal_gen.ml:119-122` with a per-signal classifier that
emits Strategy 1 or Strategy 2.

**Files to modify**

| File | Line | Change |
|------|------|--------|
| `gir_gen/lib/generate/signal_gen.ml` | 119-122 | Drop the partition-and-skip; iterate every signal and dispatch via `Signal_marshaller`. |
| `gir_gen/lib/generate/signal_gen.ml` | 130-143 | Split out `emit_simple_signal_method` (current shape, lines 139-143) and add `emit_closure_signal_method` (Strategy 2). |
| `gir_gen/lib/generate/signal_gen.ml` | 124-128 | Keep the stderr skip log — but populate it from `Signal_marshaller.Unsupported reason` instead of "non-void return or parameters". |
| `gir_gen/lib/generate/signal_gen.ml` | new helper above 108 | `sanitize_param_name` mirroring `sanitize_signal_name` (lines 66-74) — keyword list reused. |

The new `emit_closure_signal_method` body (sketch — implementer fills in
proper `Buffer.add_string` calls):

```ocaml
let emit_closure_signal_method ~ctx ~target_expr signal marshallers
    ret_marshaller =
  let method_name = sanitize_signal_name signal.signal_name in
  let labelled_args =
    List.mapi (fun i p ->
      sprintf "%s:%s"
        (sanitize_param_name p.param_name)
        (List.nth marshallers i).ocaml_type)
      signal.sig_parameters
    |> String.concat " -> "
  in
  let return_type =
    match ret_marshaller with
    | None -> "unit"  (* void with params *)
    | Some m -> m.ocaml_type
  in
  bprintf buf "  method %s\n" method_name;
  bprintf buf "      ~(callback : %s -> %s) =\n"
    labelled_args return_type;
  bprintf buf "    let closure =\n";
  bprintf buf "      Gobject.Closure.create (fun argv ->\n";
  List.iteri (fun i (p, m) ->
    bprintf buf "          let %s = %s in\n"
      (sanitize_param_name p.param_name)
      (m.getter_expr ~argv:"argv" ~pos:(i + 1)))
    (List.combine signal.sig_parameters marshallers);
  let arg_apply =
    String.concat " "
      (List.map (fun p ->
        sprintf "~%s" (sanitize_param_name p.param_name))
        signal.sig_parameters)
  in
  (match ret_marshaller with
   | None ->
     bprintf buf "          callback %s)\n" arg_apply
   | Some m ->
     bprintf buf "          let result = callback %s in\n" arg_apply;
     bprintf buf "          %s)\n"
       (m.setter_expr ~argv:"Gobject.Closure.result argv"
          ~value_var:"result"));
  bprintf buf "    in\n";
  bprintf buf
    "    Gobject.Signal.connect %s ~name:\"%s\" ~callback:closure \
     ~after:false\n\n"
    target_expr signal.signal_name
```

**Validation outputs**

After regeneration:

1. `ocgtk/src/gtk/generated/event_controller_key_signals.ml` exists and
   contains a method `on_key_pressed` whose body matches the
   "Strategy 2 — `Closure`-based dispatch" template in the architecture
   section above. **Spot-check the file**: the closure body extracts
   `keyval`, `keycode`, `state` at positions 1, 2, 3.

2. `ocgtk/src/gtk/generated/window_signals.ml` contains `on_close_request`
   that uses `Gobject.Signal.connect` (not `connect_simple`) and sets a
   boolean result.

3. `ocgtk/src/gtk/generated/switch_signals.ml` contains `on_state_set`
   with `~callback:(state:bool -> bool)`.

4. `ocgtk/src/gtk/generated/gesture_click_signals.ml` contains
   `on_pressed` with `~callback:(n_press:int -> x:float -> y:float -> unit)`.

5. **Stderr-skip count**: `bash scripts/generate-bindings.sh 2>&1 |
   grep -c "Skipping signal"` should drop from its current value (~205
   for GTK alone) to roughly 60-80 (covering only the long-tail boxed/
   GArray/callback types).

6. **Total `connect_simple` count** in `ocgtk/src/gtk/generated/`:
   `grep -rh connect_simple ocgtk/src/gtk/generated/ | wc -l` should
   stay roughly at 27 (Category A signals).

7. **Total `Signal.connect` count**:
   `grep -rh "Gobject.Signal.connect [^_]" ocgtk/src/gtk/generated/ | wc -l`
   should jump from 0 to ≈ 180.

**Test cases** — extend
`gir_gen/test/class_generation/signal_wrapper_tests.ml`:

| # | Name | GIR fixture | Assertion |
|---|------|-------------|-----------|
| 1 | `void zero-param uses connect_simple` (existing) | `clicked` on synthetic Button | unchanged |
| 2 | `void primitive params uses Closure.create` | synthetic `pressed` (`gint, gdouble, gdouble`) | AST contains `Gobject.Closure.create` and three `Gobject.Closure.nth` calls; method has labelled args `n_press / x / y` of types `int / float / float`; uses `Signal.connect` |
| 3 | `bool return zero-param uses Closure.create` | synthetic `close-request` | AST shows `Closure.create`, body sets `Value.set_boolean` on the result, uses `Signal.connect` |
| 4 | `bool return primitive param round-trip` | synthetic `state-set` (`gboolean -> gboolean`) | callback sig is `state:bool -> bool`; closure body extracts `pos:1` and sets bool result |
| 5 | `mixed bool return + 3 params` | `key-pressed`-shaped (`guint, guint, GdkModifierType -> gboolean`) | three `nth` extractions at pos 1/2/3; the third uses `Gdk_enums.modifiertype_get_value` (cross-NS) |
| 6 | `unsupported → skipped + warning` | synthetic signal with `<callback>` param | method does **not** appear in generated class; `eprintf` invocation captured via mock |
| 7 | `sender at pos:0 invariant` | inspect closure body | no `nth` call uses `pos:0` (sender is implicit) |
| 8 | `param keyword sanitisation` | synthetic signal with parameter named `type` | generated method uses `~type_` not `~type` |
| 9 | `int64 param` | synthetic signal with `gint64` param | callback type is `Int64.t`; getter is `get_int64` |
| 10 | `Variant param` | synthetic signal with `GLib.Variant` param | callback type is `Gvariant.t`; getter is `get_variant` |

Use existing `Ml_ast_helpers` (`gir_gen/test/utils/ml_ast_helpers.ml`)
for AST inspection. The pattern is established in
`signal_wrapper_tests.ml:92-114`; cases 2-10 follow the same shape.

**Exit criteria.** Test suite green; `dune build` across all 9 namespaces
clean; stderr skip count drops; total signal coverage per namespace
matches the projection.

---

### Phase 3 — Cross-namespace enum/flags resolution

**Goal.** Make `key-pressed`'s `Gdk.ModifierType` parameter resolve in a
Gtk context to `Ocgtk_gdk.Gdk_enums.modifiertype` with the correct
qualified getter.

**Files to modify**

| File | Line | Change |
|------|------|--------|
| `gir_gen/lib/generate/signal_marshaller.ml` (from Phase 1b) | enum/bitfield branch | When `classify_type` returns a foreign-namespace enum/bitfield, use `Utils.external_namespace_to_module_name` to compute the prefix and emit `<prefix>.<NS>_enums.<lower>_get_value`. Same for setter. |

**Validation outputs**

1. `ocgtk/src/gtk/generated/event_controller_key_signals.ml` —
   `on_key_pressed`'s body contains the literal token
   `Ocgtk_gdk.Gdk_enums.modifiertype_get_value` (cross-namespace
   qualified path). Inspect via `grep`:
   ```
   grep -n modifiertype_get_value ocgtk/src/gtk/generated/event_controller_key_signals.ml
   ```

2. `dune build` resolves the dependency — confirms the Gtk library
   already declares `ocgtk.gdk` in its `libraries` (it does; verify
   `grep "ocgtk.gdk" ocgtk/src/gtk/dune`).

3. `ocgtk/src/gio/generated/*_signals.ml` contains at least one
   cross-namespace flags reference (Gio's `socket-listener::event` uses
   `Gio.SocketListenerEvent` — same-NS — but DBus signals reference
   `GDBusObjectManagerClient.Flags` which is intra-Gio; spot-check
   anyway).

**Test cases** — new file
`gir_gen/test/cross_namespace/cross_ns_signal_tests.ml`:

| # | Name | Setup | Assertion |
|---|------|-------|-----------|
| 1 | `cross-NS bitfield param uses qualified getter` | Synthetic Gtk class with signal taking `Gdk.ModifierType` parameter | AST shows `Ocgtk_gdk.Gdk_enums.modifiertype_get_value` token |
| 2 | `same-NS bitfield param uses bare module` | Synthetic Gtk class with signal taking `Gtk.AccessibleRole` | AST shows bare `Gtk_enums.accessiblerole_get_value` (no `Ocgtk_gtk` prefix) |
| 3 | `cross-NS enum param` | Synthetic Gtk signal taking `Gdk.MemoryFormat` | qualified getter |
| 4 | `cross-NS enum return` | Synthetic Gtk signal returning `Gdk.MemoryFormat` | setter is qualified `Ocgtk_gdk.Gdk_enums.memoryformat_set_value` |

Cross-NS test pattern is established in
`gir_gen/test/cross_namespace/` already — use the same `gir_data_dir`
helpers.

**Exit criteria.** `Event_controller_key.event_controller_key_signals`
in the regenerated bindings has a typed `on_key_pressed` whose `state`
param is the cross-namespace flag-list type and the OCaml file compiles.

---

### Phase 4 — Runtime end-to-end marshalling test

**Goal.** Prove the generated code actually round-trips parameters and
results through the C marshaller — i.e., that what the generator emits
links and runs.

**Files to create**

| File | Purpose |
|------|---------|
| `ocgtk/tests/test_signal_marshalling.ml` (new) | Runtime alcotest suite. Add to `ocgtk/tests/dune` test names list. |

**Test cases**

| # | Name | Setup | Assertion |
|---|------|-------|-----------|
| 1 | `state-set on Switch round-trips bool param + bool return` | Create `Gtk.Switch`; connect `on_state_set ~callback:(fun ~state -> not state)`; emit via `Signal.emit_by_name` with crafted GValues, OR call `switch#set_active true` and check the deferred handler ran | callback observed `state=true`; signal emission saw return value `false` |
| 2 | `close-request inhibits close when callback returns true` | Create `Gtk.Window`; `on_close_request ~callback:(fun () -> true)`; call `window#close ()` | window remains visible (`window#get_visible () = true`) |
| 3 | `close-request closes when callback returns false` | Same with `~callback:(fun () -> false)` | window closed (`get_visible () = false`) |
| 4 | `key-pressed param round-trip via synthetic emit` | Synthetic `Gtk.Event_controller_key`; `on_key_pressed ~callback:(fun ~keyval ~keycode ~state -> ...)`; emit `key-pressed` directly via low-level `g_signal_emit_by_name` test helper | callback observed `keyval=65`, `keycode=42`, `state=[`SHIFT_MASK]` |
| 5 | `pressed on GestureClick observes int + double + double` | `Gtk.Gesture_click`; `on_pressed ~callback:…`; synthetic emit | params delivered as `(1, 10.0, 20.0)` |
| 6 | `param-name keyword sanitisation does not break call` | A signal with parameter named `type`; calling `~type_:5` from a generated method | compiles and runs |
| 7 | `Variant param delivered correctly` | A signal with `GLib.Variant` param (synthetic if no real signal in tests) | callback receives `Gvariant.t` whose `.get_string` matches the emitted value |

Build pattern reference: `ocgtk/tests/test_event_controller_runtime.ml`
already opens GTK windows and exercises event controllers under xvfb.
Reuse its helpers for window setup.

For test 4, use the existing test helpers at
`ocgtk/src/common/gobject.mli:250-268` (`Test.invoke_closure_*` family) —
or extend with a more flexible helper if needed.

**Exit criteria.** `xvfb-run dune test --root=. ocgtk/` green; reverting
any Phase 2 commit breaks the new tests.

---

### Phase 5 — Form example application

**Goal.** Single interactive app exercising the four target signal
patterns (keyboard shortcut, close-confirm, validation-on-change,
clickable link). Recommended candidate: **Contact form**
(see "Form example — proposals" below).

**Files to create / modify**

| File | Change |
|------|--------|
| `ocgtk/examples/form_example.ml` (new) | Single-file app, ~250 lines. |
| `ocgtk/examples/dune` | Add `(executable (name form_example) (libraries …))` stanza. |
| `ocgtk/examples/README.md` | Add "Form example" section under the existing example list. |
| `ocgtk/examples/form_example/test_form_example_atspi.py` (optional) | E2E AT-SPI smoke test mirroring `ocgtk/examples/calculator/test_calculator_atspi.py`. |

**Validation outputs**

1. `xvfb-run dune exec --root=. ocgtk/examples/form_example.exe` launches
   without crash.
2. Manually-triggered (or AT-SPI driven):
   - Type `not-an-email` in email field → red hint visible, Submit
     disabled.
   - Type `a@b.c` → hint disappears, Submit enabled.
   - Press Ctrl+Enter with valid form → log line "Submitted: …".
   - Press Ctrl+W with unsaved changes → banner appears, window stays
     open.
   - Press Ctrl+W twice within 3 s → window closes.
   - Click privacy link → log line "activate-link intercepted", browser
     does NOT spawn.

**Test cases** — `test_form_example_atspi.py` (optional, follows
calculator pattern):

| # | AT-SPI driver action | Expected observable |
|---|----------------------|---------------------|
| 1 | Set email field text to `bad`; check Submit button | `submit.sensitive == False` |
| 2 | Set email field to `a@b.c`; check Submit | `submit.sensitive == True` |
| 3 | Press Ctrl+Enter | submission line appears in status banner |
| 4 | Press Ctrl+W | confirmation banner visible |
| 5 | Press Ctrl+W (within 3 s) | window destroyed |

**Exit criteria.** `dune build` on the examples succeeds;
`xvfb-run dune exec ocgtk/examples/form_example.exe` runs cleanly.

---

### Phase 7 — Signal flag propagation

**Goal.** Capture GIR `<glib:signal>` flags
(`when="first|last|cleanup"`, `action`, `no-recurse`, `no-hooks`,
`detailed`) end-to-end so `~after` defaults are sensible and detailed
signals are connectable.

**Files to modify**

| File | Line | Change |
|------|------|--------|
| `gir_gen/lib/types.ml` | 69-77 | Extend `gir_signal` with `when_phase`, `action`, `no_recurse`, `no_hooks`, `detailed` fields. |
| `gir_gen/lib/parse/gir_parser.ml` | 613-664 | Read each new attribute via `get_attr "when"`, `get_attr "action"`, etc. Default `when_phase` to `\`Last` (matches GLib default). |
| `gir_gen/lib/generate/signal_gen.ml` | inside both emit functions | Default `~after:` to `true` for `\`Last`/`\`Cleanup`, `false` for `\`First`. Document choice in generated docstring. |
| `gir_gen/lib/generate/signal_gen.ml` | new emit branch | For `detailed=true` signals, emit a `~detail:string option` argument; if `Some d`, format name as `<name>::<d>` and call new `Gobject.Signal.connect_detailed`. |
| `ocgtk/src/common/gobject.{ml,mli}` | extend `module Signal` | Add `val connect_detailed : 'a obj -> name:string -> detail:string -> callback:g_closure -> after:bool -> handler_id`. Implementation in C: format name as `name::detail` and call existing `g_signal_connect_closure`. |
| `gir_gen/lib/generate/signal_gen.ml` | optional emit (gated on `action=true`) | Generate a sibling `emit_<name> : <typed args> -> unit` per action signal that calls `Gobject.Signal.emit_by_name`. Defer if typed-vararg marshalling proves awkward. |

**Validation outputs**

1. `git grep "~after:true" ocgtk/src/gtk/generated/*_signals.ml | wc -l`
   should jump from 0 to ≈ 180 (signals with `when="last"`, which is the
   GLib default and the majority).

2. `ocgtk/src/gtk/generated/widget_signals.ml` (or wherever `notify` lives
   on GObject) contains an `on_notify` method with `?detail:string`
   parameter.

3. `Gobject.Signal.connect_detailed` exported from `gobject.mli`.

**Test cases** — add to `signal_wrapper_tests.ml`:

| # | Name | GIR fixture | Assertion |
|---|------|-------------|-----------|
| 1 | `~after:true defaults from when=last` | synthetic signal `when="last"` | emitted code contains `~after:true` |
| 2 | `~after:false defaults from when=first` | synthetic signal `when="first"` | emitted code contains `~after:false` |
| 3 | `detailed signal exposes ~detail` | synthetic signal `detailed="1"` | method has optional `?detail` argument; uses `connect_detailed` when `Some _` |
| 4 | `action signal emits emit_* companion` (if step 4 ships) | synthetic `action="1"` | sibling method `emit_<name>` exists |

Plus a runtime test in `test_signal_marshalling.ml`:

| # | Name | Assertion |
|---|------|-----------|
| 5 | `notify::label round-trip` | Connect `on_notify ~detail:"label" ~callback:…`; call `widget#set_label`; observe callback fired |

**Exit criteria.** Generated bindings show `~after:true` defaults where
appropriate; `notify::*` detailed connection round-trips in runtime test.

---

### Phase 8 — Migrate hand-written closures, document, archive plan

**Files to modify**

| File | Change |
|------|--------|
| `ocgtk/examples/login_form.ml:7-15` | Delete `on_close_request` helper; use `window#on_close_request ~callback:…` from generated `window_signals`. |
| `ocgtk/examples/calculator/calc_ui.ml:179-188` | Delete the manual `Gobject.Closure.create` block; use `key_controller#on_key_pressed ~callback:…` from generated `event_controller_key_signals`. |
| `ocgtk/examples/text_editor.ml`, `settings_panel.ml` | Same as login_form. |
| `gir_gen/README.md` "Supported features" | Update signal coverage entry from "void/zero-param only" to "all primitive params + bool/int/string returns; flags/enum via per-namespace decoders". |
| `/home/deploy/projects/ocgtk-context/LEARNINGS.md` | Mark the consolidated learning "Signal generator only supports void/zero-param signals — manual wiring pattern" as **Superseded by Milestone 2 (PR/commit X)**. |
| `gir_gen/docs/plans/milestone-2-signals.md` | Move to `gir_gen/docs/plans/completed/`. |

**Validation outputs**

1. `grep -rn "Gobject.Closure.create" ocgtk/examples/ | wc -l` → 0 hits
   (or only deliberately illustrative ones).
2. `grep -rn "Gobject.Signal.connect [^_]" ocgtk/examples/ | wc -l` → 0
   hits (callers go through generated methods).
3. All examples build and run under `xvfb-run dune exec`.

**Test cases**

No new tests; the migration is verified by the existing example apps
continuing to function, plus the metric assertions above.

**Exit criteria.** `bash scripts/generate-bindings.sh` produces no diff
on a freshly-run repo (idempotency); all examples run; plan moved.

---

### Phase 9 — Boxed iter/path Value bridges (DEFERRED — Milestone 3 or 4)

**Not in this milestone.** Captured here so future planning has a
record of the actual scope and the path forward.

The signal-param census shows boxed-type usage concentrated in tree-
model and text-buffer signals:

| Boxed type | Signal-param refs | Affected signals (examples) |
|------------|-------------------:|------------------------------|
| `Gtk.TextIter` | 13 | `GtkTextBuffer::insert-text`, `mark-set`, `apply-tag`, `delete-range` |
| `Gtk.TreeIter` | 12 | `GtkTreeModel::row-inserted`, `row-deleted`, `row-changed` |
| `Gtk.TreePath` | 11 | `GtkTreeModel::row-inserted`, `row-deleted`, `rows-reordered` |
| `GLib.Error` | 2 | DBus-style error-signal patterns in Gio |
| `Gdk.EventSequence` | 6 | gesture sequence tracking |

Each is a distinct boxed `GType` — `g_value_get_boxed` returns an
opaque `gpointer` that must be cast to the correct C type and wrapped
into the corresponding OCaml binding. There is no generic `get_boxed`
that could serve all of them, so each type needs its own typed
`Gobject.Value.get_<boxed_type>` / `set_<boxed_type>` pair plus a
lightweight OCaml-side wrapper if one doesn't already exist.

**Why deferred.** None of the milestone-2 form-example signals use a
boxed type; bundling 4-5 boxed-type bindings inflates milestone-2
scope past its goal; the work is independent of the closure machinery
and only needs the Phase-1b marshaller dispatcher to learn one more
case.

---

## Risks & open questions

- **Param naming collisions.** GIR uses `type` and `class` as parameter
  names in a handful of signals; current `sanitize_signal_name` only
  handles signal *names*, not parameter names. Phase 2 adds
  `sanitize_param_name` reusing the same keyword list.
- **Enum/flags decoder allocation.** Returning
  `Gdk_enums.modifiertype` (a polymorphic-variant list) allocates per
  call. Hot paths (e.g., `motion-notify`) might prefer raw `int`.
  Decision: ship list-typed flags in Phase 3; revisit if
  `EventControllerMotion` benchmarks regress.
- **Optional GObject params.** Some signals declare GObject params
  with `nullable="1"`. C marshaller already returns `None` from
  `Value.get_object` for null pointers, so OCaml type becomes
  `_ Gobject.obj option`. Tests must cover.
- **Lifting `modules_without_implementation`.** If `<ns>_enums.ml`
  ends up empty for a namespace with zero enums (e.g. Cairo or
  Graphene), dune may complain. Mitigation: only lift the dune clause
  for namespaces that have at least one enum/bitfield. Implementer
  must verify per-namespace.
- **`Gvariant.t` exposure in `gobject.mli`.** Adding
  `val get_variant : t -> Gvariant.t` to `gobject.mli` introduces a
  dependency from `Ocgtk.common.Gobject` on `Ocgtk.common.Gvariant`.
  Both already live in `ocgtk/src/common/`; the dune library lists
  both modules already, so no new circular dep — but verify.
- **Generated code volume.** Coverage jump 141 → ~268 ≈ +900 LoC
  generated across 9 namespaces, plus 300 small per-type GValue
  wrappers in C. All uniform; review burden is low.

---

## Form example — proposals

The deliverable specifies one app demonstrating: (a) keyboard-shortcut
handling, (b) close confirmation, (c) input validation on entry
changes, (d) clickable links. Three candidates, listed in order of
recommendation:

### Proposal A (recommended) — *Contact form* `form_example.ml`

A simple "send us a message" form. Single window, no dialog widgets
(avoids GtkDialog deprecation in 4.10).

- **Fields.** `Name` (Entry), `Email` (Entry), `Phone` (Entry,
  optional), `Message` (TextView). Submit + Reset buttons.
- **Input validation (`Editable::changed`).**
  - Email: live regex check; show `<span foreground="red">…` hint
    until valid; toggle Submit button sensitivity.
  - Phone: format-as-you-type or show nothing if blank.
- **Keyboard shortcuts (`EventControllerKey::key-pressed`).**
  - `Ctrl+Enter` → submit (when valid).
  - `Esc` → focus Cancel.
  - `Ctrl+L` → focus the email field.
- **Close confirmation (`Window::close-request`).**
  - If any field has changed since last submit/reset, show an inline
    banner ("You have unsaved changes — press Ctrl+W again to close")
    and return `true` to inhibit close. Second press within 3 s
    returns `false`.
- **Clickable link (`LinkButton::activate-link`).**
  - "Privacy policy" LinkButton at the bottom. Override
    `activate-link` to log and return `true` (handled).

Hits all four categories with realistic patterns; no deprecated Dialog
dependency; works headless under `xvfb-run`.

### Proposal B — *Settings panel* (extension of `settings_panel.ml`)

Repurpose the existing shell. Pros: smaller diff. Cons: switches and
4-category coverage feel contrived; key-pressed and link click bolted
on.

### Proposal C — *Login + profile editor* (extension of `login_form.ml`)

Pros: reuses code. Cons: login forms typically don't have "unsaved
changes" semantics, so close-confirm is awkward.

**Recommendation: Proposal A.**

---

## TASKS.md updates

Replace under "Milestone 2 - Signal Handling":

```markdown
### Milestone 2 - Signal Handling `#priority:high` `#started:2026-04-27`
Plan: `gir_gen/docs/plans/milestone-2-signals.md`
- [ ] Phase 1a: per-type enum/flags GValue wrappers + variant + int64 (C + OCaml + tests)
- [ ] Phase 1b: Signal_marshaller module + unit tests
- [ ] Phase 2: Closure-based emission for params + non-void returns
- [ ] Phase 3: Cross-namespace enum/flags resolution for signals
- [ ] Phase 4: Runtime end-to-end marshalling tests
- [ ] Phase 5: form_example.ml + example dune entry + README
- [ ] Phase 7: Signal flag propagation (when/action/detailed parser + defaults)
- [ ] Phase 8: Migrate hand-written closures, archive plan
```

---

## Verification (per the brief)

The milestone is "done" when:

- [ ] `dune test --root=. gir_gen/ && xvfb-run dune test --root=. ocgtk/`
      is green from a clean tree.
- [ ] `bash scripts/generate-bindings.sh` regenerates all 9 namespaces
      idempotently (re-running produces no diff).
- [ ] `xvfb-run dune exec --root=. ocgtk/examples/form_example.exe`
      launches, accepts text, validates email, fires `Ctrl+Enter`,
      shows the close-confirm banner, intercepts the privacy LinkButton.
- [ ] No `Gobject.Closure.create` invocations remain in
      `ocgtk/examples/calculator/calc_ui.ml` or `login_form.ml`.
- [ ] Generated GTK signal count ≥ 250 (from current 141).
- [ ] `<ns>_enums.ml` exists for every namespace that has at least one
      enum or bitfield, and exposes `_get_value`/`_set_value` externals.
