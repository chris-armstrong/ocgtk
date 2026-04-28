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
first-class generated free functions in the per-class L1 modules (with one-line L2 method forwarders that proxy to L1), and a new
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

### Existing closure-marshaller test coverage

`ocgtk/tests/test_closure_stress.ml` and `test_closure_with_gc.ml`
together cover allocation at scale (1000 closures), void/0-param
invocation, single int-param dispatch via
`Gobject.Test.invoke_closure_int`, and Gc.minor interaction. **They
do not exercise** multi-param dispatch (despite
`Gobject.Test.invoke_closure_two_ints` existing at `gobject.mli:260`,
no test calls it), mixed-type params, GObject params, exception
escape, or — critically — **the non-void return-value copy-back path
at `ml_gobject.c:629-633`**. The marshaller is correct on inspection
(verified by direct read in this milestone's research), but the parts
that Strategy 2 actually relies on are not under test today. **Phase 4
treats closing this gap as a hard prerequisite**, not just an
end-to-end check on generated code.

### Records in signals

The census shows ~60 record-type references across all 466 signals,
and **all of them are boxed `<record>` types or opaque structs**:
TextIter (13), TreeIter (12), TreePath (11), EventSequence (6),
Rectangle (2), Error (2), RGBA (1), CssSection (1), VariantDict (1),
plus a handful of opaque structs without registered GTypes
(DragSurfaceSize, ToplevelSize). One signal passes `GObject.Value` —
treated as a special-case boxed param.

**No record signal-param needs new design beyond what Phase 9
already covers** for the iter/path tranche. Each requires a per-type
`Gobject.Value.get_<RecordType>` wrapper that pulls
`g_value_get_boxed`, casts to the typed `*` pointer, and hands off
to the existing OCaml record binding (where one exists). The
generator already emits OCaml record wrappers for most of these; the
gap is only the GValue ↔ record bridge. Phase 9 captures the work;
this milestone explicitly defers all of it.

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

### Layering — signals are L1, L2 mirrors

**Signal connectors are emitted at Layer 1** as free functions inside
the existing per-class L1 module, alongside the class's `external`
methods. **No separate `_signals` files, classes, or modules.** The L2
class wrapper gains a one-line method forwarder per signal that
delegates to the L1 free function.

This replaces the current 156 generated `g<class>_signals.{ml,mli}`
file pairs across all 9 namespaces with entries spliced into the
existing per-class L1 sig/impl. The L2 class type loses its
`inherit G<Class>_signals.<class>_signals` line and gains direct
forwarder methods that proxy to L1.

### Strategy 1 — `connect_simple` (unchanged)

For signals that return void and take zero parameters, the L1 free
function and L2 forwarder are:

```ocaml
(* L1 — in application_and__window_and__window_group.ml, inside `and Window = struct … end` *)
let on_changed ?(after = false) (obj : t) ~callback =
  Gobject.Signal.connect_simple obj ~name:"changed" ~callback ~after

(* L1 sig — in the matching `.mli` *)
val on_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

(* L2 forwarder — in gApplication_and__window_and__window_group.ml *)
method on_changed ?after ~callback =
  Window.on_changed ?after self#as_window ~callback
```

### Strategy 2 — `Closure`-based dispatch

For all other supported signals. Concrete example for
`EventControllerKey::key-pressed`
(`gboolean (guint keyval, guint keycode, GdkModifierType state)`):

```ocaml
(* L1 free function *)
let on_key_pressed
    ?(after = false)
    (obj : t)
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
        let state   = Ocgtk_gdk.Gdk_enums.modifiertype_of_int
                        (Gobject.Value.get_flags_int
                           (Gobject.Closure.nth argv ~pos:3)) in
        let result  = callback ~keyval ~keycode ~state in
        Gobject.Value.set_boolean (Gobject.Closure.result argv) result)
  in
  Gobject.Signal.connect obj ~name:"key-pressed" ~callback:closure ~after

(* L1 sig *)
val on_key_pressed :
  ?after:bool ->
  t ->
  callback:(keyval:int -> keycode:int -> state:Gdk_enums.modifiertype -> bool) ->
  Gobject.Signal.handler_id

(* L2 forwarder *)
method on_key_pressed ?after ~callback =
  Event_controller_key.on_key_pressed
    ?after self#as_event_controller_key ~callback
```

Notes on the shape:
- L1 takes the typed obj as a positional `t` argument; tag-based
  poly-variant constraints follow the existing L1 method idiom.
- `pos:0` in the GValue array is the sender (instance) — params start
  at `pos:1`. (Confirmed by `calc_ui.ml:181` extracting `keyval` at
  `pos:1`.)
- Param names from GIR map directly to labelled OCaml arguments.
  Reserved keywords (`type`, `class`, `method`, etc.) get a trailing
  underscore via the same logic as `Signal_gen.sanitize_signal_name`
  (`signal_gen.ml:66-74`); empty names fall back to `arg<N>`.
- For non-void signals, generator emits `Signal.connect` rather than
  `Signal.connect_simple`.
- Enum/flags conversion goes through the per-type pure-OCaml decoder
  (Phase 1a Option 2) — `Gdk_enums.modifiertype_of_int`.
- The L2 forwarder is a one-line proxy. It contains no marshaller
  logic, no closure construction, and no `Gobject.Signal.connect`
  — every concern lives at L1.

### Code sharing across L1 and L2: a single typed model

The generator computes one record per signal and consumes it twice —
once for L1 emission and once for L2 forwarder emission. The record
is pure data; the per-layer renderers are pure functions over it.

```ocaml
(* gir_gen/lib/generate/signal_gen.ml — public API *)

type signal_emission = {
  signal              : Types.gir_signal;
  method_name         : string;                 (* "on_close_request"  *)
  raw_signal_name     : string;                 (* "close-request"     *)
  param_marshallers   : (Types.gir_param * Signal_marshaller.marshaller) list;
  return_marshaller   : Signal_marshaller.marshaller option;
  ocaml_callback_type : string;                 (* "keyval:int -> ... -> bool" *)
  strategy            : [ `Connect_simple | `Closure ];
}

val classify :
  ctx:Types.generation_context ->
  namespace:string ->
  Types.gir_signal ->
  (signal_emission, string) Result.t
(* Error reason fed into the existing stderr skip log *)

val emit_l1_val    : signal_emission -> string  (* one .mli entry *)
val emit_l1_let    : signal_emission -> string  (* one .ml  entry *)
val emit_l2_method : signal_emission -> string  (* one L2 method  *)
```

Why this carve-up is the right axis for code sharing:

- **Single source of truth for the OCaml signature.** `ocaml_callback_type`
  is computed once. `emit_l1_val` produces
  `?after:bool -> t -> callback:(<type>) -> handler_id`;
  `emit_l2_method` produces `?after -> callback:<type>` (drops the obj
  position) and forwards to the L1 function. Mechanical adjustment, no
  re-derivation.
- **Marshaller composition is pure data.** `param_marshallers` and
  `return_marshaller` are computed once. The L1 `let` body uses them
  to build the closure. The L2 forwarder ignores them entirely (it
  delegates to L1).
- **Unsupported path is shared.** `classify` returns `Error reason`
  once; the per-class emitter logs once and skips the signal in both
  layers.
- **Future-proof.** Phase 9 boxed types extend `Signal_marshaller`;
  both emitters get the new support automatically — `signal_gen.ml`
  doesn't care.

### Enum/bitfield decoder layer — three options weighed

Three designs were considered for converting between an `int`-shaped
GValue and the OCaml polymorphic-variant types declared in
`<ns>_enums.mli`. The trade-off is C-symbol count vs. OCaml-symbol
count vs. reuse of existing infrastructure.

**Option 1 — per-type GValue C wrappers** (`ml_g_value_get_<EnumName>` /
`_set_<EnumName>`) alongside existing `Val_<T>` / `<T>_val`. Doubles
C-symbol count for enums/bitfields (≈ 600 new C entry points across
the 9 namespaces). **Rejected** for symbol-table cost.

**Option 2 — generic C dispatchers + per-type pure-OCaml decoders.**
4 generic C entry points (`get_enum_int`/`set_enum_int`/
`get_flags_int`/`set_flags_int`) plus per-type pure-OCaml
`<lower>_of_int`/`<lower>_to_int` functions in `<ns>_enums.ml`. C cost
fixed at 4. OCaml cost: ≈ 300 functions emitting bit-test logic that
mirrors the existing C `Val_<T>` / `<T>_val`. Two sources of truth
for the bit values, both generated from the same `Types.gir_bitfield`
data so divergence requires breaking the generator.

**Option 3 (preferred — pending Phase 0 investigation) — generic C
dispatchers + reuse of the existing `Gpointer.variant_table` /
`Gobject.Data.{enum,flags}` infrastructure.** The codebase already
has `Gpointer.variant_table` (`ocgtk/src/common/gpointer.ml:24-27`),
`external decode_variant : 'a variant_table -> int -> 'a =
"ml_lookup_from_c"` (binary search over a C static table in
`wrappers.c:57-73`), and `Gobject.Data.enum` / `Gobject.Data.flags`
(`gobject.mli:240-244`) which produce `(int -> 'a) * ('a -> int)`
decoder/encoder pairs from a `variant_table`. If this infrastructure
is fully wired (especially the bitfield variant — the Opus review
noted possible stubbing of `decode_flags`/`encode_flags`), then the
generator can:

1. Emit a per-type **data table** in C (a `variant_table` literal —
   pure data, smaller than a function symbol) generated alongside
   the existing `Val_<T>` / `<T>_val` in `ml_<ns>_enums_gen.c`.
2. Emit, in `<ns>_enums.ml`, *one let-binding* per enum/bitfield
   that calls `Gobject.Data.enum table` (or `flags table`) to
   materialise the `_of_int` / `_to_int` pair as the table's
   `decode_variant` / `encode_variant` partial application.

Option 3 collapses the two-sources-of-truth concern (the table
becomes the **single** source of truth, used by both method stubs
and signal stubs), shrinks the OCaml output (≈ 300 small data
values rather than ≈ 300 function bodies), and reuses code paths
that have already been hardened by the lablgtk lineage.

**Phase 0 (new — must run before Phase 1a)** verifies whether
Option 3 is achievable today. See "Phase 0 — Verify
`Gobject.Data` infrastructure" below.

**Adopted design (provisional).** Option 3 if Phase 0 confirms the
runtime is wired; otherwise fall back to Option 2. The C-symbol
budget is identical for both; the difference is only in where the
per-type information lives (C data table vs. OCaml function body).
Either way, **per-type C entry points are avoided**.

**C side — two new functions, total, shared across all namespaces.**
Live in `ocgtk/src/common/ml_gobject.c`:

```c
CAMLprim value ml_g_value_get_enum_int(value gv_val) {
    CAMLparam1(gv_val);
    GValue *gv = GValue_val(gv_val);
    if (!G_VALUE_HOLDS_ENUM(gv))
        caml_invalid_argument("get_enum_int: not an enum GValue");
    CAMLreturn(Val_int(g_value_get_enum(gv)));
}

CAMLprim value ml_g_value_set_enum_int(value gv_val, value v) {
    CAMLparam2(gv_val, v);
    g_value_set_enum(GValue_val(gv_val), Int_val(v));
    CAMLreturn(Val_unit);
}
/* ml_g_value_get_flags_int / ml_g_value_set_flags_int analogous. */
```

Exposed on the OCaml side as a small extension of `module Value` in
`gobject.{ml,mli}`:

```ocaml
val get_enum_int  : t -> int
val set_enum_int  : t -> int -> unit
val get_flags_int : t -> int
val set_flags_int : t -> int -> unit
```

**OCaml side — per-type pure-OCaml decoders generated into
`<ns>_enums.ml`.** The generator already knows every enum's int values
and every bitfield's flag bits (`Types.gir_enum.members.value` and
`Types.gir_bitfield.flags.flag_value`), so it emits, for every
enum/bitfield, a typed `_of_int` / `_to_int` function pair:

```ocaml
(* Generated in gdk_enums.ml *)
let modifiertype_of_int (n : int) : modifiertype =
  let acc = ref [] in
  if n land 0x1 <> 0 then acc := `SHIFT_MASK :: !acc;
  if n land 0x2 <> 0 then acc := `LOCK_MASK :: !acc;
  if n land 0x4 <> 0 then acc := `CONTROL_MASK :: !acc;
  (* ... one branch per flag, version-guarded where needed ... *)
  !acc

let modifiertype_to_int (flags : modifiertype) : int =
  List.fold_left (fun acc -> function
    | `SHIFT_MASK   -> acc lor 0x1
    | `LOCK_MASK    -> acc lor 0x2
    | `CONTROL_MASK -> acc lor 0x4
    (* ... *)
    ) 0 flags

(* Enum variant — single tag rather than list *)
let orientation_of_int = function
  | 0 -> `HORIZONTAL
  | 1 -> `VERTICAL
  | n -> failwith (Printf.sprintf "Gtk.Orientation: bad int %d" n)
let orientation_to_int = function
  | `HORIZONTAL -> 0
  | `VERTICAL   -> 1
```

Generator-emitted signal callsite then composes the pieces:

```ocaml
let state =
  Gdk_enums.modifiertype_of_int
    (Gobject.Value.get_flags_int (Gobject.Closure.nth argv ~pos:3))
in
```

**Cost analysis.**

| Aspect | Per-type C symbols (rejected) | Generic dispatcher + OCaml decoders (adopted) |
|--------|-------------------------------|-----------------------------------------------|
| New C symbols | ~600 (2 per enum/bitfield × ~300) | **4** (`ml_g_value_get_enum_int`, `_set_enum_int`, `_get_flags_int`, `_set_flags_int`) |
| New OCaml `external` decls | ~600 | **4** |
| New OCaml functions per type | 0 | 2 (pure: `_of_int`, `_to_int`) — generated bytes, not symbols |
| Per-call cost | one indirect function call | identical (one extern + one branch on int) |
| Type safety at FFI boundary | full | full (decoders typed; no `Obj.magic`) |

**Why not a runtime registry / `Obj.magic` dispatcher?** A `GType`-keyed
registry collapses C symbols similarly but loses type safety at the
OCaml boundary — every callsite must `Obj.magic` the result and the
generator carries the responsibility for soundness. The decoder
approach achieves the same symbol-cost win without erasing types.

**Why not just call the existing `Val_GdkModifierType` from OCaml via a
per-type `external`?** That's the per-type-symbol design we just
rejected — same cost.

**Two-source-of-truth concern.** Bit values now appear both in C
(existing `Val_<T>` / `<T>_val` used by method stubs) and in OCaml
(new decoders used by signal stubs). Both are emitted by the same
generator pass from the same `Types.gir_bitfield` source data, so
divergence requires breaking the generator — not a maintenance
concern. A follow-up could migrate method stubs to also use the
OCaml decoders and remove the C `Val_<T>` / `<T>_val` outright; that
is post-milestone scope.

**Version-guarded members.** The generator already knows version
guards (`Types.gir_bitfield_flag.version`); the OCaml decoder emits
`[@@if Gtk_version.gtk4_14_or_later]`-style annotations or runtime
checks matching what the C side does at `ml_gdk_enums_gen.c:1386-1394`.

### Param-type → marshaller mapping

`Signal_marshaller` (Phase 1b) **does not take `Types.gir_type` alone**
— it must see direction, nullability, transfer-ownership, and varargs,
because GIR `<parameter>` carries those *outside* the `<type>` element
and they materially change correctness. The module takes a `gir_param`
for parameters and a return-spec triple for returns:

```ocaml
type marshaller =
  { ocaml_type    : string                                   (* "int", "Gdk_enums.modifiertype", … *)
  ; getter_expr   : argv:string -> pos:int -> string        (* OCaml expression yielding the value *)
  ; setter_expr   : argv:string -> value_var:string -> string
  }

type result =
  | Supported   of marshaller
  | Unsupported of string  (* reason — logged in stderr skip message *)

val for_param :
  ctx:generation_context -> namespace:string -> gir_param -> result
val for_return :
  ctx:generation_context -> namespace:string ->
  gir_type * transfer_ownership * nullable:bool -> result
```

`for_param` returns `Unsupported` immediately, before any type
classification, when:

- `param.direction <> In` — `Unsupported "direction=out signal
  parameter not supported"`. Verified-real cases:
  - `GtkSpinButton::input` (`gir/Gtk-4.0.gir:136016`) declares
    `direction="out" caller-allocates="0" transfer-ownership="full"
    <type name="gdouble" c:type="gpointer"/>` for parameter
    `new_value`.
  - `GtkEditable::insert-text` (`gir/Gtk-4.0.gir:48692-48731`) has
    `direction="inout"` on `position`.
- `param.varargs = true` — never legal in real GLib signals (only on
  `<callback>` and `<function>`); cheap guard.
- `param.param_name = ""` — fallback to `arg<N>` and continue.

`for_return` returns `Unsupported` when:

- The return is a GObject with `transfer_ownership = Full` — needs
  `g_value_take_object` semantics not yet wired. Verified-real cases:
  - `GtkComboBox::format-entry-text` returns `transfer-ownership="full"`
    `utf8`. (For string returns the existing `g_value_set_string`
    copies, so transfer-full strings are *accidentally* correct; we
    accept them but document the subtlety.)
  - `GtkDragSource::prepare` returns
    `transfer-ownership="full" nullable="1"` `Gdk.ContentProvider`.
    On the hot drag path, leaks one ref per emission today.
  - `GtkGLArea::create-context` returns `transfer-ownership="full"`
    `Gdk.GLContext`.
- The return type's `array <> None` — array returns are deferred.

`for_param` *and* `for_return` honour `nullable`:

- Nullable GObject parameters: `ocaml_type` is wrapped in `option`;
  the existing C `ml_g_value_get_object` returns NULL → `caml_failwith`
  → caught by `gobject.ml` `try Some _ with _ -> None`. Reading works.
- Nullable GObject returns: **blocked by a pre-existing bug in
  `set_object`**. `ocgtk/src/common/gobject.ml:175-177` defines
  `set_object v None = ()` — a no-op that leaves the result GValue
  uninitialised. Phase 1a fixes this (see Phase 1a → "Pre-existing
  bug fix" subsection).

**`allow-none` normalisation.** Older GIR (Gio uses it) writes
`allow-none="1"` instead of `nullable="1"`. The parser at
`gir_gen/lib/parse/gir_parser.ml` should normalise both into
`gir_type.nullable` (or its parameter-level equivalent). Verify before
Phase 1b: `grep allow-none gir/*.gir` shows Gio uses it; GTK 4 GIR
uses `nullable` consistently.

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

| GIR type | `ocaml_type` | getter expression | setter expression | Source |
|----------|--------------|-------------------|--------------------|--------|
| Enum (`<NS>.<EnumName>`) | `<NS>_enums.<enumname>` | `<NS>_enums.<enumname>_of_int (Gobject.Value.get_enum_int gv)` | `Gobject.Value.set_enum_int gv (<NS>_enums.<enumname>_to_int v)` | 2 generic C dispatchers + per-type pure-OCaml decoders in `<ns>_enums.ml` |
| Bitfield (`<NS>.<FlagsName>`) | `<NS>_enums.<flagsname>` | `<NS>_enums.<flagsname>_of_int (Gobject.Value.get_flags_int gv)` | `Gobject.Value.set_flags_int gv (<NS>_enums.<flagsname>_to_int v)` | as above |
| `GLib.Variant` | `Gvariant.t` | `Gobject.Value.get_variant gv` | `Gobject.Value.set_variant gv v` | new generic C wrapper |
| `gint64` | `Int64.t` | `Gobject.Value.get_int64 gv` | `Gobject.Value.set_int64 gv v` | new generic C wrapper; 2 signals depend |

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
omits the signal from both L1 emission and the L2 forwarder — never silently
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

### Phase 0 — Verify `Gobject.Data` infrastructure

**Goal.** Establish whether Option 3 (reuse `Gpointer.variant_table` /
`Gobject.Data.{enum,flags}`) is achievable today, before Phase 1a
commits the generator to either Option 2 or Option 3.

**Investigation steps**

1. Read `ocgtk/src/common/gpointer.ml` and `gpointer.mli` end-to-end.
   Confirm `variant_table` is a real type (not opaque-stub) and
   `decode_variant` / `encode_variant` reach a working C primitive
   in `wrappers.c:57-73`.
2. Read `ocgtk/src/common/gobject.{ml,mli}` lines around 240
   (`Data.enum`, `Data.flags`). Confirm both branches actually
   construct decoders (or note which is stubbed).
3. Search for an existing in-tree user: `grep -rn "Gobject.Data.enum\\|Gobject.Data.flags" ocgtk/`. If lablgtk or current
   methods use it for something, the path is hardened.
4. Check whether `variant_table` literals can be emitted from the
   generator — i.e., whether the C-side static table representation
   is documented and stable.
5. Check whether version-guarded flag members can be expressed in a
   `variant_table` (some entries conditionally absent at compile
   time). The C `Val_GdkModifierType` uses `#if GTK_CHECK_VERSION`
   (`ml_gdk_enums_gen.c:1386-1394`); the static table would need the
   same.

**Outcome decision**

- **Option 3 viable** if all of (1)-(5) check out → commit Phase 1a
  to Option 3.
- **Option 3 partially viable** (e.g. enums work, flags stubbed) →
  un-stub the missing branch as part of Phase 1a, then commit.
- **Option 3 not viable** (e.g. variant_table cannot be generator-
  emitted) → fall back to Option 2 (per-type pure-OCaml decoders) and
  document why.

**Phase 0 results (2026-04-27, verified by direct read).**

✅ `Gpointer.variant_table` is real (`gpointer.ml:24`) and backed by
`lookup_info { value key; int data; }` (`wrappers.h:87`). Enum
encoder/decoder work end-to-end via `lookup_from_c_direct` / `lookup_to_c_direct` (`wrappers.c:30, 41`), wrapped at `:57, :68`,
exposed via `decode_variant` / `encode_variant`.

✅ `Gobject.Data.enum` (`gobject.ml:245`) wires it correctly.

❌ **`Gobject.Data.flags` is stubbed.** `gobject.ml:248-257` body
admits "For now, decode as single value — full implementation would
decode bits/combine bits". A flags int of `0x6` would fail or return
the wrong tag.

❌ **`decode_flags` / `encode_flags` externals are commented out**
(`gpointer.ml:28-33`). The matching C symbols (`ml_lookup_flags_from_c`,
`ml_lookup_flags_to_c`) **do not exist** anywhere in the source.

❌ **Zero in-tree users.** No production code references `Data.enum`,
`Data.flags`, or `variant_table` — only the definitions. Adopting the
infrastructure makes us the first user; latent-bug risk is non-zero.

❌ **No generator emission of `lookup_info` arrays exists today.**

**Critical realisation about Option 3 cost.** Materialising a per-type
`variant_table` on the OCaml side requires **one C accessor symbol
per type** (`ml_<typename>_table()` returning the static lookup_info
array), per the lablgtk pattern. That's ~300 per-type C symbols
(half of Option 1's 600, but still per-type). **Option 3 does not
actually win on the metric that drove the original rejection of
Option 1.** Option 2 has **zero** per-type C symbols.

**Decision: adopt Option 2** for this milestone. Concretely:

| | Option 2 (adopted) | Option 3 (rejected) |
|--|---|---|
| Per-type C symbols | 0 | ~300 (table getters) |
| Per-type OCaml | ~300 pure functions | ~300 small data values |
| New runtime code | none beyond `enum_int`/`flags_int` dispatchers | new flags lookup C primitive (≈ 60 LoC) + un-stub `Data.flags` |
| In-tree precedent | none (greenfield) | none (would be first user of dormant infra) |
| Source-of-truth for bit values | OCaml `<ns>_enums.ml` *and* existing C `Val_<T>` | the `lookup_info` table only |

Option 3 wins on the "single source of truth" axis. Option 2 wins on
all three of (a) per-type C-symbol count, (b) shipping cost, (c)
latent-bug risk. Symbol count was the originating concern; Option 2
honours it directly.

**Follow-up cleanup (out of scope this milestone):** consider
migrating method stubs to the OCaml `<ns>_enums` decoders and
removing the existing C `Val_<T>` / `<T>_val` outright. That collapses
Option 2's two-sources-of-truth into one and is the natural sequel.

**Exit criteria.** Phase 1a commits to **Option 2** as designed in
this plan. The Option 3 investigation result is recorded in the
plan and the matching follow-up task is added to TASKS.md.

---

### Phase 1a — Runtime: per-type enum/flags GValue wrappers + variant + int64

**Goal.** Make `Gdk.ModifierType` (flags), GTK enums, `GLib.Variant`, and
`gint64` parameters reachable from a closure callback.

**Pre-existing bug fix (REQUIRED — must land in Phase 1a).**
`ocgtk/src/common/gobject.ml:175-177` defines `set_object v None = ()`,
a no-op that leaves the GValue uninitialised. This silently breaks
**every** signal whose return is a nullable GObject — most notably
`GtkDragSource::prepare`. Fix: implement NULL-set via
`g_value_set_object(gv, NULL)` in a small new C primitive
`ml_g_value_set_object_null` (~5 lines in `ml_gobject.c`); update
`gobject.ml` `set_object` to dispatch on the `option` constructor.
Add a regression test in `ocgtk/tests/test_gobj.ml` that reads back
`None` after setting `None`.

**Files to modify**

| File | Line | Change |
|------|------|--------|
| `ocgtk/src/common/ml_gobject.c` | new code after line 440 | Add 8 new C wrappers (**generic, total — not per-type**): `ml_g_value_get_int64` / `_set_int64`, `ml_g_value_get_variant` / `_set_variant`, `ml_g_value_get_enum_int` / `_set_enum_int`, `ml_g_value_get_flags_int` / `_set_flags_int`. The last four return/accept raw `int`; OCaml-side decoders convert to typed variants. |
| `ocgtk/src/common/gobject.ml` | extend `module Value` block (lines 145-178) | Add eight `external` declarations matching the C entries. |
| `ocgtk/src/common/gobject.mli` | extend `module Value` (lines 117-151) | Add matching `val` lines: `val get_int64 / set_int64 / get_variant / set_variant / get_enum_int / set_enum_int / get_flags_int / set_flags_int`. |
| `gir_gen/lib/generate/enum_code.ml` | currently emits the `.mli` only; extend to also emit `.ml` | For every enum, generate two pure-OCaml functions: `<lower>_of_int : int -> <type>` (matches on int, yields polymorphic-variant tag) and `<lower>_to_int : <type> -> int` (reverse). For every bitfield, generate `<lower>_of_int : int -> <type>` (bit-tests yielding flag list) and `<lower>_to_int : <type> -> int` (folds flags via `lor`). Honour version guards via `[@@if Gtk_version.<gate>]` annotations on individual branches, mirroring the C side at `ml_gdk_enums_gen.c:1386-1394`. Add `val` lines to the `.mli` emission. |
| `gir_gen/lib/generate/c_stub_enum.ml` | unchanged | Existing `Val_<T>`/`<T>_val` C functions remain — used by method stubs. No new per-type C symbols. |
| `gir_gen/lib/generate/c_stub_bitfield.ml` | unchanged | Same. |
| `ocgtk/src/<ns>/dune` (×9) | one line per namespace | **Remove** `(modules_without_implementation <ns>_enums)` from each of the 9 namespaces — `<ns>_enums.ml` now exists. Locations grep: `cairo/dune:30`, `gdkpixbuf/dune:30`, `gdk/dune:35`, `gio/dune:37`, `graphene/dune:30`, `gsk/dune:30`, `gtk/dune:39`, `pango/dune:30`, plus one more (run `grep -rn modules_without_implementation ocgtk/src/`). For namespaces with **zero** enums and bitfields (Cairo/Graphene if applicable), keep the clause and skip generating `.ml`. |

**Validation outputs**

After regeneration via `bash scripts/generate-bindings.sh`, the implementer
must confirm:

1. `ocgtk/src/gdk/generated/gdk_enums.ml` **exists** and contains pure-OCaml
   decoders, e.g.:
   ```ocaml
   let modifiertype_of_int (n : int) : modifiertype =
     let acc = ref [] in
     if n land 0x1 <> 0 then acc := `SHIFT_MASK :: !acc;
     ...
     !acc

   let orientation_of_int = function
     | 0 -> `HORIZONTAL
     | 1 -> `VERTICAL
     | n -> failwith (Printf.sprintf "Gtk.Orientation: bad int %d" n)
   ```

2. `ocgtk/src/common/ml_gobject.c` contains the 8 new generic dispatchers
   only — **no per-type symbols added** anywhere in the generated C.
   Verify: `grep -c "ml_g_value_get_" ocgtk/src/common/ml_gobject.c`
   should jump from its current value by exactly 8 (4 getters, 4
   setters), and
   `grep -c "ml_g_value_get_" ocgtk/src/*/generated/*.c`
   should remain **0**.

3. `dune build` succeeds across all 9 namespaces with no link errors.

4. Spot-check a non-bitfield enum (e.g. `Gtk_enums.orientation_of_int`,
   `Gtk_enums.align_of_int`) and a bitfield (e.g.
   `Gdk_enums.modifiertype_of_int`) to confirm both forms are emitted.

5. **C-symbol-cost target**: total new C symbols introduced by Phase 1a
   is exactly **8**, regardless of enum/bitfield count. This is the
   primary acceptance criterion.

6. `grep -c "_of_int\\|_to_int" ocgtk/src/*/generated/*_enums.ml` should
   equal **2 ×** (total enum + bitfield count) (≈ 300 functions, all
   pure OCaml).

7. **Round-trip property check**: for every enum `T`,
   `T_of_int (T_to_int v) = v`; for every bitfield `T` and any subset
   `s` of declared flags, `T_of_int (T_to_int s)` is `s` modulo flag
   ordering. (Generator emits this as an alcotest QuickCheck-style
   smoke test per type — see Phase 1a tests below.)

**Test cases**

In `ocgtk/tests/test_signal_value_enum_flags.ml` (new file; add to
`ocgtk/tests/dune`):

| # | Name | Setup | Assertion |
|---|------|-------|-----------|
| 1 | `enum round-trip via decoder` | `Gobject.Value.create (g_type_for "GtkOrientation"); Value.set_enum_int v (Gtk_enums.orientation_to_int `VERTICAL)` | `Gtk_enums.orientation_of_int (Value.get_enum_int v) = `VERTICAL` |
| 2 | `flags round-trip via decoder` | `Value.set_flags_int v (Gdk_enums.modifiertype_to_int [`SHIFT_MASK; `CONTROL_MASK])` | `of_int (get_flags_int v)` preserves both bits |
| 3 | `flags empty list` | `set_flags_int v 0` | `of_int 0 = []` |
| 4 | `variant round-trip` | `Gvariant.new_string "hello"` set, get | `Gvariant.get_string` matches |
| 5 | `int64 round-trip` | `Value.set_int64 v Int64.max_int` | `Value.get_int64 v = Int64.max_int` |
| 6 | `enum decoder fails on out-of-range int` | `Gtk_enums.orientation_of_int 99` | raises `Failure` |
| 7 | `enum decoder property: of_int ∘ to_int = id` | foreach declared variant `v` of `Gtk.Orientation` | `of_int (to_int v) = v` |
| 8 | `bitfield decoder property: of_int ∘ to_int preserves set` | `[\`SHIFT_MASK; \`CONTROL_MASK]` and 5 other random subsets | `of_int (to_int s) = s` modulo order |
| 9 | `negative — wrong GValue type` | `set_int v 5; get_flags_int v` | raises `Invalid_argument` from `G_VALUE_HOLDS_FLAGS` check |
| 10 | `version-guarded flag honoured` | On a system with GTK ≥ 4.14, `of_int` correctly returns `\`NO_MODIFIER_MASK` | passes |

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
| 7 | Enum `Gtk.Orientation` (same-NS) | `"Gtk_enums.orientation"` | `Gtk_enums.orientation_of_int` and `Gobject.Value.get_enum_int` |
| 8 | Bitfield `Gdk.ModifierType` (cross-NS, from Gtk ctx) | `"Ocgtk_gdk.Gdk_enums.modifiertype"` | `Ocgtk_gdk.Gdk_enums.modifiertype_of_int` and `Gobject.Value.get_flags_int` |
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

### Phase 2 — Generator: emit signals at L1, mirror at L2

**Goal.** Move signal connector generation into the per-class L1
pipeline. Eliminate the standalone `_signals` files and the L2 class
inheritance from them. Emit one-line L2 forwarders alongside existing
L2 methods.

**Files to modify**

| File | Line | Change |
|------|------|--------|
| `gir_gen/lib/generate/signal_gen.ml` | full file rewrite | Replace the file-writing class emitter with the pure-data API documented in "Code sharing across L1 and L2" above. New public functions: `classify`, `emit_l1_val`, `emit_l1_let`, `emit_l2_method`. The current `generate_signal_class` function (lines 108-146) goes away. The OCaml-keyword list and `sanitize_signal_name` (lines 7-74) are kept and reused. New `sanitize_param_name` mirroring it. |
| `gir_gen/lib/generate/class_gen_method.ml` (or wherever methods are spliced into a class's L1 sig/impl) | extend the per-class emission loop | After emitting the class's `external` methods, iterate `class.signals`, call `Signal_gen.classify` per signal; on `Ok emission`, splice `Signal_gen.emit_l1_val emission` into the `.mli` and `Signal_gen.emit_l1_let emission` into the `.ml`; on `Error reason`, log via stderr (preserving today's diagnostic). Stash the `Ok emissions` for the L2 generator. |
| `gir_gen/lib/generate/class_gen.ml` (or `class_gen_body.ml` — wherever L2 class bodies are built) | extend the per-class L2 emission | After emitting L2 method forwarders, iterate the stashed signal emissions and emit `Signal_gen.emit_l2_method emission` for each. The L2 forwarder type signature drops the obj parameter from the L1 `ocaml_callback_type` and forwards through `self#as_<class>`. |
| `gir_gen/lib/generate/class_gen.ml` | inheritance list emission | Remove the `inherit G<Class>_signals.<class>_signals` line that today's emitter produces. Verify no other code path produces this inheritance. |
| `gir_gen/lib/generate/dune_file.ml` | dune output | Stop emitting `g<class>_signals.{ml,mli}` entries in the generated `dune-generated.inc` files. The 156 existing `_signals` file pairs should not be regenerated. |
| `gir_gen/bin/gir_gen.ml` | top-level pipeline | Remove any code that writes `_signals.{ml,mli}` files standalone. The `signal_gen` module is now consumed by `class_gen_method`/`class_gen` rather than driving its own file output. |

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

1. **Zero `*_signals.{ml,mli}` files generated.**
   `find ocgtk/src/*/generated -name "*_signals.ml" -o -name "*_signals.mli"`
   should return **zero results** (today's count: 156 pairs across all
   namespaces). All entries are spliced into the per-class L1
   sig/impl files.

2. **L1 signal entries present in the per-class L1 sig.** Spot-check
   `application_and__window_and__window_group.mli`: `grep -n "val on_close_request\|val on_activate_default" ocgtk/src/gtk/generated/application_and__window_and__window_group.mli` returns hits in the `and Window : sig … end` block.

3. **L1 closure body shape.** In
   `application_and__window_and__window_group.ml`, the
   `on_key_pressed` let-binding for `Event_controller_key`'s namespace
   extracts `keyval`, `keycode`, `state` at positions 1, 2, 3 of the
   closure argv.

4. **L2 forwarder shape.** In `gApplication_and__window_and__window_group.ml`,
   the L2 `window_t` class contains a `method on_close_request ?after
   ~callback = Window.on_close_request ?after self#as_window ~callback`
   one-line forwarder. The historical `inherit Gwindow_signals.window_signals`
   line is gone.

5. **Switch's `state-set` (Strategy 2 with bool param + bool return)**
   appears at L1 with `~callback:(state:bool -> bool)`.

6. **GestureClick's `pressed`** (Strategy 2 with three primitive params)
   appears at L1 with `~callback:(n_press:int -> x:float -> y:float -> unit)`.

7. **Stderr-skip count.** `bash scripts/generate-bindings.sh 2>&1 |
   grep -c "Skipping signal"` should drop from ~205 (GTK alone) to
   roughly 60-80 (covering only long-tail boxed / GArray / callback /
   transfer-full GObject return / non-In-direction signals).

8. **Total `connect_simple` count** in
   `ocgtk/src/gtk/generated/`: `grep -rh connect_simple
   ocgtk/src/gtk/generated/ | wc -l` ≈ 27 (Category A signals,
   void/zero-param).

9. **Total `Gobject.Signal.connect [^_]` (non-`_simple`) count**: jumps
   from 0 to ≈ 180.

10. **L2 inherit count drops.**
    `grep -c "inherit G.*_signals" ocgtk/src/gtk/generated/*.mli`
    should drop from its current value to **0**.

**Test cases** — extend
`gir_gen/test/class_generation/signal_wrapper_tests.ml`. Tests now
inspect the **per-class L1 sig and impl** for `val on_<sig>` /
`let on_<sig>` entries, plus the **L2 class** for the corresponding
forwarder method, rather than a separate `_signals` class.

| # | Name | GIR fixture | Assertion |
|---|------|-------------|-----------|
| 1 | `void zero-param emits L1 let-binding using connect_simple` | `clicked` on synthetic Button | parsed L1 .ml AST contains a top-level `let on_clicked …` whose body calls `Gobject.Signal.connect_simple`; matching `val` in .mli |
| 2 | `void primitive params uses Closure.create` | synthetic `pressed` (`gint, gdouble, gdouble`) | L1 `let on_pressed` body contains `Gobject.Closure.create` and three `Gobject.Closure.nth` calls; type signature has labelled args `n_press / x / y` of types `int / float / float`; uses `Signal.connect` (not `connect_simple`) |
| 3 | `bool return zero-param uses Closure.create` | synthetic `close-request` | L1 body shows `Closure.create`, sets `Value.set_boolean` on the result, uses `Signal.connect` |
| 4 | `bool return primitive param round-trip` | synthetic `state-set` (`gboolean -> gboolean`) | L1 callback sig is `state:bool -> bool`; closure body extracts `pos:1` and sets bool result |
| 5 | `mixed bool return + 3 params` | `key-pressed`-shaped (`guint, guint, GdkModifierType -> gboolean`) | L1 body has three `nth` extractions at pos 1/2/3; the third composes `Gobject.Value.get_flags_int` and `Ocgtk_gdk.Gdk_enums.modifiertype_of_int` (cross-NS) |
| 6 | `unsupported → skipped + warning` | synthetic signal with `<callback>` param | no `val on_X` or `let on_X` in L1; no L2 forwarder for X; stderr `eprintf` invocation captured |
| 7 | `sender at pos:0 invariant` | inspect any closure body | no `nth` call uses `pos:0` (sender is implicit) |
| 8 | `param keyword sanitisation` | synthetic signal with parameter named `type` | generated callback uses `~type_` not `~type` |
| 9 | `int64 param` | synthetic signal with `gint64` param | callback type is `Int64.t`; getter is `get_int64` |
| 10 | `Variant param` | synthetic signal with `GLib.Variant` param | callback type is `Gvariant.t`; getter is `get_variant` |
| 11 | `L2 forwarder shape` | synthetic Window with `clicked` signal | L2 class type contains `method on_clicked : ?after:bool -> callback:(unit -> unit) -> _`; L2 .ml contains `Window.on_clicked ?after self#as_window ~callback` body |
| 12 | `L1 obj is positional, not labelled` | any signal | L1 sig is `?after:bool -> t -> callback:… -> handler_id` (obj as positional `t`, not `~obj:t`) — matches the existing L1 method idiom |
| 13 | `no _signals files generated` | parse a synthetic class with multiple signals; capture all generator-written file paths | none ends in `_signals.ml` or `_signals.mli` |
| 14 | `L2 has no inherit-_signals line` | L2 class type AST | the class type `inherit` list contains no entry whose name ends in `_signals` |

Use existing `Ml_ast_helpers` (`gir_gen/test/utils/ml_ast_helpers.ml`)
for AST inspection. Cases 1-12 follow the existing per-method test
pattern (L1 toplevel let / L2 class method). Cases 13 and 14 are
new shape tests for the layering invariant.

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
| `gir_gen/lib/generate/signal_marshaller.ml` (from Phase 1b) | enum/bitfield branch | When `classify_type` returns a foreign-namespace enum/bitfield, use `Utils.external_namespace_to_module_name` to compute the prefix; emit `<prefix>.<NS>_enums.<lower>_of_int` composed with `Gobject.Value.get_enum_int`/`get_flags_int`. Setter form mirrors. |

**Validation outputs**

1. The per-class L1 module containing `Event_controller_key` —
   `on_key_pressed`'s let-binding body contains both the cross-namespace
   decoder call and the generic dispatcher:
   ```
   grep -rn "Ocgtk_gdk.Gdk_enums.modifiertype_of_int\\|Gobject.Value.get_flags_int" \
     ocgtk/src/gtk/generated/
   ```

2. `dune build` resolves the dependency — confirms the Gtk library
   already declares `ocgtk.gdk` in its `libraries` (it does; verify
   `grep "ocgtk.gdk" ocgtk/src/gtk/dune`).

3. Cross-namespace flags references in Gio's per-class L1 modules
   (DBus signals using `Gio.DBusObjectManagerClient.Flags` etc.) appear
   correctly qualified.

**Test cases** — new file
`gir_gen/test/cross_namespace/cross_ns_signal_tests.ml`:

| # | Name | Setup | Assertion |
|---|------|-------|-----------|
| 1 | `cross-NS bitfield param uses qualified decoder` | Synthetic Gtk class with signal taking `Gdk.ModifierType` parameter | AST shows `Ocgtk_gdk.Gdk_enums.modifiertype_of_int` and `Gobject.Value.get_flags_int` |
| 2 | `same-NS bitfield param uses bare module` | Synthetic Gtk class with signal taking `Gtk.AccessibleRole` | AST shows bare `Gtk_enums.accessiblerole_of_int` (no `Ocgtk_gtk` prefix) |
| 3 | `cross-NS enum param` | Synthetic Gtk signal taking `Gdk.MemoryFormat` | `Ocgtk_gdk.Gdk_enums.memoryformat_of_int` + `Gobject.Value.get_enum_int` |
| 4 | `cross-NS enum return` | Synthetic Gtk signal returning `Gdk.MemoryFormat` | encoder composed: `Gobject.Value.set_enum_int … (Ocgtk_gdk.Gdk_enums.memoryformat_to_int …)` |

Cross-NS test pattern is established in
`gir_gen/test/cross_namespace/` already — use the same `gir_data_dir`
helpers.

**Exit criteria.** `Event_controller_key.on_key_pressed` (L1 free
function) in the regenerated bindings has the typed signature
`?after:bool -> t -> callback:(keyval:int -> keycode:int ->
state:Ocgtk_gdk.Gdk_enums.modifiertype -> bool) ->
Gobject.Signal.handler_id`; the L2 `event_controller_key_t` class
exposes a forwarder method that proxies through it; the OCaml files
compile.

---

### Phase 4 — Runtime end-to-end marshalling test

**Goal.** Prove the generated code actually round-trips parameters and
results through the C marshaller, **and close the existing test-coverage
gap on `ml_closure_marshal`** ("Existing closure-marshaller test
coverage" above). Multi-param dispatch and non-void return copy-back are
both used by every Strategy-2 signal but unexercised today.

**Important correction on the existing `Test.invoke_closure_*`
helpers.** `ml_test_invoke_closure_int` (`ml_gobject.c:811-828`) and
its siblings build a GValue array with the typed value at slot **0**
— there is no sender slot, by design (these are pure marshaller
exercises). Production signal dispatch via `g_signal_emit` puts the
sender at slot 0 and the first user param at slot 1, which is what the
generated code's `nth ~pos:1+` indexing expects.

So Phase-4 marshaller tests can use `Test.invoke_closure_*` only when
the test's closure also extracts at `pos:0` — i.e., they validate the
generic dispatch mechanism, not the production indexing convention.
Tests that need to validate "what generated code actually does" must
emit through a real GObject via `g_signal_emit_by_name`. The two test
families are kept distinct in the table below: M-tests exercise the
marshaller; W-tests exercise the wired signal path through real
widgets.

**Marshaller-level test cases** (independent of generated code, exercise
`ml_closure_marshal` directly via existing or extended test helpers):

| # | Name | Setup | Assertion |
|---|------|-------|-----------|
| M1 | `two-int dispatch round-trip` | Build closure that reads `nth ~pos:0` and `~pos:1` as ints, sums them | `Test.invoke_closure_two_ints` (already exists, never called by tests) yields expected sum captured into a ref |
| M2 | `four-mixed-type dispatch` | Add a new `Test.invoke_closure_mixed : g_closure -> int -> string -> bool -> float -> unit` test helper; closure pulls each typed value | All four values round-trip |
| M3 | `non-void int return copy-back` | Add `Test.invoke_closure_returning_int : g_closure -> int` helper; closure sets `Closure.result` via `Value.set_int` | Helper observes the int written back to the GValue array |
| M4 | `non-void bool return copy-back` | Same shape, returning bool | observed |
| M5 | `non-void string return copy-back` | Same shape, returning string | observed; string encoding preserved |
| M6 | `exception in callback is logged but not propagated` | Build closure that raises `Failure "boom"`; invoke | `g_warning` log message captured (mock `Printexc.to_string` callback or assert via stderr capture); host process not killed |
| M7 | `enum_int / flags_int round-trip` | Use new Phase-1a helpers: set a flags GValue, callback reads via `get_flags_int`; conversely, set via `set_flags_int`, host C reads back | bit pattern preserved |

These tests live in `ocgtk/tests/test_closure_marshalling.ml` (new),
sibling to the existing `test_closure_stress.ml`. The new
`Test.invoke_closure_*` helpers go into `ocgtk/src/common/gobject.{ml,mli}`
test-helper section (lines 250-268) and `ml_gobject.c`.

**Files to create**

| File | Purpose |
|------|---------|
| `ocgtk/tests/test_signal_marshalling.ml` (new) | Runtime alcotest suite. Add to `ocgtk/tests/dune` test names list. |

**Wired-signal test cases** via real GTK widgets — these validate
`pos:1+` production indexing through real `g_signal_emit_by_name`,
not the marshaller-test helpers (in addition to M1-M7 above):

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
(`when="first|last"`, `action`, `no-recurse`, `no-hooks`) in the parser
so they're available to future generation passes. **Detailed signals
(`notify::*`) are excluded from this milestone** — see "Detailed
signals deferred to a separate sub-milestone" below.

**Scope decision: `~after` policy.** The plan's earlier draft defaulted
`~after:true` for `when="last"` signals. **Withdrawn.** The lablgtk
tradition is `~after:false` regardless of `when=`, leaving the user to
opt into after-default-handler delivery via an explicit argument.
Forcing `~after:true` on every `RUN_LAST` signal makes the common
"override the default class handler" pattern require an explicit
override on every connection — the wrong default for application code.

The generated method exposes `?after:bool` as an **optional argument**
with a default of `false`. The captured `when_phase` is recorded in
the docstring for the user's reference but does not drive the default.

**Scope decision: `\`Cleanup` removed.** GTK 4 GIR contains zero
signals with `when="cleanup"` (verified: `grep when=\"cleanup\"
gir/Gtk-4.0.gir` returns no matches). Drop the case from the parser's
`when_phase` decoder rather than carry untested code.

**Detailed signals deferred to a separate sub-milestone.** `notify::*`
is widely used and warrants careful design (the `notify` signal lives
on `GObject.Object` whose GIR is in `GObject-2.0.gir`, **not currently
parsed by `gir_gen`** — verified by `Glob gir/*.gir`). Properly
supporting detailed signals requires either parsing GObject GIR or
hand-writing the connector. That work is its own concern. This
milestone does **not** ship detailed signals, and the form example
uses `Editable::changed` rather than `notify::text` for live
validation.

**Files to modify**

| File | Line | Change |
|------|------|--------|
| `gir_gen/lib/types.ml` | 69-77 | Extend `gir_signal` with `when_phase : [\`First \| \`Last] option`, `action : bool`, `no_recurse : bool`, `no_hooks : bool`. (No `detailed` — out of scope.) |
| `gir_gen/lib/parse/gir_parser.ml` | 613-664 | Read each new attribute. Default `when_phase = Some \`Last` if missing. |
| `gir_gen/lib/generate/signal_gen.ml` | `emit_l1_let` / `emit_l1_val` / `emit_l2_method` | Change emitted `~after:false` literal to `?after:bool` optional arg with default `false`. The L1 let-binding becomes `let on_X ?(after = false) (obj : t) ~callback = ...`; L1 val becomes `?after:bool -> t -> callback:… -> handler_id`; L2 forwarder becomes `method on_X ?after ~callback = <Class>.on_X ?after self#as_<class> ~callback`. |
| `gir_gen/lib/generate/signal_gen.ml` | optional emit (gated on `action=true`) | Generate a sibling `emit_<name> : <typed args> -> unit` per action signal that calls `Gobject.Signal.emit_by_name`. Defer if typed-vararg marshalling proves awkward. |

**Validation outputs**

1. `grep -rh "?(after = false)" ocgtk/src/*/generated/ | wc -l` should
   roughly equal the count of generated signal connectors (one
   `?(after = false)` per L1 `let on_X` binding); every L2 forwarder
   exposes `?after` as well.

2. `grep -rh "~after:false\\|~after:true" ocgtk/src/*/generated/ | wc -l`
   should be **0** (no fixed `~after:bool` literals in generated code;
   the defaulting happens via `?(after = false)` at L1 and propagation
   at L2).

3. (No detailed-signal validation — out of scope.)

**Test cases** — add to `signal_wrapper_tests.ml`:

| # | Name | GIR fixture | Assertion |
|---|------|-------------|-----------|
| 1 | `?after exposed as optional arg` | any synthetic signal | emitted method signature contains `?(after = false)` |
| 2 | `when_phase captured into gir_signal` | synthetic `when="last"` | parser produces `when_phase = Some \`Last`; not surfaced in generated method (docstring only) |
| 3 | `when="cleanup" rejected at parse` | synthetic `when="cleanup"` | parser raises or normalises to `\`Last` (decision: log warning + treat as `\`Last`) |
| 4 | `action signal emits emit_* companion` (if optional step ships) | synthetic `action="1"` | sibling method `emit_<name>` exists |

(Detailed-signal tests deferred to the separate sub-milestone.)

**Exit criteria.** All generated methods expose `?after`; no
`~after:` literals remain in generated code; `when_phase` is captured
in `gir_signal` for future use.

---

### Phase 8 — Migrate hand-written closures, document, archive plan

**Files to modify**

| File | Change |
|------|--------|
| `ocgtk/examples/login_form.ml:7-15` | Delete `on_close_request` helper; replace with the generated L1 free function: `Window.on_close_request window_obj ~callback:…`. (L2 form `window#on_close_request ~callback:…` also works since the L2 class now has the forwarder; either is fine.) |
| `ocgtk/examples/calculator/calc_ui.ml:179-188` | Delete the manual `Gobject.Closure.create` block; replace with `Event_controller_key.on_key_pressed key_controller_obj ~callback:…` (L1) or `key_controller#on_key_pressed ~callback:…` (L2 forwarder). |
| `ocgtk/examples/text_editor.ml`, `settings_panel.ml` | Same as login_form. |
| `gir_gen/README.md` "Supported features" | Update signal coverage entry from "void/zero-param only on L2 _signals class" to "L1 free functions for all primitive params + bool/int/string returns; flags/enum via per-namespace decoders; L2 class methods proxy to L1". |
| `/home/deploy/projects/ocgtk-context/LEARNINGS.md` | Mark the consolidated learning "Signal generator only supports void/zero-param signals — manual wiring pattern" as **Superseded by Milestone 2 (PR/commit X)**. Add a learning that signal connectors live at L1, not in a separate `_signals` module/class. |
| `gir_gen/docs/plans/milestone-2-signals.md` | Move to `gir_gen/docs/plans/completed/`. |

**Validation outputs**

1. `grep -rn "Gobject.Closure.create" ocgtk/examples/ | wc -l` → 0 hits
   (or only deliberately illustrative ones).
2. `grep -rn "Gobject.Signal.connect [^_]" ocgtk/examples/ | wc -l` → 0
   hits (callers go through the generated L1 functions or L2 forwarders).
3. `grep -rn "\.on_close_request\\|\.on_key_pressed" ocgtk/examples/`
   shows the migrated callsites at the L1 free-function form.
4. All examples build and run under `xvfb-run dune exec`.

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

### Phase 6 — Signal-corpus regression test

**Goal.** Catch "we forgot a category" coverage regressions when GTK
4.16 (or later) adds a new signal shape, without manually re-curating
the test set.

**Files to create**

| File | Purpose |
|------|---------|
| `gir_gen/test/integration/signal_corpus_coverage.ml` (new) | Walks every parsed GIR namespace, classifies every `<glib:signal>` via `Signal_marshaller`, and emits a coverage matrix. Fails if a previously-supported shape becomes `Unsupported`. |

**Test case**

A single property-style alcotest: parse all 7 production GIR files
(`gir/Gtk-4.0.gir`, `Gdk-4.0.gir`, `Gio-2.0.gir`, `Pango-1.0.gir`,
`Gsk-4.0.gir`, `GdkPixbuf-2.0.gir`, `Graphene-1.0.gir`); for every
signal, run `Signal_marshaller.for_param` on each parameter and
`for_return` on the return; produce a histogram bucketed by
`Supported` (per `ocaml_type`) and `Unsupported` (per reason). Compare
against a checked-in baseline at
`gir_gen/test/integration/signal_corpus_baseline.txt`. Diff is the
test failure.

When the baseline genuinely needs to move (new signal shape ships in
GTK 4.16, or a new category becomes supported), the implementer
updates the baseline file in the same commit as the generator change.

**Exit criteria.** Baseline file exists; coverage histogram matches
the milestone goal numbers (≥ 250 GTK signals supported); test passes.

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
  generated across 9 namespaces. Phase 1a adds 4 generic C
  dispatchers (Option 2/3 — total, not per-type) and either ~300
  pure-OCaml decoder functions (Option 2) or ~300 OCaml data values
  (Option 3) — Phase 0 chooses. All uniform; review burden is low.
- **Build-size impact.** ~1800 OCaml top-level symbols across the
  nine `<ns>_enums.ml` files (≈ 6 per type × ~300 types if Option 2:
  `_of_int`, `_to_int`, plus generated equality / show / compare
  helpers if any ppx is invoked). OCaml symbols are cheap at link
  time but **inflate compiled `.cmxa` size noticeably** and slow
  every dependent module's recompilation. Option 3 reduces this to
  ~300 small data values and is preferable on this metric.
- **`Gvariant.t` exposure circular-dep risk.** `gobject.mli` adding
  `val get_variant : t -> Gvariant.t` introduces a new dep from
  `Ocgtk.common.Gobject` on `Ocgtk.common.Gvariant`. Both already
  live in `ocgtk/src/common/`. Verify in Phase 1a: `grep -n "Gobject"
  ocgtk/src/common/gvariant.ml` should show no Gobject references
  (else cycle). If `Gvariant.of_value` exists and uses Gobject, move
  `get_variant` to `Gvariant` instead.
- **Empty parameter names.** GIR rarely emits `<parameter name="">`
  but it is legal. Generator falls back to `arg<N>` where `N` is the
  positional index. Implement in `sanitize_param_name`.
- **`varargs` guard.** GLib does not allow va_list in real signals,
  but the parser still reads the attribute. Marshaller asserts
  `not p.varargs` and emits `Unsupported` if violated.

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
- [ ] Phase 0: Verify Gobject.Data infrastructure; choose Option 2 vs 3
- [ ] Phase 1a: enum/flags + variant + int64 GValue wrappers + set_object null fix
- [ ] Phase 1b: Signal_marshaller module (gir_param input; direction/transfer/nullable handling)
- [ ] Phase 2: Closure-based emission for params + non-void returns
- [ ] Phase 3: Cross-namespace enum/flags resolution for signals
- [ ] Phase 4: Runtime marshaller tests (M1-M7) + wired-signal end-to-end tests
- [ ] Phase 5: form_example.ml + example dune entry + README
- [ ] Phase 6: Signal-corpus regression test
- [ ] Phase 7: when/action parser + ?after policy (detailed signals deferred)
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
