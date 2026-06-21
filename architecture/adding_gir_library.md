# Adding a New GIR Library to ocgtk

This document provides a step-by-step plan for adding a new GObject Introspection (GIR) library to ocgtk, such as GIO, GtkSourceView, WebKit, or Libadwaita.

## Prerequisites

Before starting, ensure you have:
- The GIR file for the library (in `gir/` at the repo root)
- Development packages installed (e.g., `libgio-2.0-dev`, `gir1.2-gio-2.0`)
- pkg-config support for the library

## Decision: Enum-Only vs. Full Library

First, decide what level of support you need:

### Option A: Enum/Bitfield Support Only
If you only need to reference enums/bitfields from the library (e.g., for type mappings in Gtk), add it as an external namespace. This is simpler and requires minimal changes.

### Option B: Full Library Support
If you need classes, interfaces, methods, properties, and signals from the library, generate it as a full library. This requires more setup but provides complete bindings.

---

## Plan A: Adding Enum/Bitfield Support Only

### Step 1: Identify the GIR File
```bash
ls gir/ | grep -i <LibraryName>
```

Example: `gir/Gio-2.0.gir`

### Step 2: Add to External Namespaces

Edit `gir_gen/lib/gir_gen.ml` to add the library to the reference-file list.

### Step 3: Regenerate Gtk Bindings

```bash
# From repo root:
dune exec gir_gen -- generate gir/Gtk-4.0.gir ocgtk/src/gtk
```

This will generate `ocgtk/src/gtk/generated/gio_enums.mli` with all Gio enums and bitfields.

### Step 4: Build and Test

```bash
dune build
```

### Step 5: Commit Changes

```bash
git add ocgtk/src/gtk/generated/gio_enums.mli
git commit -m "Add Gio enum support to external namespaces"
```

---

## Plan B: Adding Full Library Support

### Step 1: Verify GIR File and Dependencies

Check that the GIR file exists:
```bash
ls -la gir/<Library>-<Version>.gir
```

Check pkg-config:
```bash
pkg-config --exists <library-name> && echo "Found" || echo "Not found"
pkg-config --cflags <library-name>
pkg-config --libs <library-name>
```

Example for Gio:
```bash
pkg-config --exists gio-2.0 && echo "Found"
```

### Step 2: Create Library Directory Structure

```bash
cd /workspaces/ocgtk/ocgtk/src
mkdir -p <library-name>/core
mkdir -p <library-name>/generated
```

Example:
```bash
mkdir -p gio/core
mkdir -p gio/generated
```

### Step 3: Create Core Bindings (Optional but Recommended)

Create hand-written bindings for common types and functions:

#### `src/<library>/core/<library>.ml`
```ocaml
(* Core OCaml bindings *)

(* Add type definitions and utility functions *)
```

#### `src/<library>/core/<library>.mli`
```ocaml
(* Public interface *)
```

#### `src/<library>/core/ml_<library>.c`
```c
/* Hand-written C stubs for special cases */
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <gio/gio.h>

/* Add custom bindings not handled by gir_gen */
```

### Step 4: Create Initial Dune File

Create `src/<library>/dune`:

```scheme
(library
 (name ocgtk_<library>)
 (public_name ocgtk.<library>)
 (synopsis "OCaml bindings for <Library>")
 (flags :standard -w -3-6-9-27-32-33-34-50)
 (libraries ocgtk_common)
 (foreign_stubs
  (language c)
  (names ml_<library>)  ; Hand-written C stubs in core/
  (flags :standard
   (:include c_flags.sexp)))
 (include_subdirs unqualified))

(rule
 (targets c_flags.sexp)
 (action
  (with-stdout-to %{targets}
   (run pkg-config --cflags <pkg-config-name>))))

(include generated/dune-generated.inc)
```

Example for Gio:
```scheme
(library
 (name ocgtk_gio)
 (public_name ocgtk.gio)
 (synopsis "OCaml bindings for GIO")
 (flags :standard -w -3-6-9-27-32-33-34-50)
 (libraries ocgtk_common)
 (foreign_stubs
  (language c)
  (names ml_gio)
  (flags :standard
   (:include c_flags.sexp)))
 (include_subdirs unqualified))

(rule
 (targets c_flags.sexp)
 (action
  (with-stdout-to %{targets}
   (run pkg-config --cflags gio-2.0))))

(include generated/dune-generated.inc)
```

### Step 5: Add Type Mappings (If Needed)

Cross-namespace classes, interfaces, records, enums, and bitfields are automatically
resolved via the reference file system — see [cross_namespace_types.md](./cross_namespace_types.md).
You only need to add mappings for library-specific primitive types not covered by
the existing GLib/GTK mappings in `type_mappings.ml`.

### Step 6: Update Exclude List (If Needed)

Edit `gir_gen/lib/exclude_list.ml` to exclude platform-specific or problematic types:

```ocaml
let excluded_types = [
  (* ... existing ... *)
  "<Namespace>.<ProblematicType>";
  "<Namespace>.<PlatformSpecificType>";
]
```

Alternatively, use the override system (`ocgtk/overrides/<ns>.sexp`) with `(ignore)` directives instead of modifying `exclude_list.ml`.

### Step 7: Add Library to Main gir_gen Configuration (Optional)

If you want the library to be aware of other library enums, update `external_namespaces` in `gir_gen/lib/gir_gen.ml`.

### Step 8: Run Code Generation

See [gir_gen/README.md](../gir_gen/README.md) for the `generate` command syntax and options.

### Step 9: Update Main Library Wrapper

Edit `src/dune` to expose the new sub-library:

```scheme
(library
 (name ocgtk)
 (public_name ocgtk)
 (libraries ocgtk_common ocgtk_gtk ocgtk_<library>)
 (re_export ocgtk_common ocgtk_gtk ocgtk_<library>))
```

### Step 10: Build and Fix Errors

```bash
dune build
```

Common issues:
- **Missing type mappings**: Add to `type_mappings.ml`
- **Unresolved external types**: Add dependency to external_namespaces
- **Compilation errors**: Check generated C code, may need exclude_list entries
- **Missing pkg-config**: Install development packages

Iterate on type mappings and exclude list until it builds successfully.

### Step 11: Test the Bindings

Create a simple test program:

```ocaml
(* test_<library>.ml *)
open ocgtk_<library>

let () =
  (* Test basic functionality *)
  print_endline "Library loaded successfully"
```

Build and run:
```bash
dune exec ./test_<library>.exe
```

### Step 12: Update Documentation

Update relevant documentation:
- `README.md` - Add library to features list
- `CHANGES.md` - Document the addition
- Create examples in `examples/<library>/`

### Step 13: Commit Changes

```bash
git add ocgtk/src/<library>/
git commit -m "Add <Library> bindings"
```

---

## Directory Structure After Adding a Full Library

```
ocgtk/
├── src/
│   ├── dune                          # Wrapper library
│   ├── common/                       # ocgtk_common
│   ├── gtk/                          # ocgtk_gtk
│   └── <library>/                    # ocgtk_<library> (NEW)
│       ├── dune                      # Library definition
│       ├── core/                     # Hand-written bindings
│       │   ├── <library>.ml/mli
│       │   └── ml_<library>.c
│       └── generated/                # Generated by gir_gen
│           ├── dune-generated.inc
│           ├── ml_*_gen.c            # C FFI stubs
│           ├── *.ml/.mli             # Low-level OCaml
│           ├── g*.ml/.mli            # High-level classes
│           ├── *_signals.ml          # Signal handlers
│           └── *_enums.mli           # Enums/bitfields
```

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

### Example 1: Adding GIO

See the initial implementation for a concrete example of adding Gio-2.0 following Plan B.

### Example 2: Adding GDK

GDK was added as the third library after GTK and GIO. Key learnings:

**Setup differences:**
- GDK doesn't have a separate pkg-config package — it's bundled with GTK4.
  Use `pkg-config --cflags gtk4` in the dune file.

**Opaque record types**: `EventSequence` has no public API but is referenced by
other types. If a record has no fields, constructors, or methods, the generator
produces no module for it. Create a minimal handwritten module in `core/`:

```ocaml
(* src/gdk/core/event_sequence.ml *)
type t = Obj.t
```

**Files created:**
- `src/gdk/dune` — Library definition using `gtk4` for pkg-config
- `src/gdk/core/ml_gdk.c` — Placeholder for hand-written stubs
- `src/gdk/generated/*` — Auto-generated bindings
