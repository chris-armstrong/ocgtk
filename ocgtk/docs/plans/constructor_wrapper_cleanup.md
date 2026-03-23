# Plan: Constructor Wrapper Cleanup & Hierarchy Removal Completion

## Overview

Clean up the constructor wrapper implementation (code review issues from
`bdff2469`), then complete the remaining hierarchy removal work. Steps 1–4
are code quality fixes for the constructor wrappers commit. Steps 5–6
complete the hierarchy removal.

## Files Involved

### Constructor wrapper cleanup (Steps 1–4)
- `src/tools/gir_gen/utils.ml` — new naming helpers
- `src/tools/gir_gen/generate/class_gen.ml` — extract shared helpers, fix style
- `src/tools/gir_gen/generate/class_gen_helpers.ml` — naming helpers, remove dead code
- `src/tools/gir_gen/generate/library_module.ml` — use naming helpers
- `src/tools/gir_gen/gir_gen.ml` — use naming helpers
- `src/tools/gir_gen/type_mappings.ml` — use naming helpers
- `src/tools/gir_gen/generate/class_gen_converter.ml` — delete dead functions
- `src/tools/gir_gen/generate/class_gen_method.ml` — remove dead hierarchy check
- `src/tools/gir_gen/generate/class_gen_property.ml` — same
- `src/tools/gir_gen/generate/class_gen_type_resolution.ml` — same
- `src/tools/test_gir_gen/method_wrapper_tests.ml` — new constructor wrapper tests

### Hierarchy removal (Steps 5–6)
- `src/tools/gir_gen/hierarchy_helper.ml` — NEW: extracted parent chain resolver
- `src/tools/gir_gen/hierarchy_detection.ml` — DELETE
- `src/tools/gir_gen/types.ml` — remove hierarchy_kind, hierarchy_info, hierarchy_map
- `src/tools/gir_gen/generate/layer1/layer1_helpers.ml` — use parent chain
- `src/tools/gir_gen/generate/layer1/layer1_main.ml` — use parent chain
- `src/tools/gir_gen/generate/class_gen_body.ml` — remove ~hierarchy_info param
- `src/tools/gir_gen/generate/class_gen_converter.ml` — DELETE hierarchy functions
- Tests (multiple)

---

## Step 1: Add naming helpers to Utils and use them consistently ✅ DONE

### Problem

Name assembly uses raw string concatenation everywhere:
- `"G" ^ module_name` for Layer 2 module names (14+ occurrences across 4 files)
- `class_snake ^ "_t"` for class type names (15+ occurrences)
- `"as_" ^ class_name` for accessor names (3+ occurrences)
- `"g" ^ module_name` for Layer 2 filenames (4+ occurrences in gir_gen.ml)

These are naming conventions that should be centralised in `utils.ml`, matching
the existing pattern of `module_name_of_class`, `ocaml_class_name`, etc.

### Changes

#### 1a. Add helpers to `utils.ml`

```ocaml
(** Layer 2 module name for a class: "G" ^ Module_name.
    e.g., "Button" -> "GButton", "Window" -> "GWindow" *)
let layer2_module_name class_name =
  "G" ^ module_name_of_class class_name

(** Layer 2 module filename (lowercase): "g" ^ module_name.
    e.g., "Button" -> "gButton", "Window" -> "gWindow" *)
let layer2_module_filename class_name =
  "g" ^ module_name_of_class class_name

(** Class type name with _t suffix from a snake_case class name.
    e.g., "button" -> "button_t", "text_view" -> "text_view_t" *)
let class_type_name class_name =
  ocaml_class_name class_name ^ "_t"

(** Layer 1 accessor method name.
    e.g., "Button" -> "as_button", "TextView" -> "as_text_view" *)
let accessor_name class_name =
  "as_" ^ ocaml_class_name class_name
```

#### 1b. Replace raw concatenation across files

| File | Pattern | Replacement |
|------|---------|-------------|
| `class_gen.ml` | `"G" ^ combined_module_name` | `Utils.layer2_module_name combined_module_name` or appropriate variant |
| `class_gen.ml` | `class_snake ^ "_t"` | Use `Utils.class_type_name` where the input is a class name |
| `class_gen.ml` | `"G" ^ Utils.module_name_of_class entity.name` | `Utils.layer2_module_name entity.name` |
| `class_gen_helpers.ml` | `{ layer2 = "G" ^ layer1 }` | Use `Utils.layer2_module_name` |
| `class_gen_helpers.ml` | `"G" ^ class_snake ^ "_signals"` | Combine with naming helper |
| `library_module.ml` | `"G" ^ module_name` | `Utils.layer2_module_name name` |
| `gir_gen.ml` | `"g" ^ Utils.module_name_of_class ...` | `Utils.layer2_module_filename` |
| `gir_gen.ml` | `"G" ^ Utils.module_name_of_class ...` | `Utils.layer2_module_name` |
| `type_mappings.ml` | `"G" ^ class_module` in `calculate_layer2_class` | `Utils.layer2_module_name` (or keep, since it takes module not class) |
| `type_mappings.ml` | `class_name ^ "_t"`, `"as_" ^ class_name` | Use helpers |

Note: `class_gen_helpers.ml:sanitize_name` duplicates `Utils.ocaml_class_name`.
Remove it and use `Utils.ocaml_class_name` directly.

#### 1c. Verify

```bash
cd ocgtk && dune build
cd ocgtk && xvfb-run dune runtest
```

Regenerate bindings and diff to confirm no output changes:
```bash
bash scripts/generate-bindings.sh
git diff -- src/*/generated/
```

---

## Step 2: Extract constructor wrapper helpers to eliminate duplication ✅ DONE

### Problem

Constructor wrapper generation is copy-pasted 6 times in `class_gen.ml`:
- Standalone impl (lines 78–118)
- Standalone sig (lines 145–167)
- Combined impl (lines 254–301)
- Combined sig (lines 351–378)
- Cyclic shim impl (lines 396–453)
- Cyclic shim sig (lines 478–492)

~50 lines of shared logic (param info collection, unwrapping, signature
building) are duplicated across these blocks.

### Changes

#### 2a. Extract shared types and helpers

Add to `class_gen_helpers.ml` (or a new `class_gen_constructor.ml` if
class_gen_helpers.ml is getting too large):

```ocaml
type constructor_param_info = {
  param_name : string;
  param_type : string;
  is_class : bool;
  param : gir_param;
}

(** Collect parameter info for a constructor *)
let collect_constructor_param_info ~ctx ~current_layer2_module ctor =
  List.map ctor.ctor_parameters ~f:(fun param ->
    let param_name = Utils.ocaml_parameter_name param.param_name in
    let layer2_type = get_param_layer2_type ~ctx ~current_layer2_module param in
    let param_type = match layer2_type with
      | Some t -> t
      | None -> Layer1.Layer1_helpers.map_constructor_param ~ctx ~class_name:"" param
    in
    { param_name; param_type; is_class = Option.is_some layer2_type; param })

(** Generate parameter unwrapping let-bindings for class-typed params *)
let generate_param_unwrapping ~ctx ~buf params =
  List.iter params ~f:(fun pi ->
    if pi.is_class then begin
      let accessor = get_accessor_name ~ctx pi.param in
      if pi.param.nullable || pi.param.param_type.nullable then
        bprintf buf "  let %s = Option.map (fun c -> c#%s) %s in\n"
          pi.param_name accessor pi.param_name
      else
        bprintf buf "  let %s = %s#%s in\n"
          pi.param_name pi.param_name accessor
    end)

(** Generate a constructor wrapper implementation *)
let generate_constructor_wrapper_impl ~ctx ~buf ~class_snake ~class_type_name
    ~current_layer2_module ~layer1_ctor_path ctor =
  if not (Layer1.Layer1_constructor.should_generate_constructor ~ctx ctor) then ()
  else begin
    let ocaml_ctor_name = Utils.ocaml_constructor_name ~class_name:"" ctor in
    let params = collect_constructor_param_info ~ctx ~current_layer2_module ctor in
    match params with
    | [] ->
      bprintf buf "let %s () : %s =\n" ocaml_ctor_name class_type_name;
      bprintf buf "  new %s (%s.%s ())\n\n" class_snake layer1_ctor_path ocaml_ctor_name
    | _ ->
      let sig_str = String.concat ~sep:" "
        (List.map params ~f:(fun pi -> sprintf "(%s : %s)" pi.param_name pi.param_type)) in
      bprintf buf "let %s %s : %s =\n" ocaml_ctor_name sig_str class_type_name;
      generate_param_unwrapping ~ctx ~buf params;
      let call_str = String.concat ~sep:" "
        (List.map params ~f:(fun pi -> pi.param_name)) in
      bprintf buf "  new %s (%s.%s %s)\n\n" class_snake layer1_ctor_path ocaml_ctor_name call_str
  end

(** Generate a constructor wrapper signature *)
let generate_constructor_wrapper_sig ~ctx ~buf ~class_type_name
    ~current_layer2_module ctor =
  if not (Layer1.Layer1_constructor.should_generate_constructor ~ctx ctor) then ()
  else begin
    let ocaml_ctor_name = Utils.ocaml_constructor_name ~class_name:"" ctor in
    let params = collect_constructor_param_info ~ctx ~current_layer2_module ctor in
    match params with
    | [] ->
      bprintf buf "val %s : unit -> %s\n" ocaml_ctor_name class_type_name
    | _ ->
      let sig_str = String.concat ~sep:""
        (List.map params ~f:(fun pi -> sprintf "%s -> " pi.param_type)) in
      bprintf buf "val %s : %s%s\n" ocaml_ctor_name sig_str class_type_name
  end
```

#### 2b. Replace all 6 copy-pasted blocks with calls to the shared helpers

Each call site reduces to ~3-5 lines:
```ocaml
(* In generate_class_module *)
List.iter constructors ~f:(generate_constructor_wrapper_impl
  ~ctx ~buf ~class_snake ~class_type_name
  ~current_layer2_module:module_names.layer2
  ~layer1_ctor_path:module_names.layer1)
```

#### 2c. Fix double lookup

`get_param_layer2_type` is currently called twice per param (once in
`get_constructor_param_type`, once directly for `is_class`). The extracted
`collect_constructor_param_info` calls it once and derives both values.

#### 2d. Verify

Same as Step 1c — build, test, regenerate, diff.

---

## Step 3: Replace `List.length x = 0` with pattern matching ✅ DONE

### Problem

8 occurrences in new code use `List.length x = 0` (O(n)) instead of
idiomatic pattern matching.

### Changes

Replace all occurrences in `class_gen.ml` and `library_module.ml`:

```ocaml
(* Before *)
if List.length param_types = 0 then ...

(* After *)
match params with
| [] -> ...
| _ -> ...
```

Note: many of these will be eliminated by Step 2 (the extracted helpers
use `match params with [] -> ...`). Only fix remaining occurrences.

### Verify

Build and test.

---

## Step 4: Add constructor wrapper tests ✅ DONE

### Problem

Zero test coverage for constructor wrapper generation. All test changes
in the commit just add `~constructors:[]` to existing calls.

### Changes

Add to `method_wrapper_tests.ml` (or a new `constructor_wrapper_tests.ml`):

1. **Zero-param constructor** — generates `let new_ () : button_t = new button (Button.new_ ())`
2. **Single string param** — generates `let new_with_label (label : string) : button_t = ...`
3. **Class-typed param** — generates unwrapping `let child = child#as_widget in`
4. **Nullable class param** — generates `let child = Option.map (fun c -> c#as_widget) child in`
5. **Constructor signature (.mli)** — generates correct `val` declarations
6. **Combined module constructors** — constructor wrappers in cyclic module output
7. **Cyclic shim constructors** — constructor wrappers in shim module output

Each test should:
- Create a test context with appropriate classes/constructors
- Call the appropriate `generate_*` function
- Parse the output with `Ml_ast_helpers`
- Assert on the AST structure (presence of let bindings, correct types)

### Verify

```bash
cd ocgtk && xvfb-run dune runtest
```

---

## Step 5: Remove dead hierarchy_info code from Layer 2

### Problem

`hierarchy_info` is passed through Layer 2 generation but never used:
- `class_gen_body.ml` accepts `~hierarchy_info:_` (explicitly ignored)
- `class_gen_method.ml`, `class_gen_property.ml`, `class_gen_type_resolution.ml`
  call `get_param_hierarchy_info` but only check `Some _` vs `None` — both
  branches do equivalent work (both call `resolve_ocaml_type`)
- `class_gen_converter.ml` has `generate_hierarchy_converter_method_impl/sig`
  that are defined but **never called anywhere**
- `get_param_hierarchy_info` in `class_gen_helpers.ml` is only used by the
  above three files

### Changes

#### 5a. Delete dead converter functions

In `class_gen_converter.ml`, delete `generate_hierarchy_converter_method_impl`
and `generate_hierarchy_converter_method_sig` (confirmed: never called).

#### 5b. Collapse dead branches in Layer 2 method/property/type resolution

In `class_gen_method.ml`, `class_gen_property.ml`,
`class_gen_type_resolution.ml`: remove the `get_param_hierarchy_info` call
and `match hier_opt with Some _ -> ... | None -> ...` branching. Both
branches are functionally equivalent — collapse to the single code path.

#### 5c. Remove `~hierarchy_info` parameter from Layer 2

Remove `~hierarchy_info` parameter from:
- `generate_class_module_body` and `generate_class_signature_body` in
  `class_gen_body.ml` (already `~hierarchy_info:_`)
- `generate_combined_entities` in `class_gen.ml`
- All `generate_class_type` / `generate_class_impl` / `generate_class_decl`
  local functions in `class_gen.ml`
- All callers in `class_gen.ml` (6+ call sites)

Remove `Hierarchy_detection.get_hierarchy_info` calls from `class_gen.ml`.

#### 5d. Delete `get_param_hierarchy_info` from `class_gen_helpers.ml`

No remaining callers after 5b.

#### 5e. Verify

Build, test, regenerate, diff (no output changes expected).

---

## Step 6: Complete hierarchy removal — migrate Layer 1 and delete

### Problem

`layer1_helpers.ml` and `layer1_main.ml` are the only **genuine** consumers
of `hierarchy_info`. They use it to:
- Determine if a class belongs to a known hierarchy (Widget, EventController, etc.)
- Generate polymorphic variant type chains
- Generate accessor methods (`as_widget`)

These can be replaced by walking the parent chain (already available via
`Crt_Class { parent }` and `gir_class.parent`).

### Changes

#### 6a. Extract parent chain resolver

Create `hierarchy_helper.ml` by extracting `build_parent_chain` from
`hierarchy_detection.ml`:

```ocaml
val resolve : generation_context -> string -> string list option
val has_ancestor : generation_context -> class_name:string -> ancestor:string -> bool
```

#### 6b. Parse interface prerequisites

Add `prerequisites : string list` to `gir_interface` in `types.ml`.
Update `Crt_Interface` to `Crt_Interface of { prerequisites : string list }`.
Parse `<prerequisite>` elements in `gir_parser.ml`.
Update `gir_gen.ml` to populate prerequisites in cross-references.

#### 6c. Migrate layer1_helpers.ml

Replace `Hierarchy_detection.get_hierarchy_info` call in
`detect_class_hierarchy_names` with `Hierarchy_helper.resolve` to walk the
parent chain and build the polymorphic variant type chain.

#### 6d. Migrate layer1_main.ml

Replace `Hierarchy_detection.get_hierarchy_info` call in
`generate_hierarchy_accessor_section` with parent chain + type_mapping
lookup to derive accessor method names.

#### 6e. Delete hierarchy_detection.ml

Remove the file. Remove `hierarchy_kind`, `hierarchy_info`,
`hierarchy_map` from `types.ml` and `generation_context`.

#### 6f. Update all tests

Update test helpers that construct `generation_context` (remove
`hierarchy_map`). Update test assertions that reference hierarchy types.

#### 6g. Regenerate and verify

```bash
bash scripts/generate-bindings.sh
cd ocgtk && dune build
cd ocgtk && xvfb-run dune runtest
```

Diff generated output to verify correctness.

---

## Verification Strategy

After each step:
1. `cd ocgtk && dune build` — must compile cleanly
2. `cd ocgtk && xvfb-run dune runtest` — all tests pass
3. After Steps 1–2 and 5–6: regenerate bindings and `git diff` generated
   output to confirm no changes (these are internal refactors)
4. After Step 4: new tests pass
