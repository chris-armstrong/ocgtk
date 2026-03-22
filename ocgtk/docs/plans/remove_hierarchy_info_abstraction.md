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
- **Parent-based inheritance**: `class_gen_body.ml` uses `~parent_name`
  for generating `inherit` lines. `~hierarchy_info` is accepted but ignored.
- **Conflict suppression**: `class_gen_conflict_detection.ml` walks the
  ancestor chain to suppress re-declared methods via a `seen` set.

### What remains

1. **Layer 2 dead code**: `hierarchy_info` is passed through Layer 2 but
   never used. `get_param_hierarchy_info` is called in 3 files but both
   `Some`/`None` branches do equivalent work. `class_gen_converter.ml` has
   hierarchy functions that are never called. All of this can be deleted.

2. **Layer 1 live usage**: `layer1_helpers.ml` and `layer1_main.ml` are the
   **only genuine consumers** of `hierarchy_info`. They use it to determine
   polymorphic variant types and generate accessor methods.

3. **Missing interface prerequisites**: `Crt_Interface` and `gir_interface`
   don't carry prerequisite info.

## Goal

Replace `hierarchy_info`/`hierarchy_kind`/`hierarchy_map` with:
- Parent info on `Crt_Class` (**done**) and prerequisites on `Crt_Interface`
- A parent chain resolver extracted from `hierarchy_detection.ml`
- Direct use of `type_mapping.layer2_class` for param unwrapping

## Steps

### Step 1: Expand cross_reference_type to store parent info ✅ DONE

`Crt_Class` now carries `{ parent : string option }`. `gir_gen.ml` populates
it from `cls.parent`. All pattern matches and tests updated.

### Step 2: Migrate Layer 2 inheritance to parent chain ✅ DONE

Parent class inheritance generated in `class_gen_body.ml` using the entity's
direct parent name. `inherit parent_t` in class types, `inherit parent
(Obj.magic obj : Parent.t)` in implementations. Skips parent inherit when
parent is in the same cyclic cluster. Conflict suppression via
`collect_inherited_method_names`.

### Step 3: Remove dead hierarchy_info code from Layer 2

**Status: Not started**

See [constructor_wrapper_cleanup.md](./constructor_wrapper_cleanup.md) Step 5.

Summary:
- Delete dead `generate_hierarchy_converter_method_impl/sig` from
  `class_gen_converter.ml` (never called)
- Collapse dead `get_param_hierarchy_info` branches in
  `class_gen_method.ml`, `class_gen_property.ml`,
  `class_gen_type_resolution.ml` (both branches equivalent)
- Remove `~hierarchy_info` parameter from `class_gen_body.ml`,
  `class_gen.ml`, and all Layer 2 callers
- Delete `get_param_hierarchy_info` from `class_gen_helpers.ml`

### Step 4: Migrate Layer 1 and delete hierarchy_detection.ml

**Status: Not started**

See [constructor_wrapper_cleanup.md](./constructor_wrapper_cleanup.md) Step 6.

Summary:
- Extract `build_parent_chain` → `hierarchy_helper.ml`
- Add `prerequisites` to `gir_interface`/`Crt_Interface`, parse
  `<prerequisite>` in `gir_parser.ml`
- Migrate `layer1_helpers.ml` (polymorphic variant types) to use parent chain
- Migrate `layer1_main.ml` (accessor generation) to use parent chain
- Delete `hierarchy_detection.ml`
- Remove `hierarchy_kind`, `hierarchy_info`, `hierarchy_map` from `types.ml`
- Update all tests, regenerate bindings

## Files Involved

### Types and Infrastructure
- `src/tools/gir_gen/types.ml` — Remove `hierarchy_kind`, `hierarchy_info`,
  `hierarchy_map` from `generation_context`
- `src/tools/gir_gen/hierarchy_helper.ml` — NEW: extracted parent chain resolver
- `src/tools/gir_gen/hierarchy_detection.ml` — DELETE after migration

### Layer 2 Generation (Step 3 — dead code removal)
- `src/tools/gir_gen/generate/class_gen.ml` — Remove hierarchy_info threading
- `src/tools/gir_gen/generate/class_gen_body.ml` — Remove ~hierarchy_info param
- `src/tools/gir_gen/generate/class_gen_converter.ml` — Delete dead functions
- `src/tools/gir_gen/generate/class_gen_helpers.ml` — Delete get_param_hierarchy_info
- `src/tools/gir_gen/generate/class_gen_method.ml` — Collapse dead branches
- `src/tools/gir_gen/generate/class_gen_property.ml` — Same
- `src/tools/gir_gen/generate/class_gen_type_resolution.ml` — Same

### Layer 1 Generation (Step 4 — actual migration)
- `src/tools/gir_gen/generate/layer1/layer1_helpers.ml` — Use parent chain
- `src/tools/gir_gen/generate/layer1/layer1_main.ml` — Use parent chain

### Parsing (Step 4)
- `src/tools/gir_gen/parse/gir_parser.ml` — Parse `<prerequisite>`
- `src/tools/gir_gen/gir_gen.ml` — Populate `Crt_Interface` prerequisites

## Verification

After each step:
1. `cd ocgtk && dune build` must succeed
2. `cd ocgtk && xvfb-run dune runtest` must pass
3. Regenerate bindings and diff — no output changes for Step 3 (dead code
   removal); Step 4 may change accessor generation
