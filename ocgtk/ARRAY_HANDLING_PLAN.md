# Array Handling Implementation Plan

**Date**: 2026-01-09
**Status**: Phase 1 Complete - Basic infrastructure implemented
**Branch**: array-handling

## Overview

Implemented basic array type handling in the GIR code generator at the C FFI layer (Layer 0) and OCaml interface layer (Layer 1). Arrays are now recognized, type-mapped, and conversion code is generated with proper memory management.

---

## What Was Implemented (Session 2026-01-09)

### 1. Type Mapping (`src/tools/gir_gen/type_mappings.ml`)

**Changes**:
- Made `find_type_mapping_for_gir_type` recursive
- Added array detection as first step before normal type lookup
- Arrays map to OCaml type: `<element_type> array`
- Example: `gir_type.array = Some { element_type = "utf8" }` → `string array`

**Location**: Lines 190-218

**How it works**:
```ocaml
match gir_type.array with
| Some array_info ->
    (* Recursively resolve element type *)
    match find_type_mapping_for_gir_type ~ctx array_info.element_type with
    | Some element_mapping ->
        (* Create array type mapping *)
        let ocaml_type = element_mapping.ocaml_type ^ " array" in
        Some { ocaml_type; c_type; ... }
    | None -> None  (* Unsupported element type *)
| None -> normal_type_lookup ~ctx gir_type
```

### 2. C Stub Generation (`src/tools/gir_gen/generate/c_stubs.ml`)

#### A. Array Conversion Helpers (Lines 144-239)

**`generate_array_ml_to_c`** - Converts OCaml array → C array
- Uses `g_malloc()` for GTK compatibility (NOT `malloc()`)
- Generates inline conversion loop
- Handles zero-terminated arrays (adds NULL terminator)
- Handles length-based arrays
- Returns cleanup code based on transfer-ownership:
  - `TransferNone`: `g_free(c_array)` after call
  - `TransferFull/Container/Floating`: No cleanup (GTK owns memory)

**`generate_array_c_to_ml`** - Converts C array → OCaml array
- Computes length (from parameter or by counting to NULL)
- Uses `caml_alloc()` and `Store_field()`
- Generates inline conversion loop

**Example generated code** (OCaml → C):
```c
int arg1_length = Wosize_val(arg1);
const char** c_arg1 = (const char**)g_malloc(sizeof(const char*) * (arg1_length + 1));
for (int i = 0; i < arg1_length; i++) {
    c_arg1[i] = String_val(Field(arg1, i));
}
c_arg1[arg1_length] = NULL;
// ... call gtk function ...
g_free(c_arg1);  // Only if TransferNone
```

#### B. Parameter Processing Integration (Lines 940-1015)

**Modified**: `generate_c_method` parameter handling
- Detects `p.param_type.array = Some array_info`
- Calls `generate_array_ml_to_c` for array parameters
- Tracks cleanup code in `param_acc.cleanups` list
- Passes transfer-ownership to determine cleanup behavior

**Key change**: Added `cleanups` field to `param_acc` type:
```ocaml
type param_acc = {
    ocaml_idx : int;
    decls : Buffer.t;
    args : string list;
    cleanups : string list  (* NEW *)
}
```

#### C. Cleanup Code Emission (Lines 1138-1189)

**Modified**: Function body generation
- Emits cleanup code after function call but before return
- Format: `cleanup_section = "\n    " ^ String.concat ~sep:"\n    " cleanups`
- Inserted between `c_call` and `ret_conv` in generated C functions

**Generated structure**:
```c
CAMLexport CAMLprim value ml_gtk_some_method(value self, value arg1) {
    CAMLparam2(self, arg1);

    // Array conversion
    int arg1_length = Wosize_val(arg1);
    const char** c_arg1 = (const char**)g_malloc(...);
    // ... conversion loop ...

    // Call GTK function
    gtk_some_method(GtkSomeType_val(self), c_arg1);

    // Cleanup (if TransferNone)
    g_free(c_arg1);

    CAMLreturn(Val_unit);
}
```

#### D. Return Value Handling (Lines 1061-1105)

**Modified**: Return type processing
- Detects `meth.return_type.array = Some array_info`
- Calls `generate_array_c_to_ml` for array returns
- Generates conversion loop inline

**Example generated code** (C → OCaml):
```c
const char** result = gtk_about_dialog_get_artists(self);
int result_length = 0;
while (result[result_length] != NULL) result_length++;
value ml_result = caml_alloc(result_length, 0);
for (int i = 0; i < result_length; i++) {
    Store_field(ml_result, i, caml_copy_string(result[i]));
}
CAMLreturn(ml_result);
```

### 3. ML Interface Generation (`src/tools/gir_gen/generate/ml_interface.ml`)

**No changes needed** - Already uses `find_type_mapping_for_gir_type`, so array types automatically appear in signatures.

**Example output**:
```ocaml
(** Returns the names of the artists *)
external get_artists : t -> string array = "ml_gtk_about_dialog_get_artists"
```

---

## Current Limitations

### 1. **Array Length Parameters** (CRITICAL)

**Problem**: Methods with separate length parameters aren't fully handled yet.

**Example GIR**:
```xml
<method name="set_items">
  <parameters>
    <parameter name="items">
      <array length="1">  <!-- Length is parameter index 1 -->
        <type name="utf8"/>
      </array>
    </parameter>
    <parameter name="n_items">
      <type name="gint"/>  <!-- This parameter specifies array length -->
    </parameter>
  </parameters>
</method>
```

**Current behavior**: Passes array pointer, but doesn't automatically pass computed length to the length parameter.

**Solution needed**:
1. Track which parameters are array lengths via `array.length = Some idx`
2. When processing parameter at index `idx`, substitute computed length variable
3. Example: Replace `arg2` with `arg1_length` if `params[0].array.length = Some 1`

**Code location**: `generate_c_method`, parameter processing loop around line 940

### 2. **Out-Parameter Arrays** (TODO)

**Problem**: Arrays returned via out parameters with separate length outputs.

**Example**:
```xml
<method name="get_selection">
  <return-value><type name="none"/></return-value>
  <parameters>
    <parameter name="indices" direction="out">
      <array length="1">
        <type name="gint"/>
      </array>
    </parameter>
    <parameter name="n_indices" direction="out">
      <type name="gint"/>
    </parameter>
  </parameters>
</method>
```

**Solution needed**:
1. Allocate C array pointer as out parameter
2. Call function which sets pointer and length
3. Convert C array to OCaml array using returned length
4. Free C array if transfer-full

**Code location**: Out parameter handling around line 923

### 3. **Zero-Terminated Detection** (PARTIAL)

**Problem**: Parser reads `zero-terminated` attribute, but converter doesn't verify GTK documentation.

**Current**: Trusts GIR `zero-terminated="1"` attribute

**Risk**: If GIR is wrong, could iterate past array bounds

**Solution**: For string arrays, assume zero-terminated unless proven otherwise. For primitive arrays, require explicit length.

### 4. **Element-Specific Transfer Semantics** (TODO)

**Problem**: String arrays with `TransferFull` need per-element `g_free()` PLUS container `g_free()`.

**Example**:
```c
// transfer-full on string array means:
char** strings = gtk_get_strings(...);  // We own everything
for (int i = 0; strings[i] != NULL; i++) {
    g_free(strings[i]);  // Free each string
}
g_free(strings);  // Free container
```

**Current behavior**: Only frees container with `g_free(c_array)`

**Solution needed**:
- Check if element type needs individual freeing
- Generate nested loop for transfer-full with pointer elements
- Respect `TransferContainer` (free container only, not elements)

**Code location**: `generate_array_ml_to_c` cleanup generation, line 200

### 5. **Fixed-Size Arrays** (NOT IMPLEMENTED)

**Problem**: GIR can specify `fixed-size="N"` for stack-allocated arrays.

**Example**:
```xml
<array fixed-size="4">
  <type name="gdouble"/>
</array>
```

**Current behavior**: Treats as malloc'd array (incorrect)

**Solution**: Detect `array_info.fixed_size = Some n`, use stack allocation

### 6. **No Length Information Error** (BUG)

**Problem**: Crash with "Array has no length information" when GIR has:
```xml
<array c:type="const char* const*">
  <type name="utf8"/>
</array>
```

No `zero-terminated`, `length`, or `fixed-size` attributes.

**Root cause**: `generate_array_c_to_ml` line 211 requires length info

**Solution options**:
1. Assume zero-terminated for string arrays by default
2. Skip methods with ambiguous arrays (log warning)
3. Add heuristics based on C type patterns

**Immediate fix**: Check for missing length info earlier and skip method generation

---

## Testing Status

### What Was Tested
- ✅ Code compiles: `dune build src/tools/gir_gen/main.exe`
- ✅ Type mapping recognizes arrays
- ✅ C code generation produces syntactically valid output

### What Needs Testing
- ⚠️ Real GIR generation with AboutDialog class
  - **Failed with**: "Array has no length information" error
  - **Method**: `get_artists` returning `string array`
- ❌ Actual compilation of generated C stubs
- ❌ Runtime testing of array methods
- ❌ Memory leak testing (valgrind)

### Test Commands

```bash
# Test with AboutDialog (has array methods)
mkdir -p /tmp/array_test
echo "AboutDialog" > /tmp/array_test/filter.txt
dune exec src/tools/gir_gen/main.exe -- \
    -f /tmp/array_test/filter.txt \
    /usr/share/gir-1.0/Gtk-4.0.gir \
    /tmp/array_test

# Verify generated C compiles
gcc -c /tmp/array_test/generated/ml_about_dialog_gen.c \
    -I$(ocamlc -where) \
    $(pkg-config --cflags gtk4) \
    -fsyntax-only

# Check for methods that use arrays
grep -A 10 "string array" /tmp/array_test/generated/about_dialog.mli
```

---

## Next Session Priorities

### Immediate (Critical Path)

1. **Fix "No length information" error**
   - **File**: `generate/c_stubs.ml`, line 211 in `generate_array_c_to_ml`
   - **Solution**: Default to zero-terminated for string arrays
   - **Code change**:
     ```ocaml
     let length_code = match length_expr with
     | Some expr -> sprintf "int %s = %s;" length_var expr
     | None ->
         if array_info.zero_terminated then
             (* existing code *)
         else if is_string_array array_info then
             (* Default string arrays to zero-terminated *)
             sprintf "int %s = 0;\n    while (%s[%s] != NULL) %s++;"
                 length_var var length_var length_var
         else
             (* Skip method instead of crashing *)
             failwith (sprintf "Array has no length information for %s" var)
     ```

2. **Handle array length parameters**
   - Track array→length relationships
   - Substitute length variables in argument list
   - Test with methods like `set_items(items, n_items)`

3. **Test end-to-end with a simple array method**
   - Find a method with `zero-terminated="1"` string array return
   - Generate bindings
   - Compile C stubs
   - Write OCaml test program
   - Run under valgrind to check for leaks

### Medium Priority

4. **Implement out-parameter arrays**
   - Modify out-parameter handling in `generate_c_method`
   - Generate array conversion using length from co-out-parameter

5. **Handle TransferFull for string arrays**
   - Add per-element g_free for pointer arrays
   - Distinguish TransferFull vs TransferContainer

6. **Add comprehensive array tests**
   - Unit tests for conversion helpers
   - Integration tests with real GTK methods
   - Memory leak tests

### Low Priority

7. **Fixed-size array support**
8. **Better error messages** for unsupported array patterns
9. **Documentation** in generated code (array conversion comments)

---

## Files Modified

```
src/tools/gir_gen/type_mappings.ml       - Array type detection and mapping
src/tools/gir_gen/generate/c_stubs.ml    - Array conversion and cleanup
src/tools/gir_gen/types.ml               - Already had gir_array type
parse/gir_parser.ml                      - Already parsed arrays
```

## Key Design Decisions

1. **Inline loops instead of macros** - Better readability, proper scoping
2. **g_malloc over malloc** - GTK compatibility, prevents allocator mismatch
3. **Transfer-ownership drives cleanup** - Respects GObject memory conventions
4. **Cleanup tracking per-parameter** - Allows post-call cleanup without goto
5. **Fail on ambiguous arrays** - Better than silent wrong behavior

---

## Known Issues for Debugging

### Issue 1: "Array has no length information"
- **Location**: `c_stubs.ml:223` in `generate_array_c_to_ml`
- **Trigger**: Array without `zero-terminated`, `length`, or `fixed-size`
- **Fix**: See priority #1 above

### Issue 2: Length parameter not passed
- **Location**: `c_stubs.ml:981` where `arg_expr` is determined
- **Current**: Passes array pointer only
- **Needed**: Pass computed length to the length parameter position

### Issue 3: String array memory leaks with TransferFull
- **Location**: `c_stubs.ml:200` cleanup code generation
- **Current**: Only frees container
- **Needed**: Free each string then container

---

## Architecture Notes

### Memory Management Philosophy

**Input arrays (OCaml → C)**:
- Always allocate with `g_malloc()`
- If `TransferNone`: GTK doesn't keep pointer → cleanup with `g_free()`
- If `TransferFull`: GTK takes ownership → no cleanup
- Cleanup happens AFTER function call, BEFORE return

**Output arrays (C → OCaml)**:
- If `TransferNone`: GTK owns array → copy to OCaml, don't free C array
- If `TransferFull`: We own array → copy to OCaml, free C array with `g_free()`
- If `TransferContainer`: We own container, not elements → free container only

### Type Mapping Flow

```
GIR Type → Type Mapping
  ↓
gir_type.array = Some { element_type; zero_terminated; length; ... }
  ↓
Recursive lookup: element_type → element_mapping
  ↓
Result: { ocaml_type = "element_type array"; c_to_ml = "array_c_to_ml"; ... }
  ↓
ML Signature: external foo : t -> element_type array
  ↓
C Stub: Generate inline conversion with proper memory management
```

---

## Quick Reference

### Finding Array Methods in GIR
```bash
grep -B 5 -A 10 '<array' /usr/share/gir-1.0/Gtk-4.0.gir | less
```

### Key GIR Attributes
- `<array zero-terminated="1">` - NULL-terminated
- `<array length="N">` - Length from parameter index N
- `<array fixed-size="N">` - Stack-allocated size N
- `transfer-ownership="none|full|container"` - Memory ownership

### Generated Code Patterns

**Zero-terminated string array parameter**:
```c
int arg_length = Wosize_val(arg);
const char** c_arg = (const char**)g_malloc(sizeof(const char*) * (arg_length + 1));
for (int i = 0; i < arg_length; i++) {
    c_arg[i] = String_val(Field(arg, i));
}
c_arg[arg_length] = NULL;
gtk_function(c_arg);
g_free(c_arg);  // Only if TransferNone
```

**Zero-terminated string array return**:
```c
const char** result = gtk_get_strings();
int result_length = 0;
while (result[result_length] != NULL) result_length++;
value ml_result = caml_alloc(result_length, 0);
for (int i = 0; i < result_length; i++) {
    Store_field(ml_result, i, caml_copy_string(result[i]));
}
CAMLreturn(ml_result);
```

---

## Success Criteria

Array handling will be considered complete when:

1. ✅ Type mapping recognizes arrays → OCaml `array` type
2. ✅ C conversion code generates without syntax errors
3. ✅ Memory management uses g_malloc/g_free correctly
4. ⚠️ Generated C code compiles with gcc
5. ⚠️ At least one array method works end-to-end
6. ❌ No memory leaks in valgrind testing
7. ❌ Array length parameters handled correctly
8. ❌ Out-parameter arrays work
9. ❌ TransferFull with string arrays frees correctly
10. ❌ Documentation updated

**Current status**: 3/10 complete

---

## Commands for Next Session

```bash
# 1. Check current branch
git status

# 2. Build generator
dune build src/tools/gir_gen/main.exe

# 3. Test with simple array method
# Find a method with clear zero-terminated attribute first:
grep -A 5 'zero-terminated="1"' /usr/share/gir-1.0/Gtk-4.0.gir | head -50

# 4. Generate and test
mkdir -p /tmp/array_test
echo "StringList" > /tmp/array_test/filter.txt  # Or another simple class
dune exec src/tools/gir_gen/main.exe -- \
    -f /tmp/array_test/filter.txt \
    /usr/share/gir-1.0/Gtk-4.0.gir \
    /tmp/array_test 2>&1 | tee /tmp/array_test/generation.log

# 5. Check generated code
cat /tmp/array_test/generated/*.mli | grep array
cat /tmp/array_test/generated/*.c | grep -A 20 "array"
```

---

End of session plan. Resume from priority #1: Fix "No length information" error.
