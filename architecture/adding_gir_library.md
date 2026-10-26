# Adding a New GIR Library to ocgtk

This document provides a step-by-step plan for adding a new GObject Introspection (GIR) library to ocgtk, such as GIO, GtkSourceView, WebKit, or Libadwaita.

## Prerequisites

Before starting, ensure you have:
- The GIR file for the library (in `gir/` at the repo root)
- Development packages installed (e.g., `libgio-2.0-dev`, `gir1.2-gio-2.0`)
- pkg-config support for the library

Each namespace is its own opam package in a top-level directory named
`oc<ns>` (`ocgio`, `ocgdkpixbuf`, ...), with three libraries: `oc<ns>.enums`,
`oc<ns>.raw` and `oc<ns>`. A namespace that only needs another namespace's
enums or types gets them by depending on that namespace's package: the
generator resolves them through its reference file
(see [cross_namespace_types.md](./cross_namespace_types.md)).

## Step 1: Verify the GIR File and pkg-config

```bash
ls -la gir/<Library>-<Version>.gir
pkg-config --exists <pkg-config-name> && echo "Found"
pkg-config --cflags --libs <pkg-config-name>
```

## Step 2: Declare the Package

Add a `(package ...)` stanza for `oc<ns>` to the root `dune-project`, depending
on `ocglib`, on the packages of the namespaces it refers to (all `(= :version)`),
and on a conf package for its pkg-config module. Use opam-repository's conf
package if one installs that module on every supported platform; otherwise add
a `conf-<name>/` directory like `conf-graphene-1/` (see the conf package table in
`gir_gen/docs/plans/library-layout.md`). `dune build` regenerates `oc<ns>.opam`.

## Step 3: Create the Hand-Written Files

```
oc<ns>/
├── dune                 # (documentation (package oc<ns>))
├── index.mld            # the package's documentation page
└── raw/
    ├── dune             # the oc<ns>.raw library, see below
    └── core/
        ├── <ns>_core.h  # included by the generated <ns>_decls.h
        └── ml_<ns>.c    # hand-written C stubs (may be empty)
```

`raw/dune` follows the existing ones, for example `ocgdkpixbuf/raw/dune`:

```scheme
(include_subdirs unqualified)

(include generated/dune.inc)

(library
 (name oc<ns>_raw)
 (public_name oc<ns>.raw)
 (synopsis "<Library> layer 1: externals and abstract types")
 (flags :standard -w -3-6-9-27-32-33-34-50 -open Ocglib)
 (libraries
  ocglib
  oc<ns>.enums
  oc<ns>.raw.stubs
  ; the .raw and .enums libraries of each namespace it refers to
  )
 (foreign_stubs
  (language c)
  (names ml_<ns>)
  (flags
   :standard
   -Igenerated
   -Icore
   (:include cflag-<ns>.sexp)
   -Wno-deprecated-declarations))
 (install_c_headers <ns>_decls <ns>_core))
```

Hand-written layer 1 modules go in `raw/core/` and are aliased in the generated
`Raw` module. Hand-written modules that need layer 2 go in `oc<ns>/core/`, which
the generated main library copies in (as `ocgtk/core/` does for `Ocgtk.Main`).

## Step 4: Add Overrides (If Needed)

Create `overrides/<ns>.sexp` to ignore platform-specific or problematic types
with `(ignore)`, or to add version and OS guards; see
[gir_gen/overrides.md](./gir_gen/overrides.md). `gir_gen/lib/exclude_list.ml`
holds the few exclusions that apply to every namespace.

## Step 5: Add the Namespace to the Generation Script

In `scripts/generate-bindings.sh`, add the namespace to `NAMESPACES` (in
dependency order: name, GIR file, package directory) and list the reference
files it reads in `DEPS`. Then regenerate:

```bash
bash scripts/generate-bindings.sh
```

The generator writes `oc<ns>/raw/generated/`, `oc<ns>/enums/generated/` and
`oc<ns>/generated/`, including their dune files. See
[gir_gen/README.md](../gir_gen/README.md) for the generator's options.

## Step 6: Add Type Mappings (If Needed)

Cross-namespace classes, interfaces, records, enums, and bitfields are automatically
resolved via the reference file system — see [cross_namespace_types.md](./cross_namespace_types.md).
You only need to add mappings for library-specific primitive types not covered by
the existing GLib/GTK mappings in `type_mappings.ml`.

## Step 7: Build, Test and Document

```bash
dune build
dune test oc<ns>/
```

Common issues:
- **Missing type mappings**: Add to `type_mappings.ml`
- **Unresolved external types**: Add the namespace's reference file to `DEPS`
- **Compilation errors**: Check generated C code; ignore the entity in the overrides
- **Missing pkg-config**: Install development packages

Add a test in `oc<ns>/tests/` (each test stanza has `(package oc<ns>)`), the
package to the table in `README.md`, and an entry to `CHANGELOG.md`. Check that
`dune build -p oc<ns> @install` works against its dependencies installed in
another prefix: that is how opam builds it.

## Step 8: Commit

```bash
git add dune-project oc<ns>.opam oc<ns>/ overrides/<ns>.sexp scripts/generate-bindings.sh
git commit -m "Add <Library> bindings"
```

---

## Known Limitations

When adding a new library, be aware of these gir_gen limitations:

1. **Signal handling**: Parameterless void signals and some typed-parameter signals are supported via `signal_marshaller.ml`. Complex signals (e.g., with `GdkEvent` parameters) are skipped.
2. **Parameters**: Out parameters are now supported. InOut parameters have partial support.
3. **Collections**: Arrays are fully supported (zero-terminated, length-based, GPtrArray, out-param arrays). GList/GSList support exists but is limited in coverage.
4. **Callbacks**: No callback parameter support in methods (async APIs, custom callbacks).
5. **Type mapping**: Cross-namespace types are auto-discovered via reference files — see [cross_namespace_types.md](./cross_namespace_types.md). Only primitive/GLib types need manual mapping.
6. **Platform-specific code**: The override system supports `(os ...)` and `(not_os ...)` directives for conditional compilation.
7. **Record fields**: No field accessor generation.
8. **Factory functions**: No high-level factory function generation.

Refer to [ROADMAP.md](../ROADMAP.md) for the full list.

---

## Troubleshooting

### Build Errors

**Missing types**: Add to `type_mappings.ml`
```ocaml
| "<Namespace>.<Type>", _ -> "<ocaml_type>"
```

**Compilation failures**: Add to `exclude_list.ml`
```ocaml
let excluded_types = [
  "<Namespace>.<ProblematicType>";
]
```

**Cyclic dependencies**: The gir_gen tool handles this automatically with Tarjan's SCC algorithm, creating combined modules.

### Result Type Wrapping Errors

**Symptom**: Type errors like "This expression has type (X, error) result but an expression was expected of type X"

**Cause**: Methods that can throw errors return result types. These need special handling when the success value is a class instance.

**Solution**: This is automatically handled by gir_gen. Regenerate bindings if you see this error.

### Runtime Errors

**Symbol not found**: Check pkg-config flags and ensure library is linked
**Segfaults**: Verify type conversions and memory management in custom C stubs

---

## Examples

### Example: GDK

GDK was added as the third library after GTK and GIO. Key learnings:

**Setup differences:**
- GDK doesn't have a separate pkg-config package — it's bundled with GTK4.
  Its raw library asks pkg-config for `gtk4`, and its package depends on
  `conf-gtk4`.

**Opaque record types**: if a record that other types refer to has no fields,
constructors or methods, and the generator produces no module for it, create a
minimal handwritten module in `raw/core/`. `EventSequence` needed this when GDK
was added; the generator has produced it since.

```ocaml
(* ocgdk/raw/core/event_sequence.ml — no longer needed *)
type t = Obj.t
```
