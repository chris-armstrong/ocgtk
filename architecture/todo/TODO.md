# Todos

Outstanding work items, known bugs, and intentional limitations for ocgtk,
with enough context to understand what needs to be done and why it is non-trivial.

## Missing Features

### Static functions

`<function>` elements in GIR (standalone/namespace-level functions with no
implicit `self`, e.g. `gtk_show_uri`, `pango_parse_markup`) are not yet
generated. ~2,001 such functions exist across all namespaces. Some are required
for demo applications and common tasks. Tracked as ROADMAP P4.

### Record field accessors

Accessing fields of non-opaque record types is not supported. Users cannot
access struct fields without writing manual C stubs.

### Property observer / `notify::property-name`

Property change notification wrappers (`notify::property-name` signal
connection helpers, property binding helpers, two-way synchronization) are not
generated.

### GTK Builder / Glade XML integration

Widget lookup from builder XML, signal autoconnection, template class support,
and Glade file loading helpers are not implemented.

### Constant bindings

GIR `<constant>` elements are not generated. 2,536 constants exist across all
namespaces (2,287 are GDK key syms). Required for `PANGO_SCALE`,
`GTK_STYLE_PROVIDER_PRIORITY_*`, and GDK key constants. Tracked as ROADMAP
P3. Implementation plan exists at `gir_gen/docs/plans/constant-bindings.md`.

### Interface generation

Interfaces are generated as ordinary classes but should be generated as virtual
classes (or class types) with virtual methods that concrete classes inherit and
implement. `Obj.magic` casts have been eliminated — interface access now uses
`from_gobject` with runtime `g_type_is_a()` checks. Concrete classes correctly
`inherit` interface classes (e.g. `CssProvider` implements `StyleProvider`,
`Entry` implements `Editable`). The remaining work is compile-time type safety
via virtual class types. Tracked as ROADMAP P6.

## Signal Handling

Signals are generated as per-class L1 free functions with L2 method
forwarders:

- Parameterless void signals are fully generated.
- Signals with primitive, enum, bitfield, and GObject class/interface
  parameters are generated via `signal_marshaller.ml`.
- Signals with primitive/boolean return values are supported.
- Signals with unsupported types (`GdkEvent`, custom structs, callbacks,
  `GArray`, `GVariant`) are skipped.
- Detailed signals (`notify::property-name`) are deferred.
- Signal flags: `when`, `action`, `no-recurse`, and `no-hooks` are parsed from
  GIR and stored on `gir_signal` (`types.ml`). `detailed` is deferred.
- 53 signals remain skipped across the 7 signal-bearing namespaces (40 in
  GTK), mostly boxed records, `GArray` parameters, non-In direction parameters,
  and the `GObject.Object` meta-type. Boxed records and `GArray` parameters
  are intentionally deferred to a later milestone for safety. Exact counts are
  tracked in `gir_gen/test/corpus/signal_corpus_baseline.sexp`.

## Type System and Mappings

### Byte-buffer arrays

`void*`/`gpointer` byte-buffer arrays (element type `guint8`) cannot be
generated. Many GTK/GIO APIs pass binary data as a `(void* buffer, gsize count)`
pair; the idiomatic OCaml binding should expose the buffer as `Bytes.t` or
`string` and derive the length automatically. The `guint8` type mapping is
intentionally omitted from `type_mappings.ml` to avoid generating invalid stubs
until this infrastructure exists.

### Array length hiding

The companion length parameter for length-based arrays is hidden from the C stub
but still visible in the Layer 1 OCaml signature. It should be dropped from the
OCaml API entirely with the length derived from `Array.length`. Tracked as
ROADMAP P2.

### Array-typed properties

Properties whose type is an array are skipped by `filtering.ml`. C stub
generation code exists in `c_stub_property.ml` (handles `g_value_get_boxed`/
`g_value_set_boxed`), but the OCaml Layer 1 signature generation does not emit
array-typed properties.

### Out/InOut parameters

Out parameters are fully supported (primitive, struct, array). Multiple out
parameters returning tuples ARE generated (e.g. `Pango.Matrix.get_font_scale_factors`
returns `float * float`). InOut parameters have a type mismatch bug: the C stub
returns modified values in a tuple, but the OCaml signature declares `unit`,
silently discarding them. Out-param arrays with no length are skipped.
Double-pointer out-params not marked as arrays are skipped.

### Callback parameters in methods

Callback parameters in methods are not supported (async APIs, custom
callbacks). Callbacks in signals are also unsupported. Tracked as ROADMAP
Milestone 4.

### Callback type definitions

Complex callback type definitions are not fully extracted from GIR. 101
callback types appear in function/method signatures. Required for fully typed
callback parameters. Tracked as ROADMAP P5.

### Deferred GObject/GLib type mappings

- **GObject.Value** — Works for property accessors (inline `GValue` in C stubs)
  and signal marshalling. Methods that take/return `GObject.Value` directly are
  skipped: no type mapping entry exists, and `Val_GValue` (c→ml) is not
  implemented. ~23 methods in GTK/GDK and ~21 standalone functions affected
  (e.g. `TreeModel.set_value`, `Builder.value_from_string`,
  `Expression.evaluate`).
- **GObject.Closure** — Only 16 hits in GIR. Most closure usage goes through the
  signal system which is already handled. Low priority.
- **GLib.Quark, IOCondition, String, SeekType** — Low standalone unlock
  potential; methods using them also need other missing types.
- **GLib.DateTime** — 90 hits. Moderate priority; used in `Gtk.Calendar` and
  `GFileInfo` date properties.
- **GLib.KeyFile** — 50 hits. Low intersection potential.
- **GLib.Source** — 37 hits. Most methods use callbacks that can't be
  auto-generated.

### GHashTable, unions

`GHashTable` and union types are not handled. `GVariant` is now handled
(see `gir_gen/docs/plans/gobject_glib_type_mappings.md` Phase 3.1).

### Varargs parameters

`<varargs>` parameters are not parsed correctly and default to `void`. Methods
using them are suppressed, but handling should be made explicit rather than
relying on a type-defaulting side-effect.

### Virtual methods

`<virtual-method>` elements are not parsed or generated.

### `<alias>` GIR elements

Only 4 instances exist; low priority.

### `foreign="1"` attribute on GIR records

Needed to distinguish opaque cairo types from value records. Tracked in
ROADMAP Backlog.

## Documentation and Testing

### Documentation

Generated and user-facing documentation is essentially absent. GIR documentation
strings are parsed but not emitted in generated code. `dune build @doc` is not
configured. Tracked as ROADMAP Milestone 3.

### Test coverage

Unit, integration, and C compilation test coverage is incomplete. Missing:
- Runtime functionality tests with actual GTK4 library
- Performance benchmarks
- Example program generation

### `dune-modules.sexp` cleanup

Currently unused (all dune files use `(modules :standard)`). Tracked in ROADMAP
Backlog.

## Prerequisite / Roadmap Items

The following are tracked in `ROADMAP.md` as prerequisites for upcoming
milestones:

1. **P1. GObject/GLib Type Mappings** — Task 1.1 done (`GObject.Object`,
   `GObject.InitiallyUnowned`). Remaining tasks deferred (see above).
2. **P2. Elide Length-Linked Array Parameters** — Hide companion length params
   at the OCaml API level.
3. **P3. GIR `<constant>` Bindings** — 2,536 constants (mostly GDK key syms).
4. **P4. GIR `<function>` Bindings** — 2,001 standalone functions.
5. **P5. Parse `<callback>` Type Definitions** — 101 callback types.
6. **P6. Interface Support** — Proper class type generation and wiring into
   the class hierarchy.
7. **P7. GList/GSList Interface Element Types** — Detect interface types and
   use pointer-based list handling instead of value-type copying.
