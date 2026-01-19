# Adding a New GIR Library to ocgtk

This document provides a step-by-step plan for adding a new GObject Introspection (GIR) library to ocgtk, such as GIO, GtkSourceView, WebKit, or Libadwaita.

## Prerequisites

Before starting, ensure you have:
- The GIR file for the library (usually in `/usr/share/gir-1.0/`)
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
ls /usr/share/gir-1.0/ | grep -i <LibraryName>
```

Example: `/usr/share/gir-1.0/Gio-2.0.gir`

### Step 2: Add to External Namespaces

Edit `/workspaces/ocgtk/ocgtk/src/tools/gir_gen/main.ml` around line 411-417:

```ocaml
let external_namespaces = [
  ("Gdk", "/usr/share/gir-1.0/Gdk-4.0.gir");
  ("Pango", "/usr/share/gir-1.0/Pango-1.0.gir");
  ("GdkPixbuf", "/usr/share/gir-1.0/GdkPixbuf-2.0.gir");
  ("Gsk", "/usr/share/gir-1.0/Gsk-4.0.gir");
  ("Graphene", "/usr/share/gir-1.0/Graphene-1.0.gir");
  ("Gio", "/usr/share/gir-1.0/Gio-2.0.gir");  (* ADD THIS LINE *)
] in
```

### Step 3: Regenerate Gtk Bindings

```bash
cd /workspaces/ocgtk/ocgtk
dune exec src/tools/gir_gen/gir_gen.exe -- /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
```

This will generate `src/gtk/generated/gio_enums.mli` with all Gio enums and bitfields.

### Step 4: Build and Test

```bash
dune build
```

### Step 5: Commit Changes

```bash
git add src/tools/gir_gen/main.ml src/gtk/generated/gio_enums.mli
git commit -m "Add Gio enum support to external namespaces"
```

---

## Plan B: Adding Full Library Support

### Step 1: Verify GIR File and Dependencies

Check that the GIR file exists:
```bash
ls -la /usr/share/gir-1.0/<Library>-<Version>.gir
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
open Gaux

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

### Step 5: Add Type Mappings

Edit `src/tools/gir_gen/type_mappings.ml` to add mappings for library-specific types.

Add common type conversions around line 1-100:
```ocaml
  (* <Library> types *)
  | "<Namespace>.<Type>", _ -> "<library_type>"
```

Example for Gio:
```ocaml
  (* Gio types *)
  | "Gio.File", _ -> "file"
  | "Gio.InputStream", _ -> "input_stream"
  | "Gio.OutputStream", _ -> "output_stream"
```

This is the most time-consuming step and may require examining the GIR file to identify all types.

### Step 6: Update Exclude List (If Needed)

Edit `src/tools/gir_gen/exclude_list.ml` to exclude platform-specific or problematic types:

```ocaml
let excluded_types = [
  (* ... existing ... *)
  "<Namespace>.<ProblematicType>";
  "<Namespace>.<PlatformSpecificType>";
]
```

### Step 7: Add Library to Main gir_gen Configuration (Optional)

If you want the library to be aware of other library enums, update `external_namespaces` in `src/tools/gir_gen/main.ml`:

```ocaml
let external_namespaces = [
  (* Add dependencies here *)
  ("GLib", "/usr/share/gir-1.0/GLib-2.0.gir");
  ("GObject", "/usr/share/gir-1.0/GObject-2.0.gir");
] in
```

### Step 8: Run Code Generation

Execute the gir_gen tool:

```bash
dune exec src/tools/gir_gen/gir_gen.exe -- \
  /usr/share/gir-1.0/<Library>-<Version>.gir \
  src/<library-name>
```

Example for Gio:
```bash
dune exec src/tools/gir_gen/gir_gen.exe -- \
  /usr/share/gir-1.0/Gio-2.0.gir \
  src/gio
```

This will generate:
- `src/<library>/generated/dune-generated.inc` - Build configuration
- `src/<library>/generated/ml_*_gen.c` - C FFI stubs
- `src/<library>/generated/*.ml/.mli` - OCaml low-level bindings
- `src/<library>/generated/g*.ml/.mli` - High-level wrapper classes
- `src/<library>/generated/*_signals.ml` - Signal handlers
- `src/<library>/generated/<namespace>_enums.mli` - Enum definitions

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
git add src/<library>/ src/dune src/tools/gir_gen/
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

---

## Recent Fixes

### 2026-01-02: Constructor Self-Reference and Out Parameter Fixes

Three critical code generation bugs were discovered and fixed while adding GDK support:

1. **Constructor self-reference bug**: Constructor parameters that reference the same type being defined (e.g., `Cursor.new_from_name` taking `Cursor.t option` as fallback) were generating `Cursor.t` instead of `t`, causing "module is an alias for itself" errors.
   - **Fix**: Modified `ml_interface.ml` to apply `simplify_self_reference` to constructor parameter types (line 198)
   - **File**: `src/tools/gir_gen/generate/ml_interface.ml`

2. **Out parameter struct pointer bug**: Out parameters for struct types (like `GdkRectangle`) were being passed by value instead of by pointer to their conversion functions, causing type mismatches like "incompatible type for argument 1 of 'Val_GdkRectangle'".
   - **Fix**: Modified `nullable_c_to_ml_expr` in `c_stubs.ml` to detect struct types (conversion functions starting with `Val_Gdk` but not ending in `Type` or `Flags`) and pass their address using `&var` for out parameters
   - **File**: `src/tools/gir_gen/generate/c_stubs.ml` (lines 24-45)

3. **Opaque record types**: Records with no public methods/constructors (like `EventSequence`) need minimal module definitions when referenced by other types.
   - **Workaround**: Manually create minimal `.ml/.mli` files with `type t = Obj.t`
   - **Future fix needed**: Code generator should auto-generate these minimal modules

### 2025-12-19: Previous Fixes

1. **Dynamic pkg-config references**: The dune-generated.inc now correctly generates pkg-config references for each library (e.g., `cflag-gio.sexp` for GIO instead of hardcoded `cflag-gtk4.sexp`)

2. **Result type wrapping**: Methods that throw errors (return `(type, GError.t) result`) now correctly wrap class return types using `Result.map` instead of direct instantiation

These fixes enable proper support for multiple libraries beyond GTK.

## Known Limitations

When adding a new library, be aware of these gir_gen limitations:

1. **Signal handling**: Only parameterless void signals are supported
2. **Parameters**: No support for out/inout parameters
3. **Collections**: No array/list type support
4. **Callbacks**: No callback parameter support in methods
5. **Type mapping**: Manual mapping required (not auto-discovered)
6. **Platform-specific code**: May need conditional compilation

Refer to `architecture/todo/KNOWN_BUGS.md` for the full list.

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

**Solution**: This is automatically handled by gir_gen (as of 2025-12-19). Regenerate bindings if you see this error in older generated code.

### Runtime Errors

**Symbol not found**: Check pkg-config flags and ensure library is linked
**Segfaults**: Verify type conversions and memory management in custom C stubs

---

## Examples

### Example 1: Adding GIO

See the initial implementation for a concrete example of adding Gio-2.0 following Plan B.

### Example 2: Adding GDK (2026-01-02)

GDK was added as the third library after GTK and GIO. Key learnings:

**Setup differences:**
- GDK doesn't have a separate pkg-config package - it's bundled with GTK4
- Solution: Use `pkg-config --cflags gtk4` in the dune file

**Issues encountered and fixed:**
1. **Self-reference in constructors**: `Cursor.new_from_name` takes a `Cursor.t option` fallback parameter
   - Required fix to code generator to use `t` instead of `Cursor.t` in same-module references

2. **Struct out parameters**: Methods like `Monitor.get_geometry` return `GdkRectangle` via out parameter
   - Required fix to pass `&out_var` instead of `out_var` for struct types
   - Had to distinguish between structs and enums/bitfields by checking conversion function naming patterns

3. **Opaque record types**: `EventSequence` has no public API but is referenced by other types
   - Manually created minimal module: `type t = Obj.t`

**Files created:**
- `src/gdk/dune` - Library definition using `gtk4` for pkg-config
- `src/gdk/core/ml_gdk.c` - Placeholder for hand-written stubs
- `src/gdk/generated/*` - Auto-generated bindings (47 classes, 5 interfaces, 32 records)
- `src/Gdk.ml` - Wrapper module re-exporting from ocgtk_gdk

**Result**:
- Full GDK bindings successfully generated and compiled
- Discovered and fixed 3 code generator bugs that will benefit future library additions
