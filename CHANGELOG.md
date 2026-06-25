# Changelog

All notable changes to **ocgtk** are documented here. Entries are grouped by
release; the `0.1~preview*` series is the initial preview track toward a
usable OCaml GTK 4 binding library.

## [0.1~preview2] — 2026-06-24

Completes **Milestone 2 (signal handling with parameters)** and brings broad
ownership/memory-safety hardening across the generated bindings.

### Features

- **Signal handling with parameters** — Layer 1 free functions plus Layer 2
  method forwarders for signals carrying primitive, enum, bitfield, and
  GObject class/interface parameters; boolean return values supported.
  Approximately 225 of 346 GTK signals are now generated.
- **GValue marshalling** — new generic C wrappers for `int64`, `variant`,
  `enum`, `flags`, and `boxed` GValues, plus pure-OCaml enum/bitfield decoders
  emitted into per-namespace `<ns>_enums.ml` modules.
- **GLib.Error mapping** — `GError.t` reimplemented as a custom block exposing
  a `GLib.Error` type; GError-returning methods now surface errors as OCaml
  exceptions/Results.
- **GObject identity** — pointer-identity equality, hashing, and a
  `Gobject.same` primitive.
- **Boxed record ownership** — GType-aware record finalizers dispatching
  `g_boxed_free`, a runtime value-kinds registry for discriminating FFI
  blocks, and suppression of redundant `_copy`/`_free`/`_unref` methods on
  record entities.
- **Nullable handling** — nullable length-linked array out-parameters wrapped
  in `option`; nullable GObject signal parameters emit `option` types.

### Generator (gir_gen)

- Split into a **standalone dune project**; no longer a runtime or build-time
  dependency of `ocgtk` (bindings ship pre-generated).
- Signal generation rewritten as a pure-data API: per-layer signal callback
  types with L2 wrapping of GObject params/returns; class-generation type
  resolution simplified; cyclic dependency edges absorbed via existing SCC algorithm.
- Consolidated copy/free/unref filtering and replaced ad-hoc record-kind
  booleans with a required `entity_kind` ADT.

### Infrastructure

- **Signal-corpus regression baselines** — coverage computation and baseline
  snapshots across all seven non-Cairo namespaces.
- **conf-gtk4** — simplified to MSYS2-native `depexts`, removed cross-compile
  `host-arch`/`conf-mingw` dependencies, and added an `available` constraint;
  Windows builds validated via setup-ocaml MSYS2 environment.
- Broad test-suite remediation (split `test_gir_gen` stanzas, migrated legacy
  helpers to a shared type factory, disabled-platform cleanup).

### Limitations carried forward

Signals with boxed record parameters (TextIter, RGBA, …), GArray, or callback
parameters are still skipped (~121 GTK signals). No callback parameter
marshalling; no generated API documentation.

[0.1~preview2]: https://github.com/chris-armstrong/ocgtk/releases/tag/v0.1-preview2

## [0.1~preview1] — 2026-04-15

Completes **Milestone 1 (cross-namespace type resolution)** and delivers
initial class-based APIs, interface support, and core GLib/GObject type
mappings, plus full multi-distro CI.

### Features

- **9 generated namespace libraries** — Cairo, Gio, Gdk, Graphene, GdkPixbuf,
  Pango, PangoCairo, Gsk, Gtk, with ~4,952 generated methods total.
- **Cross-namespace type resolution** — per-namespace reference files plus
  `<ns>_decls.h` headers; cross-namespace enums, bitfields, and class
  references resolved at codegen time.
- **Layer 1 / Layer 2 APIs** — module-based L1 and class-based L2; a
  contravariant `Gobject.obj` enabling safe `:>` upcasts.
- **GList / GSList** — list iterators for primitive, record, class, and
  interface element types.
- **Interface support** — L2 class types with inherited interface methods;
  interface-typed method parameters and returns; cross-namespace
  `implements` detection.
- **Throwing constructors** — Result-returning constructors for fallible
  GObject construction.
- **Type mappings** — `GLib.Bytes`, `GVariant` / `GVariantType`,
  `GObject.Object` / `InitiallyUnowned`, bounded integer wrappers (e.g.
  `Gsize`, `UInt64`), and GLib/GObject primitive integer types.
- **Override system** — extensible GIR overrides with cross-namespace version
  guards; GTK and Pango compile-time/runtime versions exposed to OCaml.

### Infrastructure

- **Release-verification CI** — build + test matrix across Ubuntu 22.04 /
  24.04, Debian 12, Fedora 40/43, CentOS Stream 9, openSUSE Leap 15.6, macOS:
  triggered on `v*` tags.
- Added `integers` (≥ 0.8.0) and `dune-configurator` dependencies;
  `conf-gtk4` `depexts` for Debian/Fedora/CentOS/openSUSE/Arch/Alpine/macOS/
  MSYS2/FreeBSD.
- Calculator and form-example applications demonstrating cross-namespace usage
  and signals.

[0.1~preview1]: https://github.com/chris-armstrong/ocgtk/releases/tag/v0.1-preview1
