# Plan: Remove hierarchy_info Abstraction

## Problem

The `hierarchy_kind` enum and `hierarchy_info` record in `types.ml` are a
hardcoded abstraction that doesn't scale. Five specific GTK hierarchies
(Widget, EventController, CellRenderer, LayoutManager, Expression) are
hardcoded in `hierarchy_detection.ml`. This causes:

1. **Cross-namespace bug**: Layer 2 wrappers (gXxx.ml) fail to call `#as_xxx`
   on cross-namespace class parameters because `hierarchy_map` only contains
   classes from the current namespace. The result is type errors like
   `Ocgtk_cairo.context` vs `Ocgtk_cairo.Wrappers.Context.t`.

2. **Unnecessary complexity**: Everything `hierarchy_info` provides is
   derivable from the parent chain (already on `gir_class.parent`) and
   `type_mapping.layer2_class` (already has accessor info).

3. **Missing data**: Cross-reference entities (`cross_reference_entity`) don't
   store parent info, so cross-namespace parent chain resolution is impossible.

## Goal

Replace `hierarchy_info`/`hierarchy_kind`/`hierarchy_map` with:
- Parent info stored on `Crt_Class` (and `Crt_Interface` for prerequisites)
- A unified parent chain resolver that walks across namespaces
- Direct use of `type_mapping.layer2_class` for param unwrapping

## Files Involved

### Types and Infrastructure
- `src/tools/gir_gen/types.ml` — Remove `hierarchy_kind`, `hierarchy_info`,
  `hierarchy_map` from `generation_context`. Add parent to `Crt_Class`.
- `src/tools/gir_gen/hierarchy_detection.ml` — Remove entirely (or repurpose
  as `parent_chain.ml`)
- `src/tools/gir_gen/type_mappings.ml` — No changes expected

### Parsing and Sexp Generation
- `src/tools/gir_gen/gir_gen.ml` — Copy `cls.parent` into `Crt_Class` when
  building cross-reference entities. Remove `hierarchy_map` construction.

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

### Step 1: Expand cross_reference_type to store parent info

**Changes:**

1. In `types.ml`, change `Crt_Class` to carry parent:
   ```ocaml
   type cross_reference_type =
     | Crt_Class of { parent : string option }
     | Crt_Interface
     | Crt_Record of { opaque : bool }
     | Crt_Enum
     | Crt_Bitfield
   ```

2. In `gir_gen.ml`, when building cross-reference entities for classes,
   include the parent:
   ```ocaml
   cr_type = Crt_Class { parent = cls.parent };
   ```

3. Also add interfaces to cross-reference entities (currently missing).

4. Update all pattern matches on `Crt_Class` across the codebase to handle
   the new payload (notably `type_mappings.ml`).

5. Update all tests that construct `Crt_Class` values.

6. Build and run tests.

### Step 2: Build unified parent chain resolver

Create `parent_chain.ml` (replacing `hierarchy_detection.ml`) with:

```ocaml
(** Walk the parent chain for a class, crossing namespace boundaries.
    Returns [parent; grandparent; ...] up to root. *)
val resolve : generation_context -> string -> string list

(** Check if a class has a given ancestor. *)
val has_ancestor : generation_context -> class_name:string -> ancestor:string -> bool
```

The resolver:
- Checks `ctx.classes` for current-namespace classes
- Checks `ctx.cross_references` for cross-namespace classes (using
  `Crt_Class { parent }`)
- Recursively walks until `parent = None` or class not found

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

### Step 6: Remove hierarchy_info, hierarchy_kind, hierarchy_map

- Delete `hierarchy_kind` and `hierarchy_info` from `types.ml`
- Remove `hierarchy_map` from `generation_context`
- Delete or repurpose `hierarchy_detection.ml`
- Update all call sites and tests

### Step 7: Regenerate bindings and verify

```bash
bash scripts/generate-bindings.sh
cd ocgtk && dune build
cd ocgtk && xvfb-run dune runtest
```

## Verification

After each step:
1. `cd ocgtk && dune build` must succeed (or only fail on expected issues)
2. `cd ocgtk && xvfb-run dune runtest` must pass

After Step 7:
- All layer 2 cross-namespace type errors must be resolved
- No regressions in existing tests
- Generated code compiles cleanly
