# Plan: Test Cases for Bug Fixes in Cross-Namespace Bindings

## Context

Five categories of bugs were fixed in the `gir_gen` code generator during the `cross-namespace-2` branch. These fixes prevent build errors in the generated GTK/GDK/Pango bindings but currently have incomplete or missing test coverage. This plan adds targeted tests for each category.

## Bugs Fixed & Tests Needed

| Bug | Fix location | Coverage status |
|-----|-------------|----------------|
| Wrong C converter name casing (`GdkpixbufColorspace_val`) | `type_mappings.ml` | **Missing** |
| CAMLxparam overflow (>5 params) for methods | `c_stub_method.ml`, `c_stub_constructor.ml` | Partial (constructor only, no content check) |
| GdkPixbufFormatFlags forward decl guard | `c_stub_bitfield.ml` | **Missing** |
| Array null-termination for non-pointer arrays | `c_stub_array_conv.ml` | **Missing** |
| `generate_methods` crashing on Failure | `c_stub_helpers.ml` | **Missing** |
| `filtering.ml` out-param array detection | `filtering.ml` | **Missing** |

---

## Tests to Add

### 1. `cross_namespace_tests.ml` — C converter name casing (type_mappings.ml fix)

**New test: `test_cross_namespace_c_converter_names`**

Create a context where a method parameter uses an enum from the `GdkPixbuf` namespace. Generate the C stub and verify the converter functions use raw namespace prefix (`GdkPixbuf`), not the dune-lowercased form (`Gdkpixbuf`).

- Build a context with a cross-namespace enum (`GdkPixbuf.Colorspace`, `c_type = "GdkColorspace"`)
- Generate C method with `generate_c_method`
- Assert generated code contains `GdkPixbufColorspace_val` (not `GdkpixbufColorspace_val`)

Uses `Gir_gen_lib.Generate.C_stub_method.generate_c_method`. Context needs `ctx.enums` populated with a cross-namespace enum.

### 2. `cross_namespace_tests.ml` — Out-param array filtering (filtering.ml fix)

**New test: `test_out_param_array_without_length_skipped`**

Create a method with an Out-direction parameter that is an array with `zero_terminated=false` and no `length`/`fixed_size`. Verify `should_skip_method_binding` returns `true`.

```ocaml
let param = { direction = Out; param_type = { array = Some {
    zero_terminated = false; length = None; fixed_size = None; ... }; ... }; ... }
let meth = { ... parameters = [param]; ... }
assert (Filtering.should_skip_method_binding ~ctx meth = true)
```

**New test: `test_double_pointer_out_param_skipped`**

Create a method with an Out-direction parameter with `c_type = "SomeType**"` and `array = None` (not marked as an array in GIR, like `pango_tab_array_get_tabs`). Verify `should_skip_method_binding` returns `true`.

**New test: `test_normal_out_param_not_skipped`** (negative control)

Out-direction array with a `length` parameter index should NOT be skipped.

### 3. `c_stubs_tests.ml` — CAMLxparam overflow for methods

**New test: `test_method_many_params`**

Mirror of existing `test_constructor_many_params` but for methods. Create a method with 6 `gint` in-parameters. Verify two functions generated (native + bytecode).

**New test: `test_method_camlxparam_chunking`**

Create a method with 11 parameters. Verify:
- Two functions generated
- Generated code does NOT contain `CAMLxparam6` or higher (which don't exist in OCaml runtime)
- Generated code contains `CAMLparam5` + `CAMLxparam5` + `CAMLxparam1`

Uses string search in generated C code (C parser doesn't parse macros).

### 4. `cross_namespace_tests.ml` — GdkPixbufFormatFlags guard (c_stub_bitfield.ml fix)

**New test: `test_gdkpixbuf_format_flags_guarded`**

Call `Gir_gen_lib.Generate.C_stub_bitfield.generate_forward_decls` directly with a bitfield whose `bitfield_c_type = "GdkPixbufFormatFlags"`. Verify the output string:
- Contains `#ifndef GDK_PIXBUF_FORMAT_WRITABLE`
- Contains `#endif`
- The converter prototypes (`Val_GdkPixbufFormatFlags`, `GdkPixbufFormatFlags_val`) appear between the guard

Also test negative: a normal bitfield does NOT get the guard.

### 5. `array_tests.ml` — Non-pointer array null-termination fix (c_stub_array_conv.ml fix)

**New test: `test_nonpointer_array_without_length_raises`**

Create a method whose return type is an array with:
- `element_type.c_type = Some "gint"` (non-pointer)
- `zero_terminated = false`
- `length = None`, `fixed_size = None`

Verify calling `generate_c_method` raises `Failure` with the descriptive error message:

```ocaml
Alcotest.check_raises "Fails for non-pointer array without length"
  (Failure "Array has no length information...")
  (fun () -> ignore (generate_c_method ~ctx ~c_type:"..." meth "..."))
```

**New test: `test_pointer_array_without_length_uses_null_termination`** (negative control)

Return type array with `element_type.c_type = Some "char*"` (pointer) and no length. Verify generated code uses NULL-termination (`!= NULL`), no failure.

### 6. `array_tests.ml` — generate_methods catches Failure (c_stub_helpers.ml fix)

**New test: `test_generate_methods_skips_failing_method`**

Build a class with two methods:
- A valid method (simple void return)
- A method whose return type is a `gint` array without length info (will raise `Failure`)

Generate via `C_stub_helpers.Method_gen.generate_methods`. Verify:
- No exception propagates out
- The valid method IS in the output
- The failing method is NOT in the output

---

## File Placement

| Test | File |
|------|------|
| C converter name casing | `c_stubs/cross_namespace_tests.ml` |
| Out-param array filtering (3 tests) | `c_stubs/cross_namespace_tests.ml` |
| Method 6+ params native/bytecode | `c_stubs/c_stubs_tests.ml` |
| Method 11-param CAMLxparam chunking | `c_stubs/c_stubs_tests.ml` |
| GdkPixbufFormatFlags guard | `c_stubs/cross_namespace_tests.ml` |
| Non-pointer array Failure | `c_stubs/array_tests.ml` |
| Pointer array null-termination | `c_stubs/array_tests.ml` |
| generate_methods skips failing method | `c_stubs/array_tests.ml` |

No new files needed — all tests extend existing modules. No dune changes needed.

---

## Key Functions & Types

**Generator functions:**
- `Gir_gen_lib.Generate.C_stub_method.generate_c_method ~ctx ~c_type meth class_name`
- `Gir_gen_lib.Generate.C_stub_bitfield.generate_forward_decls ~namespace_prefix ~gtk_bitfields ~external_bitfields`
- `Gir_gen_lib.Generate.Filtering.should_skip_method_binding ~ctx meth`
- `Gir_gen_lib.Generate.C_stub_helpers.Method_gen.generate_methods ...`

**Test helpers:**
- `Helpers.create_test_context ()` — creates minimal GTK context
- `C_parser.parse_c_code c_code` — parse generated C into AST
- `C_ast.find_function functions name`

**Critical type fields:**
```ocaml
(* gir_array *)
zero_terminated: bool
length: int option          (* None = no explicit length param *)
fixed_size: int option

(* gir_param *)
direction: In | Out | InOut
param_type.c_type: string option   (* "SomeType**" = double pointer *)
param_type.array: gir_array option (* None = not marked as array in GIR *)
```

## Implementation Order

Add tests one at a time, running `cd ocgtk && dune build && xvfb-run dune runtest` after each. Append each test to the `tests` list at the bottom of its file.

1. Filtering tests — pure logic, no C parsing, fastest to write and verify
2. Bitfield guard test — direct string check on `generate_forward_decls` output
3. Array Failure test — use `Alcotest.check_raises`
4. CAMLxparam chunking — string search in generated code
5. C converter name test — needs cross-namespace context setup
6. `generate_methods` resilience — requires multi-method class setup

## Verification

```bash
cd ocgtk && dune build && xvfb-run dune runtest
```

Target: ~9 new passing tests added to the existing 160, all appearing under `GIR Generator` in the test output.
