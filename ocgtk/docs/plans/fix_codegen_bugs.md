# Fix Code Generator Bugs for New Library Namespaces

## Context

After adding infrastructure for four new libraries (graphene, gdkpixbuf, pango, gsk), the code generation completes successfully but the build fails due to bugs in `gir_gen` that only surface with these new namespaces. Existing libraries (gio, gdk, gtk) are unaffected.

## Bug Categories

### Bug 1: Fixed-Length Array Treated as Null-Terminated Pointer Array

**Severity:** High (8 functions across graphene + gsk)

The code generator assumes all output arrays are NULL-terminated pointer arrays. For fixed-length struct/float arrays, it generates invalid C code.

**Example (graphene `box_get_vertices`):**
```c
// GENERATED (wrong):
graphene_vec3_t out1 = NULL;
while (out1[out1_length] != NULL) out1_length++;

// CORRECT: should be a fixed-size array or caller-allocated buffer
graphene_vec3_t out1[8];
graphene_box_get_vertices(self, out1);
// then convert each out1[i] to OCaml
```

**Affected functions:**
- graphene: `box_get_vertices` (8 vec3), `frustum_get_planes` (6 planes), `rect_get_vertices` (4 vec2), `vec2_to_float`, `vec3_to_float`, `vec4_to_float`, `matrix_to_float`
- gsk: `border_node_get_widths` (4 floats)

**GIR Input Pattern:**
Two variants trigger this bug:

*Variant A — Caller-allocated fixed-size out param (graphene):*
```xml
<parameter name="vertices" direction="out" caller-allocates="1" transfer-ownership="none">
  <array zero-terminated="0" fixed-size="8">
    <type name="Graphene.Vec3" c:type="graphene_vec3_t"/>
  </array>
</parameter>
```
Key attributes: `direction="out"`, `caller-allocates="1"`, `zero-terminated="0"`, `fixed-size="8"`, value-type elements (structs/floats).

*Variant B — Fixed-size return array (gsk):*
```xml
<return-value transfer-ownership="none">
  <array zero-terminated="0" fixed-size="4" c:type="const float*">
    <type name="gfloat" c:type="float"/>
  </array>
</return-value>
```

**Root cause locations:**
1. `gir_parser.ml` — `caller-allocates` attribute is **NOT parsed at all**. The parser reads `direction`, `transfer-ownership`, `nullable`, but completely ignores `caller-allocates`.
2. `types.ml:15` — `fixed_size : int option` IS in the parsed type, but...
3. `c_stub_array_conv.ml:108-137` (`length_code_for_array`) — `fixed_size` is **never checked**. The function only checks `length` (length parameter index) and falls through to NULL-terminated pointer assumptions.
4. `c_stub_method.ml:52-64` (`handle_out_param`) — Unconditionally initializes all array out params with `= NULL`: `bprintf acc.decls "%s %s = NULL;\n" base_type var_name`. This is wrong for value-type arrays that need stack allocation.

**Fix approach:**
1. Parse `caller-allocates` attribute in `gir_parser.ml` and add it to `gir_param` type
2. In `handle_out_param`, check `fixed_size`: if present, generate `type var[N];` instead of `= NULL`
3. In `length_code_for_array`, add a `fixed_size` branch that returns the constant size
4. For caller-allocated params, allocate buffer and pass it to the C function

### Bug 2: Bindings Generated for Private/Opaque Types

**Severity:** High (9 files in gdkpixbuf)

The generator creates bindings for types that are private to the library implementation and not exposed in public headers.

**Affected types:**
- `GdkPixbufModule` - private loader plugin type
- `GdkPixbufModulePattern` - private pattern matching type
- `GdkPixbufFormatFlags` - incorrectly referenced

**GIR Input Pattern:**
```xml
<!-- PixbufModule — no introspectable="0" in GIR, but contains function pointer fields -->
<record name="PixbufModule" c:type="GdkPixbufModule">
  <field name="module_name"><type name="utf8" c:type="char*"/></field>
  <field name="module_path"><type name="utf8" c:type="char*"/></field>
  <!-- Contains callback/function-pointer fields that reference opaque types like GModule -->
  <field name="load" writable="1">
    <callback name="load">...</callback>
  </field>
</record>

<!-- PixbufModulePattern — similarly lacks introspectable="0" -->
<record name="PixbufModulePattern" c:type="GdkPixbufModulePattern">
  <field name="prefix"><type name="utf8" c:type="char*"/></field>
  <field name="mask"><type name="utf8" c:type="char*"/></field>
  <field name="relevance"><type name="gint" c:type="int"/></field>
</record>
```

**Root cause:** `gir_parser.ml` does **not parse the `introspectable` attribute** at all. Even if these records had `introspectable="0"`, the parser would ignore it. The records are effectively private (contain function pointer fields, reference types from GModule that aren't available), but nothing in the GIR explicitly marks them as non-introspectable.

**Fix approach:**
1. Parse `introspectable` attribute in `gir_parser.ml` and add it as a field to `gir_class`, `gir_record`, and `gir_interface` types
2. Filter out entities with `introspectable=false` in the generation layer functions: `should_generate_class`, `should_generate_record`, `should_generate_interface`, etc. (in `generate/filtering.ml` or equivalent)
3. For PixbufModule/PixbufModulePattern specifically, add to exclude list since GIR doesn't mark them properly
4. Consider also skipping records that contain callback fields referencing unavailable types

**Key files:** 
- `src/tools/gir_gen/gir_parser.ml` — parse `introspectable` attribute and add to type definitions
- `src/tools/gir_gen/generate/filtering.ml` — add filtering logic in `should_generate_*` functions

### Bug 3: Copy Function Discards Result and Returns Empty Allocation

**Severity:** Medium (1 function in gdkpixbuf)

The generator calls `gdk_pixbuf_format_copy()` but then **discards the result** and returns a freshly allocated zeroed struct instead.

```c
// GENERATED (wrong - discards copy result, returns empty struct):
value copy_GdkPixbufFormat(const GdkPixbufFormat *ptr) {
  if (ptr == NULL) return Val_none;
  GdkPixbufFormat *copy = gdk_pixbuf_format_copy((GdkPixbufFormat*)ptr);
  return ml_gir_record_val_ptr(g_new0(GdkPixbufFormat, 1));  // BUG: should use copy!
}

// CORRECT:
value copy_GdkPixbufFormat(const GdkPixbufFormat *ptr) {
  if (ptr == NULL) return Val_none;
  GdkPixbufFormat *copy = gdk_pixbuf_format_copy((GdkPixbufFormat*)ptr);
  return ml_gir_record_val_ptr(copy);
}
```

**GIR Input Pattern:**
```xml
<!-- GdkPixbufFormat — has glib:get-type, has copy method, NOT opaque/disguised -->
<record name="PixbufFormat" c:type="GdkPixbufFormat"
        glib:type-name="GdkPixbufFormat" glib:get-type="gdk_pixbuf_format_get_type">
  <field name="name"><type name="utf8" c:type="gchar*"/></field>
  <method name="copy" c:identifier="gdk_pixbuf_format_copy">...</method>
  <method name="free" c:identifier="gdk_pixbuf_format_free">...</method>
</record>
```

**Root cause:** `c_stub_record.ml:121-129` (`generate_value_record_conversions`) — The function detects the record has a `copy` method and calls it correctly, but then the return statement wraps `g_new0()` instead of the `copy` variable. The `g_new0` call also fails at compile time because `GdkPixbufFormat`'s struct definition is not in public headers (`sizeof` unknown).

The record IS correctly classified: `is_boxed_record` returns true (has `glib_get_type`), `is_value_like_record` returns true (has copy method, non-opaque, non-disguised). The bug is purely in the code template — it generates the copy call but doesn't use its result.

**Note:** The GIR is not badly specified — `GdkPixbufFormat` is a legitimate boxed type with copy/free methods. We should support it. The fix is to return the `copy` result, not `g_new0`.

**Fix approach:** In `generate_value_record_conversions`, fix the return statement to use the `copy` variable instead of `g_new0`. For boxed types with `glib:get-type`, could also use `g_boxed_copy(gdk_pixbuf_format_get_type(), ptr)` as an alternative, but using the explicit copy method is equally correct and already generated.

### Bug 4: Inout Struct Parameters Treated as Values

**Severity:** Medium (2 functions in pango)

For `inout` struct parameters, the generator initializes them as stack values instead of pointers.

```c
// GENERATED (wrong):
PangoRectangle inout1 = PangoRectangle_val(arg1);

// CORRECT:
PangoRectangle *inout1 = PangoRectangle_val(arg1);
```

**Affected:** `pango_matrix_transform_rectangle`, `pango_matrix_transform_pixel_rectangle`

**GIR Input Pattern:**
```xml
<parameter name="rect" direction="inout" transfer-ownership="none">
  <type name="Pango.Rectangle" c:type="PangoRectangle*"/>
</parameter>
```
The `PangoRectangle` record is non-opaque, non-disguised, with 4 writable `int` fields (x, y, width, height):
```xml
<record name="Rectangle" c:type="PangoRectangle">
  <field name="x" writable="1"><type name="gint" c:type="int"/></field>
  <field name="y" writable="1"><type name="gint" c:type="int"/></field>
  <field name="width" writable="1"><type name="gint" c:type="int"/></field>
  <field name="height" writable="1"><type name="gint" c:type="int"/></field>
</record>
```

**Root cause:** `c_stub_method.ml:70` (`handle_inout_param`) generates value initialization:
```c
PangoRectangle inout1 = PangoRectangle_val(arg1);
```
But since records are passed as pointers (`PangoRectangle*`), it should generate:
```c
PangoRectangle inout1_val = PangoRectangle_val(arg1);
PangoRectangle *inout1 = &inout1_val;
```
The bug is that inout handling doesn't distinguish between primitive types (which can be values) and record types (which need to be pointers for the C function call).

**Fix approach:** For inout record parameters, generate pointer types and pass them correctly. Detect record types by checking if the parameter's type matches a known record in context.

### Bug 5: Pointer vs Value for Enum Array Elements

**Severity:** Low (2 functions in pango)

The generator passes `&result[i]` (pointer to enum) instead of `result[i]` (enum value) to the enum converter.

```c
// GENERATED (wrong):
Val_PangoScript(&result[i])

// CORRECT:
Val_PangoScript(result[i])
```

**Affected:** `pango_language_get_scripts`, `pango_tab_array_get_tabs`

**GIR Input Pattern:**
```xml
<return-value transfer-ownership="none">
  <array length="0" zero-terminated="0" c:type="const PangoScript*">
    <type name="Script" c:type="PangoScript"/>
  </array>
</return-value>
<parameters>
  <parameter name="num_scripts" direction="out" transfer-ownership="full">
    <type name="gint" c:type="int*"/>
  </parameter>
</parameters>
```
Key: return type is `<array>` with enum element type (`PangoScript`), and `length="0"` referencing the first parameter for the array length.

**Root cause:** `c_stub_array_conv.ml:300-311` — The `is_primitive_converter` check hardcodes only 4 converter names (`Val_int`, `Val_bool`, `caml_copy_double`, `caml_copy_string`). Dynamically-named enum converters like `Val_PangoScript` are not recognized, so they get the `&` prefix. The `addr_prefix` logic:
```ocaml
let is_primitive_converter =
  String.equal element_tm.c_to_ml "Val_int"
  || String.equal element_tm.c_to_ml "Val_bool"
  || String.equal element_tm.c_to_ml "caml_copy_double"
  || String.equal element_tm.c_to_ml "caml_copy_string"
in
let addr_prefix =
  if is_pointer_array || is_primitive_converter then "" else "&"
in
```

**Affects both enums AND bitfields (flags):** Bitfield converters (e.g. `Val_GtkApplicationInhibitFlags`) also take values by value, not by pointer. Both are dynamically named and neither is recognized by the hardcoded check. Outside of array contexts, enum/bitfield values are correctly passed without `&` (see `c_stub_helpers.ml:286-308`).

**Fix approach:** Instead of hardcoding converter names, check whether the type mapping was produced from an enum or bitfield lookup. The type mapping could carry a flag (e.g. `is_value_converter`) or the `addr_prefix` logic could check whether the element type is an enum/bitfield in `ctx.enums`/`ctx.bitfields`.

### Bug 6: Missing Val/val Converter Functions for Records

**Severity:** Medium (2 files in gsk)

`copy_GskRoundedRect` is generated but the corresponding `Val_GskRoundedRect` and `GskRoundedRect_val` functions are not.

**GIR Input Pattern:**
```xml
<record name="RoundedRect" c:type="GskRoundedRect">
  <field name="bounds" writable="1">
    <type name="Graphene.Rect" c:type="graphene_rect_t"/>
  </field>
  <field name="corner" writable="1">
    <array zero-terminated="0" fixed-size="4">
      <type name="Graphene.Size" c:type="graphene_size_t"/>
    </array>
  </field>
</record>
```
Key: `GskRoundedRect` is non-opaque with fields that include a **fixed-size array of cross-namespace struct types** (`Graphene.Size`). The converter generation fails because it doesn't know how to generate `Val_`/`_val` converters for records containing fixed-size arrays of foreign struct types.

**Parsing status:** The parser correctly parses `fixed-size` on array fields within records (`gir_parser.ml:589-592` and `:986-999`). The `gir_record_field.field_type` correctly contains the array with `fixed_size = Some 4`. The issue is purely in code generation.

**Root cause:** `c_stub_record.ml:107-138` (`generate_value_record_conversions`) generates a `copy_TypeName` function but does NOT generate `Val_TypeName`/`TypeName_val` macro definitions in the forward declarations header. Compare with `GskPathPoint` in `generated_forward_decls.h` which gets both the copy function AND the macros, while `GskRoundedRect` only gets the `copy_` declaration (line 204) but no macros.

The `generate_forward_decls` function (`c_stub_record.ml:19-81`) has separate paths for "value-like" vs non-value records, and the value-like path appears incomplete — it generates the copy function forward declaration but omits the `Val_`/`_val` macro definitions that USE the copy function.

**Fix approach:**
1. Fix `generate_forward_decls` to emit `Val_`/`_val` macros for all value-like records, not just some
2. The `copy_` function itself needs to handle records with fixed-size array fields (currently untested combination)
3. Record fields with arrays are never exposed as accessor functions — this is a broader missing feature but not blocking for the immediate fix

### Bug 7: Syntax Error in Record Copy Function

**Severity:** Low (1 function in gsk)

Extra parenthesis in generated C code:
```c
return ml_gir_record_val_ptr(copy));  // extra )
```

**GIR Input Pattern:** Same as Bug 6 — `GskRoundedRect` with its `corner` fixed-size array field. The copy function generation path hits the fixed-size array field and produces malformed output with an unbalanced parenthesis.

**Root cause:** The record copy code path generates `ml_gir_record_val_ptr(copy))` — the format string or buffer concatenation adds an extra `)`. Likely in the record copy generation function where it wraps the copy result with the `ml_gir_record_val_ptr` macro.

**Fix approach:** Fix the string formatting in the record copy code generator. Likely a `bprintf` call that adds `)` when wrapping in `ml_gir_record_val_ptr()` and then the caller also adds `)`, resulting in a double close paren.

### Bug 8: Wrong Namespace Prefix in C Type Name

**Severity:** Low (1 type in gdkpixbuf)

Generator outputs `GtkPixbufNonAnim` instead of `GdkPixbufNonAnim`.

**GIR Input Pattern:**
```xml
<!-- In GdkPixbuf-2.0.gir -->
<class name="PixbufNonAnim" parent="PixbufAnimation">
  <!-- NOTE: no c:type attribute! -->
  <constructor name="new" c:identifier="gdk_pixbuf_non_anim_new">
    <return-value transfer-ownership="full">
      <type name="PixbufAnimation" c:type="GdkPixbufAnimation*"/>
    </return-value>
  </constructor>
</class>

<!-- Similarly in Gsk-4.0.gir -->
<class name="NglRenderer" parent="Renderer">
  <!-- Also missing c:type attribute -->
</class>
```

Key: the `c:type` attribute is **missing** from the `<class>` element.

**Root cause:** `gir_parser.ml:271-273` — When `c:type` is not present on a class, the parser hardcodes a `"Gtk"` prefix:
```ocaml
let c_type =
  match get_attr "c:type" attrs with
  | Some t -> t
  | None -> "Gtk" ^ name  (* BUG: hardcoded Gtk prefix *)
```
Same pattern at line 1111 for interfaces. Should use the namespace's `c_identifier_prefixes` instead.

**Fix approach:** Replace `"Gtk" ^ name` fallback with `ctx.namespace.namespace_c_identifier_prefixes ^ name` to derive the correct C type from the namespace prefix.

### Bug 9: Bindings for Non-Existent C Functions

**Severity:** Low (3 functions across gdkpixbuf + gsk)

Generator creates calls to constructors that don't exist in the C library:
- `gdk_pixbuf_non_anim_new` - PixbufNonAnim is internal
- `gsk_broadway_renderer_new` - platform-specific, not always available
- `gsk_ngl_renderer_new` - deprecated/removed

**GIR Input Pattern:**
```xml
<!-- PixbufNonAnim — internal class, constructor exists in GIR but not in public API -->
<class name="PixbufNonAnim" parent="PixbufAnimation">
  <constructor name="new" c:identifier="gdk_pixbuf_non_anim_new">
    <return-value transfer-ownership="full">
      <type name="PixbufAnimation" c:type="GdkPixbufAnimation*"/>
    </return-value>
    <parameters>
      <parameter name="loader" transfer-ownership="none">
        <type name="Pixbuf" c:type="GdkPixbuf*"/>
      </parameter>
    </parameters>
  </constructor>
</class>

<!-- BroadwayRenderer — platform-specific, introspectable but not always linked -->
<class name="BroadwayRenderer" c:type="GskBroadwayRenderer" parent="Renderer"
       glib:type-name="GskBroadwayRenderer" glib:get-type="gsk_broadway_renderer_get_type">
  <constructor name="new" c:identifier="gsk_broadway_renderer_new">
    <return-value transfer-ownership="full">
      <type name="Renderer" c:type="GskRenderer*"/>
    </return-value>
  </constructor>
</class>

<!-- NglRenderer — deprecated/removed, but still in GIR -->
<class name="NglRenderer" parent="Renderer">
  <!-- Missing c:type (also triggers Bug 8) -->
  <constructor name="new" c:identifier="gsk_ngl_renderer_new">...</constructor>
</class>
```

**Root cause:** These constructors exist in the GIR XML but either: (a) the symbol is not exported from the shared library (internal/deprecated), or (b) the class is platform-specific (Broadway = Wayland-specific backend). The parser has no mechanism to check `introspectable` attribute, and there's no validation that referenced C symbols actually exist.

**Note:** The `introspectable` attribute is not parsed anywhere in the codebase (same root cause as Bug 2). Fixing Bug 2 by adding `introspectable` parsing to `gir_parser.ml` and filtering in `generate/filtering.ml` would also fix this bug for any entities that have `introspectable="0"`. However, the specific entities here (BroadwayRenderer, NglRenderer, PixbufNonAnim) may NOT have `introspectable="0"` in the GIR, so they'll need the exclude list approach regardless.

**Fix approach:**
1. Parse `introspectable` attribute in `gir_parser.ml` and add it as a field to `gir_constructor` type
2. Filter out constructors with `introspectable=false` in `should_generate_constructor` (in `generate/filtering.ml`)
3. Add BroadwayRenderer, NglRenderer, and PixbufNonAnim classes to the exclude list for symbols not in the shared library (these may not have `introspectable="0"` in the GIR)

### Bug 10: OCaml Module Name Capitalization

**Severity:** Medium (1 file in gdkpixbuf)

Generated OCaml code references `GdkPixbuf_enums` but dune creates the module as `Gdkpixbuf_enums` (only first letter capitalized).

```ocaml
(* GENERATED (wrong): *)
external new_ : GdkPixbuf_enums.colorspace -> ...
(* CORRECT: *)
external new_ : Gdkpixbuf_enums.colorspace -> ...
```

**GIR Input Pattern:**
```xml
<namespace name="GdkPixbuf" version="2.0"
           c:identifier-prefixes="GdkPixbuf"
           c:symbol-prefixes="gdk_pixbuf">
```
The namespace `name` is `"GdkPixbuf"` (mixed case). Any enum reference in generated OCaml code uses this name directly.

**Root cause:** `utils.ml:153-159`:
```ocaml
let enums_module_name (ctx : Types.generation_context) (_ : Types.gir_enum) =
  ctx.namespace.namespace_name ^ "_enums"
```
This produces `"GdkPixbuf_enums"`. But dune's module naming convention lowercases everything after the first character: file `gdkpixbuf_enums.mli` → module `Gdkpixbuf_enums`.

For single-word namespaces like "Gtk", "Gdk", "Gio", this works fine because `"Gtk" → "Gtk_enums"` and dune's `Gtk_enums` matches. But for multi-word camelCase namespaces like `"GdkPixbuf"`, the mismatch appears.

**Root cause — three separate code paths, no single source of truth:**

1. **File naming** (`gir_gen.ml:689-700`): `String.lowercase_ascii ns_name` → `"gdkpixbuf"` → file `"gdkpixbuf_enums.mli"` → dune module `Gdkpixbuf_enums` ✓
2. **Module references in type_mappings.ml** (lines 371, 395): Direct concatenation `namespace ^ "_enums"` → `"GdkPixbuf_enums"` ✗
3. **Module references in library_module.ml** (lines 115, 212): Calls `Utils.enums_module_name` → `"GdkPixbuf_enums"` ✗

Both reference paths (2 and 3) produce `"GdkPixbuf_enums"` which doesn't match the file/module name `"Gdkpixbuf_enums"`.

**Fix approach:** Create a single shared function in `generate/filtering.ml` that converts namespace name to dune module convention (lowercase after first char), and use it everywhere:
1. Add function `namespace_to_module_name` in `generate/filtering.ml` that lowercases after first character: `"GdkPixbuf" → "Gdkpixbuf"`
2. Update `Utils.enums_module_name` to use this shared function: `"GdkPixbuf" → "Gdkpixbuf" → "Gdkpixbuf_enums"`
3. Update `type_mappings.ml:371,395` to call `Utils.enums_module_name` instead of inlining `namespace ^ "_enums"`
4. Verify `gir_gen.ml:403,449` file naming is consistent with the shared function

**Key files:**
- `src/tools/gir_gen/generate/filtering.ml` — add `namespace_to_module_name` shared function
- `src/tools/gir_gen/utils.ml:153-159` — `enums_module_name` (update to use shared function)
- `src/tools/gir_gen/type_mappings.ml:371,395` — inline concatenation (replace with function call)
- `src/tools/gir_gen/generate/library_module.ml:115,212` — already calls function (will be fixed when function is fixed)
- `src/tools/gir_gen/gir_gen.ml:403,449` — file naming (verify consistency)

### ~~Bug 11: Too Many CAMLparam Arguments~~ — NOT A BUG

**Status:** Resolved — this is already correctly implemented.

Investigation confirms that `c_stub_method.ml:367-405` (`generate_multi_param_function`) and `c_stub_constructor.ml:96-134` already correctly split parameters across `CAMLparam5` + `CAMLxparamN` calls when there are more than 5 parameters. Generated code in gtk, gio, and gdkpixbuf confirms this works:

```c
// From ml_pixbuf_gen.c (gdk_pixbuf_composite, 12 params):
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam7(arg5, arg6, arg7, arg8, arg9, arg10, arg11);
```

The original error report was incorrect — the warnings observed during build were from a different cause. No fix needed.

## Unit Tests

Each bug fix should be accompanied by a unit test that detects the issue via the existing test infrastructure in `src/tools/test_gir_gen/`. Tests use Alcotest with AST-based C/ML validation (never string matching).

**Test patterns used in this project:**
- **Unit tests** construct GIR method/record/enum types in code, call the generator function directly, then parse and validate the generated C or ML output using `C_parser`/`C_ast`/`C_validation` or `Ml_ast_helpers`/`Ml_validation`.
- **Integration tests** write GIR XML files, run `gir_gen` end-to-end, then check the output files.
- All tests live in `src/tools/test_gir_gen/` and are registered in `test_gir_gen.ml`.

### New Test Module: `cross_namespace_tests.ml`

Create a new test module `src/tools/test_gir_gen/c_stubs/cross_namespace_tests.ml` for bugs surfaced by the new library namespaces. Register as `("Cross-Namespace", Cross_namespace_tests.tests)` in `test_gir_gen.ml` and add to the `(modules ...)` list in `src/tools/test_gir_gen/dune`.

### Test Specifications by Bug

**Validation approach:** Tests should use the AST-based validation infrastructure (`C_parser`/`C_ast`/`C_validation` for C code, `Ml_ast_helpers`/`Ml_validation` for OCaml code) with positive structural assertions wherever possible. String matching (`assert_contains`/`assert_not_contains`) should only be used as a last resort for patterns the AST parser cannot express.

#### Bug 1: Fixed-Length Array Output Parameters

**Test:** `test_fixed_size_array_out_param`

Construct a method with an out parameter that has `fixed_size = Some 8` and struct element type. Generate C code, parse to AST, and structurally verify the output.

```ocaml
let test_fixed_size_array_out_param () =
  let ctx = Helpers.create_test_context () in
  let meth = { (* ... as before, fixed_size = Some 8, struct element type ... *) } in
  let c_code = generate_c_method ~ctx ~c_type:"GrapheneBox" meth "Box" in
  Helpers.log_generated_c_code "fixed_size_array_out" c_code;
  let functions = C_parser.parse_c_code c_code in
  let func = Option.get (C_ast.find_function functions "ml_graphene_box_get_vertices") in

  (* Positive: out param excluded from OCaml params — only self *)
  Alcotest.(check int) "Only self parameter (out array not an OCaml param)" 1
    (C_ast.get_param_count func);

  (* Positive: calls the underlying C function *)
  Alcotest.(check bool) "Calls graphene_box_get_vertices" true
    (C_validation.calls_c_function func "graphene_box_get_vertices");

  (* Positive: allocates an OCaml array for the result *)
  Alcotest.(check bool) "Allocates OCaml array with caml_alloc" true
    (C_validation.calls_caml_alloc func);

  (* Positive: converts elements via Store_field loop *)
  Alcotest.(check bool) "Converts elements in Store_field loop" true
    (C_validation.has_conversion_loop func);

  (* Positive: has a local variable declared for the fixed-size C buffer.
     Use get_var_decls to find a variable with the array's C element type *)
  let var_decls = C_ast.get_var_decls func in
  Alcotest.(check bool) "Has a local variable for the C output buffer" true
    (List.exists (fun (name, c_type, _) ->
       String.is_prefix name ~prefix:"out" &&
       String.is_substring c_type ~substring:"graphene_vec3_t") var_decls);

  (* Positive: has CAMLparam/CAMLreturn structure *)
  Alcotest.(check bool) "Has CAMLparam" true (C_validation.has_caml_param_macro func);
  Alcotest.(check bool) "Has CAMLreturn" true (C_validation.has_caml_return func)
```

**Test:** `test_fixed_size_float_array_return`

Same pattern but for a return value with `fixed_size = Some 4` and `float` element type (like `vec2_to_float`). Verify the same structural properties: `calls_caml_alloc`, `has_conversion_loop`, correct C function call, and that the result conversion uses `caml_copy_double` (check via `C_ast.get_var_decls` or `C_ast.return_expr`).

#### Bug 2: Private/Non-Introspectable Types Excluded

**Test:** `test_non_introspectable_record_skipped`

Integration test verifying generation-level filtering (records with `introspectable=false` should not have code generated).

```ocaml
let test_non_introspectable_record_skipped () =
  let gir = Helpers.wrap_namespace
    ~namespace_name:"TestNs" ~c_prefix:"TestNs" ~symbol_prefix:"test_ns" {|
      <record name="PrivateRecord" c:type="TestNsPrivateRecord" introspectable="0">
        <field name="data"><type name="gint" c:type="int"/></field>
      </record>
      <record name="PublicRecord" c:type="TestNsPublicRecord">
        <field name="value" writable="1"><type name="gint" c:type="int"/></field>
      </record>
  |} in
  Helpers.create_gir_file test_gir gir;
  Helpers.ensure_output_dir output_dir;

  (* Generate and verify output - both records are parsed but only PublicRecord is generated *)
  let exit_code = Helpers.run_gir_gen test_gir output_dir in
  Alcotest.(check int) "Generation succeeds" 0 exit_code;
  
  (* Negative: PrivateRecord should NOT have a C stub generated *)
  Alcotest.(check bool) "No C stub for PrivateRecord" false
    (Helpers.file_exists (Helpers.stub_c_file output_dir "PrivateRecord"));
  
  (* Positive: PublicRecord IS generated *)
  Alcotest.(check bool) "C stub for PublicRecord exists" true
    (Helpers.file_exists (Helpers.stub_c_file output_dir "PublicRecord"));
  
  (* Verify by parsing the generated C file for PublicRecord *)
  let c_file = Helpers.read_file (Helpers.stub_c_file output_dir "PublicRecord") in
  let functions = C_parser.parse_c_code c_file in
  Alcotest.(check bool) "PublicRecord has generated functions" true
    (List.length functions > 0)
```

**Test:** `test_non_introspectable_constructor_skipped`

Same GIR structure but with an introspectable class containing one `introspectable="0"` constructor and one normal constructor. Verify:
- The class C stub IS generated (file exists)
- Parse the generated C file and use `C_ast.find_function` to confirm the good constructor's function exists
- Use `C_ast.find_function` to confirm the bad constructor's function does NOT exist

#### Bug 3: Copy Function Uses Result (Not g_new0)

**Test:** `test_copy_function_returns_copy_result`

Generate the record C code, parse to AST, and structurally validate the copy function.

```ocaml
let test_copy_function_returns_copy_result () =
  let ctx = Helpers.create_test_context () in
  (* Create a record with a copy method *)
  let record = {
    record_name = "Format"; c_type = "TestFormat";
    glib_type_name = Some "TestFormat"; glib_get_type = Some "test_format_get_type";
    opaque = false; disguised = false; c_symbol_prefix = Some "test_format";
    is_gtype_struct_for = None; fields = []; constructors = [];
    methods = [{ method_name = "copy"; c_identifier = "test_format_copy"; (* ... *) }];
    functions = []; record_doc = None;
  } in
  let c_code = C_stub_record.generate_value_record_conversions ctx record in
  Helpers.log_generated_c_code "copy_function" c_code;
  let functions = C_parser.parse_c_code c_code in
  let copy_func = Option.get (C_ast.find_function functions "copy_TestFormat") in

  (* Positive: copy function calls the record's copy method *)
  Alcotest.(check bool) "Calls test_format_copy" true
    (C_validation.calls_c_function copy_func "test_format_copy");

  (* Positive: return expression wraps the copy variable, not g_new0 *)
  let ret = C_ast.return_expr copy_func in
  (match ret with
   | Some expr ->
     (* The return should reference 'copy' variable *)
     Alcotest.(check bool) "Return uses copy variable" true
       (C_ast.expr_uses_var expr "copy");
     (* The return should NOT call g_new0 *)
     let calls = C_ast.get_function_calls expr in
     Alcotest.(check bool) "Return does not call g_new0" false
       (List.mem calls "g_new0" ~equal:String.equal)
   | None -> Alcotest.fail "Copy function has no return statement")
```

#### Bug 4: Inout Record Parameters as Pointers

**Test:** `test_inout_record_param_pointer_type`

Construct a method with an `inout` record parameter. Parse to AST and verify the variable declaration type is a pointer.

```ocaml
let test_inout_record_param_pointer_type () =
  let ctx = (* ... context with PangoRectangle record, as before ... *) in
  let meth = (* ... method with InOut PangoRectangle* param ... *) in
  let c_code = generate_c_method ~ctx ~c_type:"PangoMatrix" meth "Matrix" in
  Helpers.log_generated_c_code "inout_record" c_code;
  let functions = C_parser.parse_c_code c_code in
  let func = Option.get (C_ast.find_function functions "ml_pango_matrix_transform_rectangle") in

  (* Positive: calls the underlying C function *)
  Alcotest.(check bool) "Calls pango_matrix_transform_rectangle" true
    (C_validation.calls_c_function func "pango_matrix_transform_rectangle");

  (* Positive: inout variable is declared as a pointer type *)
  let var_decls = C_ast.get_var_decls func in
  let inout_decl = List.find var_decls ~f:(fun (name, _, _) ->
    String.is_prefix name ~prefix:"inout") in
  (match inout_decl with
   | Some (_, c_type, _) ->
     Alcotest.(check bool) "Inout variable is pointer type" true
       (String.is_substring c_type ~substring:"*")
   | None -> Alcotest.fail "No inout variable declaration found");

  (* Positive: the inout param is passed by reference to the C function *)
  Alcotest.(check bool) "Inout passed by reference" true
    (C_validation.out_param_passed_by_ref func "rect" "pango_matrix_transform_rectangle");

  (* Positive: param converted using PangoRectangle_val *)
  Alcotest.(check bool) "Uses PangoRectangle_val converter" true
    (C_validation.param_converted_with_val_macro func "rect" "PangoRectangle")
```

#### Bug 5: Enum/Bitfield Array Element Conversion (No Address-of)

**Test:** `test_enum_array_element_conversion`

Construct a method returning an array of enum values. Parse to AST and verify the conversion structure.

```ocaml
let test_enum_array_element_conversion () =
  let ctx = (* ... context with PangoScript enum ... *) in
  let meth = (* ... method returning array of Script with length param ... *) in
  let c_code = generate_c_method ~ctx ~c_type:"PangoLanguage" meth "Language" in
  Helpers.log_generated_c_code "enum_array" c_code;
  let functions = C_parser.parse_c_code c_code in
  let func = Option.get (C_ast.find_function functions "ml_pango_language_get_scripts") in

  (* Positive: calls the C function *)
  Alcotest.(check bool) "Calls pango_language_get_scripts" true
    (C_validation.calls_c_function func "pango_language_get_scripts");

  (* Positive: allocates OCaml array *)
  Alcotest.(check bool) "Allocates OCaml array" true
    (C_validation.calls_caml_alloc func);

  (* Positive: has element conversion loop *)
  Alcotest.(check bool) "Has Store_field conversion loop" true
    (C_validation.has_conversion_loop func);

  (* Positive: uses the enum converter macro Val_PangoScript *)
  Alcotest.(check bool) "Uses Val_PangoScript converter" true
    (C_ast.function_calls_function func "Val_PangoScript");

  (* Structural: verify no AddrOf nodes wrap the enum conversion.
     Search the function body for Call("Val_PangoScript", args) and
     verify none of the args are AddrOf expressions *)
  let has_addr_of_in_enum_call =
    let rec check_stmts stmts =
      List.exists stmts ~f:(fun stmt -> check_stmt stmt)
    and check_stmt = function
      | C_ast.ExprStmt e | Return e -> check_expr e
      | VarDecl (_, _, Some e) -> check_expr e
      | IfStmt (_, then_, else_) -> check_stmts then_ || check_stmts else_
      | _ -> false
    and check_expr = function
      | C_ast.Call ("Val_PangoScript", args) | Macro ("Val_PangoScript", args) ->
        List.exists args ~f:(fun arg -> match arg with AddrOf _ -> true | _ -> false)
      | Call (_, args) | Macro (_, args) ->
        List.exists args ~f:check_expr
      | Cast (_, e) -> check_expr e
      | _ -> false
    in
    check_stmts func.body
  in
  Alcotest.(check bool) "No AddrOf wrapping enum converter" false has_addr_of_in_enum_call
```

**Test:** `test_bitfield_array_element_conversion`

Same structure but with a bitfield (flags) type. Verify same properties: `calls_caml_alloc`, `has_conversion_loop`, correct converter macro called, no `AddrOf` wrapping the converter.

#### Bug 6: Record Converter Completeness

**Test:** `test_value_record_has_complete_forward_decls`

Integration test: create GIR with a non-opaque, non-disguised record with a copy method. Generate code, then parse the forward declarations header and verify structural completeness.

```ocaml
let test_value_record_has_complete_forward_decls () =
  let gir = Helpers.wrap_namespace {|
    <record name="TestRect" c:type="TestRect"
            glib:type-name="TestRect" glib:get-type="test_rect_get_type">
      <field name="x" writable="1"><type name="gint" c:type="int"/></field>
      <field name="y" writable="1"><type name="gint" c:type="int"/></field>
      <method name="copy" c:identifier="test_rect_copy">
        <return-value transfer-ownership="full"><type name="TestRect" c:type="TestRect*"/></return-value>
      </method>
    </record>
  |} in
  Helpers.create_gir_file test_gir gir;
  Helpers.ensure_output_dir output_dir;
  let exit_code = Helpers.run_gir_gen test_gir output_dir in
  Alcotest.(check int) "Generation succeeds" 0 exit_code;

  (* Read and parse the forward declarations header *)
  let header = Helpers.read_file (Helpers.generated_dir output_dir ^ "/generated_forward_decls.h") in

  (* Positive: copy function is declared *)
  Helpers.assert_contains "copy_ function declared" header
    "value copy_TestRect(const TestRect *ptr)";

  (* Positive: Val_ macro is defined using copy function *)
  Helpers.assert_contains "Val_TestRect macro defined" header
    "#define Val_TestRect";

  (* Positive: _val macro is defined *)
  Helpers.assert_contains "TestRect_val macro defined" header
    "#define TestRect_val";

  (* Also validate the C stub file parses and has the copy function *)
  let c_file = Helpers.read_file (Helpers.stub_c_file output_dir "TestRect") in
  let functions = C_parser.parse_c_code c_file in
  let copy_func = C_ast.find_function functions "copy_TestRect" in
  Alcotest.(check bool) "copy_TestRect function exists in C stub" true
    (Option.is_some copy_func)
```

#### Bug 7: Record Copy Syntax

**Test:** `test_record_copy_parses_successfully`

The strongest assertion for a syntax bug is that the generated C code parses into a valid AST without errors. If there's an extra parenthesis, the parser will fail.

```ocaml
let test_record_copy_parses_successfully () =
  let ctx = (* ... context with a value-like record with copy method ... *) in
  let record = (* ... non-opaque record with copy method ... *) in
  let c_code = C_stub_record.generate_value_record_conversions ctx record in
  Helpers.log_generated_c_code "record_copy_syntax" c_code;

  (* Positive: code parses without error — this catches unbalanced parens *)
  let functions = C_parser.parse_c_code c_code in
  let copy_func = C_ast.find_function functions "copy_TestRecord" in
  Alcotest.(check bool) "copy function parses to valid AST" true
    (Option.is_some copy_func);

  (* Positive: the parsed copy function has a return statement *)
  let func = Option.get copy_func in
  Alcotest.(check bool) "Has CAMLreturn" true (C_validation.has_caml_return func);

  (* Positive: return expression wraps copy in ml_gir_record_val_ptr *)
  let ret = C_ast.return_expr func in
  (match ret with
   | Some expr ->
     let calls = C_ast.get_function_calls expr in
     Alcotest.(check bool) "Return wraps in ml_gir_record_val_ptr" true
       (List.mem calls "ml_gir_record_val_ptr" ~equal:String.equal)
   | None -> Alcotest.fail "Copy function missing return expression")
```

#### Bug 8: Namespace Prefix in C Type Names

**Test:** `test_non_gtk_namespace_c_type_prefix`

Parse the GIR for a non-Gtk namespace where a class lacks `c:type`. Verify at the parser level that the inferred `c_type` uses the correct namespace prefix.

```ocaml
let test_non_gtk_namespace_c_type_prefix () =
  let gir = Helpers.wrap_namespace
    ~namespace_name:"GdkPixbuf" ~c_prefix:"GdkPixbuf" ~symbol_prefix:"gdk_pixbuf" {|
      <class name="NonAnim" parent="GObject.Object"
             glib:type-name="GdkPixbufNonAnim" glib:get-type="gdk_pixbuf_non_anim_get_type">
        <!-- Deliberately NO c:type attribute -->
        <method name="get_name" c:identifier="gdk_pixbuf_non_anim_get_name">
          <return-value transfer-ownership="none"><type name="utf8" c:type="const char*"/></return-value>
        </method>
      </class>
  |} in
  Helpers.create_gir_file test_gir gir;

  (* Parse and inspect the class c_type *)
  let _, _, classes, _, _, _, _ = Gir_gen_lib.Parse.Gir_parser.parse_gir_file test_gir [] in
  let cls = List.find_exn classes ~f:(fun c -> String.equal c.class_name "NonAnim") in

  (* Positive: inferred c_type uses GdkPixbuf prefix, not Gtk *)
  Alcotest.(check string) "C type uses correct namespace prefix"
    "GdkPixbufNonAnim" cls.c_type;

  (* Also generate and verify C code uses the correct prefix *)
  Helpers.ensure_output_dir output_dir;
  let exit_code = Helpers.run_gir_gen test_gir output_dir in
  Alcotest.(check int) "Generation succeeds" 0 exit_code;
  let c_file = Helpers.read_file (Helpers.stub_c_file output_dir "NonAnim") in
  let functions = C_parser.parse_c_code c_file in
  let func = Option.get (C_ast.find_function functions "ml_gdk_pixbuf_non_anim_get_name") in

  (* Positive: the function uses GdkPixbufNonAnim_val for self conversion *)
  Alcotest.(check bool) "Uses GdkPixbufNonAnim_val for self" true
    (C_validation.param_converted_with_val_macro func "self" "GdkPixbufNonAnim")
```

#### Bug 9: Non-Existent Constructors

**Test:** `test_introspectable_false_constructor_skipped`

Integration test with both introspectable and non-introspectable constructors in one class. Generate code and verify function presence/absence structurally by parsing the generated C file.

```ocaml
let test_introspectable_false_constructor_skipped () =
  let gir = Helpers.wrap_namespace {|
    <class name="Widget" c:type="TestWidget" parent="GObject.Object"
           glib:type-name="TestWidget" glib:get-type="test_widget_get_type">
      <constructor name="new" c:identifier="test_widget_new" introspectable="1">
        <return-value transfer-ownership="full"><type name="Widget" c:type="TestWidget*"/></return-value>
      </constructor>
      <constructor name="new_internal" c:identifier="test_widget_new_internal" introspectable="0">
        <return-value transfer-ownership="full"><type name="Widget" c:type="TestWidget*"/></return-value>
      </constructor>
    </class>
  |} in
  Helpers.create_gir_file test_gir gir;
  Helpers.ensure_output_dir output_dir;
  let exit_code = Helpers.run_gir_gen test_gir output_dir in
  Alcotest.(check int) "Generation succeeds" 0 exit_code;

  let c_file = Helpers.read_file (Helpers.stub_c_file output_dir "Widget") in
  let functions = C_parser.parse_c_code c_file in

  (* Positive: the introspectable constructor IS generated *)
  Alcotest.(check bool) "Good constructor exists" true
    (Option.is_some (C_ast.find_function functions "ml_test_widget_new"));

  (* Positive: the non-introspectable constructor is NOT generated *)
  Alcotest.(check bool) "Bad constructor is absent" true
    (Option.is_none (C_ast.find_function functions "ml_test_widget_new_internal"))
```

#### Bug 10: Enum Module Name Capitalization

**Test:** `test_enum_module_name_matches_dune_convention`

Generate ML code, parse with `Ml_ast_helpers`, and verify the enum module reference in external declarations uses the correct capitalization via AST inspection.

```ocaml
let test_enum_module_name_matches_dune_convention () =
  let ctx = { (Helpers.create_test_context ()) with
    namespace = { namespace_name = "GdkPixbuf"; namespace_version = "2.0";
                  namespace_shared_library = "libgdk_pixbuf-2.0.so";
                  namespace_c_identifier_prefixes = "GdkPixbuf";
                  namespace_c_symbol_prefixes = "gdk_pixbuf" };
    enums = [{ enum_name = "Colorspace"; c_type = "GdkColorspace";
               members = [{ member_name = "RGB"; member_value = "0";
                            member_c_identifier = "GDK_COLORSPACE_RGB";
                            member_nick = Some "rgb"; member_doc = None }];
               enum_doc = None }];
  } in
  (* Generate .mli for a method that takes an enum parameter *)
  let meth = { (* ... method with Colorspace param ... *) } in
  let mli_code = generate_ml_interface ~ctx ~c_type:"GdkPixbuf" meth "Pixbuf" in

  (* Parse ML interface *)
  let mli_ast = Ml_ast_helpers.parse_interface mli_code in

  (* Find the external declaration *)
  let ext = Option.get (Ml_ast_helpers.find_external_sig mli_ast "method_name") in

  (* Positive: parameter type references Gdkpixbuf_enums (dune convention) *)
  let param_types = Ml_ast_helpers.get_param_types ext.pval_type in
  let enum_param = List.hd_exn param_types in
  let type_str = Ml_ast_helpers.core_type_to_string enum_param in
  Alcotest.(check bool) "Enum type uses dune-convention module name" true
    (String.is_substring type_str ~substring:"Gdkpixbuf_enums");

  (* Also verify via unit test of enums_module_name directly *)
  let module_name = Utils.enums_module_name ctx (List.hd_exn ctx.enums) in
  Alcotest.(check string) "enums_module_name returns dune-style name"
    "Gdkpixbuf_enums" module_name
```

#### ~~Bug 11: CAMLparam for 6+ Parameters~~ — No test needed (not a bug)

### Test Implementation Order

Tests should be written **before** the fix (TDD approach):
1. Write the test, verify it fails with current code (confirms the test detects the bug)
2. Fix the code generator
3. Verify the test passes

This ensures each test actually catches the regression it's designed for.

## Recommended Fix Order

**Phase A - Quick wins (exclude/skip problematic entities):**
1. Bug 2 + Bug 9 + Bug 12: Parse `introspectable` attribute in `gir_parser.ml` and add as field to `gir_class`, `gir_record`, `gir_interface`, `gir_constructor`, and `gir_method` types; add filtering in `should_generate_class`, `should_generate_record`, `should_generate_interface`, `should_generate_constructor`, and `should_generate_method` (in `generate/filtering.ml`); add exclude list entries for PixbufNonAnim, BroadwayRenderer, NglRenderer, PixbufModule, PixbufModulePattern
2. Bug 3: Fix copy function to return copy result instead of `g_new0`

**Phase B - Capitalization and naming fixes:**
4. Bug 10: Unify enum module naming — fix `Utils.enums_module_name`, update `type_mappings.ml` to use it
5. Bug 8: Fix namespace prefix in C type names (use `c_identifier_prefixes` instead of hardcoded `"Gtk"`)

**Phase C - Code generation logic fixes:**
5. Bug 5: Don't take address of enum/bitfield array elements (fix `addr_prefix` in `c_stub_array_conv.ml`)
6. Bug 4: Handle inout struct parameters as pointers
7. Bug 7: Fix syntax error in record copy generation (extra parenthesis)
8. Bug 6: Generate complete Val/val converter macros for value-like records
9. Bug 1: Handle fixed-length arrays properly (use `fixed_size`, parse `caller-allocates`)

~~Bug 11 removed — already correctly implemented.~~

### Bug 12: Methods with introspectable="0" Not Filtered

**Severity:** High (unknown count across namespaces)

Methods marked `introspectable="0"` in GIR are still parsed and have bindings generated, causing build failures when the C functions use variadic arguments, output parameters, or other patterns incompatible with introspection.

**Example (gdkpixbuf `gdk_pixbuf_save`):**
```xml
<method name="save" c:identifier="gdk_pixbuf_save" introspectable="0" throws="1">
  <!-- variadic/incompatible signature -->
</method>
```

**Root cause:** Same as Bug 2/9 — the `introspectable` attribute is not checked when parsing methods. The fix for Bug 2+9 added filtering for records and constructors, but methods, virtual-methods, functions, and interface methods were not updated.

**Affected locations in `gir_parser.ml`:**
- Class methods (around line 322)
- Virtual methods (around line 350)
- Record methods (around line 1054)
- Interface methods (around line 1139)
- Standalone functions (`parse_function`)

**Fix approach:** 
1. Parse `introspectable` attribute in `gir_parser.ml` and add it as a field to `gir_method` type
2. Filter out methods with `introspectable=false` in `should_generate_method` (in `generate/filtering.ml`)
3. Apply the same pattern to virtual-methods, interface methods, and standalone functions by adding `introspectable` fields to their respective types and filtering in the corresponding `should_generate_*` functions

**Test:** `test_non_introspectable_method_skipped`

Integration test with both introspectable and non-introspectable methods in one class. Generate code and verify function presence/absence structurally by parsing the generated C file.

```ocaml
let test_non_introspectable_method_skipped () =
  let gir = Helpers.wrap_namespace {|
    <class name="Widget" c:type="TestWidget" parent="GObject.Object"
           glib:type-name="TestWidget" glib:get-type="test_widget_get_type">
      <method name="public_method" c:identifier="test_widget_public_method" introspectable="1">
        <return-value transfer-ownership="none"><type name="none" c:type="void"/></return-value>
      </method>
      <method name="internal_method" c:identifier="test_widget_internal_method" introspectable="0">
        <return-value transfer-ownership="none"><type name="none" c:type="void"/></return-value>
      </method>
    </class>
  |} in
  Helpers.create_gir_file test_gir gir;
  Helpers.ensure_output_dir output_dir;
  let exit_code = Helpers.run_gir_gen test_gir output_dir in
  Alcotest.(check int) "Generation succeeds" 0 exit_code;

  let c_file = Helpers.read_file (Helpers.stub_c_file output_dir "Widget") in
  let functions = C_parser.parse_c_code c_file in

  (* Positive: the introspectable method IS generated *)
  Alcotest.(check bool) "Good method exists" true
    (Option.is_some (C_ast.find_function functions "ml_test_widget_public_method"));

  (* Positive: the non-introspectable method is NOT generated *)
  Alcotest.(check bool) "Bad method is absent" true
    (Option.is_none (C_ast.find_function functions "ml_test_widget_internal_method"))
```

## Verification

After each phase, run:
```bash
cd ocgtk && eval $(opam env) && dune build 2>&1 | grep -c "^File\|^Error"
```

The build should produce fewer errors after each phase. Target: zero errors, warnings-only acceptable.
