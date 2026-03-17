# Plan: Remove hierarchy_info Abstraction

## Problem

The `hierarchy_kind` enum and `hierarchy_info` record in `types.ml` are a
hardcoded abstraction that doesn't scale. Five specific GTK hierarchies
(Widget, EventController, CellRenderer, LayoutManager, Expression) are
hardcoded in `hierarchy_detection.ml`.

### What's been fixed

- **Cross-namespace resolution now works**: `hierarchy_detection.ml` was
  updated (commit `718effc9`) so that `build_parent_chain`,
  `get_hierarchy_info`, and `classify_external_class` all walk
  `ctx.cross_references` for classes outside the current namespace.
- **Parent info on Crt_Class**: `Crt_Class` now carries
  `{ parent : string option }`, so cross-namespace parent chain resolution
  works.

### What remains

1. **Unnecessary complexity**: Everything `hierarchy_info` provides is
   derivable from the parent chain (already on `gir_class.parent` and
   `Crt_Class.parent`) and `type_mapping.layer2_class` (already has accessor
   info). The `hierarchy_kind` enum, `hierarchy_info` record,
   `base_hierarchy_definitions`, `build_hierarchy_definitions`, and
   `hierarchy_map` are all redundant layers.

2. **Hardcoded hierarchy roots**: The five GTK-specific hierarchies
   (Widget, EventController, CellRenderer, LayoutManager, Expression) are
   still hardcoded in `base_hierarchy_definitions`. Adding a new hierarchy
   root requires editing this list rather than being derived automatically.

3. **Missing interface prerequisites**: `Crt_Interface` and `gir_interface`
   don't carry prerequisite info, which will be needed for complete
   cross-namespace interface resolution.

## Goal

Replace `hierarchy_info`/`hierarchy_kind`/`hierarchy_map` with:
- Parent info on `Crt_Class` (**done**) and prerequisites on `Crt_Interface`
- A unified parent chain resolver that walks across namespaces (note:
  `build_parent_chain` in `hierarchy_detection.ml` already does this — the
  goal is to extract it into a standalone module and remove the surrounding
  hierarchy_info machinery)
- Direct use of `type_mapping.layer2_class` for param unwrapping

## Files Involved

### Types and Infrastructure
- `src/tools/gir_gen/types.ml` — Remove `hierarchy_kind`, `hierarchy_info`,
  `hierarchy_map` from `generation_context`. Add parent to `Crt_Class`, add
  prerequisites to `Crt_Interface` and `gir_interface`.
- `src/tools/gir_gen/hierarchy_helper.ml` — NEW FILE: unified parent chain resolver
- `src/tools/gir_gen/hierarchy_detection.ml` — REMOVE after migration
- `src/tools/gir_gen/type_mappings.ml` — No changes expected

### Parsing and Sexp Generation
- `src/tools/gir_gen/parse/gir_parser.ml` — Parse `<prerequisite>` in interfaces
- `src/tools/gir_gen/gir_gen.ml` — Populate `Crt_Interface` with prerequisites,
  copy `cls.parent` into `Crt_Class`. Remove `hierarchy_map` construction.

### Layer 2 Generation (the bug fix)
- `src/tools/gir_gen/generate/class_gen_method.ml` — Use `type_mapping.layer2_class`
  instead of `hierarchy_info` for param unwrapping
- `src/tools/gir_gen/generate/class_gen_property.ml` — Same
- `src/tools/gir_gen/generate/class_gen_type_resolution.ml` — Same
- `src/tools/gir_gen/generate/class_gen_helpers.ml` — Remove `get_param_hierarchy_info`
- `src/tools/gir_gen/generate/class_gen_body.ml` — Use parent chain for
  `inherit` lines
- `src/tools/gir_gen/generate/class_gen_converter.ml` — Derive from parent
  chain instead of hierarchy_info

### Layer 1 Generation
- `src/tools/gir_gen/generate/layer1/layer1_helpers.ml` — Use parent chain
  for polymorphic variant type building
- `src/tools/gir_gen/generate/layer1/layer1_main.ml` — Use parent chain for
  accessor generation

### Tests
- `src/tools/test_gir_gen/method_wrapper_tests.ml`
- `src/tools/test_gir_gen/infrastructure/helpers.ml`
- `src/tools/test_gir_gen/infrastructure/layer2_helpers.ml`
- `src/tools/test_gir_gen/integration/signals.ml`
- `src/tools/test_gir_gen/cross_namespace/integration_tests.ml`
- `src/tools/test_gir_gen/cross_namespace/no_external_bitfield_decls_tests.ml`
- `src/tools/test_gir_gen/cross_namespace/no_external_enum_decls_tests.ml`
- `src/tools/test_gir_gen/c_stubs/header_generation_tests.ml`
- `src/tools/test_gir_gen/c_stubs/header_naming_tests.ml`
- `src/tools/test_gir_gen/c_stubs/cross_namespace_tests.ml`

## Steps

### Step 1: Expand cross_reference_type to store parent info ✅ DONE

`Crt_Class` now carries `{ parent : string option }`. `gir_gen.ml` populates
it from `cls.parent`. All pattern matches and tests updated.

Additionally, `hierarchy_detection.ml` was updated (commit `718effc9`) to use
`ctx.cross_references` for cross-namespace resolution:
- `build_parent_chain` walks both `ctx.classes` and `ctx.cross_references`
- `get_hierarchy_info` delegates to `classify_external_class` for non-local
  classes
- `classify_external_class` looks up entities in cross-references and builds
  `hierarchy_info` for external classes/interfaces/records

### Step 2: Build unified parent chain resolver

**Goal:** Create `hierarchy_helper.ml` with functions for walking parent chains
across namespaces, parsing interface prerequisites, and updating cross-reference
types.

#### 2a. Update types.ml

1. Add `prerequisites : string list` to `gir_interface`:
   ```ocaml
   type gir_interface = {
     interface_name : string;
     c_type : string;
     c_symbol_prefix : string;
     prerequisites : string list;  (* NEW *)
     methods : gir_method list;
     properties : gir_property list;
     signals : gir_signal list;
     interface_doc : string option;
   }
   ```

2. Update `Crt_Interface` to carry prerequisites:
   ```ocaml
   type cross_reference_type =
     | Crt_Class of { parent : string option }
     | Crt_Interface of { prerequisites : string list }  (* UPDATED *)
     | Crt_Record of { opaque : bool }
     | Crt_Enum
     | Crt_Bitfield
   ```

3. Update `entity_of_interface` in `types.ml` to include prerequisites in the
   `entity` type (note: `entity.parent` for interfaces should remain `None`,
   prerequisites are separate).

#### 2b. Update gir_parser.ml

Parse `<prerequisite name="..."/>` elements in interface definitions:

```ocaml
(* In parse_interface, add prerequisite collection *)
let prerequisites = ref [] in
(* Add case in parse_class_contents for "prerequisite" tag *)
| "prerequisite" ->
    (match get_attr "name" tag_attrs with
     | Some name -> prerequisites := name :: !prerequisites
     | None -> ());
    skip_element input 1;
    parse_class_contents ()

(* Return interface with prerequisites *)
{
  interface_name = name;
  c_type;
  c_symbol_prefix = name;
  prerequisites = List.rev !prerequisites;  (* NEW*)
  methods;
  properties = List.rev !properties;
  signals = List.rev !signals;
  interface_doc = None;
}
```

#### 2c. Update gir_gen.ml

When building cross-reference entities for interfaces, populate prerequisites:
```ocaml
@ (interfaces
  |> List.map ~f:(fun intf ->
      {cr_name = intf.interface_name;
       cr_type = Crt_Interface { prerequisites = intf.prerequisites };
       cr_c_type = intf.c_type;
      }))
```

#### 2d. Create hierarchy_helper.ml

New module `src/tools/gir_gen/hierarchy_helper.ml`:

```ocaml
(** Parent chain resolution across namespaces.

    Provides functions to walk class inheritance chains, crossingnamespace
    boundaries using cross-reference entities. *)

(** Get the parent of a class from current namespace or cross-references.
    Returns:
    - Some (Some parent) if class found with a parent
    - Some None if class found but has no parent (root class)
    - None if class not found anywhere *)
val get_parent : generation_context -> string -> string option option

(** Walk the parent chain for a class, crossing namespace boundaries.
    Returns [parent; grandparent; ...root] or None if entity not found.
    Only works for classes (interfaces don't have a linear parent chain). *)
val resolve : generation_context -> string -> string list option

(** Check if a class has a given ancestor in its inheritance chain. *)
val has_ancestor : generation_context -> class_name:string -> ancestor:string -> bool
```

Implementation:
- `get_parent` checks `ctx.classes` first, then `ctx.cross_references`
- For cross-references, extracts parent from `Crt_Class { parent }`
- `resolve` recursively walks using `get_parent`
- `has_ancestor` uses `resolve` and checks if ancestor is in the chain

#### 2e. Remove hierarchy_info/hierarchy_kind/hierarchy_map

1. Delete `hierarchy_kind` and `hierarchy_info` from `types.ml`
2. Remove `hierarchy_map` from `generation_context`
3. Update all call sites:

| File | Change |
|------|--------|
| `class_gen_helpers.ml` | Remove `get_param_hierarchy_info`, use `Type_mappings` directly |
| `class_gen_method.ml` | Replace `get_param_hierarchy_info` with `Type_mappings.find_type_mapping_for_gir_type` |
| `class_gen_property.ml` | Same |
| `class_gen_type_resolution.ml` | Same |
| `class_gen_converter.ml` | Remove `hierarchy_info` parameter, derive accessor from parent chain or remove |
| `class_gen_body.ml` | Remove `hierarchy_info` parameter, derive from parent |
| `class_gen.ml` | Remove `hierarchy_info` propagation |
| `layer1_main.ml` | Use `Hierarchy_helper.resolve` instead of `get_hierarchy_info` |
| `layer1_helpers.ml` | Same|

4. Delete `hierarchy_detection.ml`
5. Update all tests

#### 2f. Update tests

Update all test files that construct `Crt_Class`/`Crt_Interface`:
- `test_gir_gen/infrastructure/helpers.ml`
- `test_gir_gen/method_wrapper_tests.ml`
- `test_gir_gen/infrastructure/layer2_helpers.ml`

#### 2g. Build and test

```bash
cd ocgtk && dune build
cd ocgtk && xvfb-run dune runtest
```

### Step 3: Fix layer 2 param unwrapping using type_mapping

In `class_gen_method.ml`, replace the hierarchy-based unwrapping with
`type_mapping.layer2_class`-based unwrapping:

- For each method parameter, check `Type_mappings.find_type_mapping_for_gir_type`
- If it returns `Some { layer2_class = Some lc; _ }`, the parameter is a
  class/interface/record that needs unwrapping via `lc.class_layer1_accessor`
- Generate `let param = param#as_xxx in` (or `Option.map` for nullable)
- This works identically for same-namespace and cross-namespace types

Apply same pattern to `class_gen_property.ml` and `class_gen_type_resolution.ml`.

### Step 4: Migrate layer 2 inheritance to parent chain

In `class_gen_body.ml`, replace `hierarchy_info`-based `inherit` generation
with parent-chain-based logic:
- Use `parent_chain.resolve` to find the immediate parent
- Derive the skel class name and module from the parent name
- Generate `inherit GParent.parent_skel (Layer1.as_parent obj)`

### Step 5: Migrate layer 1 type/accessor generation

In `layer1_helpers.ml` and `layer1_main.ml`:
- Use `parent_chain.resolve` to build the polymorphic variant chain
- Remove `hierarchy_kind` string labels ("Widget", "Event controller", etc.)
- Keep the same variant structure but derive it from parent chain

### Step 6: Regenerate bindings and verify

```bash
bash scripts/generate-bindings.sh
cd ocgtk && dune build
cd ocgtk && xvfb-run dune runtest
```

## Verification

After each step:
1. `cd ocgtk && dune build` must succeed (or only fail on expected issues)
2. `cd ocgtk && xvfb-run dune runtest` must pass

After Step 6:
- All layer 2 cross-namespace type errors must be resolved
- No regressions in existing tests
- Generated code compiles cleanly