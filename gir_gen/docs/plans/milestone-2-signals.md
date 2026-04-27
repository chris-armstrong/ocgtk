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
with `gboolean`/`gint`/`gdouble` return values become first-class generated
methods on the existing `*_signals` classes, and a new form-example app
demonstrates the four most common signal patterns end-to-end.

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
- Signals that take `GArray`, `GVariant`, struct-by-value, or `va_list`
  parameters — long tail; punt to Milestone 4.
- Cleaning up *every* hand-written closure in `examples/` (we update those
  whose signatures become covered by the generator and leave the rest).

---

## Current State

### Coverage

GTK-4.0 signal census (across 346 signals total):

| Category | ~Count | Covered today? | Covered after this milestone? |
|----------|-------:|----------------|-------------------------------|
| A. void return, 0 params (`changed`, `state-set` on Switch only when no param overload, `activate` on Entry) | ~27 | ✅ via `connect_simple` | ✅ unchanged |
| B. void return, primitive params (`response`, `icon-press`, `pressed`) | ~95 | ❌ | ✅ |
| C. void return, GObject* params (`page-added`, `child-notify`) | ~25 | ❌ | ✅ |
| D. bool return, 0 or primitive params (`close-request`, `key-pressed`, `state-set` on Switch with state, `activate-link`) | ~68 | ❌ | ✅ |
| E. bool return, GObject* params | ~18 | ❌ | ✅ |
| F. non-bool/void return (string, int, GObject*) | ~35 | ❌ | partially — int and string only |
| G. detailed (`notify::*`) | ~2 | ❌ | ❌ deferred |
| H. hard cases (GArray/GVariant/callback/struct-by-value) | ~76 | ❌ | ❌ deferred |

After Milestone 2, the expected coverage jump is **~141 → ~268 signals (≈77%)**
within the GTK namespace alone, plus the analogous gains in Gdk/Gio/Pango.

### What already works

- **Parser.** `Gir_parser.parse_signal` (`gir_gen/lib/parse/gir_parser.ml:613-664`)
  already extracts parameters and return type into `Types.gir_signal`
  (`gir_gen/lib/types.ml:69-77`). The fields `sig_parameters` and
  `return_type` are populated correctly for every signal we care about; the
  parser is **not** the limiting factor.
- **Runtime — partially.** `Gobject.Closure.create / nth / set_result`
  supports arbitrary closures with arbitrary parameter counts; the generic
  C marshaller `ml_closure_marshal`
  (`ocgtk/src/common/ml_gobject.c:569-637`) correctly dispatches multi-
  param invocations and copies non-void return values back to GLib.
  **Verified by direct read.**
  The OCaml-visible `Gobject.Value.get_*/set_*` API, however, currently
  exposes only `int`, `uint`, `boolean`, `string`, `float`, `double`,
  `object` (and `gtype` getter). **Enum, flags, and variant GValues are
  NOT reachable from OCaml today** — `g_value_get_enum`,
  `g_value_get_flags`, and `g_value_get_variant` exist in GLib but have
  no `ml_g_value_get_*` wrapper. This is why `calc_ui.ml:181` extracts
  `keyval` (a `guint`) but never reads `state` (`Gdk.ModifierType`, a
  flags type) — the manual code dodges the gap rather than crossing it.
- **Signal-param type census (across 462 GTK/Gdk/Gio/Pango/Gsk
  signals).** Top non-primitive types: `Gtk.TextIter` (13),
  `Gtk.TreeIter` (12), `Gtk.TreePath` (11), `GtkWidget`/`GObject` (~20
  combined — already supported via `get_object`), `GLib.Variant` (9),
  enum/flags (~50 combined), `Gdk.EventSequence` (6), `GLib.Error` (2),
  `GLib.Array` (1). The boxed iter/path types are the largest single
  unsupported category; they are explicitly deferred (see deferred
  table below).
- **Hand-written precedent.** `ocgtk/examples/calculator/calc_ui.ml:179-187`
  already wires `key-pressed` (bool return + 3 primitive params) and
  `ocgtk/examples/login_form.ml:7-15` wires `close-request` (bool return,
  no params). These are the exact patterns the generator must emit.
- **Tests.** AST-based unit tests in
  `gir_gen/test/class_generation/signal_wrapper_tests.ml` already validate
  signal-class generation; the same harness extends naturally to
  parameterised signals.

### What's missing

1. **Generator filter** in
   `gir_gen/lib/generate/signal_gen.ml:119-122` partitions every signal
   that has any parameter or non-void return into a `skipped` list and
   logs a warning. **This is the only gate.** Removing it without doing
   the work below would break compilation.
2. **Per-signal closure emission.** `signal_gen.ml` only knows how to
   emit a `Gobject.Signal.connect_simple` line. It needs a code path
   that emits the `Gobject.Closure.create (fun argv -> …)` form,
   threading per-parameter `Value.get_*` calls and a `set_result` for
   non-void signals.
3. **Type → marshaller mapping.** `Type_mappings` resolves GIR types
   to OCaml/C types for methods, but there is no helper that maps a
   GIR parameter type to "the right `Gobject.Value.get_*` call". This
   is a small new function.
4. **Cross-namespace type lookup for signal params.** `key-pressed`'s
   `state` parameter is `Gdk.ModifierType` (a flags type living in a
   different namespace). The L2 wrapper currently never references
   types from foreign namespaces in signal context, so the
   import/qualification path for signals is untested. This is a thin
   reuse of existing cross-namespace machinery, not new work.
5. **Form example.** No app today demonstrates all four target
   patterns (keyboard, close-confirm, input validation, link click)
   in a single file.

---

## Architecture

### Overall shape of generated code

For each signal the generator decides one of two emission strategies:

**Strategy 1 — `connect_simple`** (unchanged). Used iff the signal
returns void and takes zero parameters.

```ocaml
method on_changed ~callback =
  Gobject.Signal.connect_simple obj ~name:"changed" ~callback ~after:false
```

**Strategy 2 — `Closure`-based**. Used otherwise. The callback receives
typed OCaml arguments and (for non-void signals) returns the typed result.

```ocaml
method on_key_pressed
    ~(callback : keyval:int -> keycode:int -> state:Gdk.ModifierType.t list -> bool)
    =
  let closure =
    Gobject.Closure.create (fun argv ->
        let keyval   = Gobject.Value.get_uint (Gobject.Closure.nth argv ~pos:1) in
        let keycode  = Gobject.Value.get_uint (Gobject.Closure.nth argv ~pos:2) in
        let state    = Gdk.Modifier_type.of_int
                         (Gobject.Value.get_int (Gobject.Closure.nth argv ~pos:3)) in
        let result   = callback ~keyval ~keycode ~state in
        Gobject.Value.set_boolean (Gobject.Closure.result argv) result)
  in
  Gobject.Signal.connect obj ~name:"key-pressed" ~callback:closure ~after:false
```

Notes on the shape:
- `pos:0` is always the sender (instance) — params start at `pos:1`.
  (Confirmed by `calc_ui.ml:181` extracting `keyval` at `pos:1` despite
  `key-pressed` declaring `keyval` as the first parameter.)
- Param names from GIR map directly to labelled OCaml arguments.
- Reserved-keyword params (e.g. a parameter literally named `type`)
  reuse `Signal_gen.ocaml_keywords`/`sanitize_signal_name`.
- Enum/flags parameters and return values use the **decoder/encoder
  pair** generated by the bitfield/enum module
  (`Gobject.Data.flags`/`Data.enum` infrastructure).
- For signals whose return is non-void, we call `Signal.connect`
  rather than `Signal.connect_simple`.

### Param-type → marshaller mapping

A small new function `Signal_marshaller.value_getter` takes a
`Types.gir_type` plus context and returns:

```ocaml
type marshaller = {
  ocaml_type   : string;            (* "int", "bool", "string", "Gdk.Modifier_type.t list" *)
  getter_expr  : argv:string -> pos:int -> string;  (* "Gobject.Value.get_uint (Gobject.Closure.nth argv ~pos:1)" *)
  setter_expr  : argv:string -> value:string -> string;  (* "Gobject.Value.set_boolean ..." *)
}
```

Cases:

**Signal-param census across all 466 signals** in the seven GIR files
shows a remarkably narrow primitive footprint: only `gint` (48),
`guint` (28), `gint64` (2), `gboolean` (105), `gdouble` (57),
`gfloat` (0), `utf8` (53), `gpointer` (2 — GIR bugs). **No
occurrences** of `gint8/16/32`, `guint8/16/32/64`, `glong`, `gulong`,
`gchar`, `guchar`, `gsize`, `gssize`, `goffset`, `gunichar`,
`gunichar2`. Coverage policy below lists every primitive explicitly,
not just the ones that happen to appear, so the design has a defensible
answer for every GIR primitive name.

**Supported (Phase 1b — no new runtime work):**

| GIR type | `ocaml_type` | getter | setter | Notes |
|----------|--------------|--------|--------|-------|
| `gboolean` | `bool` | `get_boolean` | `set_boolean` | |
| `gint` | `int` | `get_int` | `set_int` | |
| `gint8`, `gint16`, `gint32` | `int` | `get_int` | `set_int` | GLib stores as `G_TYPE_INT`; existing wrapper round-trips. |
| `guint` | `int` | `get_uint` | `set_uint` | |
| `guint8`, `guint16`, `guint32`, `gunichar` | `int` | `get_uint` | `set_uint` | GLib stores as `G_TYPE_UINT`. |
| `gdouble`, `gfloat` | `float` | `get_double`/`get_float` | `set_double`/`set_float` | |
| `utf8`, `filename`, `gchar*` | `string` | `get_string` | `set_string` | |
| GObject (class/interface) | `<NS>.<Cls>.t obj` | `get_object` | `set_object` | Nullable params yield `option`. |
| `none`/void | `unit` | n/a | n/a | |

**Supported (Phase 1a — new runtime wrappers):**

| GIR type | `ocaml_type` | getter | setter | Notes |
|----------|--------------|--------|--------|-------|
| Enum | `<NS>.<Enum>.t` | `get_enum` ∘ decoder | encoder ∘ `set_enum` | New C wrapper. |
| Flags | `<NS>.<Flags>.t list` | `get_flags` ∘ decoder | encoder ∘ `set_flags` | New C wrapper. |
| `GLib.Variant` | `Gvariant.t` | `get_variant` | `set_variant` | New C wrapper; reuses existing GVariant binding. |
| `gint64` | `Int64.t` | `get_int64` | `set_int64` | 2 signals depend; new `g_value_get_int64` wrapper. |

**Deferred — no signal usage and distinct `GType`** (fall through to
"skipped" log; not on the milestone-2 critical path):

| GIR type | GValue path | Why deferred |
|----------|-------------|--------------|
| `glong`, `gulong` | `G_TYPE_LONG`/`ULONG` | Zero signal usages; on LP64 they alias to `gint64`/`guint64` so adding them later is straightforward. |
| `guint64` | `G_TYPE_UINT64` | Zero signal usages. Add when needed. |
| `gchar`, `guchar` | `G_TYPE_CHAR`/`UCHAR` | Zero signal usages. |
| `gsize`, `gssize`, `goffset` | platform-dependent (`G_TYPE_INT64` on 64-bit) | Zero signal usages; portability-sensitive — preserve until a real signal forces the platform decision. |
| `gpointer` (raw) | `G_TYPE_POINTER` | Two GIR-tagged-as-`gint`-but-`c:type=gpointer` signals look like GIR bugs; not pursuing. |

**Unsupported — long-tail GValue categories:**

| GIR type | Why deferred |
|----------|--------------|
| `<callback>` types | Depends on `<callback>` parsing in Milestone 4. |
| `GLib.Array` | 1 signal; no standalone GArray binding exists either. Milestone 4. |
| Boxed iter/path types (`Gtk.TextIter`, `Gtk.TreeIter`, `Gtk.TreePath`, `GLib.Error`, `Gdk.EventSequence`) | 36+ signal-param refs but each is a distinct boxed `GType` requiring its own typed wrapper. Captured in Phase 9 (deferred to Milestone 3/4). |
| `<param>` (GParamSpec), opaque `<record>` struct-by-value | Negligible signal usage; defer indefinitely. |

When `Signal_marshaller.value_getter` encounters a deferred or
unsupported type it returns `Unsupported`, the generator logs the
skip on stderr (preserving today's diagnostic), and the signal
remains absent from the generated `*_signals` class — never silently
emitted with wrong types.

The fall-through behaviour preserves today's logging-on-skip semantics so
the code base never silently drops a signal — a regression in coverage
shows up as a stderr warning and a count delta.

### Cross-namespace type qualification

When a parameter type lives in another namespace, the generator already
knows how to emit a qualified module reference for methods (see
`Type_mappings.map_cross_reference_to_type_mapping`). Signal generation
threads the same context (`generation_context`) so the qualified name
resolution comes free. The only new wrinkle: the **decoder/encoder for
a foreign enum/flags** must be referenced via its qualified module
(e.g. `Ocgtk_gdk.Gdk.Modifier_type.of_int`).

### Minimal new C code

The closure-dispatch C path (`ml_closure_marshal`) is reusable as-is —
it doesn't care about parameter types, only counts. What we **do** need
to add is a small set of `ml_g_value_get_*`/`ml_g_value_set_*` C
wrappers and matching OCaml `external` declarations for value
categories that signals expose but the runtime currently doesn't:

| Category | Why we need it (milestone signals) | Defer? |
|----------|------------------------------------|--------|
| `enum` (`get_enum`/`set_enum`) | `icon-press` (`EntryIconPosition`), many widget-state signals | **No — required** |
| `flags` (`get_flags`/`set_flags`) | `key-pressed` `state: Gdk.ModifierType`, `key-released`, `modifiers` | **No — required** |
| `variant` (`get_variant`/`set_variant`) | 9 signals across bindings (mostly Gio DBus); standalone `Gvariant` bindings already exist, only the GValue bridge is missing | **No — required** |
| `int64`, `uint64` | None of the four target categories use these. | Yes |
| `long`, `ulong` | Handful of `gulong` timestamp params; not in form example. | Yes |
| `char`, `uchar`, `pointer`, `param` | Not used in any milestone-target signal. | Yes |
| Boxed iter/path types (`TextIter`, `TreeIter`, `TreePath`, `GError`) | 36+ signal-param refs across `TextView`/`TreeView`/tree-model signals — each is a distinct boxed GType, so no generic `get_boxed` works. Largest remaining post-milestone gap. | **Yes — Milestone 3/4** |
| `GArray` | 1 signal across all bindings (Gio); no standalone GArray binding exists either, so cost is disproportionate. | **Yes — Milestone 4** |

That's 4 tiny C wrappers (≈10 lines each) plus 4 `external`s in
`gobject.ml` and 4 `val` lines in `gobject.mli`. All of them follow the
exact pattern of `ml_g_value_get_int`/`ml_g_value_set_int`
(`ml_gobject.c:296-311`). No changes to the marshaller itself.

If a signal references one of the deferred GValue categories
(`int64`, `pointer`, etc.), `Signal_marshaller.value_getter` returns
`Unsupported` and the signal is logged-and-skipped in the same way
today's filter handles unhandled signals — no silent regressions.

---

## Phases

Each phase is independently testable and ships behind a working build.
Tests are added in the same phase as the production change.

### Phase 1a — Runtime: enum, flags, variant, and int64 GValue wrappers

**Goal.** Make `Gdk.ModifierType` (flags), GTK enums, `GLib.Variant`,
and 64-bit signed integer parameters reachable from a closure callback.
These are the four GValue categories that real signals use today and
have no OCaml-visible getter/setter.

- Add to `ocgtk/src/common/ml_gobject.c`:
  - `ml_g_value_get_enum`, `ml_g_value_set_enum` (use `G_VALUE_HOLDS_ENUM`
    + `g_value_get_enum`/`g_value_set_enum`).
  - `ml_g_value_get_flags`, `ml_g_value_set_flags` (use
    `G_VALUE_HOLDS_FLAGS` + `g_value_get_flags`/`g_value_set_flags`).
  - `ml_g_value_get_variant`, `ml_g_value_set_variant` (use
    `G_VALUE_HOLDS_VARIANT` + `g_value_get_variant`/`g_value_set_variant`).
    Wrap the returned `GVariant*` using the existing custom-block
    scheme in `ml_gvariant.c` (`Val_GVariant_new` ref-sinks the
    variant before returning it to OCaml; setter takes ownership of
    the supplied variant via `g_variant_ref_sink` per
    `g_value_take_variant` semantics).
  - `ml_g_value_get_int64`, `ml_g_value_set_int64` (use
    `G_VALUE_HOLDS_INT64` + `g_value_get_int64`/`g_value_set_int64`).
    Return/accept OCaml `Int64.t` via `caml_copy_int64` /
    `Int64_val` — the standard pattern.
  - Enum/flags wrappers return/accept `int` (raw integer; OCaml-side
    decoder converts to/from polymorphic variants).
- Add `external`s in `ocgtk/src/common/gobject.ml` and corresponding
  `val` lines in `gobject.mli` under the existing
  `module Value` block:
  ```ocaml
  val get_enum    : t -> int
  val set_enum    : t -> int -> unit
  val get_flags   : t -> int
  val set_flags   : t -> int -> unit
  val get_variant : t -> Gvariant.t
  val set_variant : t -> Gvariant.t -> unit
  val get_int64   : t -> Int64.t
  val set_int64   : t -> Int64.t -> unit
  ```
- Tests in a new `ocgtk/tests/test_signal_value_enum_flags.ml`:
  - Manually create a `GValue` of an enum GType (e.g.
    `Gtk.Orientation`) via `Value.create`, store/round-trip a value.
  - Same for a flags GType (`Gdk.ModifierType`).
  - Round-trip a GVariant value (e.g. `Gvariant.new_string "hello"`)
    through `Value.set_variant`/`get_variant`.
  - Round-trip an `Int64.t` value through `Value.set_int64`/`get_int64`
    (including `Int64.max_int` to confirm width preservation).
  - Negative test: `get_enum` on an int GValue raises
    `Invalid_argument` (mirroring existing `get_int` semantics).

**Exit criteria.** `xvfb-run dune test ocgtk/` green; the eight new
wrappers are exercised end-to-end.

### Phase 1b — Marshaller helper module (`gir_gen/lib/generate/signal_marshaller.ml`)

**Goal.** Pure function from `Types.gir_type` to the printable getter/
setter expressions described in the table above.

- New module `Signal_marshaller` with:
  - `value_getter : ctx:generation_context -> namespace:string ->
    Types.gir_type -> [ `Supported of marshaller | `Unsupported of reason ]`.
- Unit tests in
  `gir_gen/test/class_generation/signal_marshaller_tests.ml` covering
  each row of the type table. AST-based assertions that the printed
  expression contains the expected `Gobject.Value.get_*` token.

**Exit criteria.** All `gir_gen` tests pass, including 8+ new cases.

### Phase 2 — Generator: signals with primitive params (Categories A, B, C, D, E)

**Goal.** Replace the partition in `signal_gen.ml:119-122` with a per-
signal classifier that emits Strategy 1 or Strategy 2.

- Refactor `generate_signal_class`: split out
  `emit_simple_signal_method` and `emit_closure_signal_method`.
- For each signal:
  - Resolve return type and every parameter type via
    `Signal_marshaller.value_getter`.
  - If any resolution returns `Unsupported`, log on stderr (preserve
    today's diagnostic) and skip — but record the reason.
  - Otherwise emit Strategy 1 or Strategy 2.
- Method signature uses **labelled parameters** matching GIR param
  names (consistent with method-generator convention).
- For non-void signals, the callback's return type is the marshaller's
  `ocaml_type`.

**Tests** (extend
`gir_gen/test/class_generation/signal_wrapper_tests.ml`):

1. **Param-bearing signal** (`pressed` on a synthetic class with
   `n_press: gint, x: gdouble, y: gdouble`) — assert the generated
   class declares `on_pressed` with three labelled args, and the body
   AST contains three `Gobject.Closure.nth` calls and a
   `Gobject.Signal.connect` (not `connect_simple`).
2. **Bool-return signal** (`close-request` with no params) — assert
   `Signal.connect` is used and the body sets a boolean result.
3. **Mixed signal** (`key-pressed`-shaped, three params + bool return).
4. **Unsupported signal** still logs via stderr and does not appear in
   the generated class.
5. **Sender at pos:0** — implicit invariant check: pos values start at 1.

**Exit criteria.** Test suite green; running
`bash scripts/generate-bindings.sh` regenerates without errors;
`dune build` succeeds across all 9 namespaces.

### Phase 3 — Cross-namespace flag/enum params

**Goal.** Make `key-pressed`'s `Gdk.ModifierType` resolve in a Gtk
context to `Ocgtk_gdk.Gdk.Modifier_type.t list` with the correct
decoder/encoder.

- Extend `Signal_marshaller.value_getter` to call the existing
  cross-namespace resolver, then look up the enum/flags decoder
  module path via `Utils.external_namespace_to_module_name`.
- The emitted code references decoders via their qualified path; no
  new generator entry points required.

**Tests** (new file
`gir_gen/test/cross_namespace/cross_ns_signal_tests.ml`):

1. Synthetic Gtk class with a signal taking a `Gdk.ModifierType`
   parameter — assert the generated AST references
   `Ocgtk_gdk.Gdk.Modifier_type.of_int` (or whatever the canonical
   path resolves to).
2. Synthetic class with a signal returning a Gtk-namespace flags
   value — assert encoder is called.

**Exit criteria.** `Event_controller_key.event_controller_key_signals`
in the regenerated bindings has a typed `on_key_pressed` method whose
`state` parameter is the flag-list type.

### Phase 4 — Runtime test for end-to-end marshalling

**Goal.** Prove that the generated code actually round-trips
parameters and results through the C marshaller.

- New file `ocgtk/tests/test_signal_marshalling.ml`:
  - Connect a generated `on_state_set` (Switch, takes `state: bool`,
    returns `bool`); programmatically emit via `Signal.emit_by_name`
    or by toggling the Switch and assert the callback fires with the
    expected boolean and that returning `true`/`false` is observed.
  - Connect a generated `on_close_request` and assert returning `true`
    actually inhibits a window close.
  - Connect a generated `on_key_pressed` via a synthetic
    `EventControllerKey`; emit via `Signal.emit_by_name` with crafted
    GValues; assert `keyval`/`keycode`/`state` round-trip.
- Add to dune `(env (_ (flags (:standard))))` test stanza for
  `xvfb-run`-able tests where needed.

**Exit criteria.** `xvfb-run dune test ocgtk/` green; the new test
file fails if you revert any phase 2/3 commit.

### Phase 5 — Form example application

See "Form example" section below for full design. Implementation
details:

- New file `ocgtk/examples/form_example.ml` (single-file app, ~250
  lines) plus a stanza in `ocgtk/examples/dune`.
- README entry under `ocgtk/examples/README.md`.
- E2E smoke test (optional, follows the calculator AT-SPI pattern):
  `ocgtk/examples/form_example/test_form_example_atspi.py` —
  drives keyboard shortcuts, verifies validation feedback updates,
  triggers close-request and checks the inline confirmation appears.

**Exit criteria.** `dune exec ocgtk/examples/form_example.exe` runs
under `xvfb-run`; the app responds to all four signal categories.

### Phase 7 — Signal flag propagation

**Goal.** Capture the GIR `<glib:signal>` *flag* attributes
(`when="first|last|cleanup"`, `action`, `no-recurse`, `no-hooks`,
`detailed`) end-to-end so the generated bindings can pick sensible
defaults, expose detailed-signal connection, and (optionally) emit
companions for action signals.

These flags don't change a callback's parameter or return shape, so
they aren't on the critical path for Phases 1-5 — but the parser drops
them today and the generator hard-codes `~after:false`, both of which
should be fixed before this milestone closes.

**Sub-steps.**

1. **Parser + types.** Extend `Types.gir_signal`
   (`gir_gen/lib/types.ml:69-77`) with:
   ```ocaml
   when_phase : [ `First | `Last | `Cleanup ] option;
   action     : bool;
   no_recurse : bool;
   no_hooks   : bool;
   detailed   : bool;
   ```
   Update `Gir_parser.parse_signal`
   (`gir_gen/lib/parse/gir_parser.ml:613-664`) to read each attribute.
   Defaults: `when_phase = Some `Last` if missing (matches GLib
   default), other booleans default to `false`.
   Add unit tests covering each attribute in
   `gir_gen/test/parse/`.

2. **`when_phase` → connection default.** In `signal_gen.ml`, default
   `~after:` to `true` for `RUN_LAST` and `RUN_CLEANUP`, `false` for
   `RUN_FIRST`. Idiomatic GTK code matches this. Document the choice
   in the generated module's signal-class docstring.

3. **Detailed signals (`detailed="1"`).** For signals flagged
   `detailed`, generate a sibling method that takes a `~detail`
   labelled string:
   ```ocaml
   method on_notify ?detail ~callback =
     match detail with
     | None         -> Gobject.Signal.connect          obj ~name:"notify"        …
     | Some detail  -> Gobject.Signal.connect_detailed obj ~name:"notify" ~detail …
   ```
   Add a thin `Gobject.Signal.connect_detailed` runtime helper that
   formats the signal name as `name::detail` and delegates to the
   existing connect path. Specifically unblocks typed
   `on_notify_<property>` later (a Milestone 4 task) by providing the
   plumbing now.

4. **Action signals (`action="1"`).** Optional and behind a single
   generator flag — emit a sibling `emit_<name> : <typed args> -> unit`
   on the `*_signals` class that calls
   `Gobject.Signal.emit_by_name`. Useful for action signals like
   `Gtk.Widget::activate-default` that the API contract says
   applications may invoke directly. If the typed-emit helper proves
   awkward (varargs to GValue marshalling), defer to Milestone 4 —
   the parser/types work in step 1 still lands so the data is
   available.

5. **`no-recurse` / `no-hooks`.** Recorded in `gir_signal` for
   completeness but not surfaced in generated code: they are runtime
   policy concerns that don't affect application authors. Document
   the no-op decision inline in `signal_gen.ml`.

**Tests.**

- AST-based: `signal_wrapper_tests.ml` cases for `~after:true`
  defaulting on `when="last"` signals, `~detail` parameter on
  detailed signals, and (if step 4 ships) `emit_*` companion on
  action signals.
- Runtime test extending `test_signal_marshalling.ml`:
  emit `notify::label` on a `GtkLabel` and verify the detailed
  handler fires.

**Exit criteria.** Generated GTK bindings show `~after:true` defaults
where appropriate (spot-check `Gtk_window#close-request`,
`Gtk_widget#realize`); a `notify::*` detailed connection round-trips
in the runtime test.

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

Each of these is a distinct boxed `GType` — `g_value_get_boxed`
returns an opaque `gpointer` that must be cast to the correct C type
and then wrapped/copied into the corresponding OCaml binding. There
is no generic `get_boxed` that could serve all of them, so each type
needs its own typed `Gobject.Value.get_<boxed_type>` /
`set_<boxed_type>` pair plus a lightweight OCaml-side wrapper if one
doesn't already exist. (TextIter and TreeIter, for instance, have
existing manual bindings; TreePath does not.)

**Why deferred:**
- None of the milestone-2 form-example signals use a boxed type.
- Bundling 4–5 boxed-type bindings inflates milestone-2 scope past
  its goal (parameterised and non-void signals).
- The work is independent of the closure machinery — it only needs
  the Phase-1b marshaller dispatcher to learn one more case.

**Suggested grouping for the follow-up milestone:** treat
TextIter/TreeIter/TreePath as a single tranche ("tree-model and
text-buffer signal coverage") and ship them with the related
`<callback>` parsing work that unblocks `GtkTreeModelFilter` and
similar APIs.

### Phase 8 — Migrate hand-written closures, document, archive plan

- Delete the manual `on_close_request` closures in
  `login_form.ml`, `text_editor.ml`, `settings_panel.ml` and replace
  with `window#on_close_request ~callback:…`.
- Delete the manual `key-pressed` block in `calc_ui.ml:179-187` and
  replace with the generated `on_key_pressed`.
- Update `gir_gen/README.md` "Supported features" table.
- Update `LEARNINGS.md` consolidated entry "Signal generator only
  supports void/zero-param signals" → mark superseded.
- Move this plan to `gir_gen/docs/plans/completed/`.

**Exit criteria.** Grep for `Gobject.Closure.create` in
`ocgtk/examples/` returns either zero hits or only hits in
intentionally-illustrative code.

---

## Form example — proposals

The deliverable specifies one app demonstrating: (a) keyboard-shortcut
handling, (b) close confirmation, (c) input validation on entry
changes, (d) clickable links. Three candidates, listed in order of
recommendation:

### Proposal A (recommended) — *Contact form* `form_example.ml`

A simple "send us a message" form. Single window, no separate dialog
widgets (avoids GtkDialog deprecation in 4.10).

- **Fields.** `Name` (Entry), `Email` (Entry), `Phone` (Entry,
  optional), `Message` (TextView). Submit + Reset buttons.
- **Input validation (`Editable::changed`).**
  - Email: live regex check; show `<span foreground="red">…` hint
    until valid; toggle Submit button sensitivity.
  - Phone: format-as-you-type or show nothing if blank.
- **Keyboard shortcuts (`EventControllerKey::key-pressed`).**
  - `Ctrl+Enter` → submit (when valid).
  - `Esc` → focus Cancel.
  - `Ctrl+L` → focus the email field (cycle to next invalid).
- **Close confirmation (`Window::close-request`).**
  - If any field has changed since last submit/reset, show an inline
    banner ("You have unsaved changes — press Ctrl+W again to close")
    and return `true` to inhibit close. Second press within 3 s
    returns `false`.
  - Avoids a modal dialog dependency.
- **Clickable link (`LinkButton::activate-link`).**
  - "Privacy policy" LinkButton at the bottom. Override
    `activate-link` to log and return `true` (handled) so the default
    browser-spawning behaviour is suppressed in the demo (no network
    surprises in CI).

Hits all four categories with realistic patterns; no dependency on
deprecated Dialog widgets; works headless under `xvfb-run`.

### Proposal B — *Settings panel* (extension of `settings_panel.ml`)

Repurpose the existing `settings_panel.ml` shell.

- Pros: smaller diff, builds on a real app.
- Cons: existing app already uses Switch heavily and *most* of its
  signals are 0-param or void; the four-category coverage feels
  contrived. Switch's `state-set` (bool param + bool return) is a
  natural fit, but `key-pressed` and link click feel bolted on.

### Proposal C — *Login + profile editor* (extension of `login_form.ml`)

Add validation, keyboard nav, "Forgot password" link, close-confirm
to the existing login form.

- Pros: reuses code, makes a familiar example richer.
- Cons: login forms typically don't have "unsaved changes" semantics,
  so close-confirm is awkward; we'd be inventing behaviour to hit the
  brief.

**Recommendation: Proposal A.** It maps each milestone signal pattern
to its idiomatic widget, has no deprecated dependencies, and the
Submit-disabled-while-invalid pattern showcases the *practical value*
of generated `changed`/`state-set` callbacks. Falls back to existing
example apps for migration in Phase 6.

---

## Risks & open questions

- **Param naming collisions.** GIR uses `type` and `class` as
  parameter names in a handful of signals; current
  `sanitize_signal_name` only handles signal *names*, not parameter
  names. Add `sanitize_param_name` reusing the same keyword list
  during Phase 2.
- **Enum vs int trade-off.** Returning `Gdk.Modifier_type.t list`
  makes pattern matching idiomatic but allocates per call. Hot paths
  (e.g., `motion-notify`) might prefer raw `int`. Decision: ship
  flag-list types in Phase 3; revisit if `EventControllerMotion`
  benchmarks regress.
- **Optional GObject params.** Some signals declare GObject parameters
  with `nullable="1"`. The C marshaller already returns `None` from
  `Value.get_object` for null pointers, so the OCaml type becomes
  `_ obj option`. No special handling needed, but tests must cover.
- **Signal flag propagation.** GIR `<glib:signal>` carries `when`,
  `action`, `no-recurse`, `no-hooks`, `detailed`. None affect the
  callback signature — they're emission-side concerns. Captured in
  Phase 7 (parser + types update, `when_phase`-derived `~after`
  defaults, detailed-signal `~detail` plumbing). Action-signal
  companion `emit_*` methods are step-4 of Phase 7 and are guarded
  by ergonomic experience — may slip to Milestone 4 if the typed-
  vararg marshalling is awkward.
- **Generated code volume.** Coverage jump 141 → ~268 ≈ +900 LoC
  generated across 9 namespaces. Acceptable; each method is small
  (10-20 lines) and follows a single shape.

---

## TASKS.md updates

Replace under "Milestone 2 - Signal Handling":

```markdown
### Milestone 2 - Signal Handling `#priority:high` `#started:2026-04-27`
Plan: `gir_gen/docs/plans/milestone-2-signals.md`
- [ ] Phase 1a: GValue enum/flags wrappers (C + OCaml + tests)
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

- [ ] `dune test gir_gen/ && xvfb-run dune test ocgtk/` is green from
      a clean tree.
- [ ] `bash scripts/generate-bindings.sh` regenerates all 9 namespaces
      with no new warnings besides the documented Hard-cases skip log.
- [ ] `dune exec ocgtk/examples/form_example.exe` (under `xvfb-run`)
      launches, accepts text, validates email, fires `Ctrl+Enter`,
      shows the close-confirm banner, and intercepts the privacy
      LinkButton.
- [ ] No `Gobject.Closure.create` invocations remain in
      `ocgtk/examples/calculator/calc_ui.ml` or `login_form.ml`.
- [ ] Generated GTK signal count increases from 141 to ≥250.
