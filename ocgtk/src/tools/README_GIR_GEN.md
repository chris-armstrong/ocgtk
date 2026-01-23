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

### From the `ocgtk` directory

**Recommended approach - run from the `ocgtk` directory:**

```bash
# Generate GTK bindings to src/gtk/generated/
dune exec src/tools/gir_gen/gir_gen.exe -- /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
```

### From the repository root directory

If running from `/workspaces/ocgtk` (parent of `ocgtk`):

```bash
cd ocgtk
dune exec src/tools/gir_gen/gir_gen.exe -- /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
```

### Options

- `GIR_FILE`: Path to GTK GIR file (usually `/usr/share/gir-1.0/Gtk-4.0.gir`)
- `OUTPUT_DIR`: Where to write generated files

### ⚠️ IMPORTANT: Output Directory Convention

**The output directory should be the PARENT of the `generated/` directory, NOT the `generated/` directory itself.**

The generator automatically creates a `generated/` subdirectory inside the output directory you specify.

✅ **Correct:**
```bash
dune exec gir_gen -- /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
```
This creates files in `src/gtk/generated/`

❌ **Wrong:**
```bash
dune exec gir_gen -- /usr/share/gir-1.0/Gtk-4.0.gir src/gtk/generated
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
dune exec src/tools/gir_gen/gir_gen.exe -- -f output/test/filter.txt \
  /usr/share/gir-1.0/Gtk-4.0.gir output/test

# Verify files generated
ls output/test/label.mli output/test/ml_event_controllers_gen.c
```

### Verify C Compilation
```bash
# Check generated C compiles (headers only)
gcc -c output/test/ml_event_controllers_gen.c \
  -I$(ocamlc -where) $(pkg-config --cflags gtk4) \
  -fsyntax-only
```

### Full Rebuild
```bash
# Regenerate all GTK bindings and rebuild library (run from ocgtk directory)
dune exec src/tools/gir_gen/gir_gen.exe -- /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
dune build
```

## Output Files

Generated files are written to `src/gtk/generated/`:

- **C FFI stubs**: `ml_*_gen.c` - C bindings for classes, interfaces, enums
- **Layer 1 (low-level)**: `<class_name>.ml/.mli` - External declarations (snake_case)
- **Layer 2 (high-level)**: `g<Class>.ml/.mli` - OCaml wrapper classes (PascalCase)
- **Enums**: `gtk_enums.ml/.mli`, `gdk_enums.ml/.mli`, etc. - Enumeration types
- **Library module**: `Gtk.ml/.mli` - Top-level module with all exports

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
- Forward declarations header for cross-module references
- Proper CAMLparam/CAMLreturn macros throughout

### Layer 2: Low-Level OCaml Interfaces (`<class_name>.ml/.mli`)
- Polymorphic variant type definitions: `type t = [`widget | ...] Gobject.obj` (see `generate/ml_interface.ml`)
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
- External namespace loading for Gdk-4.0, Pango-1.0, GdkPixbuf-2.0, Gsk-4.0, Graphene-1.0
- Documentation string extraction
- Constructor `throws` attribute detection

**Limitations:**
- Signals parsed only for parameterless void signatures; complex signal callbacks skipped
- Array/list type parameters not parsed
- Callback types not extracted
- Interface method implementations not tracked beyond interface names

### Type Mapping (type_mappings.ml - 500+ lines)
**Working:**
- ~150 hardcoded GTK/GLib type mappings to OCaml types
- Nullable type handling with `option` wrapper
- Polymorphic variants for enums via hash table lookup
- Boxed record converters (`Val_*` / `*_val` macros)
- Widget type mappings (`GtkWidget*` → `Widget.t`)
- EventController, CellRenderer, LayoutManager, Expression hierarchies
- Pango, Gdk, and GdkPixbuf type support
- GdkEvent special handling
- Context-aware cyclic module type resolution:
  - Detects when generating within a cyclic module via `current_cycle_classes`
  - Uses unqualified names for same-cycle references
  - Uses fully qualified names for cross-module references
  - Applies to classes, interfaces, and records

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
- Forward declarations for cross-module dependencies

**OCaml Interfaces (generate/ml_interface.ml - 434 lines):**
- Polymorphic variant types with inheritance chains
- External declarations matching C stubs
- Accessor methods for 5 hierarchies (Widget, EventController, CellRenderer, LayoutManager, Expression)
- Combined module generation for cyclic SCCs
- Handles nullable parameters/returns

**High-Level Classes (generate/class_gen.ml - 600+ lines):**
- Skeleton class generation with `GObj.widget_impl` inheritance
- Property methods (get_property, set_property patterns)
- Method wrappers with type coercion to parent types
- Concrete class instantiation
- Signal handler wiring via `connect` method

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
- Combined module generation for mutual recursion
- Topological ordering for compilation
- Smart type resolution for cyclic modules:
  - Within same cycle: uses simple submodule names (e.g., `Window.t`)
  - Cross-cycle references: uses full qualified names (e.g., `Application_and__window_and__window_group.Window.t`)
- Module name mapping table (`module_groups`) tracks which classes belong to which combined modules
- Proper handling of snake_case → capitalization for OCaml module name mapping

### Hierarchy Support (hierarchy_detection.ml - 108 lines)
**Working:**
- Parent chain traversal with depth limit (100 iterations)
- Accessor method generation (`as_widget`, etc.)

### Filtering and Exclusions (filtering.ml - 150+ lines, exclude_list.ml - 85 lines)
**Working:**
- Platform-specific type filtering (PrintJob, etc.)
- Variadic function detection and filtering
- Unknown type detection with skip logic
- Duplicate property detection between class and interfaces
- Virtual method de-duplication

**What Gets Filtered:**
- Methods with Out/InOut parameters (see `class_gen.ml` filtering)
- Methods with unknown types in parameters/returns
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

### 9. Dynamic Hierarchy Detection - Hardcoded Only
**Issue:** 5 hierarchies hardcoded in `hierarchy_detection.ml`; no automatic discovery.

**Missing:**
- Automatic hierarchy classification from GIR parent chains
- Root detection algorithm
- Accessor method generation for arbitrary hierarchies
- Multiple inheritance path handling

**Impact:** New widget hierarchies require manual code changes to gir_gen.

### 10. Type Coverage - Static Mapping List
**Issue:** ~150 hardcoded type mappings in `type_mappings.ml`; no auto-discovery.

**Missing:**
- Automatic type mapping generation from GIR type system
- Gdk/Pango/GdkPixbuf type auto-mapping beyond enums
- Custom type registration mechanism
- Type alias resolution

**Impact:** Adding new types requires manual editing of `type_mappings.ml`. Scaling challenge for full GTK4 coverage.

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
| Enum/Bitfield Support | ✓ Complete | 95% |
| Factory Functions | ✗ Missing | 0% |
| Container Helpers | ✗ Missing | 0% |
| Hierarchy Detection | ⚠ Hardcoded | 50% (5 hierarchies only) |
| Type Coverage | ⚠ Partial | 60% (~150 types) |
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
- `parse/gir_parser.ml` (1090 lines) - GIR XML parsing, extracts classes/interfaces/enums/records/signals
- `types.ml` (204 lines) - AST type definitions for GIR elements, generation_context with:
  - `module_groups: (string, string) Hashtbl.t` - Maps class names to combined module names for cyclic groups
  - `current_cycle_classes: string list` - Tracks which classes are in the currently-generating cyclic module
- `type_mappings.ml` (500+ lines) - GTK/GLib to OCaml type mappings, nullable handling, record/class lookups, context-aware cyclic module resolution
- `hierarchy_detection.ml` (108 lines) - 5 hardcoded widget hierarchies, parent chain traversal
- `dependency_analysis.ml` (225+ lines) - Tarjan's SCC algorithm for cyclic dependency resolution, module group management:
  - `create_module_groups_table()` - Builds class-to-module mapping
  - `module_name_of_group()` - Generates proper snake_case-then-capitalized module names
  - `create_module_name_for_cycle()` - Combines multiple class names with `_and_` separator

### Code Generators
- `generate/c_stubs.ml` (943 lines) - C FFI stubs, type converters, property GValue access, memory management
- `generate/ml_interface.ml` (434 lines) - OCaml types, external declarations, accessor methods, combined modules
- `generate/class_gen.ml` (600+ lines) - Skeleton/concrete classes, property/method wrappers, inheritance
- `generate/signal_gen.ml` (~80 lines) - Signal handler classes (parameterless void signals only)
- `generate/enum_code.ml` (250+ lines) - Enum/bitfield types and C converters for 5 namespaces
- `generate/dune_file.ml` (~43 lines) - Build configuration generation

### Filtering and Utilities
- `filtering.ml` (150+ lines) - Method/property filtering, unknown type detection, duplicate removal
- `exclude_list.ml` (85 lines) - Platform-specific types, variadic functions, skip rules
- `utils.ml` - String normalization, snake_case conversion, module naming

### Entry Point and Testing
- `main.ml` (628 lines) - Generation pipeline orchestration, external namespace loading
- `test/test_gir_gen.ml` (~200+ lines) - Unit tests for parsing and generation

### Example Generated Code (for reference patterns)
- `ocgtk/src/button.ml/.mli` - Low-level FFI example with polymorphic variant types
- `ocgtk/src/gButton.ml/.mli` - High-level class wrapper example (if manually created)
- `ocgtk/src/gtk_enums.ml/.mli` - Enum/bitfield type examples
- `ocgtk/src/application_and__window_and__window_group.ml/.mli` - Combined cyclic module example showing:
  - `module rec Application : sig ... end and Window : sig ... end and Window_group : sig ... end` structure
  - Internal references using simple names (e.g., `Window.t`)
  - External files using fully qualified names (e.g., `Application_and__window_and__window_group.Window.t`)

### Runtime Dependencies
- `ocgtk/src/gObj.ml` - Base `widget_impl` class for high-level wrappers
- `ocgtk/src/gobject.ml` - GObject type system, signal connection infrastructure
- `ocgtk/src/widget.ml/.mli` - Core Widget module

- **GObject Introspection Spec**: https://gi.readthedocs.io/
- **GTK4 API Reference**: https://docs.gtk.org/gtk4/
- **GIR Format Annotations**: https://gi.readthedocs.io/en/latest/annotations/giannotations.html
- **lablgtk3 Reference** - Polymorphic variant type patterns for GTK3 bindings
