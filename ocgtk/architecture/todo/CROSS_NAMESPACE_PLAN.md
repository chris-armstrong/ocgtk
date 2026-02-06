# Cross-Namespace Handling Plan for ocgtk GIR Generator

**Status**: Planning  
**Created**: 2026-01-23  
**Last Updated**: 2026-01-23 (reordered phases - testing first)

## Executive Summary

This document outlines a comprehensive plan to add cross-namespace support to the ocgtk GIR code generator. The goal is to generate full bindings for Gtk, Gdk, Pango, GdkPixbuf, Gsk, Graphene, and Gio while excluding low-level namespaces (GLib, GModule, GObject).

The plan prioritizes:
1. **Refactoring first** - Clean up Layer 1 and Layer 2 generation for maintainability
2. **Library-specific headers** - Each library generates its own `<ns>_decls.h` file
3. **Extended type registry** - Load enough metadata from external namespaces for correct FFI
4. **Testing** - Build up test coverage to ensure refactoring preserves behavior

## Session Context

This plan was developed through an interactive planning session. Key decisions made:

- **Gio**: Include for full binding generation (important for GMenuModel, ListModel, Application, etc.)
- **Gdk, Pango, GdkPixbuf, Gsk, Graphene**: Generate full bindings for all
- **GLib, GModule, GObject**: Excluded from bindings (too low-level)
- **Special GLib types**: Continue expanding support (PtrArray done, List/Variant planned for future)
- **Refactoring strategy**: Refactor code before adding cross-namespace complexity
- **Generation model**: Single gir_gen invocation outputs to multiple directories
- **Header strategy**: Each library generates `<ns>_decls.h`, dependent libraries `#include` them

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

Currently, cross-namespace types are **filtered out** rather than supported:

- `filtering.ml:is_cross_namespace_enum_or_bitfield` - Detects external types
- `filtering.ml:method_has_cross_namespace_types` - Skips methods using them
- Methods using Gdk/Gio/etc. types are simply not generated

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

**Current issues:**
- `generate_ml_interface_internal` is 280 lines doing constructors, methods, properties
- Signature vs implementation generation interleaved
- Hard to trace what generates what

**New file structure:**

```
generate/
├── layer1_helpers.ml       # Shared utilities
├── layer1_constructor.ml   # Constructor generation
├── layer1_method.ml        # Method generation
├── layer1_property.ml      # Property getter/setter generation
└── ml_interface.ml         # Orchestration only
```

**Concrete steps:**
1. Create `layer1_helpers.ml` with extracted helpers (simplify_self_reference, qualify_module_reference, sanitize_doc)
2. Create `layer1_constructor.ml` extracting lines 168-218
3. Create `layer1_method.ml` extracting lines 220-339
4. Create `layer1_property.ml` extracting lines 341-388
5. Refactor `ml_interface.ml` to orchestrate via module calls
6. Each module follows docstring pattern from `c_stub_method.ml`

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

**Goal**: Each library generates its own `<ns>_decls.h` that dependent libraries include.

### 2.1 Rename and Split Forward Declarations

**Current**: `generated_forward_decls.h` contains everything including external enum protos  
**New**: Each library gets `<ns>_decls.h` with only its own types

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

### 2.2 Update `c_stubs.ml`

Modify `generate_forward_decls_header` to:
1. Accept `dependency_headers` parameter
2. Include dependency headers instead of declaring external enum protos
3. Only generate converters for current namespace's types

### 2.3 Update dune File Generation

Generated dune file specifies include paths for dependency headers:

```scheme
(foreign_stubs
  (language c)
  (names ml_button_gen ...)
  (flags -fPIC 
         (:include cflag-gtk4.sexp) 
         -I../../gdk/generated    ; For gdk_decls.h
         -I../../gio/generated    ; For gio_decls.h
         -Wno-deprecated-declarations))
```

---

## Phase 3: Extended External Namespace Parsing

**Goal**: Load enough type information from external namespaces for correct FFI generation.

### 3.1 Required Information from External Namespaces

For **records**, FFI differs based on:
- `opaque`: Pass as pointer, no field access
- `disguised`: Special handling (GLib internal)
- Boxed (has `glib:get-type`): Can copy, has finalizer
- Non-opaque, non-boxed: Value-like record

For **classes/interfaces**:
- C type name for `Val_X`/`X_val` macros
- Parent class (for inheritance chain validation)

For **enums/bitfields**:
- Already loaded - continue as-is

### 3.2 Extend `Types.generation_context`

```ocaml
(* New type for external class/interface/record metadata *)
type external_type_metadata = {
  namespace : string;          (* "Gdk", "Gio", etc. *)
  name : string;               (* "Texture", "ListModel" *)
  c_type : string;             (* "GdkTexture", "GListModel" *)
  kind : external_type_kind;
}

and external_type_kind =
  | ExternalClass of { parent : string option }
  | ExternalInterface
  | ExternalRecord of {
      opaque : bool;
      disguised : bool;
      has_glib_get_type : bool;  (* Boxed type *)
    }

type generation_context = {
  (* ... existing fields ... *)
  
  (* Extended external type registry *)
  external_classes : (string, external_type_metadata) Hashtbl.t;
  external_interfaces : (string, external_type_metadata) Hashtbl.t;
  external_records : (string, external_type_metadata) Hashtbl.t;
  
  (* Existing enum/bitfield lists *)
  external_enums : (string * gir_enum) list;
  external_bitfields : (string * gir_bitfield) list;
}
```

### 3.3 Update `gir_parser.ml`

Add metadata-only parsing mode:

```ocaml
type parse_mode =
  | FullParse           (* For namespaces we're generating *)
  | MetadataOnly        (* Just type info for cross-refs *)

val parse_gir_metadata : string -> external_type_metadata list
(* Fast parser that only extracts:
   - class/interface names and c:type
   - record names, c:type, opaque, disguised, glib:get-type
   Does NOT parse methods, constructors, properties, signals *)
```

### 3.4 Array Handling for Cross-Namespace Types

**Known issue**: Array conversion uses `Type_mappings.find_type_mapping_for_gir_type` to get element type mapping. If element type is from external namespace, this fails.

**Solution**: Update `find_type_mapping_for_gir_type` to consult `external_classes`, `external_interfaces`, `external_records`.

---

## Phase 4: Remove Cross-Namespace Filtering

**Goal**: Now that types are properly resolved, remove filtering that skips cross-namespace methods.

### 4.1 Changes to `filtering.ml`

**Remove:**
- `is_cross_namespace_enum_or_bitfield`
- `method_has_cross_namespace_types`
- `constructor_has_cross_namespace_types`

**Modify:**
- `should_skip_method_binding` - remove cross-namespace check
- `should_generate_constructor` - remove cross-namespace check

### 4.2 Changes to `ml_interface.ml` and `class_gen.ml`

Remove all `has_cross_namespace_type` checks that cause method skipping.

---

## Phase 5: Multi-Namespace Output Generation

**Goal**: Single gir_gen run produces bindings for multiple namespaces to separate directories.

### 5.1 Update gir_gen Main Flow

```ocaml
let main () =
  (* 1. Parse primary namespace fully *)
  let primary_ctx = parse_full target_gir in
  
  (* 2. Determine all dependencies in order *)
  let deps = compute_dependency_order primary_ctx.repository.repository_includes in
  
  (* 3. For each dependency:
     - Generate full bindings (if in GenerateBindings list)
     - Parse metadata only (for FFI type info) *)
  let type_registry = build_type_registry deps in
  
  (* 4. Generate for each namespace to its directory *)
  List.iter deps ~f:(fun ns ->
    if should_generate ns then
      let output_dir = Filename.concat base_output_dir (String.lowercase_ascii ns) in
      let dep_headers = compute_dependency_headers ns deps in
      generate_namespace_bindings ~ctx:{...} ~output_dir ~dep_headers
  )
```

### 5.2 Output Structure

```
src/
├── common/           # Hand-written common code (unchanged)
├── gtk/
│   ├── core/         # Hand-written GTK code
│   └── generated/
│       ├── gtk_decls.h
│       ├── dune-generated.inc
│       └── *.ml, *.mli, ml_*_gen.c
├── gdk/
│   └── generated/
│       ├── gdk_decls.h
│       └── ...
├── gio/
│   └── generated/
│       ├── gio_decls.h
│       └── ...
└── pango/
    └── generated/
        └── ...
```

---

## Phase 6: Testing Strategy

**Goal**: Ensure refactoring preserves behavior and new functionality works correctly.

### 6.1 Before Refactoring: Baseline Tests

**Layer 1 tests to add** (in `ml_generation/`):

1. **Cross-module type references**
   - Test that `Widget.t` reference in `Button.t` is correctly qualified
   - Test cyclic module references (`module rec ... and ...`)

2. **Combined module generation**
   - Test `generate_combined_ml_modules` produces valid OCaml
   - Test signature matches implementation for combined modules

3. **Property generation**
   - Test property getter/setter external declarations
   - Test nullable property types

**Layer 2 tests to add** (new `layer2_generation/` directory):

1. **Method wrapper tests**
   - Test hierarchy parameter coercion (`#widget` -> `Widget.t`)
   - Test structural type for same-cluster classes
   - Test nullable parameter handling in wrappers
   - Test return value wrapping (new ClassName ret)

2. **Property wrapper tests**
   - Test property getter/setter method generation
   - Test Layer 2 class references in property types

3. **Inheritance tests**
   - Test `inherit widget_skel` generation
   - Test signal handler inheritance
   - Test hierarchy accessor methods

4. **Signature consistency tests**
   - Test that generated `.mli` matches `.ml` for Layer 2

### 6.2 During Refactoring: Regression Tests

For each refactored module:
1. Run existing test suite - must pass unchanged
2. Add tests for edge cases discovered during refactoring
3. Verify generated output is identical (diff testing)

### 6.3 Cross-Namespace Tests

**New test file**: `test_gir_gen/cross_namespace/`

1. **Type resolution tests**
   - Test that `Gdk.Texture` resolves to correct type mapping
   - Test that `Gio.ListModel` resolves correctly
   - Test external record with different flags (opaque, disguised, boxed)

2. **Array element type tests**
   - Test array of external class (e.g., `Gdk.Monitor array`)
   - Test array of external enum
   - Test GPtrArray with external element type

3. **Header inclusion tests**
   - Test that `gtk_decls.h` includes `gdk_decls.h`
   - Test no duplicate converter declarations

4. **Full generation tests**
   - Test generating a method that uses Gdk type parameter
   - Test generating a method that returns Gio interface
   - Test constructor with external namespace parameter

### 6.4 Test Infrastructure Additions

Add to `infrastructure/`:

```ocaml
(* cross_namespace_helpers.ml *)
val create_multi_namespace_context : unit -> generation_context
(* Creates context with Gtk, Gdk, Gio, Pango type registries populated *)

val create_external_class : namespace:string -> name:string -> c_type:string -> external_type_metadata

val create_external_record : 
  namespace:string -> name:string -> c_type:string -> 
  opaque:bool -> disguised:bool -> boxed:bool -> 
  external_type_metadata
```

---

## Execution Dependencies

```
Phase 6 (Testing Strategy - baseline tests)
              │
              ▼
        Phase 1 (Refactoring)
              │
              ├─► Phase 2 (Library-specific headers)
              │
              └─► Phase 3 (Extended external parsing)
                        │
                        ▼
                  Phase 4 (Remove filtering)
                        │
                        ▼
                  Phase 5 (Multi-namespace output)
```

Phase 6 (baseline tests) must come first to ensure refactoring preserves behavior.
Phases 2 and 3 can proceed in parallel after Phase 1.  
Phase 4 requires both Phase 2 and Phase 3.  
Phase 5 requires Phase 4.

Cross-namespace tests (Phase 6.3) are added incrementally as Phases 3-5 are implemented.

---

## Continuation Prompt

To continue this planning session in a future conversation, use the following prompt:

---

**Prompt for continuing cross-namespace planning:**

> I'm working on cross-namespace support for the ocgtk GIR code generator. Please read the plan document at `ocgtk/architecture/todo/CROSS_NAMESPACE_PLAN.md` to understand the context.
>
> Key decisions already made:
> - Generate full bindings for: Gtk, Gdk, Pango, GdkPixbuf, Gsk, Graphene, Gio
> - Exclude: GLib, GModule, GObject (too low-level)
> - Each library generates `<ns>_decls.h`, dependent libraries include them
> - Refactor Layer 1/2 generation code before adding cross-namespace complexity
> - Single gir_gen invocation outputs to multiple directories
>
> The plan has 6 phases. Please review the current state and help me with [specific phase or task].

---

## Open Questions

1. **Build order enforcement**: How should dune handle cross-library dependencies? Should we generate a dependency graph file?

2. **Incremental generation**: Should gir_gen support generating only specific namespaces, or always all?

3. **GLib special types priority**: After PtrArray, which GLib types are most important? (Candidates: List, SList, Variant, Bytes)

4. **Testing against real GIR files**: Should tests use actual Gtk-4.0.gir or synthetic test data?

---

## References

- `ocgtk/architecture/gir_gen/array_handling.md` - Array conversion documentation
- `ocgtk/architecture/todo/SPLIT_LIBRARIES_REFACTORING_PLAN.md` - Library structure plan
- `ocgtk/STYLE_GUIDELINES.md` - OCaml code style guidelines
- `ocgtk/architecture/FFI_GUIDELINES.md` - C FFI guidelines
