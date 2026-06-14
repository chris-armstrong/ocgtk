# GIR Code Generator (gir_gen)

GTK introspection-based code generator for ocgtk bindings.

For a full architectural introduction covering the binding layers, pipeline,
dependency analysis, signals, and dead code elimination, see
[architecture/overview.md](../architecture/overview.md).

## Architecture Overview

The generator processes GIR XML files through a 4-stage pipeline:

```
GIR XML (e.g., Gtk-4.0.gir)
    │
    ├─► parse/gir_parser.ml     ──► types.ml (AST)
    │                              │
    │                              ▼
    │                       type_mappings.ml (type resolution)
    │                              │
    │         ┌────────────────────┼────────────────────┐
    │         ▼                    ▼                    ▼
    │   generate/            generate/            generate/
    │   c_stubs.ml           ml_interface.ml      class_gen.ml
    │   (Layer 0 C)          (Layer 1 ML)         (Layer 2 ML)
    │         │                    │                    │
    │         ▼                    ▼                    ▼
    │   ml_*_gen.c          widget.mli             gWidget.ml
    │   C FFI stubs         Low-level bindings     High-level wrappers
```

### Key Files

| File | Purpose |
|------|---------|
| `types.ml` | AST for GIR elements (classes, methods, types, enums, records, signals) |
| `parse/gir_parser.ml` | XML parsing → AST |
| `type_mappings.ml` | Maps C types to OCaml types (`gint` → `int`, etc.) + cross-namespace resolution |
| `override_types.ml` / `override_parser.ml` / `override_apply.ml` | Override sexp parsing and application |
| `dependency_analysis.ml` | Tarjan SCC for cyclic dependency resolution |
| `generate/c_stubs.ml` | C FFI code orchestration (Layer 0) |
| `generate/c_stub_method.ml` | C method stub generation |
| `generate/c_stub_property.ml` | C property getter/setter generation |
| `generate/c_stub_array_conv.ml` | Array conversion code generation |
| `generate/layer1/layer1_main.ml` | OCaml interface generation (Layer 1) |
| `generate/class_gen.ml` | High-level wrapper orchestration (Layer 2) |
| `generate/signal_gen.ml` / `signal_marshaller.ml` | Signal handler generation |
| `generate/enum_code.ml` | Enum/bitfield type and converter generation |
| `generate/dune_file.ml` | Build configuration generation |

### Type Resolution Flow

```
gir_type.name + gir_type.c_type
        │
        ▼
Type_mappings.find_type_mapping_for_gir_type()
        │
        ├─► Found → use mapping.ocaml_type in ML output
        │
        └─► Not found → method is SKIPPED (exclude_list.ml)
                       or falls back to "unit" in some cases
```

## Building

```bash
# From repository root
dune build
```

The executable is built to `_build/default/gir_gen/bin/gir_gen.exe`

## Running

### Commands

gir_gen has three commands:

- **`generate`** - Generate C FFI bindings and OCaml modules from GIR files
- **`references`** - Generate cross-namespace reference list for type validation
- **`overrides`** - Extract `Since` version annotations from a GIR file into an override sexp file

### From the repository root directory

**Recommended approach - run from the repository root:**

```bash
# Generate GTK bindings to ocgtk/src/gtk/generated/
dune exec gir_gen -- generate gir/Gtk-4.0.gir ocgtk/src/gtk
```

### Generate Command Options

- `GIR_FILE`: Path to GIR file (e.g. `gir/Gtk-4.0.gir`)
- `OUTPUT_DIR`: Where to write generated files (relative to repo root, e.g. `ocgtk/src/gtk`)
- `-f, --filter FILE`: Optional filter file specifying which classes to generate
- `-r, --reference FILE`: Optional reference file(s) for cross-namespace type validation (can be specified multiple times)
- `-o, --overrides FILE`: Optional override sexp file controlling which entities are ignored and their version guards (see [Override System](#override-system))

### References Command Options

- `GIR_FILE`: Path to GIR file
- `OUTPUT_FILE`: Where to write the reference sexp
- `-o, --overrides FILE`: Optional override sexp file; ignored entities are excluded from the reference output

### Overrides Command

Extracts `Since` version annotations from GIR documentation into a starter override file. The output should be committed to `ocgtk/overrides/<ns>.sexp` and then augmented with manually-authored `(ignore)` entries.

```bash
# Extract version annotations for GTK into the overrides directory (from repo root)
dune exec gir_gen -- overrides \
  gir/Gtk-4.0.gir ocgtk/overrides/gtk.sexp
```

### ⚠️ IMPORTANT: Output Directory Convention

**The output directory should be the PARENT of the `generated/` directory, NOT the `generated/` directory itself.**

The generator automatically creates a `generated/` subdirectory inside the output directory you specify.

✅ **Correct (from repo root):**
```bash
dune exec gir_gen -- generate gir/Gtk-4.0.gir ocgtk/src/gtk
```
This creates files in `ocgtk/src/gtk/generated/`

❌ **Wrong:**
```bash
dune exec gir_gen -- generate gir/Gtk-4.0.gir ocgtk/src/gtk/generated
```
This creates files in `ocgtk/src/gtk/generated/generated/` (nested directory problem)

**Examples (from repo root):**
- For GTK: Use `ocgtk/src/gtk` → generates to `ocgtk/src/gtk/generated/`
- For GDK: Use `ocgtk/src/gdk` → generates to `ocgtk/src/gdk/generated/`
- For GIO: Use `ocgtk/src/gio` → generates to `ocgtk/src/gio/generated/`

## Testing

### Quick Test
```bash
# Generate test output (from repo root)
mkdir -p output/test
echo "Label" > output/test/filter.txt
dune exec gir_gen -- generate -f output/test/filter.txt \
  gir/Gtk-4.0.gir output/test

# Verify files generated
ls output/test/generated/label.mli output/test/generated/ml_label_gen.c
```

### Verify C Compilation
```bash
# Check generated C compiles (headers only)
gcc -c output/test/generated/ml_label_gen.c \
  -I$(ocamlc -where) $(pkg-config --cflags gtk4) \
  -fsyntax-only
```

### Full Rebuild
```bash
# Regenerate all GTK bindings and rebuild library (from repo root)
dune exec gir_gen -- generate gir/Gtk-4.0.gir ocgtk/src/gtk
dune build
```

### Generate Cross-Namespace References
```bash
# Generate reference list for type validation (from repo root)
dune exec gir_gen -- references \
  gir/Gtk-4.0.gir gtk_refs.txt

# Use references when generating bindings
dune exec gir_gen -- generate \
  -r gtk_refs.txt -r gdk_refs.txt \
  gir/Gtk-4.0.gir ocgtk/src/gtk
```

### Generate with Override File

```bash
# Apply overrides while generating (from repo root)
dune exec gir_gen -- generate \
  -o ocgtk/overrides/gtk.sexp \
  -r gdk_refs.txt \
  gir/Gtk-4.0.gir ocgtk/src/gtk
```

## Output Files

Generated files are written to `ocgtk/src/<ns>/generated/` (e.g., `ocgtk/src/gtk/generated/`):

- **C FFI stubs**: `ml_*_gen.c` - C bindings for classes, interfaces, enums
- **Layer 1 (low-level)**: `<class_name>.ml/.mli` - External declarations (snake_case)
- **Layer 2 (high-level)**: `g<Class>.ml/.mli` - OCaml wrapper classes (PascalCase)
- **Enums**: `<ns>_enums.ml/.mli` - Enumeration and bitfield types for this namespace
- **Library module**: `<Ns>.ml/.mli` - Combined library module with all re-exports
- **Wrapper module**: `ocgtk_<ns>.ml` - Library wrapper: `module <Ns> = <Ns>; include <Ns>` + core module aliases
- **Declaration header**: `<ns>_decls.h` - C type converter declarations, includes dependency headers
- **Combined cyclic modules**: `<class1>_and__<class2>_and__<class3>.ml/.mli` - Single module combining mutually-recursive classes (see dependency resolution below)

## Override System

Override files (`overrides/<ns>.sexp`) allow per-library customisation of what gets
generated without modifying the generator source. They replace the former hardcoded
exclusion lists in `exclude_list.ml`, `filtering.ml`, and `library_module.ml`.

Override files live in `ocgtk/overrides/` and are committed to the repository. One file
exists per namespace (e.g. `ocgtk/overrides/gtk.sexp`, `ocgtk/overrides/gio.sexp`).

### Format

```sexp
(overrides
  (library "Gtk")

  ;; Ignore an entire class (no bindings generated)
  (class PrintJob (ignore))

  ;; Ignore a single method on a class
  (class TextBuffer
    (method insert_with_tags (ignore))
  )

  ;; Ignore a property
  (class IconPaintable
    (property is-symbolic (ignore))
  )

  ;; Set a version guard on an enum member (emits #if GTK_CHECK_VERSION(...))
  (enumeration FileChooserAction
    (save (version "4.10"))
  )

  ;; Cross-namespace version guard: guard on a DIFFERENT namespace's version.
  ;; Useful when the binding depends on a dependency at a higher version than
  ;; the containing namespace requires (e.g. a GTK property that uses a
  ;; PangoTextTransform type introduced in Pango 1.50, but the GTK version
  ;; guard alone is not sufficient because the distro may ship GTK >= 4.6
  ;; with Pango < 1.50).
  (class TextTag
    (property text-transform (version (pango "1.50")))
  )

  ;; Ignore a bitfield or record
  (bitfield PrintCapabilities (ignore))
  (record PrintBackend (ignore))

  ;; OS guard: generate this entity only on Linux
  (class DesktopAppInfo (os "linux"))

  ;; OS guard: generate this entity on all platforms except Windows
  (class UnixInputStream (not_os "windows"))

  ;; Conditional header include in <ns>_decls.h (only on Linux)
  (header "gio/gdesktopappinfo.h" (os "linux"))
  ;; Conditional header include excluded on Windows
  (header "gio/gunixoutputstream.h" (not_os "windows"))
)
```

Supported entity kinds: `class`, `interface`, `enumeration`, `bitfield`, `record`.
Supported sub-component directives: `method`, `constructor`, `property`, `signal`,
`member` (enum member), `flag` (bitfield flag), `field` (record field).

Available actions:
- `(ignore)` — skip generation of this entity or sub-component entirely
- `(version "X.Y")` — emit a `#if NS_CHECK_VERSION(X, Y, 0)` guard using this namespace's version macro (e.g. `GTK_CHECK_VERSION` in `gtk.sexp`)
- `(version (<ns> "X.Y"))` — emit a `#if <NS>_CHECK_VERSION(X, Y, 0)` guard using a **different** namespace's version macro; use when the binding depends on a dependency at a version higher than the containing namespace's own minimum (e.g. `(version (pango "1.50"))` in `gtk.sexp` emits `PANGO_CHECK_VERSION(1, 50, 0)`)
- `(os "<platform>")` — wrap the generated C stub in `#if defined(<MACRO>)` / `#else caml_failwith` so the binding compiles on all platforms but raises a runtime error on unsupported ones
- `(not_os "<platform>")` — same, but the guard is `#if !defined(<MACRO>)`; cannot be mixed with `(os ...)`

OS guard actions can be applied to top-level entities **and** to sub-component directives (`method`, `constructor`, `property`, etc.).

Recognised platform names and the C macros they expand to:

| Name | C guard |
|------|---------|
| `"linux"` | `defined(__linux__)` |
| `"macos"` | `defined(__APPLE__) && defined(__MACH__)` |
| `"freebsd"` | `defined(__FreeBSD__)` |
| `"unix"` | `defined(G_OS_UNIX)` |
| `"windows"` | `defined(_WIN32)` |

The `(header "path" (os/not_os ...))` directive adds a header to `<ns>_decls.h` wrapped in the same platform guard. This is distinct from the per-entity `(os ...)` action — it controls C `#include` lines, not stub generation.

### Workflow: updating override files

Override files are generated once with `gir_gen overrides` and then hand-edited. When
the GIR file changes (e.g. a GTK upgrade), re-run `gir_gen overrides` and merge the
diff to pick up new `Since` annotations.

The recommended workflow is to use `generate-bindings.sh` (from the repository root),
which handles all 9 namespaces end-to-end:

```bash
bash scripts/generate-bindings.sh
```

To regenerate just the version-annotation portion for one namespace:

```bash
# From repository root:
dune exec gir_gen -- overrides \
  gir/Gtk-4.0.gir ocgtk/overrides/gtk.sexp
```

Then review the diff, keep any manual `(ignore)` entries you added, and commit.

## Constructor Wrapper Generation

Each G* module (Layer 2 high-level wrapper) generated by `class_gen.ml` exports
constructor wrapper functions in addition to the class definition:

```ocaml
(* Example from gButton.ml *)
let new_ () : button_t =
  new button (Button.new_ ())

let new_with_label (label : string) : button_t =
  new button (Button.new_with_label label)

let new_from_icon_name (icon_name : string) : button_t =
  new button (Button.new_from_icon_name icon_name)
```

These constructors wrap the low-level FFI constructors from the Layer 1 module
with the high-level class wrapper. They are used to support the ergonomic API:

```ocaml
let btn = GButton.new_with_label "Click"
```

instead of the more verbose:

```ocaml
let btn = new GButton.button (Button.new_with_label "Click")
```

When classes with different constructor names are used (e.g., `Button` has
`new_`, `new_with_label`, etc.), each is wrapped individually in the G* module.

## Cyclic Dependency Resolution and Shim Modules

Classes with cyclic dependencies are detected using Tarjan's strongly connected
components (SCC) algorithm and combined into single modules. For example:

- `Application`, `Window`, and `WindowGroup` form a cycle (each references others)
- Generator creates `application_and__window_and__window_group.ml` combining all three
- Within this module, each class gets a submodule: `Application`, `Window`, `WindowGroup`
- Type references within the cycle use simple names: `Window.t`
- Type references across cycles use qualified names: `Application_and__window_and__window_group.Window.t`

This approach allows OCaml's type checker to validate recursive types while the
linker still treats it as a single compilation unit.

## Common Issues

**Error: "Program 'gir_gen' not found"**
- Ensure you're in the repository root (not the `ocgtk/` subdirectory)
- Run `dune build` first

**Error: "Don't know how to build gir_gen"**
- Use `dune exec gir_gen --` from the repository root (where the dune-workspace file lives)
- Do not use `dune exec src/tools/gir_gen/gir_gen.exe` — that path no longer exists

---

# Current Implementation Status

## What gir_gen Generates (As of Phase 5)

The tool produces a **four-layer binding system** from GIR introspection data:

### Layer 1: C FFI Bindings (`ml_*_gen.c`)
- Type-safe C stubs for all GTK4 classes, interfaces, and records
- Polymorphic variant converters using `caml_hash_variant` (see `generate/enum_code.ml`)
- Boxed record converters with NULL checking and deep copies (see `generate/c_stubs.ml`)
- Property getters/setters via GValue marshalling
- Per-library `<ns>_decls.h` headers with type converter declarations; dependent libraries include them
- Proper CAMLparam/CAMLreturn macros throughout

### Layer 2: Low-Level OCaml Interfaces (`<class_name>.ml/.mli`)
- Polymorphic variant type definitions: `type t = [`widget | ...] Gobject.obj` (see `generate/layer1/layer1_main.ml`)
- External function declarations for constructors, methods, and properties
- Hierarchy accessor methods (`as_widget`, `as_event_controller`, etc.) 
- Combined modules for cyclic dependencies using Tarjan's SCC algorithm (see `dependency_analysis.ml`)
- **Smart type resolution for cyclic modules** - automatically uses simple names within a cycle (`Window.t`) and fully-qualified names for external references (`Application_and__window_and__window_group.Window.t`)
- Over 600 generated binding files

### Layer 3: High-Level Wrapper Classes (`g<Class>.ml/.mli`)
- Skeleton classes (`<widget>_skel`) inheriting from `GObj.widget_impl` or parent skeleton (see `generate/class_gen.ml`)
- Concrete widget classes with method syntax for properties and methods
- Property wrapper methods with automatic type coercion
- Method wrappers delegating to low-level FFI bindings
- Constructor wrappers as module-level `let` functions (e.g., `let new_with_label ...`), wrapping Layer 1 constructors with the high-level class

### Layer 4: Signal Handling (`<widget>_signals` classes)
- Signal handler classes using `Gobject.Signal.connect_simple` (see `generate/signal_gen.ml`)
- **Limited to parameterless void signals only**
- Signals with parameters or return values are skipped with warnings

### Layer 5: Enum and Bitfield Types
- Complete enum type definitions for Gtk4 and external namespaces (Gdk, Pango, GdkPixbuf, Gsk, Graphene)
- Polymorphic variant representations with C converters
- Handles namespaced enums and digit-prefixed variant names (see `generate/enum_code.ml`)

### Build Integration
- Automatic `dune-generated.inc` generation with C stubs list and module names (see `generate/dune_file.ml`)

---

## Current Capabilities

### Parsing (parse/gir_parser.ml - ~1560 lines)
**Working:**
- Class extraction with parent/implements relationships, constructors, methods, properties, signals
- Interface extraction with methods, properties, c:symbol-prefix
- Enumeration and bitfield extraction with values and C identifiers
- Record extraction with boxed types, disguised/opaque flags, fields, methods
- Cross-namespace reference loading for all 9 namespaces via sexp reference files
- Documentation string extraction
- Constructor `throws` attribute detection
- Array type annotations (zero-terminated, length parameters, fixed-size, GPtrArray)
- Property `writable` / `construct-only` / `transfer-ownership` attributes

**Limitations:**
- Complex callback type definitions not fully extracted
- Interface method implementations not tracked beyond interface names

### Type Mapping (type_mappings.ml - ~784 lines)
**Working:**
- ~150 hardcoded GTK/GLib type mappings to OCaml types
- Nullable type handling with `option` wrapper
- Polymorphic variants for enums via hash table lookup
- Boxed record converters (`Val_*` / `*_val` macros)
- Widget type mappings (`GtkWidget*` → `Widget.t`)
- EventController, CellRenderer, LayoutManager, Expression hierarchies
- Cross-namespace type resolution via reference files:
  - Classes, interfaces, records: qualified as `Ocgtk_<ns>.<Ns>.Wrappers.<Module>.t`
  - Enums/bitfields: qualified as `Ocgtk_<ns>.<Ns>.<enum_name>`
  - `classify_type` for cross-namespace enum/bitfield detection in property analysis
- Context-aware cyclic module type resolution:
  - Detects when generating within a cyclic module via `current_cycle_classes`
  - Uses unqualified names for same-cycle references
  - Uses fully qualified names for cross-module references
- Array type mapping with `ARRAY_INLINE` marker for inline conversion
- GList/GSList type detection
- Modular lookup pipeline: `find_class_mapping`, `find_interface_mapping`, `find_record_mapping`, `find_enum_mapping`, `find_bitfield_mapping` chained via `or_else`

**Limitations:**
- No variadic argument support (filtered in `exclude_list.ml`)
- Limited callback type support
- No union type handling

### Code Generation
**C Stubs (`generate/c_stub_*.ml` - ~3100 lines across 12 modules):**
- Proper memory management with CAMLparam/CAMLlocal/CAMLreturn
- Type converter macros for enums, records, nullable types
- Property access via g_object_get_property/g_object_set_property with GValue
- Record allocation/deallocation with copy semantics
- Array inline conversion (zero-terminated, length-based, GPtrArray, out-param arrays)
- GList/GSList conversion macros
- Constructor stub generation with array parameters
- Out parameter handling (arrays, structs, primitives)
- Per-library `<ns>_decls.h` declaration headers with dependency includes
- Version guard emission (`#if GTK_CHECK_VERSION(...)`) for versioned entities and members

**OCaml Interfaces (`generate/layer1/` - ~480 lines across 5 modules):**
- Polymorphic variant types with inheritance chains
- External declarations matching C stubs
- Accessor methods for 5 hierarchies (Widget, EventController, CellRenderer, LayoutManager, Expression)
- Combined module generation for cyclic SCCs
- Handles nullable parameters/returns
- Constructor external declarations with self-reference simplification

**High-Level Classes (`generate/class_gen*.ml` - ~1880 lines across 8 modules):**
- Skeleton class generation with `GObj.widget_impl` inheritance
- Property methods (get_property, set_property patterns)
- Method wrappers with type coercion to parent types
- Concrete class instantiation
- Signal handler wiring via `connect` method
- Cross-namespace type resolution via `class_gen_type_resolution.ml`
- Property/method name conflict detection and resolution

**Signals (`generate/signal_gen.ml` / `signal_marshaller.ml` - ~670 lines):**
- Signal handler class generation
- Parameter marshalling via `Gobject.Value` for signals with typed parameters
- Widget type coercion for signal attachment
- Unsupported signals are skipped with warnings (not all parameter types are marshallable)

**Enums (`generate/enum_code.ml` - ~380 lines):**
- Type definitions for all enums and bitfields
- C converter functions using `caml_hash_variant`
- Namespace prefix handling (Gtk, Gdk, Pango, etc.)
- Digit-prefixed variant name sanitization
- Member-level version guards in C converters

### Dependency Handling (`dependency_analysis.ml` - ~299 lines)
**Working:**
- Tarjan's strongly connected components algorithm
- Cyclic dependency detection and resolution
- Combined module generation for mutual recursion (generates `<class1>_and__<class2>_and__<class3>.ml/.mli`)
- Topological ordering for compilation
- Smart type resolution for cyclic modules:
  - Within same cycle: uses simple submodule names (e.g., `Window.t`)
  - Cross-cycle references: uses full qualified names (e.g., `Application_and__window_and__window_group.Window.t`)
- Module name mapping table (`module_groups`) tracks which classes belong to which combined modules
- Proper handling of snake_case → capitalization for OCaml module name mapping
- Constructor wrappers and method implementations properly scoped within combined modules

### Parent Chain Support
Parent chain traversal (from `gir_class.parent` and `Crt_Class { parent }`)
drives polymorphic variant types in Layer 1 and `inherit` in Layer 2.
The former `hierarchy_detection.ml` module was removed (2026-03-23) as it
was entirely dead code.

### Filtering and Exclusions (filtering.ml - 150+ lines, exclude_list.ml - 85 lines)
**Working:**
- Platform-specific type filtering (PrintJob, etc.)
- Variadic function detection and filtering
- Unknown type detection with skip logic (cross-namespace types resolved via `cross_references`)
- Duplicate property detection between class and interfaces
- Virtual method de-duplication

**What Gets Filtered:**
- Methods with Out/InOut parameters (see `filtering.ml`)
- Methods with unknown types in parameters/returns (cross-namespace types are NOT filtered — they resolve via references)
- Signals with parameters or non-void returns
- Variadic functions (hardcoded list in `exclude_list.ml`)
- Platform-specific classes (Windows/macOS-only widgets)

---

## Known Bugs and Quirks

### Parser Issues (parse/gir_parser.ml)
1. Element data extraction uses recursive string concatenation (performance issue for large docs)
2. Namespace attribute handling has multiple fallback paths, can be fragile
3. Record parsing returns None on exclude (silent skip, no logging)
4. Signal parameter parsing assumes single return-value + parameters structure

### Generator Issues
1. Hierarchy root check uses lowercase string comparison (fragile)
2. Combined files generated even for single-element SCCs
3. Virtual method de-duplication logic may incorrectly skip inherited methods
4. Some property getter/setter GValue macros have platform-specific edge cases

### Type Mapping Issues (type_mappings.ml)
1. Type normalization removes namespace prefix, can cause collisions
2. Hash table lookup is case-sensitive, but C types are not canonicalized
3. Record mapping requires exact C type match, no fuzzy matching
4. Nullable handling assumes pointer types; value types cause issues

---

## Architecture Strengths

1. **Modular generation pipeline** - Easy to extend with new generators
2. **Dependency analysis** - Tarjan's algorithm handles mutual recursion elegantly
3. **Polymorphic variant types** - Type safety superior to lablgtk3's unified type approach
4. **External namespace support** - Enum/bitfield generation works across 5 namespaces
5. **Filtering system** - Prevents generation of unsupported code patterns
6. **Combined modules** - Handles OCaml's restriction on cyclic dependencies with intelligent type resolution
7. **Context-aware type generation** - Automatically uses correct module paths for self-references vs. cross-module references in cyclic dependencies

---

## Completion Estimate

**Overall: ~80% Complete**

| Feature | Status | Completeness |
|---------|--------|--------------|
| GIR Parsing | ✓ Working | 90% (missing callback types) |
| C FFI Generation | ✓ Working | 90% (arrays, out params implemented) |
| Low-Level OCaml Bindings | ✓ Working | 90% (missing some type conversions) |
| High-Level Class Wrappers | ⚠ Basic | 65% (no specializations) |
| Signal Handling | ⚠ Partial | 50% (parameterless + typed parameters for supported types) |
| Enum/Bitfield Support | ✓ Complete | 95% (same + cross-namespace) |
| Cross-Namespace Types | ✓ Working | 95% (classes, records, enums, bitfields) |
| Factory Functions | ✗ Missing | 0% |
| Container Helpers | ✗ Missing | 0% |
| Hierarchy Detection | ⚠ Hardcoded | 50% (5 hierarchies, removal planned) |
| Multi-Library Generation | ✓ Complete | 100% (9 namespaces via generate-bindings.sh) |
| Dependency Handling | ✓ Excellent | 100% |
| Array/List Support | ✓ Working | 85% (arrays done, GList/GSList partial) |
| Out/InOut Parameters | ✓ Working | 80% (out params done, inout partial) |
| Documentation | ✗ Missing | 0% |
| Test Coverage | ⚠ Good | 65% (unit + integration + C compilation tests) |

---

## Migration Path From Design Plan To Implementation

The original design plan outlined a comprehensive multi-phase implementation. The current implementation has achieved:

- **Phase 1 (Type System):** ✓ Complete - Polymorphic variants, hierarchy types, accessor methods all implemented
- **Phase 2 (Signals):** ⚠ Partial - Simple signal generation works, parameter/return value handling partially implemented via `signal_marshaller.ml`
- **Phase 3 (High-Level Classes):** ⚠ Partial - Skeleton/concrete classes generated, out/inout parameter support added, specializations still missing
- **Phase 4 (Factory Functions):** ✗ Not Started - Documented but not implemented
- **Phase 5 (Containers):** ✗ Not Started - No special handling
- **Phase 6 (Inheritance):** ⚠ Partial - 5 hierarchies hardcoded, not automatic
- **Phase 7 (Special Patterns):** ✗ Not Started - No widget-specific patterns

**Next priorities to achieve full coverage:**
1. Complete signal parameter and return value handling (close Phase 2)
2. Add factory function generation (complete Phase 4)
3. Generate container-specific methods (complete Phase 5)
4. Make hierarchy detection dynamic (complete Phase 6)
5. Add widget-specific patterns (complete Phase 7)
6. Add callback type support
7. Generate record field accessors

---

## References for Understanding Implementation

### Parser and Type System
- `parse/gir_parser.ml` (~1560 lines) - GIR XML parsing, extracts classes/interfaces/enums/records/signals/arrays
- `types.ml` - AST type definitions for GIR elements, `generation_context` with:
  - `cross_references : generation_context_namespace_cross_references StringMap.t` - Cross-namespace type data
  - `module_groups: (string, string) Hashtbl.t` - Maps class names to combined module names for cyclic groups
  - `current_cycle_classes: string list` - Tracks which classes are in the currently-generating cyclic module
- `type_mappings.ml` (~784 lines) - Type mappings, cross-namespace resolution, `classify_type`, `find_type_mapping_for_gir_type`, array detection
- `utils.ml` - String normalization, snake_case conversion, `library_wrapper_name`, `external_namespace_to_module_name`
- `class_utils.ml` - Qualified module name resolution for cyclic modules
- `dependency_analysis.ml` (~299 lines) - Tarjan's SCC algorithm for cyclic dependency resolution

### Override System
- `override_types.ml` / `override_types.mli` - Override AST type definitions
- `override_parser.ml` (~370 lines) - S-expression parser for `overrides/<ns>.sexp` files
- `override_apply.ml` (~290 lines) - Apply overrides to parsed GIR data (filter + version)
- `override_extractor.ml` (~30 lines) - Extract `Since X.Y` version annotations from GIR doc strings
- `version_guard.ml` - C version guard macro generation
- `os_filter.ml` - OS/platform filter type for conditional compilation

### Code Generators
- `generate/c_stubs.ml` (~161 lines) - C FFI orchestration, dependency extraction, re-exports
- `generate/c_stub_helpers.ml` (~622 lines) - Shared C generation utilities, version guard emission
- `generate/c_stub_method.ml` (~742 lines) - Method wrapper C code generation
- `generate/c_stub_method_out.ml` (~148 lines) - Out-parameter array and struct handling
- `generate/c_stub_property.ml` (~325 lines) - Property getter/setter GValue access
- `generate/c_stub_constructor.ml` (~297 lines) - Constructor C stub generation
- `generate/c_stub_enum.ml` (~62 lines) / `c_stub_bitfield.ml` (~96 lines) - Enum/bitfield C converters
- `generate/c_stub_record.ml` (~278 lines) - Boxed record converters, copy method detection
- `generate/c_stub_class.ml` (~96 lines) - Class type macros (`GtkWidget_val`, `Val_GtkWidget`)
- `generate/c_stub_array_conv.ml` (~461 lines) - Inline array conversion code generation
- `generate/c_stub_gvalue.ml` (~165 lines) - GValue access helper macros
- `generate/c_stub_type_analysis.ml` (~136 lines) - Property type introspection for GValue dispatch
- `c_stub_list_conv.ml` (~194 lines) - GList/GSList conversion code generation
- `generate/layer1/` (5 modules, ~480 lines) - Layer 1 OCaml interfaces: helpers, constructors, methods, properties, main orchestration
- `generate/ml_interface.ml` (~10 lines) - Thin re-export wrapper for layer1/
- `generate/class_gen*.ml` (8 modules, ~1880 lines) - Layer 2 high-level wrappers: body, method, property, type resolution, helpers, conflict detection, converter
- `generate/signal_gen.ml` (~353 lines) - Signal handler class generation
- `generate/signal_marshaller.ml` (~320 lines) - Signal parameter marshalling to/from `Gobject.Value`
- `generate/enum_code.ml` (~380 lines) - Enum/bitfield OCaml type definitions and C converters for all namespaces
- `generate/dune_file.ml` (~230 lines) - Build configuration generation with cross-namespace library dependencies
- `generate/library_module.ml` (~222 lines) - Combined library module (`Gtk.ml`) generation
- `generate/common.ml` - Shared types (`StringSet`, `module_names`) for class generation

### Filtering and Utilities
- `filtering.ml` (~281 lines) - Method/property filtering, unknown type detection, duplicate removal
- `exclude_list.ml` (~68 lines) - Platform-specific types, variadic functions, skip rules

### Entry Point
- `bin/gir_gen.ml` (~1929 lines) - CLI entry point, generation pipeline orchestration, reference file loading, binding generation

### Build Automation
- `scripts/generate-bindings.sh` - Two-phase generation: reference files then bindings for all 9 namespaces

### Example Generated Code (for reference patterns)
- `src/gtk/generated/button.ml/.mli` - Low-level FFI with polymorphic variant types
- `src/gtk/generated/gButton.ml/.mli` - High-level class wrapper
- `src/gtk/generated/gtk_enums.ml/.mli` - Enum/bitfield type examples
- `src/gtk/generated/application_and__window_and__window_group.ml/.mli` - Combined cyclic module
- `src/pangocairo/generated/font.ml` - Cross-namespace type example (`Ocgtk_cairo.Cairo.Wrappers.Scaled_font.t`)
- `src/gtk/generated/ocgtk_gtk.ml` - Library wrapper module (`module Gtk = Gtk; include Gtk; module GMain = GMain`)

### Runtime Dependencies
- `src/common/gObj.ml` - Base `widget_impl` class for high-level wrappers
- `src/common/gobject.ml` - GObject type system, signal connection infrastructure

### External References
- **GObject Introspection Spec**: https://gi.readthedocs.io/
- **GTK4 API Reference**: https://docs.gtk.org/gtk4/
- **GIR Format Annotations**: https://gi.readthedocs.io/en/latest/annotations/giannotations.html
- **lablgtk3 Reference** - Polymorphic variant type patterns for GTK3 bindings
- **Cross-Namespace Architecture**: `architecture/cross_namespace_types.md`
