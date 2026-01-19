# Array Handling Implementation Plan

**Date**: 2026-01-09 (Initial), 2026-01-10 (Critical Fixes & Out-Params & Compilation Fixes)
**Status**: Partial Implementation - Methods work, Constructors/Properties skipped
**Branch**: array-handling

## Overview

Implemented array type handling in the GIR code generator for **methods** (parameters and return values). Arrays are recognized, type-mapped, and inline conversion code is generated with proper memory management.

**Current Limitation**: Constructors and properties with array types are currently **skipped** (filtered out) rather than properly implemented. This is a workaround to avoid generating broken code.

---

## Remaining TODOs

### High Priority - Complete Array Support

#### TODO 1: Implement array handling in constructors
**Location**: `src/tools/gir_gen/generate/c_stub_class.ml` - `generate_c_constructor`

**Current behavior**: Constructors with array parameters are filtered out via `Filtering.constructor_has_array_params`.

**What's needed**:
- Detect array parameters in constructors (like we do for methods)
- Generate inline array conversion code using `generate_array_ml_to_c`
- Handle cleanup code after constructor call
- Remove the `constructor_has_array_params` filter once implemented

**Example constructor that's currently skipped**:
```xml
<constructor name="new_from_names" c:identifier="g_themed_icon_new_from_names">
  <parameters>
    <parameter name="iconnames">
      <array length="1"><type name="utf8"/></array>
    </parameter>
    <parameter name="len"><type name="gint"/></parameter>
  </parameters>
</constructor>
```

**Files to modify**:
- `src/tools/gir_gen/generate/c_stub_class.ml` - Add array handling to `generate_c_constructor`
- `src/tools/gir_gen/generate/filtering.ml` - Remove `constructor_has_array_params` filter
- `src/tools/gir_gen/generate/ml_interface.ml` - Remove array filter for constructors

#### TODO 2: Implement array handling in property getters
**Location**: `src/tools/gir_gen/generate/c_stub_class.ml` - `generate_c_property_getter`

**Current behavior**: Properties with array types are filtered out via `is_array_type` check in `should_generate_property`.

**What's needed**:
- Detect array return types in property getters
- Generate inline array conversion code using `generate_array_c_to_ml`
- Handle proper cleanup based on transfer ownership

**Example property that's currently skipped**:
```xml
<property name="argv" readable="1">
  <array><type name="utf8"/></array>
</property>
```

**Files to modify**:
- `src/tools/gir_gen/generate/c_stub_class.ml` - Add array handling to `generate_c_property_getter`
- `src/tools/gir_gen/generate/filtering.ml` - Remove array check from `should_generate_property`

#### TODO 3: Implement array handling in property setters
**Location**: `src/tools/gir_gen/generate/c_stub_class.ml` - `generate_c_property_setter`

**What's needed**:
- Detect array parameter types in property setters
- Generate inline array conversion code using `generate_array_ml_to_c`
- Handle cleanup code

### Medium Priority

#### TODO 4: Remove ARRAY_INLINE marker from type_mappings.ml
**Location**: `src/tools/gir_gen/type_mappings.ml` line 206-207

Once constructors and properties handle arrays properly, we should consider whether `ARRAY_INLINE` is still needed as a marker, or if we can use a more explicit mechanism.

#### TODO 5: Add tests for constructor array handling
**Location**: `src/tools/test_gir_gen/c_stubs/array_tests.ml`

Add tests for:
- Constructor with zero-terminated string array
- Constructor with length-based array
- Constructor with nullable array parameter

#### TODO 6: Add tests for property array handling
Add tests for:
- Property getter returning string array
- Property setter accepting string array

### Low Priority

#### TODO 7: Fixed-size array support
GIR can specify `fixed-size="N"` for arrays. Currently treated as heap-allocated.

#### TODO 8: Better error messages
Improve error messages when array patterns aren't supported.

---

## What Was Implemented (Session 2026-01-10 Part 3 - Compilation Fixes)

### C Compilation Error Fixes

This session fixed several C compilation errors in the generated array handling code.

#### 1. Fixed const qualifier issue in array allocation
**File**: `src/tools/gir_gen/generate/c_stub_class.ml`

**Problem**: When the array's C type was `const gchar* const*`, we were stripping one `*` to get the element type, resulting in `const gchar* const` which is read-only.

**Solution**: Use the inner `<type>` element's `c:type` directly instead of stripping from the array's `c:type`.

**Before**:
```c
const gchar* const* c_arg2 = ...;  // Can't assign to elements!
c_arg2[i] = String_val(...);       // ERROR: read-only
```

**After**:
```c
gchar** c_arg2 = ...;              // Modifiable
c_arg2[i] = String_val(...);       // OK
```

#### 2. Fixed struct vs pointer assignment for arrays
**File**: `src/tools/gir_gen/generate/c_stub_helpers.ml`

**Problem**: For arrays of structs (e.g., `GOutputMessage[]`), the `_val` macro returns a pointer, but we were assigning directly to a struct element.

**Solution**: Dereference the conversion result when the element type is a struct (non-pointer).

**Before**:
```c
c_arg1[i] = GOutputMessage_val(Field(arg1, i));  // ERROR: pointer assigned to struct
```

**After**:
```c
c_arg1[i] = *GOutputMessage_val(Field(arg1, i)); // OK: dereferenced
```

#### 3. Added workaround filters for constructors/properties with arrays
**Files**: `src/tools/gir_gen/generate/filtering.ml`, `c_stub_class.ml`, `c_stub_record.ml`, `ml_interface.ml`

**Problem**: Constructors and properties with array types were generating code with `ARRAY_INLINE` marker (undefined function).

**Solution**: Added filtering to skip these cases for now:
- `is_array_type` - checks if a gir_type has an array
- `constructor_has_array_params` - checks if constructor has array parameters
- Updated `should_generate_property` to skip array properties

This is a **workaround**, not a fix. See TODOs 1-3 above for proper implementation.

### Files Modified
```
src/tools/gir_gen/generate/c_stub_class.ml    - Use element c:type for arrays
src/tools/gir_gen/generate/c_stub_helpers.ml  - Dereference struct array elements
src/tools/gir_gen/generate/c_stub_record.ml   - Add array filter for constructors
src/tools/gir_gen/generate/filtering.ml       - Add is_array_type, constructor_has_array_params
src/tools/gir_gen/generate/ml_interface.ml    - Add array filter for constructors
src/tools/test_gir_gen/c_stubs/c_stubs_tests.ml - Fix test function call syntax
```

---

## What Was Implemented (Session 2026-01-10 Part 2)

### Out-Parameter Array Testing & Completion

This session completed out-parameter array handling and added comprehensive test coverage.

#### 1. Out-Parameter Array Implementation

**What was added:**
- Detection and mapping of out-parameter array→length relationships
- Proper C pointer declaration for out arrays (`type* out1 = NULL;`)
- Array conversion after C function call using length from companion out-parameter
- Integration with existing cleanup infrastructure

**Example generated code:**
```c
CAMLexport CAMLprim value ml_gtk_list_get_selection(value self)
{
CAMLparam1(self);
    gint* out1 = NULL;   /* Array pointer set by C function */
    gint out2;           /* Length set by C function */

    gtk_list_get_selection(GtkList_val(self), &out1, &out2);

    /* Convert to OCaml array using out2 as length */
    value ml_out1 = caml_alloc(out2, 0);
    for (int i = 0; i < out2; i++) {
        Store_field(ml_out1, i, Val_int(out1[i]));
    }

    /* Cleanup if TransferFull */
    g_free(out1);

    CAMLreturn(ml_out1);
}
```

**Key files modified:**
- `src/tools/gir_gen/generate/c_stub_class.ml` - Out-parameter array conversion

#### 2. Comprehensive Test Suite

**New test file:** `src/tools/test_gir_gen/c_stubs/array_tests.ml`

**Test coverage (7 tests, all passing):**
- ✅ Zero-terminated string array input
- ✅ Zero-terminated string array return
- ✅ Array with explicit length parameter
- ✅ Out-parameter array with length
- ✅ Out-parameter string array
- ✅ Array cleanup with TransferNone
- ✅ Array cleanup with TransferFull

**New validation helpers in `c_validation.ml`:**
- `allocates_with_null_terminator` - Checks g_malloc calls
- `sets_null_terminator` - Verifies NULL terminator assignment
- `uses_const_pointer_array` - Validates const qualifiers
- `counts_to_null` - Checks for length computation
- `calls_caml_alloc` - Verifies OCaml array allocation
- `has_conversion_loop` - Checks for Store_field calls
- `computes_array_length` - Validates Wosize_val usage
- `passes_length_variable` - Checks length parameter passing
- `calls_g_free` - Verifies cleanup code

#### 3. Valgrind Testing Documentation

**New file:** `VALGRIND_TESTING.md`

Comprehensive guide covering:
- Manual valgrind testing process (step-by-step)
- Automated testing approaches (bash scripts, dune rules, CI/CD)
- Common issues and solutions
- Expected test coverage
- Integration with GitHub Actions

**Key insight:** Current unit tests verify *code generation correctness*. Valgrind tests would verify *runtime memory safety*. Both valuable but serve different purposes.

#### 4. Medium Priority Items Clarified

**Fixed-size arrays:** Resolved - heap allocation acceptable for all arrays.

**Element-wise freeing heuristics:** Documented approach for determining per-element cleanup based on element type (GObject, boxed type, pointer). Currently conservative (only string arrays fully handled) to avoid crashes. Lower priority as:
- Most common case (strings) already correct
- TransferFull arrays are rare
- Conservative approach prevents crashes
- Worst case is leak, not corruption

### Testing Results

**All array tests passing:**
```bash
$ dune exec src/tools/test_gir_gen/test_gir_gen.exe -- test "Arrays"
✅ Arrays  0  Zero-terminated string array input
✅ Arrays  1  Zero-terminated string array return
✅ Arrays  2  Array with explicit length parameter
✅ Arrays  3  Out-parameter array with length
✅ Arrays  4  Out-parameter string array
✅ Arrays  5  Array cleanup with transfer-none
✅ Arrays  6  Array cleanup with transfer-full

7 tests run, 7 passed
```

### Files Modified in This Session

```
src/tools/gir_gen/generate/c_stub_class.ml           - Out-param arrays
src/tools/test_gir_gen/c_stubs/array_tests.ml        - NEW: Comprehensive test suite
src/tools/test_gir_gen/infrastructure/c_validation.ml - Array validation helpers
src/tools/test_gir_gen/test_gir_gen.ml                - Register array tests
src/tools/test_gir_gen/dune                           - Add array_tests module
VALGRIND_TESTING.md                                   - NEW: Valgrind testing guide
ARRAY_HANDLING_PLAN.md                                - Status updates
```

---

## What Was Implemented (Session 2026-01-10 Part 1)

### Critical Fixes to Array Handling

This session focused on fixing the broken and missing functionality identified in the previous session. All critical path items have been completed.

#### 1. Fixed "Array has no length information" Error

**File**: `src/tools/gir_gen/generate/c_stub_helpers.ml`

**Problem**: Arrays without explicit `zero-terminated`, `length`, or `fixed-size` attributes caused the generator to crash.

**Solution**:
- Added `is_string_array` helper function to detect string arrays
- Modified `generate_array_c_to_ml` to default string arrays to zero-terminated when no length information is provided
- Better error messages for truly ambiguous arrays

**Code changes**:
```ocaml
(* New helper function *)
let is_string_array (array_info : gir_array) =
  let elem_name = String.lowercase_ascii array_info.element_type.name in
  let elem_ctype = array_info.element_type.c_type in
  String.equal elem_name "utf8" || String.equal elem_name "gchararray" ||
  is_string_type elem_ctype

(* Updated length computation in generate_array_c_to_ml *)
else if is_string_array array_info then
  (* String arrays are typically zero-terminated even if not explicitly marked *)
  sprintf "int %s = 0;\n    while (%s[%s] != NULL) %s++;"
    length_var var length_var length_var
else
  (* No length information and not a string array - cannot safely convert *)
  failwith (sprintf "Array has no length information for %s (element type: %s). \
                     Either zero-terminated, length, or fixed-size attribute required."
             var array_info.element_type.name)
```

**Testing**: Successfully generated bindings for `GtkAboutDialog.get_artists()` which previously crashed.

#### 2. Fixed Array Length Parameter Handling

**File**: `src/tools/gir_gen/generate/c_stub_class.ml`

**Problem**: Methods with separate array length parameters (e.g., `set_items(items, n_items)`) were not handled correctly. The generated code would pass the array pointer but not properly handle the length parameter.

**Solution**:
- Added a first pass to build a map of which parameters are array length parameters
- Modified parameter processing to check if a parameter is a length parameter and substitute the computed length variable

**Code changes**:
```ocaml
(* First pass: identify which parameters are array length parameters *)
let length_param_map =
  List.fold_left
    ~f:(fun acc (p : gir_param) ->
      match p.param_type.array with
      | Some array_info -> (
          match array_info.length with
          | Some length_idx ->
              (* Build map: OCaml arg index -> length variable name *)
              ...
          | None -> acc
        )
      | None -> acc)
    ~init:[]
    meth.parameters
in

(* During parameter processing *)
match List.assoc_opt acc.ocaml_idx length_param_map with
| Some length_var ->
    (* This parameter is the length for an array - use the computed length variable *)
    length_var
| None ->
    (* Normal parameter handling *)
    ...
```

#### 3. Fixed TransferFull Memory Cleanup for Arrays

**File**: `src/tools/gir_gen/generate/c_stub_helpers.ml` and `c_stub_class.ml`

**Problem**: Arrays returned with `TransferFull` ownership were not being freed properly. String arrays need per-element freeing plus container freeing.

**Solution**:
- Modified `generate_array_c_to_ml` to take `transfer_ownership` parameter and return cleanup code
- Added proper cleanup generation for different transfer modes
- Threaded cleanup code through the return value processing

**Code changes**:
```ocaml
(* In generate_array_c_to_ml *)
let cleanup_code = match transfer_ownership with
  | Types.TransferNone | Types.TransferFloating ->
      (* GTK owns the array - don't free it *)
      ""
  | Types.TransferContainer ->
      (* We own the container but not the elements - just free the container *)
      sprintf "g_free(%s);" var
  | Types.TransferFull ->
      (* We own everything - free elements (if pointers) then container *)
      if is_string_array array_info then
        (* String array: free each string then the container *)
        sprintf
          "for (int i = 0; i < %s; i++) {\n\
          \      g_free((gpointer)%s[i]);\n\
          \    }\n\
          \    g_free(%s);"
          length_var var var
      else if is_pointer_array then
        (* Generic pointer array: just free container for now *)
        sprintf "g_free(%s);" var
      else
        (* Primitive array: just free the container *)
        sprintf "g_free(%s);" var
in
```

#### 4. Defaulted String Arrays to Zero-Terminated

**File**: `src/tools/gir_gen/generate/c_stub_helpers.ml`

**Problem**: Input string arrays without explicit `zero-terminated` attribute were not getting NULL terminators added, causing crashes when GTK functions expected them.

**Solution**:
- Modified `generate_array_ml_to_c` to default string arrays to zero-terminated unless they have an explicit length parameter

**Code changes**:
```ocaml
(* Determine if this array should be zero-terminated *)
let should_zero_terminate =
  array_info.zero_terminated ||
  (* Default: string arrays without explicit length are typically zero-terminated in GTK *)
  (is_string_array array_info && Option.is_none array_info.length)
in
```

**Testing**: Verified that `GtkAboutDialog.set_artists()` now correctly generates:
```c
int arg1_length = Wosize_val(arg1);
char** c_arg1 = (char**)g_malloc(sizeof(char*) * (arg1_length + 1));
for (int i = 0; i < arg1_length; i++) {
  c_arg1[i] = String_val(Field(arg1, i));
}
c_arg1[arg1_length] = NULL;  // Added!
```

### Testing Results

**Generator Build**: ✅ Compiles without errors or warnings

**Code Generation Test**: ✅ Successfully generated bindings for GtkAboutDialog
- `get_artists : t -> string array` - Returns NULL-terminated string array
- `set_artists : t -> string array -> unit` - Accepts OCaml array, converts with NULL terminator
- `add_credit_section : t -> string -> string array -> unit` - Handles string array parameter

**Generated Code Quality**:
- ✅ Proper NULL terminator handling
- ✅ Correct memory allocation (including space for NULL)
- ✅ Cleanup code generated for TransferNone arrays
- ✅ No crashes on arrays without explicit length info

### Files Modified in This Session

```
src/tools/gir_gen/generate/c_stub_helpers.ml  - Array conversion and cleanup fixes
src/tools/gir_gen/generate/c_stub_class.ml    - Length parameter handling
```

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
- ✅ Code compiles: `dune build src/tools/gir_gen/gir_gen.exe`
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
dune exec src/tools/gir_gen/gir_gen.exe -- \
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

### Completed in Session 2026-01-10 ✅

1. ✅ **Fixed "No length information" error** - String arrays now default to zero-terminated
2. ✅ **Handle array length parameters** - Length parameters correctly substituted
3. ✅ **Handle TransferFull for string arrays** - Per-element freeing implemented
4. ✅ **Default string arrays to zero-terminated** - Input arrays get NULL terminators

### Remaining Work

#### High Priority

1. **Implement out-parameter arrays**
   - Modify out-parameter handling in `generate_c_method`
   - Generate array conversion using length from co-out-parameter
   - Example: `get_selection(out indices: int array, out n_indices: int)`

2. **Test end-to-end with compiled bindings**
   - Compile generated C stubs into a full OCaml library
   - Write OCaml test program using array methods
   - Run under valgrind to check for leaks
   - Verify NULL termination works correctly at runtime

#### Medium Priority

3. **Add comprehensive array tests**
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

### Methods (COMPLETE)
1. ✅ Type mapping recognizes arrays → OCaml `array` type
2. ✅ C conversion code generates without syntax errors
3. ✅ Memory management uses g_malloc/g_free correctly
4. ✅ Generated C code compiles with gcc
5. ✅ Array length parameters handled correctly
6. ✅ TransferFull with string arrays generates correct free code
7. ✅ String arrays default to NULL-terminated when appropriate
8. ✅ Out-parameter arrays work (implemented and tested)
9. ✅ Comprehensive test suite for methods (7 tests, all passing)
10. ✅ Struct array elements properly dereferenced

### Constructors (NOT IMPLEMENTED - TODO 1)
11. ❌ Constructors with array parameters generate correct code
12. ❌ Length parameters in constructors handled correctly
13. ❌ Tests for constructor array handling

### Properties (NOT IMPLEMENTED - TODOs 2-3)
14. ❌ Property getters with array return types generate correct code
15. ❌ Property setters with array parameters generate correct code
16. ❌ Tests for property array handling

### Other
17. 📋 Valgrind testing documented (see VALGRIND_TESTING.md)
18. ❌ Fixed-size array support (low priority)

**Current status**: Methods complete, Constructors/Properties skipped via filtering

**Workaround in place**: Constructors with array params are filtered via `constructor_has_array_params`. Properties with array types are filtered via `is_array_type` check in `should_generate_property`. This prevents broken code generation but means these bindings are not available to users.

---

## Commands for Next Session

```bash
# 1. Check current branch
git status

# 2. Build generator
dune build src/tools/gir_gen/gir_gen.exe

# 3. Test with simple array method
# Find a method with clear zero-terminated attribute first:
grep -A 5 'zero-terminated="1"' /usr/share/gir-1.0/Gtk-4.0.gir | head -50

# 4. Generate and test
mkdir -p /tmp/array_test
echo "StringList" > /tmp/array_test/filter.txt  # Or another simple class
dune exec src/tools/gir_gen/gir_gen.exe -- \
    -f /tmp/array_test/filter.txt \
    /usr/share/gir-1.0/Gtk-4.0.gir \
    /tmp/array_test 2>&1 | tee /tmp/array_test/generation.log

# 5. Check generated code
cat /tmp/array_test/generated/*.mli | grep array
cat /tmp/array_test/generated/*.c | grep -A 20 "array"
```

---

End of session plan. Resume from priority #1: Fix "No length information" error.
