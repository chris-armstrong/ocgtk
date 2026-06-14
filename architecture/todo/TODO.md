# Todos

Outstanding work items, known bugs, and intentional limitations for ocgtk,
with enough context to understand what needs to be done and why it is non-trivial.

## Missing Features

### Static functions

`<function>` elements in GIR (standalone/namespace-level functions with no
implicit `self`, e.g. `gtk_show_uri`, `pango_parse_markup`) are not yet
generated. ~2,001 such functions exist across all namespaces. Some are required
for demo applications and common tasks. Tracked as ROADMAP P4.

### Factory functions

High-level factory function generation is not implemented. Widget creation
requires verbose manual constructor calls and separate property setting.
Tracked as ROADMAP Phase 4.

### Container helpers

Container-specific convenience methods are not generated. Box-like containers
(`append`, `prepend`, `insert_child_after`), single-child containers
(`set_child`, `get_child`), window/dialog lifecycle (`destroy`, `present`,
`close`, `run`), and TreeView/ListView model management all require direct
low-level FFI calls. Tracked as ROADMAP Phase 5.

### Range and adjustment helpers

Specialized methods for Range-derived widgets (`Scale`, `Scrollbar`,
`LevelBar`) are not generated: `value`/`set_value` property methods,
`adjustment` accessor, `value-changed` signal helpers, and increment/step
configuration.

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
P3.

### Layer 1 parent-chain accessors

Layer 1 parent-chain accessor methods (`as_widget : t -> Widget.t` etc.) are
not generated. Layer 2 `inherit` provides parent method access, but there is no
direct L1 function to upcast a type to its ancestor's type. Could be implemented
by walking the parent chain.

### Interface parameter handling

Methods that accept interface types as parameters are currently skipped at L2.
Proper interface parameter handling requires `as_<interface>` accessors.
GList/GSList parameters containing interface types (e.g. `GSList<Gio.File>`)
generate broken C stubs because interface structs are opaque. These methods are
filtered out; manual bindings are required if needed.

### Interface generation

Interfaces are generated as ordinary classes but should be generated as virtual
classes (or class types) with virtual methods that concrete classes inherit and
implement. Adding proper class type generation and wiring interface
implementation into the class hierarchy (e.g. `CssProvider` implementing
`StyleProvider`, `Entry` implementing `Editable`) would eliminate `Obj.magic`
casts. Tracked as ROADMAP P6.

### Hierarchy detection

Parent chain traversal is currently hardcoded for 5 hierarchies (Widget,
EventController, CellRenderer, LayoutManager, Expression). Dynamic hierarchy
detection is needed so new hierarchies are discovered automatically. Tracked
as ROADMAP Phase 6.

## Signal Handling

Signals are partially implemented:

- Parameterless void signals are fully generated.
- Signals with primitive parameters (`int`, `bool`, `float`, `string`, enums,
  bitfields) and GObject class/interface parameters are generated via
  `signal_marshaller.ml`.
- Signals with return values are supported for primitive types only.
- Signals with unsupported types (`GdkEvent`, custom structs, callbacks,
  `GArray`, `GVariant`) are skipped.
- Detailed signals (`notify::property-name`) are deferred.
- Signal flags (`when`, `action`, `no-recurse`, `no-hooks`, `detailed`) are not
  parsed from GIR and are dropped by the parser.
- ~100 signals remain skipped (mostly boxed records, callbacks, non-In
direction params, and the `GObject.Object` meta-type).

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
OCaml API entirely with the length derived from `Array.length`.

### Array-typed properties

Properties whose type is an array are skipped. `GValue` can expose boxed arrays,
but the generator does not yet marshal arrays through `GValue`.

### Fixed-size stack-allocated arrays

Fixed-size stack-allocated arrays are treated as heap-allocated.

### Out/InOut parameters

Out parameters are supported. InOut parameters have partial support. Multiple
out parameters returning tuples are not yet wrapped. Out-param arrays with no
length are skipped. Double-pointer out-params not marked as arrays are skipped.

### Callback parameters in methods

Callback parameters in methods are not supported (async APIs, custom
callbacks). Callbacks in signals are also unsupported. Tracked as ROADMAP
Milestone 4.

### Callback type definitions

Complex callback type definitions are not fully extracted from GIR. 101
callback types appear in function/method signatures. Required for fully typed
callback parameters. Tracked as ROADMAP P5.

### Deferred GObject/GLib type mappings

- **GObject.Value** — `GValue_val` exists (ml→c) but there is no `Val_GValue`
  (c→ml). 73 hits in GTK, 50 in GDK. Deferred until cross-namespace interface
  types are resolved.
- **GObject.Closure** — Only 16 hits in GIR. Most closure usage goes through the
  signal system which is already handled. Low priority.
- **GLib.Quark, IOCondition, String, SeekType** — Low standalone unlock
  potential; methods using them also need other missing types.
- **GLib.DateTime** — 90 hits. Moderate priority; used in `Gtk.Calendar` and
  `GFileInfo` date properties.
- **GLib.KeyFile** — 50 hits. Low intersection potential.
- **GLib.Source** — 37 hits. Most methods use callbacks that can't be
  auto-generated.

### Bounded integer wrapper types

`guint16`, `gint16`, `guint32`, `gint32` are currently mapped to bare `int` /
`int32`, allowing silent truncation at the C boundary. A custom `bounded_int`
module with `private int` wrapper types (`UInt8`, `Int8`, `UInt16`, `Int16`,
`UInt32`, `Int32`) is planned to enforce range constraints at the OCaml level.
See `architecture/integer_type_design.md`. Tracked as `gobject_glib_type_mappings`
Task 3.3.1.

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

## Platform and Build Issues

### macOS build

`gio/gdesktopappinfo.h` is included unconditionally in `gio_decls.h` but is not
available on macOS (Homebrew omits it). Wrap it in `#ifdef G_OS_UNIX` or ignore
`GDesktopAppInfo` via the override file.

### Throwing constructors

Constructors with `throws="1"` are currently filtered out. The generator already
handles `throws` for methods (returning `('a, GError.t) result`), but
constructors need the same `Res_Ok`/`Res_Error` wrapping in
`c_stub_constructor.ml` and `layer1_constructor.ml`. Tracked as
`gobject_glib_type_mappings` Separate Track.

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
- Full end-to-end compilation of generated bindings in CI
- ML file generation tests (module_structure_tests.ml,
  type_definition_tests.ml, external_decl_tests.ml, signature_tests.ml)
- ML generation infrastructure (ml_parser.ml, ml_ast.ml, ml_validation.ml)

### `dune-modules.sexp` cleanup

Currently unused (all dune files use `(modules :standard)`). Tracked in ROADMAP
Backlog.

## Known Bugs and Quirks

### Parser (`parse/gir_parser.ml`)

- Element data extraction uses recursive string concatenation (performance issue
  for large documents).
- Namespace attribute handling has multiple fallback paths and can be fragile.
- Record parsing returns `None` on exclude (silent skip, no logging).
- Signal parameter parsing assumes a single return-value + parameters structure.

### Generator

- Hierarchy root check uses lowercase string comparison (fragile).
- Combined files are generated even for single-element SCCs.
- Virtual method de-duplication logic may incorrectly skip inherited methods.
- Some property getter/setter `GValue` macros have platform-specific edge cases.

### Type mapping (`type_mappings.ml`)

- Type normalization removes the namespace prefix, which can cause collisions.
- Hash table lookup is case-sensitive, but C types are not canonicalized.
- Record mapping requires an exact C type match; there is no fuzzy matching.
- Nullable handling assumes pointer types; value types cause issues.

### Override system (`override_apply.ml`)

- `set_version` lambda is duplicated across ~12 call sites; should be extracted
  into per-type helpers.
- Entity-level `Set_version` is dead code (parser never produces it).
- `namespace_display_name` duplicates knowledge from `version_guard.ml`;
  adding a new namespace requires updating both.
- Single guard per property: `(version ...)` supports exactly one version
  constraint. Properties requiring both a namespace version guard and a
cross-namespace guard cannot be expressed.

### C FFI

- `value result` declared without `CAMLlocal1` in some generated GVariant C
  stubs (`ml_g_variant_get_variant`, `ml_g_variant_get_child_value`,
  `ml_g_variant_type_new`). Currently safe (no GC between allocation and
  return) but violates OCaml FFI convention.

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

## Completed Items (no longer tracked here)

The following were previously limitations but are now implemented:

- **Cross-namespace type resolution** — Classes, interfaces, records, enums,
  and bitfields are auto-discovered via reference files.
- **GList/GSList for class element types** — Macro-based conversion in
  `wrappers.h` with generator support via `c_stub_list_conv.ml`.
- **Out parameters** — Primitive, struct, and array out parameters are
  supported.
- **GVariant** — Full opaque wrapper with scalar, array, dict, and child
  access support (`src/common/gvariant.ml`, `gvariant_type.ml`).
- **GLib.Bytes** — Opaque wrapper with `create`, `to_string`, `size`.
- **Primitive integer type mappings** — `gsize`, `gssize`, `GType`, `guint16`,
  `gint16`, `gint32`, `guint32`, `gint64`, `guint64`, `gulong`, `gunichar`,
  `gchar`.
- **Signals with primitive and GObject parameters** — Generated via
  `signal_marshaller.ml` and `signal_gen.ml`.
- **GObject.Object / InitiallyUnowned** — Type mappings added; `` `object_ ``
  tag introduced as hierarchy root.
