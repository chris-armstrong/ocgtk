# Cross-Namespace Handling Plan for ocgtk GIR Generator

**Status**: In Progress
**Created**: 2026-01-23
**Last Updated**: 2026-03-17 (cleaned up redundant phases, updated dune naming to match implementation, renumbered Phase 3)

## Executive Summary

This document outlines a comprehensive plan to add cross-namespace support to the ocgtk GIR code generator. The goal is to generate full bindings for Cairo, Gtk, Gdk, Pango, PangoCairo, GdkPixbuf, Gsk, Graphene, and Gio while excluding low-level namespaces (GLib, GModule, GObject).

The plan prioritizes:
1. **Refactoring first** - Clean up Layer 1 and Layer 2 generation for maintainability
2. **Library-specific headers** - Each library generates its own `<ns>_decls.h` file
3. **Extended type registry** - Load enough metadata from external namespaces for correct FFI
4. **Testing** - Build up test coverage to ensure refactoring preserves behavior

## Session Context

This plan was developed through an interactive planning session. Key decisions made:

- **Cairo**: Generate bindings (GObject type stubs + 22 enumerations, no methods - cairo API is not GObject-based)
- **Gio**: Include for full binding generation (important for GMenuModel, ListModel, Application, etc.)
- **Gdk, Pango, GdkPixbuf, Gsk, Graphene**: Generate full bindings for all
- **PangoCairo**: Generate bindings (2 interfaces: Font, FontMap with cross-namespace deps on Cairo + Pango)
- **GLib, GModule, GObject**: Excluded from bindings (too low-level)
- **Special GLib types**: Continue expanding support (PtrArray done, List/Variant planned for future)
- **Refactoring strategy**: Refactor code before adding cross-namespace complexity
- **Generation model**: Single gir_gen invocation outputs to multiple directories
- **Header strategy**: Each library generates `<ns>_decls.h`, dependent libraries `#include` them

## Build Automation

### `scripts/generate-bindings.sh`

The `scripts/generate-bindings.sh` script automates the complete cross-namespace binding generation process:

**Phase 1: Reference File Generation**
```bash
# Generates .sexp reference files for each namespace (9 total)
gir_gen references /usr/share/gir-1.0/cairo-1.0.gir     _build/references/cairo-references.sexp
gir_gen references /usr/share/gir-1.0/Gio-2.0.gir       _build/references/gio-references.sexp
gir_gen references /usr/share/gir-1.0/Gdk-4.0.gir       _build/references/gdk-references.sexp
gir_gen references /usr/share/gir-1.0/PangoCairo-1.0.gir _build/references/pangocairo-references.sexp
# ... etc for Graphene, GdkPixbuf, Pango, GSK, GTK
```

**Phase 2: Binding Generation with Cross-References**
```bash
# Each namespace is generated with references to its dependencies
gir_gen generate /usr/share/gir-1.0/cairo-1.0.gir src/cairo

gir_gen generate -r cairo-references.sexp -r pango-references.sexp \
    /usr/share/gir-1.0/PangoCairo-1.0.gir src/pangocairo

gir_gen generate -r cairo-references.sexp -r gio-references.sexp \
    -r gdk-references.sexp -r graphene-references.sexp \
    -r gdkpixbuf-references.sexp -r pango-references.sexp \
    -r pangocairo-references.sexp -r gsk-references.sexp \
    /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
```

The script handles the dependency ordering and ensures each namespace has access to the type information it needs from its dependencies.

**Dependency Chain (updated)**:
```
CAIRO ──┬──→ GDK ──┬──→ GSK ──→ GTK
        ├──→ PANGO ─┤          ↗
        └──→ PANGOCAIRO        │
GIO ────┤                      │
        ├──→ GDKPIXBUF ────────┤
        └──→ GRAPHENE ─────────┘
```

---

## Current State Analysis

### Existing Test Coverage

The GIR generator has good test coverage for **Layer 0 (C stubs)**:

```
src/tools/test_gir_gen/
├── c_stubs/
│   ├── array_tests.ml         # 10+ tests for array conversion
│   ├── c_stubs_tests.ml       # Basic C stub generation
│   ├── error_handling_tests.ml # GError handling
│   ├── nullable_tests.ml      # Nullable parameter handling
│   ├── out_params_tests.ml    # Out parameter conversion
│   └── type_conversion_tests.ml # Type mapping tests
├── ml_generation/
│   ├── type_definition_tests.ml  # Type `t` declaration tests
│   ├── signature_tests.ml        # .mli/.ml consistency
│   ├── external_decl_tests.ml    # External declaration tests
│   └── accessor_method_tests.ml  # Hierarchy accessor tests
├── integration/
│   ├── core.ml              # End-to-end generation tests
│   ├── parser.ml            # GIR parsing tests
│   ├── properties.ml        # Property generation tests
│   ├── signals.ml           # Signal generation tests
│   ├── enums.ml             # Enum generation tests
│   ├── records.ml           # Record generation tests
│   └── edge_cases.ml        # Edge case handling
└── infrastructure/
    ├── helpers.ml           # Test context creation
    ├── c_validation.ml      # C code validation helpers
    ├── ml_validation.ml     # ML code validation helpers
    └── ml_ast_helpers.ml    # OCaml AST parsing utilities
```

### Layer 1 & 2 Test Gaps

While there are some tests in `ml_generation/`, Layer 2 (`class_gen.ml`) has **minimal direct test coverage**:

- No tests for method wrapper generation with hierarchy types
- No tests for property wrapper generation
- No tests for same-cluster class handling
- No tests for signature vs implementation consistency in Layer 2
- No cross-namespace type handling tests (because it's currently filtered out)

### Current Cross-Namespace Handling

#### What Works

**Cross-namespace type resolution (via reference files):**
- Detection: `filtering.ml:is_cross_namespace_enum_or_bitfield` (lines 13-28)
- Type mapping: `type_mappings.ml` lines 388-409 (enums), 437-459 (bitfields)
- C converter names: Correctly generated as `Val_GdkModifierType` / `GdkModifierType_val` (tested in Bug 11)

**⚠️ DEPRECATED - To be removed:**
- Forward declarations for external enums/bitfields in `c_stub_enum.ml`/`c_stub_bitfield.ml` - use header inclusion instead

**Infrastructure:**
- Cross-reference data model: `types.ml` lines 280-293
- Reference file loading: `gir_gen.ml` lines 489+
- External type context: `external_enums`, `external_bitfields` in `generation_context` (lines 305-306)

#### What's Suppressed (Not Working)

**Cross-namespace classes/interfaces/records:**
- Detection: Implemented via `cross_references` map
- Type mapping: `type_mappings.ml:find_cross_namespace_type_mapping` (lines 501-506) uses reference files
- C converters: Available in external library headers (included via `#include "<ns>_decls.h"`)
- **Approach**: Include dependency headers rather than generating forward declarations locally

**Filtering that skips cross-namespace methods:**
- `filtering.ml:method_has_cross_namespace_types` (line 31-34) - Skips methods with external enum/bitfield params
- `filtering.ml:constructor_has_cross_namespace_types` (line 37-39) - Skips constructors with external enum params
- `filtering.ml:should_skip_method_binding` (lines 176, 189) - Filters out cross-namespace methods
- `ml_interface.ml` (lines 180-181, 200-205) - Skips constructors/methods in Layer 1
- `class_gen_helpers.ml` (lines 64, 67) - Skips methods in Layer 2

**Result:** Methods using Gdk/Gio/Pango/etc. types are simply not generated, even for enums/bitfields that have working type mappings.

---

## Cross-Namespace Reference Files

### Sexp File Format

Reference files use S-expression format with `[@@deriving sexp]` serialization (`types.ml:286,293`). The format is (`gir_gen.ml:488-501`):

```ocaml
(* Top-level structure: (namespace, cross_reference list) *)
("Gdk", [
  ((cr_name "Texture")
   (cr_type Crt_Class)
   (cr_c_type "GdkTexture*"));
  ((cr_name "ModifierType")
   (cr_type Crt_Enum)
   (cr_c_type "GdkModifierType"));
  ((cr_name "Rectangle")
   (cr_type (Crt_Record (opaque false)))
   (cr_c_type "GdkRectangle"));
  ...
])
```

### Loading and Usage

**Loading** (`gir_gen.ml:488-501`):
```ocaml
let load_reference_files reference_files =
  let converter =
    Sexplib.Conv.(
      pair_of_sexp string_of_sexp
        (list_of_sexp Gir_gen_lib.Types.cross_reference_of_sexp))
  in
  List.fold_left reference_files ~init:StringMap.empty ~f:(fun acc file ->
      let namespace, cr_list = 
        Sexplib.Sexp.load_sexp_conv_exn file converter 
      in
      let sm =
        List.fold_left cr_list ~init:StringMap.empty ~f:(fun sm cr ->
            StringMap.add cr.cr_name cr sm)
      in
      StringMap.add namespace sm acc)
```

**Usage during generation** (`type_mappings.ml:501-506`):
```ocaml
let find_cross_namespace_type_mapping ~ctx ~namespace ~name =
  let open Option in
  let* namespace_map = StringMap.find_opt namespace ctx.cross_references in
  let* cross_reference = StringMap.find_opt name namespace_map in
  Some (map_cross_reference_to_type_mapping ~ctx cross_reference)
```

The nested map structure (`cross_reference StringMap.t StringMap.t`) enables efficient two-level lookup: first by namespace, then by type name within that namespace.

---

## Phase 1: Refactor Code Generation for Clarity

**Goal**: Apply the clean modular structure seen in `c_stubs.ml` and `c_stub_method.ml` to Layer 1 and Layer 2 generation.

### 1.1 Refactor `type_mappings.ml`

**Current issues:**
- `normal_type_lookup` (lines 217-467) is a 250-line function with nested closures
- Duplicate patterns for class/interface/record lookups
- Hard to trace type resolution flow

**Refactoring plan:**

Create `type_resolution.ml` with modular lookup pipeline:

```ocaml
(* Individual lookup modules *)
module ClassLookup : sig
  val lookup : ctx:generation_context -> string -> type_mapping option
end

module InterfaceLookup : TypeLookup
module RecordLookup : TypeLookup
module EnumLookup : TypeLookup    (* Local + external *)
module BitfieldLookup : TypeLookup (* Local + external *)
module PrimitiveLookup : TypeLookup

(* Resolution pipeline - try each in order *)
val resolve_type : ctx:generation_context -> gir_type -> type_mapping option
```

**Concrete steps:**
1. Extract `find_class_mapping` into `ClassLookup` module
2. Extract `find_interface_mapping` into `InterfaceLookup` module
3. Extract `find_record_mapping` into `RecordLookup` module
4. Extract enum/bitfield lookup (local + external) into respective modules
5. Create `resolve_type` that chains these with `or_else`
6. Keep `find_type_mapping_for_gir_type` as the public API

### 1.2 Refactor `ml_interface.ml` (Layer 1)

**Current State:** The file is now ~507 lines with better separation but still mixes concerns. It has four clear functional areas: helpers/type detection, constructors, methods, and properties.

**New file structure:**

```
generate/layer1/
├── layer1_helpers.ml       # Lines 1-166: Type detection, hierarchy, utilities
├── layer1_constructor.ml   # Lines 168-205: Constructor generation
├── layer1_method.ml        # Lines 207-280: Method generation
├── layer1_property.ml      # Lines 282-343: Property getter/setter generation
└── layer1_main.ml          # Lines 345-507: Section orchestration + combined modules
```

**Functions to Move:**

**`layer1_helpers.ml`** (shared utilities):
- `build_parent_chain_variants` (lines 17-28)
- `build_hierarchy_variants` (lines 31-40)
- `detect_class_hierarchy_names` (lines 42-81)
- `print_indent` (lines 83-91)
- `combine_return_and_out_types` (lines 93-100)
- `method_handles_property` (lines 102-112)
- Type conversion helpers: `map_constructor_param`, `convert_method_param_to_ocaml_type`, `convert_out_param_to_ocaml_type`
- `should_generate_accessor`, `build_accessor_base_type`, `format_accessor_declaration`

**`layer1_constructor.ml`**:
- `build_constructor_signature` (lines 169-175)
- `format_constructor_external` (lines 177-186)
- `should_generate_constructor` (lines 188-193)
- `generate_constructor_decl` (lines 195-205)

**`layer1_method.ml`**:
- `should_generate_method` (lines 208-222)
- `build_method_signature` (lines 224-250)
- `format_method_external` (lines 252-258)
- `generate_method_decl` (lines 260-280)

**`layer1_property.ml`**:
- `has_property_type_mapping` (lines 283-286)
- `should_generate_property_getter` (line 289)
- `should_generate_property_setter` (lines 292-293)
- `generate_property_getter` (lines 296-310)
- `generate_property_setter` (lines 313-327)
- `generate_property_decl` (lines 330-343)

**`layer1_main.ml`** (orchestration):
- Section generators: `generate_type_declaration`, `generate_hierarchy_accessor_section`, `generate_constructors_section`, `generate_methods_section`, `generate_properties_section`
- Main entry: `generate_ml_interface_internal`, `generate_ml_interface`
- Combined module support: `format_module_declaration`, `generate_module_signature`, `generate_module_implementation`, `generate_combined_module_entity`, `generate_combined_ml_modules`

This structure isolates each binding type (constructors, methods, properties) into testable units while keeping the orchestration logic centralized.

### 1.3 Refactor `class_gen.ml` (Layer 2)

**Current issues:**
- 760+ lines with many helper functions
- `generate_method_wrappers` (lines 249-472) is extremely complex
- Signature vs implementation generation duplicated
- Same-cluster class handling interleaved

**New file structure:**

```
generate/
├── layer2_helpers.ml         # Shared utilities
├── layer2_method_wrapper.ml  # Method wrapper generation
├── layer2_property_wrapper.ml # Property method generation
├── layer2_inheritance.ml     # Inheritance and signal setup
└── class_gen.ml              # Orchestration only
```

**Concrete steps:**
1. Create `layer2_helpers.ml` extracting common utilities (lines 13-48)
2. Create `layer2_method_wrapper.ml` extracting method generation (lines 249-542)
3. Create `layer2_property_wrapper.ml` extracting property generation (lines 135-247)
4. Create `layer2_inheritance.ml` extracting inheritance setup
5. Refactor `class_gen.ml` to orchestrate via module calls

---

## Phase 2: Library-Specific Declaration Headers

**Status**: ✅ COMPLETED (all stages implemented)

**Goal**: Each library generates its own `<ns>_decls.h` that dependent libraries include.

**Implementation Summary**:
- All 9 stages of Phase 2 have been completed
- Header file generation now uses `<ns>_decls.h` naming pattern
- Dependency headers are automatically included via `#include "<dep>_decls.h"`
- Dune files include proper library dependencies (`ocgtk.<dep>`)
- External enum/bitfield forward declarations removed in favor of header inclusion

**Key Implementation Details Discovered**:
1. **Header naming consistency**: All headers use lowercase namespace (e.g., `gtk_decls.h`, `gdk_decls.h`)
2. **Dependency exclusion**: GLib, GModule, GObject are explicitly filtered from dependency includes
3. **Include order**: Main library header (e.g., `#include <gtk/gtk.h>`) comes before dependency includes
4. **Library dependency naming**: Uses `ocgtk.<ns>` pattern (e.g., `ocgtk.gdk`) - depends on public library, not internal .generated stubs. The `<ns>_decls.h` headers are made available through the library dependency mechanism.
5. **No manual include paths needed**: The dune build system handles header availability through library dependencies, so no `-I../../<dep>/generated` flags are required

### 2.1 Library-Specific Declaration Headers

**Current**: `generated_forward_decls.h` contains everything including external enum protos  
**New**: Each library gets `<ns>_decls.h` with **only its own types** - no external type declarations

**Example structure:**

```c
// gdk_decls.h (generated by Gdk library)
#ifndef _gdk_decls_h_
#define _gdk_decls_h_
#include <gdk/gdk.h>
#include <caml/mlvalues.h>

// Class/interface converters (Gdk only)
#define GdkTexture_val(val) ((GdkTexture*)ml_gobject_ext_of_val(val))
#define Val_GdkTexture(obj) ((value)(ml_gobject_val_of_ext(obj)))

// Record converters (Gdk only)
GdkRectangle *GdkRectangle_val(value val);
value Val_GdkRectangle(const GdkRectangle *ptr);

// Enum converters (Gdk only)
value Val_GdkModifierType(GdkModifierType val);
GdkModifierType GdkModifierType_val(value val);

#endif
```

```c
// gtk_decls.h (generated by Gtk library)
#ifndef _gtk_decls_h_
#define _gtk_decls_h_
#include <gtk/gtk.h>
#include <caml/mlvalues.h>

// Include dependencies' declarations (NOT redeclare!)
#include "gdk_decls.h"
#include "gio_decls.h"

// Gtk-specific converters only
#define GtkWidget_val(val) ((GtkWidget*)ml_gobject_ext_of_val(val))
#define Val_GtkWidget(obj) ((value)(ml_gobject_val_of_ext(obj)))

#endif
```

### 2.2 Header Inclusion Strategy

**⚠️ DEPRECATED**: Generating forward declarations for external enums/bitfields in `c_stub_enum.ml` (lines 31-38) and `c_stub_bitfield.ml` (lines 61-68) is deprecated. Use header inclusion instead.

**Strategy**: Option A - Include all dependency headers in `<ns>_decls.h`
- Each `<ns>_decls.h` includes its dependency headers via `#include "<dep>_decls.h"`
- All C stub files automatically get all converters through the single include
- Simpler than per-file tracking, no changes needed to individual stub file generation

**Determining Dependencies**:
- Extract from `ctx.cross_references : cross_reference StringMap.t StringMap.t`
- Keys of the outer map are the dependency namespace names (e.g., "Gdk", "Gio")
- Generate `#include "<ns_lower>_decls.h"` for each dependency namespace
- Filter out "GObject", "GLib", "GModule" (low-level, never generate bindings for these)

**Dependency Chain**:
```
CAIRO ──┬──→ GDK ──┬──→ GSK ──→ GTK
        ├──→ PANGO ─┤          ↗
        └──→ PANGOCAIRO        │
GIO ────┤                      │
        ├──→ GDKPIXBUF ────────┤
        └──→ GRAPHENE ─────────┘
```

**Example gdk_decls.h**:
```c
#ifndef _gdk_decls_h_
#define _gdk_decls_h_
#include <gdk/gdk.h>
#include <caml/mlvalues.h>

/* Include GIO dependency */
#include "gio_decls.h"

/* Gdk-specific converters only */
#define GdkTexture_val(val) ((GdkTexture*)ml_gobject_ext_of_val(val))
#define Val_GdkTexture(obj) ((value)(ml_gobject_val_of_ext(obj)))

/* ... more Gdk converters ... */

#endif
```

**Modify `generate_forward_decls_header` to**:
1. Accept `cross_references` parameter to determine dependencies
2. Generate `#include` directives for each dependency header at the TOP of the file
3. Generate converters ONLY for current namespace's types
4. Remove external enum/bitfield forward declaration generation

**Key principle**: All cross-namespace type converters (classes, interfaces, records, enums, bitfields) are accessed via included headers, not locally declared.

### 2.2.1 Implementation Details

**Files to modify**:

1. **`c_stubs.ml`** - Rename header and add dependency includes
   - Change filename from `generated_forward_decls.h` to `<ns>_decls.h`
   - Add function to extract dependency namespaces from `ctx.cross_references`
   - Generate `#include "<dep>_decls.h"` for each dependency
   - Remove `~external_enums` and `~external_bitfields` parameters

2. **`c_stub_enum.ml`** - Remove external enum forward declarations
   - Remove `~external_enums` parameter from `generate_forward_decls`
   - Delete lines 30-38 (external enum forward declaration generation)
   - Keep only local namespace enum declarations

3. **`c_stub_bitfield.ml`** - Remove external bitfield forward declarations  
   - Remove `~external_bitfields` parameter from `generate_forward_decls`
   - Delete lines 60-68 (external bitfield forward declaration generation)
   - Keep only local namespace bitfield declarations

4. **`c_stub_helpers.ml`** - Update header include
   - Change `#include "generated_forward_decls.h"` to `#include "<ns>_decls.h"`
   - The header name should be derived from the namespace being generated

5. **`gir_gen.ml`** - Update header generation call
   - Change header filename generation to use `<ns>_decls.h` pattern
   - Pass `ctx.cross_references` instead of `~external_enums`/`~external_bitfields`
   - Extract dependency namespaces and pass to header generation

**Example dependency extraction**:
```ocaml
(* Extract dependency namespaces from cross_references *)
let get_dependency_namespaces cross_references current_ns =
  StringMap.fold (fun ns _ acc ->
    if ns = current_ns then acc
    else if List.mem ns ["GLib"; "GModule"; "GObject"] then acc
    else ns :: acc
  ) cross_references []
```

**Header naming**:
- Gtk → `gtk_decls.h`
- Gdk → `gdk_decls.h`  
- Gio → `gio_decls.h`
- Gsk → `gsk_decls.h`
- Pango → `pango_decls.h`
- etc.

### 2.3 Update dune File Generation

**Library Dependencies in dune Files:**

Each generated library must declare its cross-namespace dependencies in the `(libraries)` clause:

```scheme
(library
 (name ocgtk_gsk_generated_stubs)
 (public_name ocgtk.gsk.generated_stubs)
 (wrapped false)
 (modules)  ; No OCaml modules, only C stubs
 (libraries
   ocgtk.gdk    ; For GDK types (GdkTexture, etc.)
   ocgtk.graphene  ; For Graphene types
   ocgtk_common)  ; Common header files
 (foreign_stubs
  (language c)
  (names ml_..._gen)
  (flags -fPIC -Igenerated -Icore -I../common
         (:include cflag-gsk.sexp)
         -Wno-deprecated-declarations
         -Wno-incompatible-pointer-types
         -Wno-int-conversion))
 (c_library_flags (:include clink-gsk.sexp)))
```

**Key points:**
1. **OCaml library dependencies**: Listed in `(libraries)` clause using public library names (e.g., `ocgtk.gdk`) — dependencies reference the public library, not internal `.generated_stubs`
2. **Dependency ordering**: Libraries must be listed in dependency order (dependencies before dependents)
3. **Generated automatically**: The dune file generator (`generate/dune_file.ml`) extracts dependency namespaces from `repository.repository_includes`, filters base namespaces, and maps to `ocgtk.<ns>` library names
4. **Header availability**: The `<ns>_decls.h` headers are made available through the library dependency mechanism — no manual `-I` include paths to other libraries are needed
5. **Library naming**: Generated stubs use `ocgtk_<ns>_generated_stubs` (name) / `ocgtk.<ns>.generated_stubs` (public_name), with `(wrapped false)` and `(modules)` since they contain only C stubs

---

## Phase 3: Cross-Namespace OCaml Type Fixes

**Goal**: Fix OCaml type generation for cross-namespace references so libraries like PangoCairo can compile.

### 3.1 Current Cross-Namespace Infrastructure (Reference)

The cross-namespace system uses a two-phase approach:
1. **Reference generation**: `gir_gen references <gir-file> <output.sexp>` extracts type metadata
2. **Binding generation**: `gir_gen generate [-r ref.sexp ...] <gir-file> src/<ns>` uses references

**Data model** (`types.ml`):
```ocaml
type cross_reference = {
  cr_name : string;          (* Type name, e.g., "Texture" *)
  cr_type : cross_reference_type;
  cr_c_type : string;        (* C type, e.g., "GdkTexture*" *)
}

and cross_reference_type =
  | Crt_Class | Crt_Interface
  | Crt_Record of { opaque : bool }
  | Crt_Enum | Crt_Bitfield
```

**Lookup** (`type_mappings.ml`):
```ocaml
let find_cross_namespace_type_mapping ~ctx ~namespace ~name =
  let open Option in
  let* namespace_map = StringMap.find_opt namespace ctx.cross_references in
  let* cross_reference = StringMap.find_opt name namespace_map in
  Some (map_cross_reference_to_type_mapping ~ctx cross_reference)
```

**C-side**: Fully working — each library's `<ns>_decls.h` declares its converters, dependent libraries include them via `#include "<ns>_decls.h"`. No forward declarations needed.

**Converter naming**: `Val_<c_type>` / `<c_type>_val` (e.g., `Val_GdkTexture` / `GdkTexture_val`). The `cr_type` determines pointer vs value semantics.

### 3.2 Array Handling for Cross-Namespace Types

**Known issue**: Array conversion uses `Type_mappings.find_type_mapping_for_gir_type` to get element type mapping. If element type is from external namespace, this may fail if the lookup doesn't consult `cross_references`.

**Solution**: Ensure `find_type_mapping_for_gir_type` falls through to `find_cross_namespace_type_mapping` for array element types.

---

### 3.3 Cross-Namespace OCaml Type Generation Bugs

**Status**: Not started - blocking PangoCairo compilation

**Discovery context**: When adding PangoCairo (which depends on Cairo and Pango), the generated OCaml code has three categories of cross-namespace type bugs. These bugs have always existed but were hidden because cross-namespace methods were filtered out (Phase 4 filtering). Now that libraries like PangoCairo have direct cross-namespace references, the bugs are exposed.

#### Bug 1: Layer 1 - Unqualified cross-namespace record types

**Symptom**: `font.ml` generates `Scaled_font.t` for a cairo.ScaledFont return type. Since `Scaled_font` is in the `ocgtk_cairo` library (not `ocgtk_pangocairo`), OCaml can't find it.

**Root cause**: `map_cross_reference_to_type_mapping` (type_mappings.ml:23-24) generates `ocaml_type = Utils.module_name_of_class cr.cr_name ^ ".t"` without any namespace qualification. For same-namespace types this works because the module is local. For cross-namespace types, it produces `Scaled_font.t` instead of something like `Ocgtk_cairo.Scaled_font.t`.

**Fix needed**: The `ocaml_type` for cross-namespace records/classes/interfaces must be namespace-qualified. The qualification depends on the OCaml library structure — since each library is wrapped (e.g., `ocgtk_cairo`), the external module path is `Ocgtk_<ns>.Module_name.t`.

#### Bug 2: Layer 1 - Unqualified cross-namespace enum types

**Symptom**: `font_map.ml` generates `fonttype` for a cairo.FontType return type. Since `fonttype` is defined in `cairo_enums.mli` inside `ocgtk_cairo`, it's not accessible from `ocgtk_pangocairo`.

**Root cause**: Same function (type_mappings.ml:25) generates `ocaml_type = String.lowercase_ascii cr.cr_name` for enums/bitfields without namespace qualification.

**Fix needed**: Cross-namespace enums must reference the external library's enum module, e.g., `Ocgtk_cairo.Cairo_enums.fonttype` or use a type alias.

#### Bug 3: Layer 2 - Invalid OCaml for cross-namespace class references

**Symptom**: `gFont.ml` generates `cairo.scaled_font` as a class type (for `new cairo.scaled_font ret`). This is invalid OCaml — `cairo` is not a module accessible here, and even if it were, the syntax is wrong.

**Root cause**: `map_cross_reference_to_type_mapping` (type_mappings.ml:38) sets `class_module = namespace` (e.g., `"cairo"`). Then `type_resolution.ml:19` combines as `class_module ^ "." ^ class_type`, producing `"cairo.scaled_font"`. For local types, `class_module` is set to `"G" ^ module_name` (e.g., `"GWidget"`), which works because the G-module is in the same library.

**Fix needed**: `layer2_class` for cross-namespace types must use the fully-qualified wrapped library module path, or Layer 2 generation must skip wrapping cross-namespace return types as class objects (since the class is defined in another library).

#### Proposed Fix Strategy

The cleanest approach is to make `map_cross_reference_to_type_mapping` namespace-aware:

1. **Add namespace to the `ocaml_type`**: For cross-namespace types, prefix with the wrapped library module:
   - Records/Classes: `Ocgtk_<ns_lower>.Module_name.t`
   - Enums: `Ocgtk_<ns_lower>.<Ns>_enums.enum_name`

2. **Fix `layer2_class` for cross-namespace**: Either:
   - (a) Set `layer2_class = None` for cross-namespace types (don't wrap in class objects — just use the Layer 1 type), or
   - (b) Use fully-qualified module paths like `Ocgtk_<ns_lower>.GModule_name` for `class_module`

   Option (a) is simpler and probably correct — you shouldn't be instantiating a Layer 2 class from another library's module hierarchy.

3. **The `namespace` parameter** is already passed to `map_cross_reference_to_type_mapping`. The function needs to also receive the *current* namespace to determine if qualification is needed (same-ns → unqualified, cross-ns → qualified).

#### Files to modify

| File | Change |
|------|--------|
| `type_mappings.ml:18-58` | Add current namespace awareness; qualify cross-namespace ocaml_type; fix layer2_class |
| `type_resolution.ml:12-22` | May need updates if layer2_class format changes |

#### Testing

Add test cases to `cross_namespace/` tests:
- Cross-namespace record return type generates qualified `Ocgtk_cairo.Scaled_font.t`
- Cross-namespace enum parameter generates qualified `Ocgtk_cairo.Cairo_enums.fonttype`
- Layer 2 does not attempt to wrap cross-namespace return types as class objects

---

## Phase 4: Remove Cross-Namespace Filtering

**Goal**: Now that types are properly resolved, remove filtering that skips cross-namespace methods.

**Depends on**: Phase 3.3 (type bugs must be fixed first)

### 4.1 Changes to `filtering.ml`

**Remove:**
- `is_cross_namespace_enum_or_bitfield`
- `method_has_cross_namespace_types`
- `constructor_has_cross_namespace_types`

**Modify:**
- `should_skip_method_binding` - remove cross-namespace check (line ~176)
- `should_generate_constructor` - remove cross-namespace check (line ~208)

### 4.2 Changes to `ml_interface.ml` and `class_gen.ml`

Remove all `has_cross_namespace_type` checks that cause method skipping.

### 4.3 Changes to `library_module.ml`

`library_module.ml` (lines ~109, 127, 210, 232) uses `ctx.external_enums` and `ctx.external_bitfields` to detect cross-namespace enum/bitfield usage in the library-level combined module. These checks need updating to use `cross_references` instead.

### 4.4 Remove legacy `external_enums`/`external_bitfields` from context

After all filtering is removed, the `external_enums` and `external_bitfields` fields in `generation_context` (types.ml:320-321) are redundant — all cross-namespace type information is available via `cross_references`. Remove these fields and update all call sites.

---

## Phase 5: Multi-Namespace Output Generation

**Status**: ✅ COMPLETED (via `scripts/generate-bindings.sh`)

**Original goal**: Single gir_gen run produces bindings for multiple namespaces.

**Actual implementation**: Instead of a single monolithic invocation, we use `scripts/generate-bindings.sh` which runs gir_gen once per namespace with the appropriate reference files. This is simpler, more flexible, and avoids coupling all namespaces in a single run.

### 5.1 Current Implementation

The script has two phases:
1. **Reference generation**: `gir_gen references <gir-file> <output.sexp>` for each of 9 namespaces
2. **Binding generation**: `gir_gen generate [-r ref.sexp ...] <gir-file> src/<ns>` for each namespace

Each namespace is generated independently with explicit dependency references. The dependency order is enforced by the script ordering.

### 5.2 Output Structure

```
src/
├── common/           # Hand-written common code
├── cairo/            # ocgtk_cairo (22 enums, 12 record type stubs)
├── gio/              # ocgtk_gio
├── gdk/              # ocgtk_gdk
├── graphene/         # ocgtk_graphene
├── gdkpixbuf/        # ocgtk_gdkpixbuf
├── pango/            # ocgtk_pango
├── pangocairo/       # ocgtk_pangocairo (2 interfaces: Font, FontMap)
├── gsk/              # ocgtk_gsk
├── gtk/              # ocgtk_gtk
├── Cairo.ml          # Wrapper: include Ocgtk_cairo.Cairo
├── Gio.ml            # Wrapper: include Ocgtk_gio.Gio
├── Gdk.ml            # Wrapper: include Ocgtk_gdk.Gdk
├── PangoCairo.ml     # Wrapper: include Ocgtk_pangocairo.PangoCairo
└── ...etc
```

---

## Phase 6: Testing Strategy

**Goal**: Ensure cross-namespace functionality works correctly.

### 6.1 Existing Cross-Namespace Tests

Tests already exist in `test_gir_gen/cross_namespace/`:
- `c_stub_include_tests.ml` — header include generation
- `dune_library_deps_tests.ml` — library dependency generation
- `no_external_enum_decls_tests.ml` — no external enum forward declarations
- `no_external_bitfield_decls_tests.ml` — no external bitfield forward declarations
- `dependency_includes_tests.ml` — dependency header includes
- `compilation_tests.ml` — end-to-end compilation

### 6.2 Tests Still Needed

**Cross-namespace OCaml type tests** (for Phase 3.3):
1. Cross-namespace record return type generates qualified `Ocgtk_cairo.Scaled_font.t`
2. Cross-namespace enum parameter generates qualified `Ocgtk_cairo.Cairo_enums.fonttype`
3. Layer 2 does not attempt to wrap cross-namespace return types as class objects
4. Array of external class type resolves correctly

**Cross-namespace method generation tests** (for Phase 4):
5. Method with cross-namespace enum parameter generates valid OCaml + C
6. Constructor with cross-namespace type parameter generates correctly
7. Method returning cross-namespace class generates valid OCaml

**Layer 1/2 baseline tests** (for Phase 1 refactoring, when undertaken):
- Cross-module type references (`Widget.t` in `Button.t`)
- Combined module generation validity
- Property getter/setter generation
- Method wrapper hierarchy coercion
- Signature vs implementation consistency

---

## Execution Dependencies

```
Phase 2 (Library-specific headers)     ✅ COMPLETED
Phase 5 (Multi-namespace output)       ✅ COMPLETED (via generate-bindings.sh)

Phase 3.3 (Cross-NS OCaml type bugs)  ◄── BLOCKING PangoCairo
              │
              ▼
        Phase 4 (Remove cross-NS filtering + cleanup external_enums/external_bitfields)
              │
              ▼
        Phase 1 (Refactoring - optional, for maintainability)
        Phase 6 (Testing - ongoing)
```

**Critical path**: Phase 3.3 must be completed first — it blocks PangoCairo and will block any library with cross-namespace method/property types.

Phase 4 (removing filtering) depends on Phase 3.3 — once cross-namespace types generate valid OCaml, the filtering can be removed to expose more methods.

Phase 1 (refactoring) is an independent improvement that can happen at any time.

---

## Continuation Prompt

To continue this planning session in a future conversation, use the following prompt:

---

**Prompt for continuing cross-namespace planning:**

> I'm working on cross-namespace support for the ocgtk GIR code generator. Please read the plan document at `ocgtk/architecture/todo/CROSS_NAMESPACE_PLAN.md` to understand the context.
>
> Key decisions already made:
> - Generate full bindings for: Cairo, Gtk, Gdk, Pango, PangoCairo, GdkPixbuf, Gsk, Graphene, Gio
> - Exclude: GLib, GModule, GObject (too low-level)
> - Each library generates `<ns>_decls.h`, dependent libraries include them (✅ Phase 2 done)
> - Multi-namespace output via `scripts/generate-bindings.sh` (✅ Phase 5 done)
> - **Blocking issue**: Phase 3.3 - cross-namespace OCaml type generation produces unqualified/invalid types
>
> The plan has 6 phases. Phase 3.3 is the critical next step. Please review and help with [specific task].

---

## Open Questions

1. ~~**Build order enforcement**: How should dune handle cross-library dependencies?~~ → Resolved: `generate-bindings.sh` handles ordering; dune handles library deps via `(libraries ocgtk.<dep>)` in generated dune files.

2. ~~**Incremental generation**: Should gir_gen support generating only specific namespaces?~~ → Resolved: Each namespace is a separate gir_gen invocation. Run the script for all, or invoke gir_gen directly for one.

3. **GLib special types priority**: After PtrArray, which GLib types are most important? (Candidates: List, SList, Variant, Bytes)

4. **Cross-namespace Layer 2 class wrapping**: Should cross-namespace return types be wrapped in Layer 2 class objects, or should they be returned as raw Layer 1 types? Wrapping requires the foreign library's G-class to be accessible, which adds coupling. Returning raw types is simpler but less ergonomic.

---

## References

- `ocgtk/architecture/gir_gen/array_handling.md` - Array conversion documentation
- `ocgtk/architecture/todo/SPLIT_LIBRARIES_REFACTORING_PLAN.md` - Library structure plan
- `ocgtk/STYLE_GUIDELINES.md` - OCaml code style guidelines
- `ocgtk/architecture/FFI_GUIDELINES.md` - C FFI guidelines
