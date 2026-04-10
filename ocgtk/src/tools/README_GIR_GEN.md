# GIR Code Generator (gir_gen)

GTK introspection-based code generator for ocgtk bindings.

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
| `types.ml` | AST for GIR elements (classes, methods, types) |
| `parse/gir_parser.ml` | XML parsing → AST |
| `type_mappings.ml` | Maps C types to OCaml types (`gint` → `int`, etc.) |
| `generate/c_stubs.ml` | C FFI code generation (Layer 0) |
| `generate/ml_interface.ml` | OCaml interface generation (Layer 1) |
| `generate/class_gen.ml` | High-level wrapper generation (Layer 2) |

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
# From ocgtk directory
dune build
```

The executable is built to `_build/default/src/tools/gir_gen/gir_gen.exe`

## Running

### Commands

gir_gen has three commands:

- **`generate`** - Generate C FFI bindings and OCaml modules from GIR files
- **`references`** - Generate cross-namespace reference list for type validation
- **`overrides`** - Extract `Since` version annotations from a GIR file into an override sexp file

### From the `ocgtk` directory

**Recommended approach - run from the `ocgtk` directory:**

```bash
# Generate GTK bindings to src/gtk/generated/
dune exec src/tools/gir_gen/gir_gen.exe -- generate /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
```

### From the repository root directory

If running from `/workspaces/ocgtk` (parent of `ocgtk`):

```bash
cd ocgtk
dune exec src/tools/gir_gen/gir_gen.exe -- generate /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
```

### Generate Command Options

- `GIR_FILE`: Path to GIR file (e.g. `/usr/share/gir-1.0/Gtk-4.0.gir`)
- `OUTPUT_DIR`: Where to write generated files
- `-f, --filter FILE`: Optional filter file specifying which classes to generate
- `-r, --reference FILE`: Optional reference file(s) for cross-namespace type validation (can be specified multiple times)
- `-o, --overrides FILE`: Optional override sexp file controlling which entities are ignored and their version guards (see [Override System](#override-system))

### References Command Options

- `GIR_FILE`: Path to GIR file
- `OUTPUT_FILE`: Where to write the reference sexp
- `-o, --overrides FILE`: Optional override sexp file; ignored entities are excluded from the reference output

### Overrides Command

Extracts `Since` version annotations from GIR documentation into a starter override file. The output should be committed to `overrides/<ns>.sexp` and then augmented with manually-authored `(ignore)` entries.

```bash
# Extract version annotations for GTK into the overrides directory
dune exec src/tools/gir_gen/gir_gen.exe -- overrides \
  /usr/share/gir-1.0/Gtk-4.0.gir overrides/gtk.sexp
```

### ⚠️ IMPORTANT: Output Directory Convention

**The output directory should be the PARENT of the `generated/` directory, NOT the `generated/` directory itself.**

The generator automatically creates a `generated/` subdirectory inside the output directory you specify.

✅ **Correct:**
```bash
dune exec gir_gen -- generate /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
```
This creates files in `src/gtk/generated/`

❌ **Wrong:**
```bash
dune exec gir_gen -- generate /usr/share/gir-1.0/Gtk-4.0.gir src/gtk/generated
```
This creates files in `src/gtk/generated/generated/` (nested directory problem)

**Examples:**
- For GTK: Use `src/gtk` → generates to `src/gtk/generated/`
- For GDK: Use `src/gdk` → generates to `src/gdk/generated/`
- For GIO: Use `src/gio` → generates to `src/gio/generated/`

## Testing

### Quick Test
```bash
# Generate test output
mkdir -p output/test
echo "Label" > output/test/filter.txt
dune exec src/tools/gir_gen/gir_gen.exe -- generate -f output/test/filter.txt \
  /usr/share/gir-1.0/Gtk-4.0.gir output/test

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
# Regenerate all GTK bindings and rebuild library (run from ocgtk directory)
dune exec src/tools/gir_gen/gir_gen.exe -- generate /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
dune build
```

### Generate Cross-Namespace References
```bash
# Generate reference list for type validation
dune exec src/tools/gir_gen/gir_gen.exe -- references \
  /usr/share/gir-1.0/Gtk-4.0.gir gtk_refs.txt

# Use references when generating bindings
dune exec src/tools/gir_gen/gir_gen.exe -- generate \
  -r gtk_refs.txt -r gdk_refs.txt \
  /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
```

### Generate with Override File

```bash
# Apply overrides while generating
dune exec src/tools/gir_gen/gir_gen.exe -- generate \
  -o overrides/gtk.sexp \
  -r gdk_refs.txt \
  /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
```

## Output Files

Generated files are written to `src/<ns>/generated/` (e.g., `src/gtk/generated/`):

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
exists per namespace (e.g. `overrides/gtk.sexp`, `overrides/gio.sexp`).

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

  ;; Ignore a bitfield or record
  (bitfield PrintCapabilities (ignore))
  (record PrintBackend (ignore))
)
```

Supported entity kinds: `class`, `interface`, `enumeration`, `bitfield`, `record`.
Supported sub-component directives: `method`, `constructor`, `property`, `signal`,
`member` (enum member), `flag` (bitfield flag).

Available actions:
- `(ignore)` — skip generation of this entity or sub-component entirely
- `(version "X.Y")` — emit a `#if NS_CHECK_VERSION(X, Y, 0)` guard around the C code

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
cd ocgtk
dune exec src/tools/gir_gen/gir_gen.exe -- overrides \
  /usr/share/gir-1.0/Gtk-4.0.gir overrides/gtk.sexp
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

**Error: "Program 'src/tools/gir_gen/gir_gen.exe' not found"**
- Ensure you're in the `ocgtk` directory
- Run `dune build` first

**Error: "Don't know how to build src/tools/gir_gen/gir_gen.exe"**
- Use `dune exec src/tools/gir_gen/gir_gen.exe` instead of `dune build src/tools/gir_gen/gir_gen.exe`

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

### Parsing (parse/gir_parser.ml - 1090 lines)
**Working:**
- Class extraction with parent/implements relationships, constructors, methods, properties, signals
- Interface extraction with methods, properties, c:symbol-prefix
- Enumeration and bitfield extraction with values and C identifiers
- Record extraction with boxed types, disguised/opaque flags, fields, methods
- Cross-namespace reference loading for all 9 namespaces via sexp reference files
- Documentation string extraction
- Constructor `throws` attribute detection

**Limitations:**
- Signals parsed only for parameterless void signatures; complex signal callbacks skipped
- Array/list type parameters not parsed
- Callback types not extracted
- Interface method implementations not tracked beyond interface names

### Type Mapping (type_mappings.ml - 544 lines)
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
- Modular lookup pipeline: `find_class_mapping`, `find_interface_mapping`, `find_record_mapping`, `find_enum_mapping`, `find_bitfield_mapping` chained via `or_else`

**Limitations:**
- No variadic argument support (filtered in `exclude_list.ml`)
- Limited callback type support
- No union type handling
- Out/InOut parameters filtered in class generation (see `filtering.ml`)

### Code Generation
**C Stubs (generate/c_stubs.ml - 943 lines):**
- Proper memory management with CAMLparam/CAMLlocal/CAMLreturn
- Type converter macros for enums, records, nullable types
- Property access via g_object_get_property/g_object_set_property with GValue
- Record allocation/deallocation with copy semantics
- Per-library `<ns>_decls.h` declaration headers with dependency includes

**OCaml Interfaces (generate/layer1/ - 546 lines across 5 modules):**
- Polymorphic variant types with inheritance chains
- External declarations matching C stubs
- Accessor methods for 5 hierarchies (Widget, EventController, CellRenderer, LayoutManager, Expression)
- Combined module generation for cyclic SCCs
- Handles nullable parameters/returns

**High-Level Classes (generate/class_gen*.ml - 952 lines across 8 modules):**
- Skeleton class generation with `GObj.widget_impl` inheritance
- Property methods (get_property, set_property patterns)
- Method wrappers with type coercion to parent types
- Concrete class instantiation
- Signal handler wiring via `connect` method
- Cross-namespace type resolution via `class_gen_type_resolution.ml`

**Signals (generate/signal_gen.ml - ~80 lines):**
- Signal classes with `Gobject.Signal.connect_simple` connections
- Only void signals with no parameters supported
- Widget type coercion for signal attachment

**Enums (generate/enum_code.ml - 250+ lines):**
- Type definitions for all enums and bitfields
- C converter functions using `caml_hash_variant`
- Namespace prefix handling (Gtk, Gdk, Pango, etc.)
- Digit-prefixed variant name sanitization

### Dependency Handling (dependency_analysis.ml - 225+ lines)
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

## Major Deficiencies and Missing Features

### 1. Signal Handling - Severely Limited
**Issue:** Only parameterless void signals are generated (see `generate/signal_gen.ml`).

**Missing:**
- Signals with parameters (e.g., `key-press-event` with GdkEvent parameter)
- Signals with return values (e.g., `delete-event` returning bool to prevent window close)
- Callback wrapper generation for complex signal signatures
- Event marshalling for GdkEvent, GdkModifierType, etc.

**Impact:** Most GTK4 signals unusable through generated bindings. Users must write manual signal wrappers.

### 2. Factory Functions - Not Implemented
**Issue:** No factory function generation despite documentation in README (formerly lines 162-174, 309-351, 536-550).

**Missing:**
- Optional parameter handling for common properties
- Constructor selection logic (new_with_label, new_with_mnemonic, etc.)
- Property initialization after construction
- Packing and show parameter support
- Customization file system (button.json, window.json, etc.)

**Impact:** Widget creation requires verbose manual constructor calls and separate property setting. Less ergonomic than lablgtk3.

### 3. Container-Specific Methods - Not Generated
**Issue:** No special handling for container widgets (see README formerly lines 353-384).

**Missing:**
- Box-like containers: `append`, `prepend`, `insert_child_after` wrappers
- Single-child containers: `set_child`, `get_child` methods
- Window/Dialog lifecycle: `destroy`, `present`, `close`, `run` patterns
- TreeView/ListView: model and selection management
- Child widget type coercion helpers

**Impact:** Container operations require direct low-level FFI calls. No type-safe child management.

### 4. Range and Adjustment Helpers - Not Generated
**Issue:** No specialized methods for Range-derived widgets (Scale, Scrollbar, LevelBar).

**Missing:**
- `value`/`set_value` property methods
- `adjustment` accessor returning wrapped GData.adjustment object
- Signal handling for `value-changed`
- Increment/step configuration helpers

**Impact:** Slider/progress widgets lack convenient OCaml-style access patterns.

### 5. Out/InOut Parameters - Actively Filtered
**Issue:** Methods with output parameters are skipped entirely (see `filtering.ml` and `class_gen.ml`).

**Missing:**
- Methods returning multiple values via out parameters
- Wrapper generation converting out params to OCaml tuples
- InOut parameter handling with mutable refs or tuples

**Impact:** Significant API coverage gap. Many useful GTK4 methods unavailable (e.g., geometry queries, range queries).

### 6. Array and List Types - Not Supported
**Issue:** No support for GList, GSList, GPtrArray, or C array parameters/returns.

**Missing:**
- List type conversion to OCaml lists
- Array marshalling with length parameters
- NULL-terminated array handling
- Transfer-ownership handling for array elements

**Impact:** Methods accepting/returning collections are filtered. Significant API coverage loss.

### 7. Callback Parameters - Not Supported
**Issue:** No callback type generation or marshalling (distinct from signal callbacks).

**Missing:**
- Callback type definitions from GIR
- C callback stub generation for OCaml function values
- Closure data handling with GDestroyNotify
- Async callback patterns (e.g., gio_async callbacks)

**Impact:** Async APIs, custom sorting/filtering callbacks, iteration callbacks all unavailable.

### 8. Record Field Accessors - Not Generated
**Issue:** Records parsed but no field getter/setter generation.

**Missing:**
- Field accessor methods for record structs
- Nested record access
- Field documentation from GIR

**Impact:** Users cannot access struct fields without writing manual C stubs.

### 9. Layer 1 Accessor Methods Not Generated
**Issue:** `as_widget : t -> Widget.t` and similar parent chain accessor
methods are not generated in Layer 1 modules. The former hierarchy detection
system was supposed to generate these but was dead code (removed 2026-03-23).

**Impact:** Layer 2 `inherit` provides parent method access, but there's no
direct L1 function to upcast a type to its ancestor's type. Could be
implemented by walking the parent chain.

### 10. Type Coverage - Mostly Resolved via Cross-Namespace References
**Issue:** ~150 hardcoded type mappings in `type_mappings.ml` for primitive/GLib types.

**Status:** Cross-namespace classes, interfaces, records, enums, and bitfields are now automatically resolved via the reference file system (`cross_references`). The hardcoded mappings are only needed for GLib primitives (`gint`, `gboolean`, `gchar*`, etc.) and special types. Adding new GIR namespaces with classes/records/enums/bitfields requires no changes to `type_mappings.ml`.

**Remaining gap:** Callback types, union types, and some GLib collection types still have no mapping.

### 11. Property Observer Generation - Not Implemented
**Issue:** No property change notification wrappers (marked TODO in `test_gir_gen.ml`).

**Missing:**
- `notify::property-name` signal connection helpers
- Property binding helpers
- Two-way property synchronization

**Impact:** Property change monitoring requires manual signal connection.

### 12. Builder/Glade Integration - Not Implemented
**Issue:** No GTK Builder XML support (marked TODO in README formerly lines 667-673).

**Missing:**
- Widget lookup from builder XML
- Signal autoconnection
- Template class support
- Glade file loading helpers

**Impact:** Cannot use GTK Builder UI files effectively.

### 13. Documentation Generation - Not Implemented
**Issue:** GIR documentation strings parsed but not emitted in generated code.

**Missing:**
- OCamldoc comment generation from GIR docs
- Parameter documentation
- Example code from GIR annotations
- Deprecation warnings

**Impact:** Generated code has no inline documentation. Developers must reference GTK docs separately.

### 14. Test Coverage - Minimal Integration Testing
**Issue:** `test_gir_gen.ml` has unit tests but no real compilation/runtime tests.

**Missing:**
- Generated code compilation verification
- Runtime functionality tests with actual GTK4 library
- Type safety regression tests
- Performance benchmarks
- Example program generation

**Impact:** Bugs in generated code may not be caught until user code compilation.

---

## Known Bugs and Quirks

### Parser Issues (parse/gir_parser.ml)
1. Element data extraction uses recursive string concatenation (performance issue for large docs)
2. Namespace attribute handling has multiple fallback paths, can be fragile
3. Record parsing returns None on exclude (silent skip, no logging)
4. Signal parameter parsing assumes single return-value + parameters structure

### Generator Issues
1. Hierarchy root check uses lowercase string comparison (fragile)
2. Parent chain building has arbitrary 100-iteration limit
3. Filtered modules still tracked in generated_modules list (memory overhead)
4. Combined files generated even for single-element SCCs
5. Property getter/setter GValue macros have platform-specific issues (commented in `c_stubs.ml`)
6. Virtual method de-duplication logic may incorrectly skip inherited methods

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

**Overall: ~70% Complete**

| Feature | Status | Completeness |
|---------|--------|--------------|
| GIR Parsing | ✓ Working | 85% (missing array/callback types) |
| C FFI Generation | ✓ Working | 90% (missing out params, arrays) |
| Low-Level OCaml Bindings | ✓ Working | 85% (missing some type conversions) |
| High-Level Class Wrappers | ⚠ Basic | 60% (no specializations) |
| Signal Handling | ⚠ Minimal | 30% (parameterless only) |
| Enum/Bitfield Support | ✓ Complete | 95% (same + cross-namespace) |
| Cross-Namespace Types | ✓ Working | 90% (classes, records, enums, bitfields) |
| Factory Functions | ✗ Missing | 0% |
| Container Helpers | ✗ Missing | 0% |
| Hierarchy Detection | ⚠ Hardcoded | 50% (5 hierarchies, removal planned) |
| Multi-Library Generation | ✓ Complete | 100% (9 namespaces via generate-bindings.sh) |
| Dependency Handling | ✓ Excellent | 100% |
| Documentation | ✗ Missing | 0% |
| Test Coverage | ⚠ Basic | 40% (unit tests only) |

---

## Migration Path From Design Plan to Implementation

The original design plan (formerly lines 74-676 of this document) outlined a comprehensive multi-phase implementation. The current implementation has achieved:

- **Phase 1 (Type System):** ✓ Complete - Polymorphic variants, hierarchy types, accessor methods all implemented
- **Phase 2 (Signals):** ⚠ Partial - Simple signal generation works, parameter/return value handling not implemented
- **Phase 3 (High-Level Classes):** ⚠ Partial - Skeleton/concrete classes generated, specializations missing
- **Phase 4 (Factory Functions):** ✗ Not Started - Documented but not implemented
- **Phase 5 (Containers):** ✗ Not Started - No special handling
- **Phase 6 (Inheritance):** ⚠ Partial - 5 hierarchies hardcoded, not automatic
- **Phase 7 (Special Patterns):** ✗ Not Started - No widget-specific patterns

**Next priorities to achieve full coverage:**
1. Implement signal parameter and return value handling (close Phase 2)
2. Add factory function generation (complete Phase 4)
3. Implement out/inout parameter wrapping (expand Phase 3)
4. Add array/list type support (expand parsing and type mapping)
5. Generate container-specific methods (complete Phase 5)
6. Make hierarchy detection dynamic (complete Phase 6)
7. Add widget-specific patterns (complete Phase 7)

---

## References for Understanding Implementation

### Parser and Type System
- `parse/gir_parser.ml` - GIR XML parsing, extracts classes/interfaces/enums/records/signals
- `types.ml` - AST type definitions for GIR elements, `generation_context` with:
  - `cross_references : generation_context_namespace_cross_references StringMap.t` - Cross-namespace type data
  - `module_groups: (string, string) Hashtbl.t` - Maps class names to combined module names for cyclic groups
  - `current_cycle_classes: string list` - Tracks which classes are in the currently-generating cyclic module
- `type_mappings.ml` (544 lines) - Type mappings, cross-namespace resolution, `classify_type`, `find_type_mapping_for_gir_type`
- `utils.ml` - String normalization, snake_case conversion, `library_wrapper_name`, `external_namespace_to_module_name`
- `hierarchy_detection.ml` (108 lines) - 5 hardcoded widget hierarchies (removal planned)
- `dependency_analysis.ml` (225+ lines) - Tarjan's SCC algorithm for cyclic dependency resolution

### Code Generators
- `generate/c_stubs.ml` - C FFI stubs, type converters, property GValue access, `<ns>_decls.h` headers
- `generate/layer1/` (5 modules, 546 lines) - Layer 1 OCaml interfaces: helpers, constructors, methods, properties, main orchestration
- `generate/ml_interface.ml` (10 lines) - Thin re-export wrapper for layer1/
- `generate/class_gen*.ml` (8 modules, 952 lines) - Layer 2 high-level wrappers: body, method, property, type resolution, helpers, conflict detection, converter
- `generate/signal_gen.ml` - Signal handler classes (parameterless void signals only)
- `generate/enum_code.ml` - Enum/bitfield types and C converters for all namespaces
- `generate/dune_file.ml` - Build configuration generation with cross-namespace library dependencies

### Filtering and Utilities
- `filtering.ml` - Method/property filtering, unknown type detection, duplicate removal (no cross-namespace filtering)
- `exclude_list.ml` - Platform-specific types, variadic functions, skip rules

### Entry Point
- `gir_gen.ml` (1164 lines) - CLI entry point, generation pipeline orchestration, reference file loading, binding generation

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
- **Cross-Namespace Plan**: `architecture/todo/CROSS_NAMESPACE_PLAN.md`
