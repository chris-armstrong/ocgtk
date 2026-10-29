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
    │   ml_*_gen.c          raw/generated/       generated/widget.ml
    │   C FFI stubs         widget.mli            High-level wrappers
    │                       Low-level bindings
```

### Key Files

| File | Purpose |
|------|---------|
| `types.ml` | AST for GIR elements (classes, methods, types, enums, records, signals) |
| `parse/gir_parser.ml` | XML parsing → AST |
| `type_mappings.ml` | Maps C types to OCaml types (`gint` → `int`, etc.) + cross-namespace resolution |
| `override_types.ml` / `override_parser.ml` / `override_apply.ml` | Override sexp parsing and application |
| `dependency_analysis.ml` | Tarjan SCC for cyclic dependency resolution |
| `module_paths.ml` | Package, library and module names; module paths by target library (raw or main) |
| `generate/c_stubs.ml` | C FFI code orchestration (Layer 0) |
| `generate/c_stub_method.ml` | C method stub generation |
| `generate/c_stub_property.ml` | C property getter/setter generation |
| `generate/c_stub_array_conv.ml` | Array conversion code generation |
| `generate/layer1/layer1_main.ml` | OCaml interface generation (Layer 1) |
| `generate/class_gen.ml` | High-level wrapper orchestration (Layer 2) |
| `generate/signal_gen.ml` / `signal_marshaller.ml` | Signal handler generation |
| `generate/enum_code.ml` | Enum/bitfield type and converter generation |
| `generate/constant_code.ml` | GIR `<constant>` → pure-OCaml `let` bindings (`constants.ml/.mli` in the main library) |
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
# Generate GTK bindings into the ocgtk package directory
dune exec gir_gen -- generate gir/Gtk-4.0.gir ocgtk
```

### Generate Command Options

- `GIR_FILE`: Path to GIR file (e.g. `gir/Gtk-4.0.gir`)
- `OUTPUT_DIR`: The namespace's package directory (relative to repo root, e.g. `ocgtk`, `ocgio`); it must exist
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
# Extract version annotations for GTK into the overrides directory (from repo root)
dune exec gir_gen -- overrides \
  gir/Gtk-4.0.gir overrides/gtk.sexp
```

### ⚠️ IMPORTANT: Output Directory Convention

**The output directory is the namespace's package directory** (`ocgio`,
`ocgtk`, ...), not a `generated/` directory. The generator writes the three
libraries of the package under it:

```
<pkg>/raw/generated/    library oc<ns>.raw: layer 1, C stubs, <ns>_decls.h, dune.inc
<pkg>/enums/generated/  library oc<ns>.enums: oc<ns>_enums.ml/.mli, dune
<pkg>/generated/        library oc<ns>: layer 2, raw.ml, enums.ml, constants.ml/.mli, dune
```

`<pkg>/raw/core/` holds hand-written C and layer 1 OCaml, and `<pkg>/raw/dune`
declares the raw library and includes `generated/dune.inc`; the generator
reads the former and writes neither. `<pkg>/core/`, when present, holds
hand-written modules of the main library (Gtk's `Main` and `Version`): the
generated `<pkg>/generated/dune` copies them in with `copy_files#`, so they
are `Ocgtk.Main`, not `Ocgtk.Raw.Main`.

The three generated directories hold generated files only: after writing, the
generator deletes every file in them that the run did not write, so renamed or
newly ignored types leave nothing behind.

✅ **Correct (from repo root):**
```bash
dune exec gir_gen -- generate gir/Gtk-4.0.gir ocgtk
```
This creates files in `ocgtk/generated/`, `ocgtk/raw/generated/` and `ocgtk/enums/generated/`.

❌ **Wrong:**
```bash
dune exec gir_gen -- generate gir/Gtk-4.0.gir ocgtk/generated
```
This creates `ocgtk/generated/generated/`, `ocgtk/generated/raw/generated/`, ...

## Testing

### Quick Test
```bash
# Generate test output (from repo root)
mkdir -p output/test
echo "Label" > output/test/filter.txt
dune exec gir_gen -- generate -f output/test/filter.txt \
  gir/Gtk-4.0.gir output/test

# Verify files generated
ls output/test/raw/generated/label.mli output/test/raw/generated/ml_label_gen.c
```

### Verify C Compilation
```bash
# Check generated C compiles (headers only)
gcc -c output/test/raw/generated/ml_label_gen.c \
  -I$(ocamlc -where) $(pkg-config --cflags gtk4) \
  -fsyntax-only
```

### Full Rebuild
```bash
# Regenerate all bindings and rebuild (from repo root)
bash scripts/generate-bindings.sh
dune build
```

### Generate Cross-Namespace References
```bash
# Generate reference list for type validation (from repo root). Pass the
# reference files of the namespace's dependencies with -r, as for generate:
# the list holds only what generate emits, which depends on them.
dune exec gir_gen -- references \
  -r cairo-references.sexp -r pango-references.sexp ... \
  gir/Gdk-4.0.gir gdk-references.sexp

# Use references when generating bindings
dune exec gir_gen -- generate \
  -r gdk-references.sexp \
  gir/Gtk-4.0.gir ocgtk
```

A reference file lists the namespace's classes, interfaces, records, enums
and constants. A member of a cycle needs no special handling: it has its own
layer 1 module (see Output Files), so other namespaces write `Ocgio_raw.File.t`.

### Generate with Override File

```bash
# Apply overrides while generating (from repo root)
dune exec gir_gen -- generate \
  -o overrides/gtk.sexp \
  -r gdk-references.sexp \
  gir/Gtk-4.0.gir ocgtk
```

## Output Files

For namespace `<Ns>` with package directory `<pkg>` (`oc` + the lowercased
namespace, e.g. `ocgdkpixbuf` for GdkPixbuf):

| File | Directory | Library | Contents |
|---|---|---|---|
| `ml_*_gen.c` | `raw/generated/` | `oc<ns>.raw` (via the stubs library) | C bindings for classes, interfaces, records, enums |
| `<class_name>.ml/.mli` | `raw/generated/` | `oc<ns>.raw` | Layer 1: abstract `t` and external declarations |
| `<a>_and__<b>.ml/.mli`, `<a>_cycle_<hash>.ml/.mli` | `raw/generated/` | `oc<ns>.raw` | Layer 1 combined module for a cycle of classes (see dependency resolution below) |
| `<member>.ml/.mli` | `raw/generated/` | `oc<ns>.raw` | Shim for each member of a cycle: `include App_info_cycle_<hash>.File`, with a signature keeping the types equal, so the member is `Ocgio_raw.File` |
| `<ns>_decls.h` | `raw/generated/` | `oc<ns>.raw` (installed) | C type converter declarations; includes dependency namespaces' headers |
| `dune.inc` | `raw/generated/` | | pkg-config rule, header copies, C stubs library `oc<ns>_raw_stubs` (in batches when large) |
| `oc<ns>_enums.ml/.mli`, `dune` | `enums/generated/` | `oc<ns>.enums` | Enumeration and bitfield types (written even when empty) |
| `<class_name>.ml/.mli` | `generated/` | `oc<ns>` | Layer 2: OCaml wrapper classes, one module per class (no prefix); members of a cycle have a combined module plus one shim each |
| `raw.ml` | `generated/` | `oc<ns>` | `module Point = Ocgraphene_raw.Point`, one alias per class (a cycle member by its shim) and per `raw/core` module |
| `enums.ml` | `generated/` | `oc<ns>` | `include Oc<ns>_enums` |
| `constants.ml/.mli` | `generated/` | `oc<ns>` | Pure-OCaml `let` bindings for GIR `<constant>` elements (omitted when the namespace has none, e.g. Cairo/Gsk/PangoCairo) |
| `dune` | `generated/` | `oc<ns>` | The main library: depends on its raw and enums libraries and other namespaces' main libraries, opens `Ocglib` |

The main library's main module is generated by dune, so users write
`Ocgtk.Button`, `Ocgtk.Raw.Button`, `Ocgtk.Enums.orientation` and
`Ocgtk.Constants`.

Module paths in generated code depend on the library the code belongs to
(see `module_paths.ml`):

| Reference | Layer 1 (raw library) | Layer 2 (main library) |
|---|---|---|
| Same-namespace class | `Point.t`, `Box_and__sphere.Box.t` | `Raw.Point.t`, `Raw.Box.t` |
| Same-namespace layer 2 class | | `Point.point_t` |
| Other namespace's class | `Ocgio_raw.Icon.t`, `Ocgio_raw.File.t` (cycle member) | `Ocgio.Raw.Icon.t`, layer 2 `Ocgio.Icon.icon_t` |
| Same-namespace enum | `Ocgtk_enums.orientation` | `Enums.orientation` |
| Other namespace's enum | `Ocgdk_enums.modifiertype` | `Ocgdk.Enums.modifiertype` |
| Constants | | `Constants.x`, `Ocgdk.Constants.x` |

## Override System

See [architecture/gir_gen/overrides.md](../architecture/gir_gen/overrides.md) for the full override format reference, architecture, and workflow.

## Constructor Wrapper Generation

Each layer 2 module generated by `class_gen.ml` exports
constructor wrapper functions in addition to the class definition:

```ocaml
(* Example from ocgtk/generated/button.ml *)
let new_ () : button_t =
  new button (Raw.Button.new_ ())

let new_with_label (label : string) : button_t =
  new button (Raw.Button.new_with_label label)

let new_from_icon_name (icon_name : string) : button_t =
  new button (Raw.Button.new_from_icon_name icon_name)
```

These constructors wrap the low-level FFI constructors from the Layer 1 module
with the high-level class wrapper. They are used to support the ergonomic API:

```ocaml
let btn = Ocgtk.Button.new_with_label "Click"
```

instead of the more verbose:

```ocaml
let btn = new Ocgtk.Button.button (Ocgtk.Raw.Button.new_with_label "Click")
```

When classes with different constructor names are used (e.g., `Button` has
`new_`, `new_with_label`, etc.), each is wrapped individually in the layer 2 module.

## Cyclic Dependency Resolution and Shim Modules

Classes with cyclic dependencies are detected using Tarjan's strongly connected
components (SCC) algorithm and combined into single modules. For example:

- `Application`, `Window`, and `WindowGroup` form a cycle (each references others)
- Generator creates `application_and__window_and__window_group.ml` combining all three
- Within this module, each class gets a submodule: `Application`, `Window`, `WindowGroup`
- Type references within the cycle use simple names: `Window.t`
- Type references across cycles use qualified names: `Application_and__window_and__window_group.Window.t`
- At layer 2, code outside the group refers to a member through the member's own
  module (`Window.window_t`); only the group's combined module and member modules,
  generated with `current_cycle_classes` set, use the combined name

This approach allows OCaml's type checker to validate recursive types while the
linker still treats it as a single compilation unit.

## Common Issues

**Error: "Program 'gir_gen' not found"**
- Ensure you're in the repository root (not the `ocgtk/` subdirectory)
- Run `dune build` first

**Error: "Don't know how to build gir_gen"**
- Use `dune exec gir_gen --` from the repository root (where the dune-workspace file lives)
- Do not use `dune exec gir_gen/bin/gir_gen.exe` — use `dune exec gir_gen --` from the repository root

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

### Layer 3: High-Level Wrapper Classes (`generated/<class_name>.ml/.mli`)
- Skeleton classes (`<widget>_skel`) inheriting from `GObj.widget_impl` or parent skeleton (see `generate/class_gen.ml`)
- Concrete widget classes with method syntax for properties and methods
- Property wrapper methods with automatic type coercion
- Method wrappers delegating to low-level FFI bindings
- Constructor wrappers as module-level `let` functions (e.g., `let new_with_label ...`), wrapping Layer 1 constructors with the high-level class

### Layer 4: Signal Handling

See [architecture/closures_and_signals.md](../architecture/closures_and_signals.md) for
the full signal architecture, marshalling, and generation details.

### Layer 5: Enum and Bitfield Types
- Complete enum type definitions for Gtk4 and external namespaces (Gdk, Pango, GdkPixbuf, Gsk, Graphene)
- Polymorphic variant representations with C converters
- Handles namespaced enums and digit-prefixed variant names (see `generate/enum_code.ml`)

### Constants
- GIR `<constant>` elements become pure-OCaml `let` bindings in the main library's `constants.ml/.mli` (no C FFI stubs)
- snake_case names (e.g. `ACCESSIBLE_ATTRIBUTE_BACKGROUND` → `accessible_attribute_background`)
- Type mapping from the constant's `<type name=.../>`: `gint`/`guint`/`Glyph`/`PangoGlyph` → `int`, `gdouble`/`gfloat` → `float`, `utf8` → `string`, `gboolean` → `bool`; constants with unmappable types are skipped with a warning
- OCamldoc from the GIR `<doc>`, with `@since X.Y` appended from the native `version` XML attribute
- Reached as `Constants` within the namespace and `Oc<ns>.Constants` from outside; no constants module is emitted for namespaces with no constants
- Emitted in the `references` command as `cr_type = Crt_Constant` (see [cross-namespace references](#generate-cross-namespace-references))
- No override workflow: pure-OCaml constants cannot use C `#if` OS guards, and the version is already available from the native XML attribute, so the `overrides` command's `Since`-extraction is not used for constants

### Build Integration
- Automatic generation of `raw/generated/dune.inc` (C stubs libraries, header copies) and the enums and main libraries' `dune` files (see `generate/dune_file.ml`)

---

## Current Capabilities

### Parsing (parse/gir_parser.ml - ~1560 lines)
**Working:**
- Class extraction with parent/implements relationships, constructors, methods, properties, signals
- Interface extraction with methods, properties, c:symbol-prefix
- Enumeration and bitfield extraction with values and C identifiers
- Record extraction with boxed types, disguised/opaque flags, fields, methods
- Constant extraction (`<constant>`) with name, c:type, value, value type, doc, and native version attribute
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
- `Glyph`/`PangoGlyph` (Pango's `guint32` alias) mapped to `int`, enabling Pango glyph methods and constant support
- Nullable type handling with `option` wrapper
- Polymorphic variants for enums via hash table lookup
- Boxed record converters (`Val_*` / `*_val` macros)
- Widget type mappings (`GtkWidget*` → `Widget.t`)
- EventController, CellRenderer, LayoutManager, Expression hierarchies
- Cross-namespace type resolution via reference files — see [architecture/cross_namespace_types.md](../architecture/cross_namespace_types.md)
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

### Filtering and Exclusions (filtering.ml - ~281 lines, exclude_list.ml - 68 lines)
**Working:**
- Platform-specific type filtering (PrintJob, etc.)
- Variadic function detection and filtering
- Unknown type detection with skip logic (cross-namespace types resolved via `cross_references`)
- Duplicate property detection between class and interfaces
- Virtual method de-duplication

**What Gets Filtered:**
- Methods with unknown types in parameters/returns (cross-namespace types are NOT filtered — they resolve via references)
- Signals with unsupported parameter types or return types
- Variadic functions (hardcoded list in `exclude_list.ml`)
- Platform-specific classes (Windows/macOS-only widgets)

---

## Major Deficiencies and Missing Features

### 1. Signal Handling

See [architecture/closures_and_signals.md](../architecture/closures_and_signals.md) for
signal coverage, supported/unsupported patterns, and the signal-corpus regression baseline.

### 2. Factory Functions - Not Implemented
**Issue:** No factory function generation.

**Missing:**
- Optional parameter handling for common properties
- Constructor selection logic (`new_with_label`, `new_with_mnemonic`, etc.)
- Property initialization after construction
- Packing and show parameter support
- Customization file system (button.json, window.json, etc.)

**Impact:** Widget creation requires verbose manual constructor calls and separate property setting.

### 3. Container-Specific Methods - Not Generated
**Issue:** No special handling for container widgets.

**Missing:**
- Box-like containers: `append`, `prepend`, `insert_child_after` wrappers
- Single-child containers: `set_child`, `get_child` methods
- Window/Dialog lifecycle: `destroy`, `present`, `close`, `run` patterns
- TreeView/ListView: model and selection management
- Child widget type coercion helpers

**Impact:** Container operations require direct low-level FFI calls.

### 4. Range and Adjustment Helpers - Not Generated
**Issue:** No specialized methods for Range-derived widgets (Scale, Scrollbar, LevelBar).

**Missing:**
- `value`/`set_value` property methods
- `adjustment` accessor returning wrapped object
- Signal handling for `value-changed`
- Increment/step configuration helpers

**Impact:** Slider/progress widgets lack convenient OCaml-style access patterns.

### 5. Out/InOut Parameters - Implemented
**Status:** Out parameters are supported (see `architecture/gir_gen/array_handling.md`).

**Working:**
- Primitive out parameters returned directly
- Out-parameter arrays with companion length parameters
- Struct out parameters with correct pointer handling
- Multiple out parameters returning tuples

**Limitations:**
- InOut parameters are partially supported but may have edge cases
- Out-param arrays with no length are skipped
- Double-pointer out-params not marked as arrays are skipped

### 6. Array and List Types - Implemented
**Status:** Array support is production-ready for methods, constructors, and properties.

**Working:**
- Zero-terminated C arrays ↔ OCaml arrays
- Length-based arrays with automatic length parameter substitution
- GPtrArray handling
- String arrays with per-element cleanup
- Struct arrays with correct dereferencing
- Array out parameters

**Missing:**
- Fixed-size stack-allocated arrays (treated as heap-allocated)
- GList/GSList support exists (`c_stub_list_conv.ml`) but is limited in coverage

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

### 9. Layer 1 Accessor Methods - Not Generated
**Issue:** `as_widget : t -> Widget.t` and similar parent-chain accessor
methods are not generated in Layer 1 modules (see [ROADMAP.md](../ROADMAP.md)).

**Impact:** Layer 2 `inherit` provides parent method access, but there's no
direct L1 function to upcast a type to an ancestor's type. Could be
implemented by walking the parent chain.

### 10. Type Coverage - Mostly Resolved via Cross-Namespace References
**Issue:** ~150 hardcoded type mappings in `type_mappings.ml` for primitive/GLib types.

**Status:** Cross-namespace classes, interfaces, records, enums, and bitfields are now automatically resolved via the reference file system (`cross_references`). The hardcoded mappings are only needed for GLib primitives (`gint`, `gboolean`, `gchar*`, etc.) and special types. Adding new GIR namespaces with classes/records/enums/bitfields requires no changes to `type_mappings.ml`.

**Remaining gap:** Callback types, union types, and some GLib collection types still have no mapping.

### 11. Property Observer Generation - Not Implemented
**Issue:** No property change notification wrappers.

**Missing:**
- `notify::property-name` signal connection helpers
- Property binding helpers
- Two-way property synchronization

**Impact:** Property change monitoring requires manual signal connection.

### 12. Builder/Glade Integration - Not Implemented
**Issue:** No GTK Builder XML support.

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

### 14. Test Coverage - Improved but Still Limited
**Status:** Test suite has expanded significantly (~70 test files across 12 categories).

**Working:**
- Unit tests for parser, type mappings, filtering, exclusions
- C stub compilation verification tests
- Array handling tests (10 test cases)
- Override system tests (parser, apply, version guards, pipeline)
- Cross-namespace type resolution tests
- Signal marshaller tests
- Constructor wrapper tests
- Integration tests for generated code patterns

**Missing:**
- Runtime functionality tests with actual GTK4 library
- Performance benchmarks
- Example program generation
- Full end-to-end compilation of generated bindings in CI

**Impact:** Most generator bugs are caught by tests, but runtime issues may still slip through.

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
| GIR Parsing | ✓ Working | 90% (see [ROADMAP.md](../ROADMAP.md)) |
| C FFI Generation | ✓ Working | 90% (arrays, out params implemented) |
| Low-Level OCaml Bindings | ✓ Working | 90% (see [ROADMAP.md](../ROADMAP.md)) |
| High-Level Class Wrappers | ⚠ Basic | 65% (no specializations) |
| Signal Handling | ✓ Working | 90% (primitive/enum/bitfield/GObject params + primitive returns; boxed records/GArray/callbacks remain) |
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
- **Phase 2 (Signals):** ✓ Complete - Per-class L1 signal connectors and L2 method forwarders are generated for parameterless, primitive-param, and primitive/enum/bitfield/GObject class/interface-param signals, including non-void primitive returns. Remaining skips are boxed records, `GArray`, callbacks, non-In parameters, and the `GObject.Object` meta-type, tracked by the signal-corpus baseline.
- **Phase 3 (High-Level Classes):** ⚠ Partial - Skeleton/concrete classes generated, out/inout parameter support added, specializations still missing. See [ROADMAP.md](../ROADMAP.md).
- **Phase 4 (Factory Functions):** ✗ Not Started - See [ROADMAP.md](../ROADMAP.md).
- **Phase 5 (Containers):** ✗ Not Started - No special handling
- **Phase 6 (Inheritance):** ⚠ Partial - 5 hierarchies hardcoded, not automatic
- **Phase 7 (Special Patterns):** ✗ Not Started - No widget-specific patterns

**Next priorities to achieve full coverage:**
1. Add factory function generation (complete Phase 4)
2. Generate container-specific methods (complete Phase 5)
3. Make hierarchy detection dynamic (complete Phase 6)
4. Add widget-specific patterns (complete Phase 7)
5. Add callback type support
6. Generate record field accessors
7. Add boxed record / `GArray` signal parameter support to close remaining signal gaps

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
- `generate/library_module.ml` - The main library's `raw.ml` (layer 1 aliases) and `enums.ml`
- `module_paths.ml` - Package, library and module names; module paths by target library (raw or main)
- `generate/common.ml` - Shared types (`StringSet`, `module_names`) for class generation

### Filtering and Utilities
- `filtering.ml` (~281 lines) - Method/property filtering, unknown type detection, duplicate removal
- `exclude_list.ml` (~68 lines) - Platform-specific types, variadic functions, skip rules

### Entry Point
- `bin/gir_gen.ml` (~1929 lines) - CLI entry point, generation pipeline orchestration, reference file loading, binding generation

### Build Automation
- `scripts/generate-bindings.sh` - Two-phase generation: reference files then bindings for all 9 namespaces

### Example Generated Code (for reference patterns)
- `ocgtk/raw/generated/button.ml/.mli` - Low-level FFI with polymorphic variant types
- `ocgtk/generated/button.ml/.mli` - High-level class wrapper
- `ocgtk/enums/generated/ocgtk_enums.ml/.mli` - Enum/bitfield type examples
- `ocgtk/raw/generated/application_and__window_and__window_group.ml/.mli` - Combined cyclic module
- `ocpangocairo/raw/generated/font.ml` - Cross-namespace type example (`Occairo_raw.Scaled_font.t`)
- `ocgtk/generated/raw.ml` - Layer 1 aliases (`module Button = Ocgtk_raw.Button`)

### Runtime Dependencies
- `ocglib/gobject.ml` - GObject type system, signal connection infrastructure

### External References
- **GObject Introspection Spec**: https://gi.readthedocs.io/
- **GTK4 API Reference**: https://docs.gtk.org/gtk4/
- **GIR Format Annotations**: https://gi.readthedocs.io/en/latest/annotations/giannotations.html
- **lablgtk3 Reference** - Polymorphic variant type patterns for GTK3 bindings
- **Cross-Namespace Architecture**: `architecture/cross_namespace_types.md`
