# Cross-Namespace Handling Plan for ocgtk GIR Generator

**Status**: Mostly Complete — Phases 1-5 done, Phase 6 (testing) ongoing, Phase 7 (class type separation) awaiting build verification
**Created**: 2026-01-23
**Last Updated**: 2026-03-21 (Phase 7: Layer 2 class type separation — complete, `#` prefix removed)

## Executive Summary

This document outlines the plan to add cross-namespace support to the ocgtk GIR code generator. The goal is to generate full bindings for Cairo, Gtk, Gdk, Pango, PangoCairo, GdkPixbuf, Gsk, Graphene, and Gio while excluding low-level namespaces (GLib, GModule, GObject).

All core phases are now complete. Cross-namespace types resolve correctly, the filtering that suppressed cross-namespace methods has been removed, and all 9 libraries generate and compile.

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

**Dependency Chain**:
```
CAIRO ──┬──→ GDK ──┬──→ GSK ──→ GTK
        ├──→ PANGO ─┤          ↗
        └──→ PANGOCAIRO        │
GIO ────┤                      │
        ├──→ GDKPIXBUF ────────┤
        └──→ GRAPHENE ─────────┘
```

---

## Cross-Namespace Reference System

### Sexp File Format

Reference files use S-expression format with `[@@deriving sexp]` serialization:

```ocaml
(* cross_reference_namespace — serialized to .sexp *)
type cross_reference_type =
  | Crt_Class of { parent : string option }
  | Crt_Interface
  | Crt_Record of { opaque : bool }
  | Crt_Enum
  | Crt_Bitfield

type cross_reference_entity = {
  cr_name : string;        (* Type name, e.g., "Texture" *)
  cr_type : cross_reference_type;
  cr_c_type : string;      (* C type, e.g., "GdkTexture*" *)
}
```

### In-Memory Structure

At generation time, references are loaded into `generation_context.cross_references`:

```ocaml
type generation_context_namespace_cross_references = {
  ncr_namespace_name : string;
  ncr_namespace_packages : string list;
  ncr_namespace_includes : string list;
  ncr_namespace_c_includes : string list;
  ncr_entities : cross_reference_entity StringMap.t;  (* name → entity *)
}

(* In generation_context: *)
cross_references : generation_context_namespace_cross_references StringMap.t
(* namespace name → namespace cross-references *)
```

### Type Resolution Flow

```
gir_type.name (e.g., "Gdk.ModifierType")
    │
    ├─ Same namespace? → find_enum_mapping / find_class_mapping / etc.
    │
    └─ Cross namespace? → find_cross_namespace_type_mapping
                              │
                              └─ map_cross_reference_to_type_mapping
                                   │
                                   ├─ ocaml_type: "Ocgtk_gdk.Gdk.modifiertype"
                                   ├─ c_type: "GdkModifierType"
                                   ├─ c_to_ml / ml_to_c: "Val_GdkModifierType" etc.
                                   └─ layer2_class: Some { class_module = "Ocgtk_gdk.Gdk"; ... }
```

Key function: `Utils.external_namespace_to_module_name` converts namespace "Gdk" → "Ocgtk_gdk.Gdk" using `String.capitalize_ascii` (not `internal_namespace_to_module_name`, which lowercases incorrectly for multi-case names like GdkPixbuf).

### classify_type

Added 2026-03-18 to `type_mappings.ml` for cross-namespace enum/bitfield detection in property analysis:

```ocaml
type type_kind = Tk_Enum | Tk_Bitfield | Tk_Class | Tk_Interface | Tk_Record | Tk_Primitive | Tk_Unknown

val classify_type : ctx:generation_context -> gir_type -> type_kind
```

Same-namespace: checks `ctx.enums`/`ctx.bitfields` lists. Cross-namespace: checks `ctx.cross_references` entity `cr_type`.

---

## Phase 1: Refactor Code Generation for Clarity ✅ COMPLETED

### 1.1 Refactor `type_mappings.ml` ✅

**Completed differently than planned**: Instead of creating `type_resolution.ml` with separate lookup modules, the refactoring:
- Eliminated `type_resolution.ml` entirely (decision 2026-03-17)
- Extracted `find_class_mapping`, `find_interface_mapping`, `find_record_mapping`, `find_enum_mapping`, `find_bitfield_mapping` as separate functions
- Reduced `normal_type_lookup` from 250+ lines to ~28 lines using `or_else` chaining
- Distributed `type_resolution.ml` functions to their proper layers

### 1.2 Refactor `ml_interface.ml` (Layer 1) ✅

**Completed as planned**:
```
generate/layer1/
├── layer1_helpers.ml       # 180 lines: Type detection, hierarchy, utilities
├── layer1_constructor.ml   # 43 lines: Constructor generation
├── layer1_method.ml        # 79 lines: Method generation
├── layer1_property.ml      # 68 lines: Property getter/setter generation
└── layer1_main.ml          # 176 lines: Section orchestration + combined modules
```
`ml_interface.ml` is now a 10-line re-export wrapper.

### 1.3 Refactor `class_gen.ml` (Layer 2) ✅

**Completed with different naming** (`class_gen_*` instead of `layer2_*`):
```
generate/
├── class_gen.ml                    # 133 lines: Orchestration
├── class_gen_body.ml               # 115 lines: Class body generation
├── class_gen_method.ml             # 301 lines: Method wrapper generation
├── class_gen_property.ml           # 118 lines: Property method generation
├── class_gen_type_resolution.ml    # 112 lines: Type resolution helpers
├── class_gen_helpers.ml            # 67 lines: Common utilities
├── class_gen_conflict_detection.ml # 83 lines: Conflict detection
└── class_gen_converter.ml          # 23 lines: Converter generation
```

---

## Phase 2: Library-Specific Declaration Headers ✅ COMPLETED

Each library generates `<ns>_decls.h` with its own type converters and `#include` directives for dependency headers. External enum/bitfield forward declarations removed. Dune files include proper `(libraries ocgtk.<dep>)` dependencies.

**Key implementation details**:
1. Header naming: lowercase namespace (e.g., `gtk_decls.h`, `gdk_decls.h`)
2. GLib/GModule/GObject filtered from dependency includes
3. Library dependencies use `ocgtk.<ns>` pattern
4. No manual `-I` include paths needed — dune handles header availability

---

## Phase 3: Cross-Namespace OCaml Type Fixes ✅ COMPLETED

### 3.1 Cross-Namespace Infrastructure ✅

See "Cross-Namespace Reference System" section above for current data model.

### 3.2 Array Handling for Cross-Namespace Types

**Status**: Partially addressed. `find_type_mapping_for_gir_type` falls through to `find_cross_namespace_type_mapping` for array element types. Specific edge cases may remain.

### 3.3 Cross-Namespace OCaml Type Generation Bugs ✅ FIXED

Three original bugs (all fixed):

1. **Unqualified record types** → `map_cross_reference_to_type_mapping` now uses `external_namespace_to_module_name` to produce qualified paths like `Ocgtk_cairo.Cairo.Wrappers.Scaled_font.t`
2. **Unqualified enum types** → Cross-namespace enums produce `Ocgtk_cairo.Cairo.fonttype`
3. **Invalid Layer 2 class_module** → `layer2_class.class_module` set to `Ocgtk_<ns>.<Ns>` for cross-namespace; `class_gen_type_resolution.ml` uses fully-qualified path when modules differ

Three additional compilation bugs (fixed 2026-03-18):

4. **Wrapper modules flattened** → Changed from `include Ns` to `module Ns = Ns; include Ns` + core/ module scanning (GMain)
5. **Cross-namespace enum properties as pointer types** → Added `classify_type` to resolve enum/bitfield across namespaces in `c_stub_type_analysis.ml`
6. **Nullable array length variable scoping** → Hoisted `int length_var = 0` before if-block in `c_stub_array_conv.ml`

---

## Phase 4: Remove Cross-Namespace Filtering ✅ COMPLETED

All cross-namespace filtering has been removed:

| Item | Status |
|------|--------|
| `is_cross_namespace_enum_or_bitfield` | Removed from filtering.ml |
| `method_has_cross_namespace_types` | Removed from filtering.ml |
| `constructor_has_cross_namespace_types` | Removed from filtering.ml |
| Cross-namespace checks in `should_skip_method_binding` | Removed |
| Cross-namespace checks in `should_generate_constructor` | Removed |
| Cross-namespace checks in Layer 1/Layer 2 | Removed |
| `external_enums`/`external_bitfields` in `generation_context` | Removed |
| `library_module.ml` external enum/bitfield usage | Replaced by `cross_references` |

Methods with cross-namespace types are now generated normally. Type resolution via `find_type_mapping_for_gir_type` → `find_cross_namespace_type_mapping` handles them.

---

## Phase 5: Multi-Namespace Output Generation ✅ COMPLETED

Implemented via `scripts/generate-bindings.sh` (separate gir_gen invocation per namespace).

### Output Structure

```
src/
├── Cairo.ml              # include Ocgtk_cairo.Cairo
├── Gio.ml                # include Ocgtk_gio.Gio
├── Gdk.ml                # include Ocgtk_gdk.Gdk
├── Graphene.ml           # include Ocgtk_graphene.Graphene
├── Gdkpixbuf.ml          # include Ocgtk_gdkpixbuf.Gdkpixbuf
├── Pango.ml              # include Ocgtk_pango.Pango
├── PangoCairo.ml         # include Ocgtk_pangocairo.PangoCairo
├── Gsk.ml                # include Ocgtk_gsk.Gsk
├── Gtk.ml                # include Ocgtk_gtk.Gtk
├── GMain.ml              # include Ocgtk_gmain.GMain
│
├── cairo/generated/      # ocgtk_cairo (22 enums, 12 record type stubs)
├── gio/generated/        # ocgtk_gio
├── gdk/generated/        # ocgtk_gdk
├── graphene/generated/   # ocgtk_graphene
├── gdkpixbuf/generated/  # ocgtk_gdkpixbuf
├── pango/generated/      # ocgtk_pango
├── pangocairo/generated/ # ocgtk_pangocairo (2 interfaces: Font, FontMap)
├── gsk/generated/        # ocgtk_gsk
└── gtk/generated/        # ocgtk_gtk
```

Each `<ns>/generated/` directory contains:
- `ocgtk_<ns>.ml` — Library wrapper: `module <Ns> = <Ns>; include <Ns>` + core module aliases
- `<Ns>.ml` / `<Ns>.mli` — Combined library module with all re-exports
- `<ns>_decls.h` — C type converter declarations for this namespace
- Layer 1/2 `.ml`/`.mli` files — Individual class/record/interface bindings
- `ml_*_gen.c` — C FFI stubs
- `dune-generated.inc` — Build configuration

---

## Phase 6: Testing Strategy — Ongoing

### Existing Cross-Namespace Tests

Tests in `test_gir_gen/c_stubs/cross_namespace_tests.ml` (20 tests):
- Non-introspectable record/constructor/method filtering
- Copy function return types, record copy parsing
- Enum/bitfield array element conversion (validates converter macros)
- Inout record param pointer types, value record forward decls
- Fixed-size array out-params and float array returns
- Out-param array without length / double-pointer out-param skipping
- GdkPixbuf format flags guarding
- Cross-namespace C converter name casing

Tests in `test_gir_gen/cross_namespace/` (36 tests across 7 files):
- `c_stub_include_tests.ml` — header include generation
- `dune_library_deps_tests.ml` — library dependency generation
- `no_external_enum_decls_tests.ml` — no external enum forward declarations
- `no_external_bitfield_decls_tests.ml` — no external bitfield forward declarations
- `dependency_includes_tests.ml` — dependency header includes
- `dependency_exclusion_tests.ml` — base namespace (GLib/GModule/GObject) filtering
- `compilation_tests.ml` — C header structure and syntax validation
- `integration_tests.ml` — multi-library header generation chains

### Tests Still Needed

1. **`classify_type` unit tests** — dedicated tests for same-namespace (enum, bitfield, class, interface, record, primitive) and cross-namespace (enum, bitfield, class) classification. Currently only tested indirectly via C converter name casing.
2. **Cross-namespace array element type resolution** — validate that `find_type_mapping_for_gir_type` recursively resolves array element types through cross-namespace lookup (e.g. `GArray<Gdk.Texture>` producing correct OCaml type and C converters).

### Tests Dropped (redundant)

- ~~Wrapper module structure tests~~ — the `module Ns = Ns; include Ns` pattern described in the original plan is outdated. Current implementation uses pure module aliasing in `library_module.ml`, validated by CI compilation.
- ~~End-to-end compilation for all 9 namespaces~~ — CI already runs `dune build` across all 9 libraries on every push. A unit test replicating this adds no value.

---

## Phase 7: Layer 2 Class Type Separation (2026-03-20)

**Status**: Complete (2026-03-20)

Separated Layer 2 generated output into explicit `class type` definitions and `class` implementations constrained by those types. Class type references use plain `class_type_t` names (not `#class_type_t`, which introduces unbound type variables in class type definitions).

### Before

```ocaml
(* Combined: class types and implementations interleaved *)
class rec widget (obj : Widget.t) = object (self)
    method get_parent : unit -> <as_widget: Widget.t; ..> option = ...
end
and event_controller (obj : Event_controller.t) = object (self)
    method get_widget : unit -> <as_widget: Widget.t; ..> = ...
end
```

### After

```ocaml
(* Pass 1: class type definitions — self-referencing and mutual recursion allowed *)
class type widget_t = object
    method get_parent : unit -> widget_t option
    method as_widget : Widget.t
end
and event_controller_t = object
    method get_widget : unit -> widget_t
    method as_event_controller : Event_controller.t
end

(* Pass 2: class implementations constrained by types *)
class widget (obj : Widget.t) : widget_t = object (self)
    method get_parent () = Option.map (fun ret -> new widget ret) (Widget.get_parent obj)
    method as_widget = obj
end
and event_controller (obj : Event_controller.t) : event_controller_t = object (self)
    method get_widget () = new widget (Event_controller.get_widget obj)
    method as_event_controller = obj
end
```

### Key Design Decision: No `#` in Class Types

OCaml's `#class_type` syntax introduces a type variable, which is invalid in `class type` definitions (causes "unbound type variable" errors). Therefore:

- **Class type signatures** use plain `widget_t` (not `#widget_t`)
- **Class implementations** use plain `widget_t` (not `(#widget_t as 'pN)`)
- **Property setters** use plain `widget_t -> unit` (not `'a . (#widget_t as 'a) -> unit`)
- Callers must use explicit coercion `(btn :> widget_t)` when passing subtypes

### Key Changes

| File | Change |
|------|--------|
| `class_gen.ml` | Two-pass generation: class types first, then classes with `: type_t` constraint |
| `type_mappings.ml` | `class_type` field has `_t` suffix (e.g., `widget_t`); cross-namespace too |
| `class_gen_type_resolution.ml` | Added `resolve_layer2_class_name` — strips `_t` for `new` expressions; `convert_to_partial_object_type` is now identity |
| `class_gen_helpers.ml` | `structural_type_for_class` returns `widget_t` instead of structural type |
| `class_gen_method.ml` | Removed `#` prefix from all type references; removed same-cluster branching; `has_object_type` always false |
| `class_gen_property.ml` | Removed `#` prefix; setters use `class_ref -> unit` not `'a . (#class_ref as 'a) -> unit` |
| `library_module.ml` | Exports `class type cursor_t = GCursor.cursor_t` before `class cursor` |

### Why

OCaml `class type` definitions can self-reference (`widget_t` in its own body) and mutually recurse via `class type ... and ...`. Plain `class` definitions cannot. The previous structural type workaround (`<as_widget: Widget.t; ..>`) was fragile and verbose. The `#class_type` syntax cannot be used in class type definitions because it introduces unbound type variables.

---

## Remaining Work

### Hierarchy Removal (completed 2026-03-23)

The `hierarchy_info` abstraction has been fully removed. The 5 hardcoded
hierarchies and `hierarchy_detection.ml` were dead code — `classify_class`
always returned `MonomorphicType`. Parent chain (from `Crt_Class.parent`)
now drives polymorphic variant types in Layer 1. See
`architecture/object_polymorphism/object_polymorphism_design.md` for details.

### Method Count Impact (measured 2026-03-24)

Cross-namespace type resolution increased the total number of generated `external` bindings by **+305 net** (4647 → 4952):

| Namespace | Before | After | Delta | Notes |
|-----------|--------|-------|-------|-------|
| cairo | 0 | 0 | — | Enum/record stubs only (no GObject API) |
| gio | 932 | 897 | -35 | Filtering improvements (unsupported out-params) |
| gdk | 236 | 242 | +6 | |
| graphene | 104 | 104 | — | |
| gdkpixbuf | 61 | 56 | -5 | Filtering improvements |
| pango | 178 | 172 | -6 | Filtering improvements |
| pangocairo | 0 | 5 | +5 | New library (added during cross-ns work) |
| gsk | 175 | 212 | +37 | Many Graphene-typed methods unblocked |
| gtk | 2961 | 3264 | +303 | Largest gain — depends on most external namespaces |
| **Total** | **4647** | **4952** | **+305** | |

**+351 methods gained** from cross-namespace type resolution (methods previously filtered because they referenced types in other namespaces). **-46 methods removed** from improved filtering that now correctly skips unsupported parameter patterns (out-param arrays without length annotations, double-pointer out-params not marked as arrays in GIR).

Baseline commit: `d5f5890f` (merge before cross-namespace work began).

### Open Questions

1. **GLib special types priority**: After PtrArray, which GLib types are most important? (Candidates: List, SList, Variant, Bytes)

---

## References

- `scripts/generate-bindings.sh` - Build automation script
- `ocgtk/architecture/gir_gen/array_handling.md` - Array conversion documentation
- `ocgtk/STYLE_GUIDELINES.md` - OCaml code style guidelines
- `ocgtk/architecture/FFI_GUIDELINES.md` - C FFI guidelines
- `ocgtk/architecture/object_polymorphism/object_polymorphism_design.md` - Object polymorphism design and history
