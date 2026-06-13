# Milestone 2: Signal Handling with Parameters

**Status: IN PROGRESS**
**Created: 2026-04-27**
**Updated: 2026-06-07**
**Branch: `signals`**

## Overview

GTK 4 signals are the primary event-delivery mechanism: keyboard input, mouse
clicks, window-lifecycle events, and widget-state changes are all expressed as
signals carrying typed parameters and (often) a non-void return value. The
generator originally emitted only the trivial subset — void return, zero
parameters — via `Gobject.Signal.connect_simple`.

This milestone fills that gap. Signals with primitive parameters and signals
with non-void return values become first-class generated free functions in the
per-class L1 modules, with L2 class method forwarders that proxy to L1.

### Goal

Signals that carry typed parameters or non-void returns are generated as
usable OCaml callbacks on top of the existing `Gobject.Closure` runtime,
unlocking keyboard handling, mouse events, window-lifecycle control, and
event-driven UI patterns.

### Non-goals

- Detailed signals (`notify::property-name`)
- Signals with `<callback>`-typed parameters (Milestone 4)
- Signals with `GArray`, struct-by-value, or `va_list` parameters (Milestone 4)
- Boxed record types (`Gtk.TextIter`, `Gtk.TreeIter`, `Gtk.TreePath`,
  `Gdk.EventSequence`, `GLib.Error`) — deferred to Milestone 3/4 (though the
  generic GValue boxed bridge is already in place)

---

## Architecture

### Layering — signals live at L1 with L2 proxies

Signal connectors are free functions in the per-class L1 module (alongside
`external` method declarations), not in a separate `_signals` module/class.
Each signal produces three generated fragments:

| Layer | What | Where |
|-------|------|-------|
| L1 sig | `val on_X : ?after:bool -> t -> callback:(<types>) -> handler_id` | Per-class `.mli` |
| L1 impl | `let on_X ?after obj ~callback = Gobject.Closure.create (fun argv -> …)` | Per-class `.ml` |
| L2 sig | `method on_X : callback:(<l2_types>) -> handler_id` | Class type in `g<Class>.ml` |
| L2 impl | `method on_X ~callback = <L1Mod>.on_X self#as_<snake> ~callback …` | Class body in `g<Class>.ml` |

**Why L1, not L2 directly.** Signal callbacks run inside the GLib closure
marshal, which delivers parameters as a `GValue` array. Extracting typed
values from `GValue` requires calling `Gobject.Value.get_*` — these are
FFI calls that produce L1-level types (`int`, `string`, `Widget.t
Gobject.obj`). The L1 free function contains all marshalling logic (closure
construction, getter/setter calls); the L2 forwarder is a thin proxy that
converts L2 class types ↔ L1 GObject refs (via `self#as_widget`, `new widget`,
etc.) and delegates to L1.

### Signal data flow

```
GLib signal emit
    → ml_closure_marshal (C)        — builds GValue argv[]
    → OCaml closure callback         — Gobject.Closure.nth + get_* at pos:1+
    → user callback (typed OCaml)    — labelled args, typed return
    → set_* into result GValue       — GLib reads return value back
```

The generator computes one `signal_emission` record per signal and consumes it
twice — once for L1 emission, once for L2. The record is pure data; each
layer's renderer is a pure function over it:

```
GIR signal → classify() → signal_emission
                              ├→ emit_l1_val   → .mli entry
                              ├→ emit_l1_let   → .ml let binding
                              ├→ emit_l2_method_sig → class type method sig
                              └→ emit_l2_method → class body forwarder
```

This makes type computation happen once (`ocaml_callback_type` is a field of
`signal_emission`, not recomputed per layer) and ensures unsupported signals
are skipped in all layers simultaneously.

### Cross-namespace types

Cross-namespace GObject/enum/bitfield references (e.g. a Gtk signal with a
`Gdk.ModifierType` param) are resolved through `ctx.cross_references` via the
existing `Type_mappings.map_cross_reference_to_type_mapping`
(`type_mappings.ml:29`). Signal marshallers use the same resolver as method
stubs, producing qualified module paths like `Ocgtk_gdk.Gdk_enums.modifiertype`
or `Ocgtk_gdk.Wrappers.Surface.t`. This is already wired in `classify_enum:97`
and `classify_bitfield:115` of `signal_marshaller.ml`.

---

## Landscape

### Signal coverage overview

Census across all 7 GIR files (462 signals in GTK-4.0.gir; 466 total across
Gdk, Gio, Pango, Gsk, GdkPixbuf, Graphene):

| Category | ~Count | Covered today? | Covered after this milestone? |
|----------|-------:|----------------|-------------------------------|
| A. void return, 0 params (`changed`, `activate` on Entry, etc.) | ~27 | Yes via `connect_simple` | Yes (unchanged) |
| B. void return, primitive params (`response`, `icon-press`, `pressed`) | ~95 | No | Yes |
| C. void return, GObject\* params (`page-added`, `child-notify`) | ~25 | No | Yes |
| D. bool return, 0 or primitive params (`close-request`, `key-pressed`, `state-set`) | ~68 | No | Yes |
| E. bool return, GObject\* params | ~18 | No | Yes |
| F. non-bool/void return (string, int, GObject\*) | ~35 | No | partially (int, int64, string only) |
| G. detailed (`notify::\*`) | ~2 + every property | No | No (deferred) |
| H. hard cases (GArray/GVariant return, callback, struct-by-value, boxed iter) | ~76 | No | No (deferred) |

Expected GTK signal coverage after this milestone: ~141 → ~268 (≈77%), plus
analogous gains in Gdk/Gio/Pango.

### Param-type census

Across 466 signals in seven GIR files, primitive-type breakdown:

```
gint    48   guint   28   gint64  2   gboolean 105   gdouble 57   utf8 53
gpointer 2   (GIR-bug cases tagging a primitive c:type as gpointer)
[zero]  occurrences of: gint8/16/32, guint8/16/32/64, glong, gulong, gchar,
        guchar, gsize, gssize, goffset, gunichar, gunichar2
```

`primitive_marshallers` in `signal_marshaller.ml:22` covers every GIR
primitive type that maps to a `Gobject.Value` accessor defined in
`gobject.ml`. The aliases with zero signal usage (`gint16`, `gint32`,
`guint16`, `guint32`, `gunichar`, `gchar*`, `const gchar*`) are included
for exhaustiveness — they cost one line each and prevent fall-through to
`Tk_Primitive → Unsupported`. Types without a corresponding GValue accessor
(`guint64`, `glong`, `gulong`, `gchar`, `guchar`, `gpointer`, `gsize`,
`gssize`, `goffset`) are genuinely unsupported and documented as such in the
marshaller comment.

Top non-primitive types: `Gtk.TextIter` (13), `Gtk.TreeIter` (12),
`Gtk.TreePath` (11), `GtkWidget`/`GObject` (~20 combined — blocked by the
`classify_gobject` placeholder, addressed by Remaining work 1), `GLib.Variant`
(9), enum/flags (~50 combined), `Gdk.EventSequence` (6), `GLib.Error` (2),
`GLib.Array` (1).

### What's already in place (preexisting — not built in this milestone)

**Parser.** `Gir_parser.parse_signal` (`gir_gen/lib/parse/gir_parser.ml:613`)
extracts parameters and return type into `Types.gir_signal`
(`gir_gen/lib/types.ml:69`). It drops `when`/`action`/`no-recurse`/
`no-hooks`/`detailed` attributes — Phase 7 fixes that.

**Generic closure dispatch.** `ml_closure_marshal`
(`ocgtk/src/common/ml_gobject.c:569-637`) handles arbitrary-arity calls,
exposes parameters via `argv`, and copies a non-void return value back
to GLib at `:629-633`. Verified by direct read in Phase 0 research.

**Per-enum/bitfield C converters.** `Val_<T>` and `<T>_val` are emitted by
`c_stub_enum.ml` and `c_stub_bitfield.ml` for every enum/bitfield in every
namespace. Method stubs call them inline (e.g.
`ml_device_gen.c:134`: `CAMLreturn(Val_GdkModifierType(result));`).
These converters are **C-only** — the corresponding `<ns>_enums.ml` did not
exist before this milestone, so closures running in OCaml had no bridge.

**Hand-written precedent.** `ocgtk/examples/calculator/calc_ui.ml:179-187`
wires `key-pressed` (bool return + 3 primitive params, skipping the `state`
flags param) via manual `Gobject.Closure.create`. `login_form.ml:7-15` wires
`close-request` (bool return, no params).

**Tests.** `gir_gen/test/class_generation/signal_wrapper_tests.ml` validates
signal-class generation via AST inspection.

### Verified gaps (current status)

These are the specific gaps identified in the original research. Most of
items 1-4 are now resolved; items 5-6 remain.

1. **Generator filter (resolved).** `Signal_gen.generate_signal_class`
   previously partitioned all signals with params or non-void returns into a
   `skipped` list. Replaced by the `classify`/`emit_*` pure-data API. ✅

2. **Per-signal closure emission (resolved).** The old code only knew
   `connect_simple`. Now `emit_l1_let` at `signal_gen.ml:258` emits
   `Gobject.Closure.create` bodies for all Strategy-2 signals. ✅

3. **Type → marshaller mapping (resolved).** `Signal_marshaller.classify`
   (`signal_marshaller.ml:157`) maps every `gir_type` to getter/setter
   expressions. 15 test cases cover primitives, enums, bitfields, variant,
   int64, and unsupported cases. ✅

4. **OCaml enum/bitfield bridge (resolved).** `<ns>_enums.ml` now contains
   `_of_int`/`_to_int` decoders for every enum and bitfield. Generic C
   dispatchers (`get/set_enum_int`, `get/set_flags_int`) provide the GValue
   bridge. ✅

5. **GValue OCaml wrappers (resolved).** `Gobject.Value` in `gobject.{ml,mli}`
   now exposes `get/set_{int64,variant,enum_int,flags_int,boxed}` in addition
   to the original `int`, `uint`, `boolean`, `string`, `float`, `double`,
   `object`, `gtype`. ✅

6. **GObject class/interface params** → Remaining work 1. **Now resolved.** `classify_gobject` is fully implemented and returns `Supported` with structured `l2_class` / `is_same_ns_class` / `nullable` fields. Same-namespace signal-param edges are fed into the dependency graph via `extract_signal_dependencies` (already exists in `dependency_analysis.ml:138`). ✅
7. **L2 type coherence** → Remaining work 2. **Now resolved.** `emit_l2_method` / `emit_l2_method_sig` take `~current_layer2_module` and render L2 class types; generated forwarders already emit `new widget` / `Option.map` wrapping. `current_class` has been removed from `classify` (per the DoD) and only remains on L1 emit functions (`emit_l1_val` / `l1_callback_type`), which is intentional. ✅
8. **Form example** → Phase 5.

### Records in signals

~60 record-type references across all 466 signals (`Gtk.TextIter` 13,
`Gtk.TreeIter` 12, `Gtk.TreePath` 11, `Gdk.EventSequence` 6, plus others).
The generic `ml_g_value_get_boxed`/`_set_boxed` pair added in Phase 1a handles
all of them — takes an owned copy via `g_boxed_copy`, wraps it in a
GType-aware custom block whose finalizer calls `g_boxed_free`. Zero per-type
symbols. Existing `_free` externals (e.g. `tree_iter#free`) are a tracked
double-free hazard, out of scope here.

### Existing closure-marshaller test coverage gaps

`ocgtk/tests/test_closure_stress.ml` and `test_closure_with_gc.ml` cover
allocation at scale (1000 closures), void/0-param invocation, single int-param
dispatch, and GC interaction. They do **not** exercise: multi-param dispatch,
mixed-type params, non-void return copy-back (`ml_gobject.c:778-783`),
GObject params, or exception escape. Phase 4 treats closing these gaps
as a hard prerequisite before signals with GObject params ship.

---

## Current State (completed work)

### Runtime: GValue wrappers + enum/bitfield decoders

10 generic C wrappers added to `ocgtk/src/common/ml_gobject.c`
(`ml_g_value_get/set_{int64,variant,enum_int,flags_int,boxed}`). Exposed as
OCaml externals in `gobject.ml`. Each namespace's `<ns>_enums.ml` now contains
pure-OCaml `_of_int`/`_to_int` decoders for every enum and bitfield. A new
`ml_boxed_record_custom_ops` in `wrappers.c` handles GType-aware
`g_boxed_free` for boxed records.

8 of 9 namespace dune files lost their `(modules_without_implementation
<ns>_enums)` clauses. The `set_object None` null fix (`0e6c7bf6`) correctly
stores NULL in the GValue.

The enum/bitfield strategy was chosen after a detailed investigation
of three options — see Appendix A for the tradeoff analysis.

### Signal_marshaller module

 `gir_gen/lib/generate/signal_marshaller.{ml,mli}` maps each `gir_type` to
getter/setter OCaml expressions. `primitive_marshallers` at line 22 is
exhaustive for every GIR primitive with a `Gobject.Value` counterpart. 19 test
cases pass. `classify_gobject` at `signal_marshaller.ml:184` returns `Supported`
with structured `l2_class`, `is_same_ns_class`, and `nullable` fields — it
handles same-namespace and cross-namespace GObject/Interface params
unconditionally. The `nullable` field drives whether `get_object` (option) or
`get_object_exn` (bare) is used in generated code.

### Generator rewrite: pure-data API, L1 + L2 emission

The generator was rewritten from a file-writing pipeline into a pure-data API.
The standalone `_signals.{ml,mli}` files (156 pairs across 9 namespaces) were
eliminated. Signals now appear as `let`/`val` entries inside the per-class L1
module, with one-line L2 method forwarders. 14 test cases pass.

Current API (`signal_gen.mli`):

```ocaml
type signal_emission = {
  signal              : gir_signal;
  method_name         : string;                 (* "on_close_request" *)
  raw_signal_name     : string;                 (* "close-request" *)
  param_marshallers   : (gir_param * Signal_marshaller.marshaller) list;
  return_marshaller   : Signal_marshaller.marshaller option;
  strategy            : [ `Connect_simple | `Closure ];
}

val classify :
  ctx:generation_context -> gir_signal -> (signal_emission, string) result

val l1_callback_type  : current_class:string -> signal_emission -> string
val l2_callback_type  : current_layer2_module:string -> signal_emission -> string
val emit_l1_val       : current_class:string -> signal_emission -> string
val emit_l1_let       : signal_emission -> string
val emit_l2_method    :
  current_layer2_module:string ->
  layer1_module_name:string -> class_snake:string -> signal_emission -> string
val emit_l2_method_sig :
  current_layer2_module:string -> signal_emission -> string
```

**Key design evolution:** The callback type is **not** pre-rendered at
`classify` time. Instead, `l1_callback_type` and `l2_callback_type` are pure
functions over the structural `param_marshallers` / `return_marshaller`. This
keeps `signal_emission` as a single source of truth and eliminates the
`~current_class` parameter from `classify` (DoD satisfied).

Generated L1 example (from `notebook.ml`):

```ocaml
(* L1 val *)
val on_focus_tab :
  ?after:bool -> t -> callback:(object_:Gtk_enums.notebooktab -> bool) ->
  Gobject.Signal.handler_id

(* L1 let *)
let on_focus_tab ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let object_ =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gtk_enums.notebooktab_of_int (Gobject.Value.get_enum_int v)
        in
        let result = callback ~object_ in
        let v = Gobject.Closure.result argv in
        Gobject.Value.set_boolean v result)
  in
  Gobject.Signal.connect obj ~name:"focus-tab" ~callback:closure
    ~after:(Option.value after ~default:false)
```

Generated L2 example (from `gNotebook.ml`):

```ocaml
method on_focus_tab ~callback =
  Notebook.on_focus_tab self#as_notebook ~callback
```

**Current skip count:** ~100 signals skipped. Remaining skips are due to
boxed records (`Gtk.TextIter`, `Gtk.TreeIter`, `Gtk.TreePath`,
`Gdk.EventSequence`), callbacks, non-In direction params, and the
`GObject.Object` meta-type. GObject class/interface params are now fully
supported.

---

## Next steps

Work 1 and Work 2 are **completed** in the current codebase. The remaining
phases are verification, testing, and polish:

1. **Regenerate all 9 namespaces** — verify idempotency, zero GObject-param
   skips, combined modules absorb new SCCs, L2 types are correct
2. **Phase 3** — Cross-namespace verification (spot-check
   `Event_controller_key.on_key_pressed`) ✅
3. **Phase 4** — Runtime marshalling tests (marshaller-level M1–M8 + wired
   widget tests) ✅
4. **Phase 5** — `form_example.ml`
5. **Phases 6–8** — Regression test, signal flags, migrate examples, archive
   plan

---

## Completed Work 1: Feed signal-param edges into the dependency graph

**Status: COMPLETED.** `extract_signal_dependencies` already exists at
`dependency_analysis.ml:138` and is wired into `extract_class_dependencies`
(line 158) and `extract_interface_dependencies` (line 179). The Tarjan SCC
pass absorbs any new cycles into combined modules automatically.

`classify_gobject` at `signal_marshaller.ml:184` is fully implemented and
returns `Supported` with structured `l2_class`, `is_same_ns_class`, and
`nullable` fields. It handles same-namespace and cross-namespace GObject/Interface
params unconditionally.

**Validation results (observed):**
1. `dune build` succeeds across all 9 namespaces.
2. Skip count dropped from ~322 to ~100 (boxed records, callbacks, non-In,
   `GObject.Object` meta-type remain).
3. `grep -c 'GObject class parameter.*not yet supported'` on stderr → 0.
4. Combined-module names reflect new SCCs (e.g. `Tooltip` merged into Window
   combined module).

**Files modified (historical):**
| File | Change |
|------|--------|
| `gir_gen/lib/dependency_analysis.ml` | `extract_signal_dependencies` added (~5 lines); wired into class/interface extraction |
| `gir_gen/lib/generate/signal_marshaller.ml` | `classify_gobject` replaced placeholder with unconditional `Supported` (~30 lines) |
| `gir_gen/lib/generate/signal_marshaller.mli` | Updated doc comment on `classify` |

---

## Completed Work 2: L2 type conversion for GObject signal params/returns

**Status: COMPLETED.** `emit_l2_method` and `emit_l2_method_sig` already take
`~current_layer2_module` and render L2 class types using the structural
`l2_class` field on each marshaller. Generated forwarders already emit:
- `new <class>` wrapping for GObject params (e.g. `new widget child`)
- `Option.map` for nullable params and returns
- `?after` with trailing `()` terminator

**Inherited debt resolution:** `~current_class` was successfully removed from
`Signal_marshaller.classify` and `Signal_gen.classify` (DoD satisfied). It
remains only on L1 emit functions (`emit_l1_val` / `l1_callback_type`), which is
intentional per the design: L1 rendering needs to know the self-class to
collapse same-namespace references to bare `t option`.

**Design insight — direction reversal:**
- **Params (C→OCaml):** L2 callback accepts L2 types; forwarder wraps
  L1→L2 before calling the user (`new widget child`, `Option.map`).
- **Returns (OCaml→C):** User returns L2 type; forwarder unwraps to L1
  (`result#as_widget`, `Option.map`) before setting into GValue.

This mirrors the existing pattern in `class_gen_method.ml`.

**Generated example (observed in `gNotebook.ml:327`):**
```ocaml
method on_page_added ?(after = false) ~callback () =
  Notebook.on_page_added ~after self#as_notebook
    ~callback:(fun ~child ~page_num ->
      callback
        ~child:
          (new
             GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
             .widget
             child)
        ~page_num)
```

**Files modified (historical):**
| File | Change |
|------|--------|
| `gir_gen/lib/generate/signal_marshaller.mli` | `l2_class` added to `marshaller` record |
| `gir_gen/lib/generate/signal_marshaller.ml` | `classify_gobject` populates `l2_class` via `Type_mappings` |
| `gir_gen/lib/generate/signal_gen.mli` | `l1_callback_type` / `l2_callback_type` functions added; `emit_l2_method` signature updated |
| `gir_gen/lib/generate/signal_gen.ml` | Rewrote `emit_l2_method` with L1↔L2 conversion; added `?after` to L2 forwarders |
| `gir_gen/test/class_generation/signal_wrapper_tests.ml` | Tests for L2 GObject param/return type conversion and `?after` |

---

## Remaining phases (summary)

**Phase 3 — Cross-namespace enum/flags resolution.** Already wired from
Phase 1b: `classify_enum` (`signal_marshaller.ml:97`) and `classify_bitfield`
(`:115`) resolve cross-namespace types via `cross_ns_enums_module` (`:69`),
producing qualified paths like `Ocgtk_gdk.Gdk_enums.modifiertype`. The
cross-reference infrastructure is shared with method stubs
(`Type_mappings.map_cross_reference_to_type_mapping` at `type_mappings.ml:29`).
Verification: confirm `Event_controller_key.on_key_pressed` has
`state:Ocgtk_gdk.Gdk_enums.modifiertype` in the regenerated L1 sig.

**Phase 4 — Runtime marshalling tests.** Marshaller-level tests (M1–M8:
multi-param dispatch, non-void return copy-back, exception handling, enum
dispatch, int return copy-back) and wired-signal tests through real widgets.
Add GObject class param tests (e.g. `notebook.page-added`) and `?after`
coverage.

**Phase 5 — Form example app.** `ocgtk/examples/form_example.ml` — a contact
form exercising keyboard shortcuts, close-confirm, input validation, and
clickable links through generated signal connectors.

**Phase 6 — Signal-corpus regression test.** Parse all 7 GIR files, classify
every signal, compare against a checked-in baseline signal coverage snapshot.

**Phase 7 — Signal flag propagation.** ✅ Done. `parse_signal` reads `when=`
into `gir_signal.run_when : signal_run_when option` and `action`/`no-recurse`/
`no-hooks` into matching booleans on `gir_signal` (`types.ml:69`). Parser
tests cover all four attrs plus the omitted-defaults case
(`gir_parser_tests.ml:test_parse_signal_flags`). Downstream consumers (signal
emission, docs) are left unchanged for now; the data is now available to
future phases. Detailed signals (`notify::*`) deferred.

**Phase 8 — Migrate hand-written closures, archive plan.** Replace manual
`Gobject.Closure.create` blocks in examples with generated connectors. Move
this plan to `completed/`.

---

## Verification

- [ ] `dune test gir_gen/ && xvfb-run dune test ocgtk/` green from clean tree
- [ ] `bash scripts/generate-bindings.sh` idempotent (re-run produces no diff)
- [ ] Zero signals skipped due to GObject class parameter type
- [ ] L2 signal forwarder signatures use L2 class types for GObject params/returns
- [ ] L2 signal forwarder bodies generate correct L1↔L2 conversions
- [ ] Combined modules structurally reflect signal-param SCC expansions
- [ ] `xvfb-run dune exec ocgtk/examples/form_example.exe` exercises all four signal patterns
- [ ] No `Gobject.Closure.create` in `examples/` where generated connectors suffice
- [ ] `<ns>_enums.ml` exists for every namespace with at least one enum or bitfield

---

## Appendix A: Enum/bitfield strategy selection

Three designs were evaluated for converting between int-shaped GValues and
OCaml polymorphic-variant enum/bitfield types. The tradeoff was per-type C
symbol count vs shipping cost vs single-source-of-truth.

| | Option 1 | Option 2 (adopted) | Option 3 |
|---|---|---|---|
| **Approach** | Per-type C wrappers (`ml_g_value_get_<T>`) | 4 generic C dispatchers + per-type OCaml decoders | Reuse `Gpointer.variant_table` + `Gobject.Data` |
| **New C symbols** | ~600 (2 per type × ~300) | **4** | ~300 (table getters) |
| **New OCaml** | ~600 externals | ~300 pure functions | ~300 data values |
| **New runtime C code** | ~600 small functions | ~60 lines (generic) | ~120 lines (flags lookup + un-stub `Data.flags`) |
| **In-tree precedent** | N/A | Greenfield | None (would be first user of dormant infrastructure) |
| **Truth for bit values** | Per-type C only | Two sources (OCaml decoders + existing C `Val_<T>`) | Single source (lookup_info table) |

**Investigation (2026-04-27):** `Gobject.Data.flags` was stubbed
(`gobject.ml:248-257`), `decode_flags`/`encode_flags` externals were commented
out, and zero production code used the infrastructure. Adopting Option 3 would
have meant writing a new C flags-lookup primitive, un-stubbing `Data.flags`,
and emitting ~300 per-type C table-getter symbols — defeating the symbol-count
goal that drove the original rejection of Option 1.

**Decision:** Option 2. Zero per-type C symbols, all per-type logic is pure
OCaml emitted by the generator from the same source data as the existing C
`Val_<T>` functions, so divergence requires breaking the generator.

**Follow-up:** Consider migrating method stubs to use the OCaml decoders and
removing the C `Val_<T>`/`<T>_val` converters. This would collapse the
two-sources-of-truth into one.

---

## Appendix B: Cycle handling — why signal-skipping was rejected

**Problem.** `classify_gobject` in `signal_marshaller.ml` needs to handle
same-namespace GObject params. These can introduce dependency edges between L1
modules that form cycles (e.g. `Tooltip` signal param `Widget` when Widget
already depends on Tooltip).

**Approach explored (Epoch 2, committed then discarded):** Add bespoke
reachability machinery — `build_module_dependency_graph` and
`module_reaches_module` — that pre-emptively detects would-be cycles and
**skips** those signals at generation time.

**Why it was wrong:**

1. **Duplication.** `build_module_dependency_graph` was a clone of the
   existing `build_dependency_graph` at `dependency_analysis.ml:189` that
   collapsed class-level edges to module-level edges. Tarjan SCC in
   `compute_module_groups:231` already does cycle detection correctly.
2. **Silent data loss.** Cycle-creating signals were simply omitted. A signal
   on `Tooltip` that takes a `Widget` param is useful; skipping it silently
   is worse than having the classes share a combined module.
3. **Maintenance burden.** ~200 lines of graph code with its own DFS
   reachability, separate from the canonical SCC pass, that must stay in step
   with any changes to module grouping.

**What replaces it:** Feed signal-param edges into the existing
`build_dependency_graph`. The Tarjan SCC naturally absorbs new cycles into
larger combined modules. Combined modules are internal — the L2 API doesn't
change. No signals are skipped.

**Code that must be removed** (committed on the `signals` branch during Epoch 2):
- `build_module_dependency_graph` and `module_reaches_module` from
  `dependency_analysis.ml` (if present)
- The reachability-check-and-skip branch in `classify_gobject`
- `dependency_graph_tests.ml` test file (if present)
