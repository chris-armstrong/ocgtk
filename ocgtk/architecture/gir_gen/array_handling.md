# GIR Generator Array Handling Reference

**Status**: Implemented for methods, workaround filters for constructors/properties  
**Last Updated**: 2026-01-21  

## Overview

The GIR code generator supports automatic conversion between OCaml arrays and C arrays for GTK bindings. Arrays can appear in parameters, return values, and out-parameters, with proper memory management based on transfer ownership semantics.

**Current Implementation Status**:
- ✅ **Methods**: Full array support (parameters, returns, out-params)
- ⚠️ **Constructors**: Filtered out if they have array parameters (TODO)
- ⚠️ **Properties**: Filtered out if they have array types (TODO)

## Architecture

### Type System Integration

Arrays are detected early in the type mapping pipeline (`type_mappings.ml`):

```ocaml
(* Arrays are handled recursively *)
let rec find_type_mapping_for_gir_type ~ctx (gir_type : Types.gir_type) =
  match gir_type.array with
  | Some array_info ->
      (* Recursively resolve element type *)
      match find_type_mapping_for_gir_type ~ctx array_info.element_type with
      | Some element_mapping ->
          let ocaml_type = element_mapping.ocaml_type ^ " array" in
          Some { ocaml_type; c_to_ml = "ARRAY_INLINE"; ml_to_c = "ARRAY_INLINE"; ... }
      | None -> None
  | None -> normal_type_lookup ~ctx gir_type
```

**Key Design Decision**: Arrays use `"ARRAY_INLINE"` as a marker instead of macro names. This signals that conversion must be handled via inline code generation rather than simple macro invocation.

### Module Organization

Array handling code is organized across several modules:

- **`type_mappings.ml`**: Array type detection and OCaml type mapping
- **`c_stub_array_conv.ml`**: Core conversion code generation
  - `generate_array_ml_to_c`: OCaml → C conversion
  - `generate_array_c_to_ml`: C → OCaml conversion
  - `is_string_array`: String array detection
- **`c_stub_class.ml`**: Integration into method/constructor/property generation
- **`filtering.ml`**: Array-based filtering (workarounds for incomplete implementation)

## Array Types and Representations

### GIR Array Attributes

Arrays in GIR files have several attributes that control conversion:

```xml
<!-- Zero-terminated string array -->
<array zero-terminated="1">
  <type name="utf8"/>
</array>

<!-- Array with explicit length parameter -->
<array length="1">  <!-- Length from parameter index 1 -->
  <type name="gint"/>
</array>

<!-- Fixed-size array (NOT IMPLEMENTED) -->
<array fixed-size="4">
  <type name="gdouble"/>
</array>

<!-- GPtrArray (GLib pointer array) -->
<array name="GLib.PtrArray">
  <type name="utf8"/>
</array>
```

### Length Information

Arrays must have one of the following to determine length:

1. **`zero-terminated="1"`**: NULL-terminated for pointers, zero-terminated for primitives
2. **`length="N"`**: Length from parameter at index N
3. **`fixed-size="N"`**: Fixed size N (not implemented)
4. **Implicit**: String arrays default to zero-terminated when no length info provided

**String Array Heuristic**: Arrays with element types `utf8`, `gchararray`, `filename`, or `char*` are treated as zero-terminated by default.

### Transfer Ownership

Transfer ownership controls memory management:

- **`TransferNone`**: GTK owns memory
  - Input arrays: We allocate, pass, then free
  - Return arrays: GTK owns, we copy, don't free
- **`TransferFull`**: Caller owns memory
  - Input arrays: We allocate, pass, GTK frees
  - Return arrays: We receive ownership, copy, then free
- **`TransferContainer`**: Container ownership transferred, not elements
  - Return arrays: Free container only, not elements
- **`TransferFloating`**: Treated like TransferNone

## Conversion Patterns

### OCaml → C Conversion (Input Parameters)

**Generated code structure**:

```c
/* Zero-terminated string array with TransferNone */
int arg1_length = Wosize_val(arg1);
char** c_arg1 = (char**)g_malloc(sizeof(char*) * (arg1_length + 1));
for (int i = 0; i < arg1_length; i++) {
    c_arg1[i] = String_val(Field(arg1, i));
}
c_arg1[arg1_length] = NULL;  // NULL terminator

gtk_function(c_arg1);

g_free(c_arg1);  // Cleanup (TransferNone only)
```

**Implementation**: `c_stub_array_conv.ml:generate_array_ml_to_c`

**Key features**:
- Uses `g_malloc` (not `malloc`) for GTK compatibility
- Computes length with `Wosize_val`
- Adds NULL terminator for zero-terminated arrays
- Returns cleanup code based on transfer ownership

**Struct array handling**:

For non-pointer element types (structs), the `_val` macro returns a pointer, so we dereference:

```c
/* Array of structs (GOutputMessage[]) */
GOutputMessage* c_arg1 = (GOutputMessage*)g_malloc(sizeof(GOutputMessage) * arg1_length);
for (int i = 0; i < arg1_length; i++) {
    c_arg1[i] = *GOutputMessage_val(Field(arg1, i));  // Dereference
}
```

### C → OCaml Conversion (Return Values)

**Generated code structure**:

```c
/* Zero-terminated string array return */
const char** result = gtk_get_strings();

int result_length = 0;
while (result[result_length] != NULL) result_length++;

CAMLlocal1(ml_result);
ml_result = caml_alloc(result_length, 0);
for (int i = 0; i < result_length; i++) {
    Store_field(ml_result, i, caml_copy_string(result[i]));
}

/* Cleanup if TransferFull */
for (int i = 0; i < result_length; i++) {
    g_free((gpointer)result[i]);
}
g_free(result);

CAMLreturn(ml_result);
```

**Implementation**: `c_stub_array_conv.ml:generate_array_c_to_ml`

**Key features**:
- Computes length (from parameter, by counting to NULL, or from GPtrArray->len)
- Allocates OCaml array with `caml_alloc`
- Converts elements with `Store_field`
- Frees C array if we own it (TransferFull/TransferContainer)

### Out-Parameter Arrays

Out-parameter arrays are returned from C functions via pointer:

```c
/* Method signature: get_selection(out indices: int array, out n_indices: int) */

CAMLexport CAMLprim value ml_gtk_list_get_selection(value self) {
    CAMLparam1(self);
    
    gint* out1 = NULL;   /* Array pointer - set by C function */
    gint out2;           /* Length - set by C function */
    
    gtk_list_get_selection(GtkList_val(self), &out1, &out2);
    
    /* Convert to OCaml array using out2 as length */
    CAMLlocal1(ml_out1);
    ml_out1 = caml_alloc(out2, 0);
    for (int i = 0; i < out2; i++) {
        Store_field(ml_out1, i, Val_int(out1[i]));
    }
    
    /* Cleanup if TransferFull */
    g_free(out1);
    
    CAMLreturn(ml_out1);
}
```

**Key features**:
- Out-parameter array declared as pointer initialized to NULL
- C function sets pointer and length via `&out1`, `&out2`
- Conversion uses companion out-parameter as length
- Proper cleanup based on transfer ownership

**Implementation**: `c_stub_class.ml` (out-parameter handling in `generate_c_method`)

### Array Length Parameters

When an array has a companion length parameter, the generator automatically substitutes the computed length:

```xml
<!-- GIR definition -->
<method name="set_items">
  <parameters>
    <parameter name="items">
      <array length="1">  <!-- Length is parameter index 1 -->
        <type name="utf8"/>
      </array>
    </parameter>
    <parameter name="n_items">
      <type name="gint"/>
    </parameter>
  </parameters>
</method>
```

**Generated code**:

```c
/* OCaml signature: set_items : t -> string array -> unit */
CAMLexport CAMLprim value ml_gtk_list_set_items(value self, value arg1) {
    CAMLparam2(self, arg1);
    
    /* Convert array */
    int arg1_length = Wosize_val(arg1);
    char** c_arg1 = ...;
    
    /* Pass computed length to length parameter */
    gtk_list_set_items(GtkList_val(self), c_arg1, arg1_length);
    
    g_free(c_arg1);
    CAMLreturn(Val_unit);
}
```

**Implementation**: `c_stub_class.ml` builds a map of length parameters in first pass, then substitutes during argument processing.

### GPtrArray Handling

GPtrArray (GLib pointer arrays) have special handling:

```c
/* GPtrArray return value */
GPtrArray* result = gtk_get_elements();

guint result_length = result->len;
gpointer* result_pdata = result->pdata;

CAMLlocal1(ml_result);
ml_result = caml_alloc(result_length, 0);
for (int i = 0; i < result_length; i++) {
    Store_field(ml_result, i, Val_string((char*)result_pdata[i]));
}

/* TransferFull: free array and elements */
g_ptr_array_free(result, TRUE);

CAMLreturn(ml_result);
```

**Detection**: Arrays with `array_name = "GLib.PtrArray"`  
**Length**: Uses `result->len` field  
**Data**: Uses `result->pdata` field  
**Cleanup**:
- `TransferNone`: No cleanup
- `TransferContainer`: `g_ptr_array_unref(result)`
- `TransferFull`: `g_ptr_array_free(result, TRUE)` (frees elements too)

## Memory Management

### Allocation Strategy

**Always use `g_malloc` for C arrays**:
- Ensures GTK compatibility
- Prevents allocator mismatch issues
- Required by GTK functions that may internally realloc or free

```c
/* CORRECT */
char** array = (char**)g_malloc(sizeof(char*) * (length + 1));

/* WRONG - do not use malloc */
char** array = (char**)malloc(sizeof(char*) * (length + 1));
```

### Cleanup Rules

Cleanup depends on transfer ownership and direction:

| Direction | Ownership      | Who Cleans Up        | When               |
|-----------|----------------|----------------------|--------------------|
| In        | TransferNone   | OCaml binding        | After C call       |
| In        | TransferFull   | GTK                  | Never (GTK owns)   |
| Out/Return| TransferNone   | GTK                  | Never (GTK owns)   |
| Out/Return| TransferFull   | OCaml binding        | After conversion   |
| Out/Return| TransferContainer| OCaml binding      | Container only     |

### String Array Cleanup

String arrays with `TransferFull` require per-element cleanup:

```c
/* TransferFull string array - free each string then container */
for (int i = 0; i < result_length; i++) {
    g_free((gpointer)result[i]);
}
g_free(result);
```

**Implementation**: `c_stub_array_conv.ml:cleanup_for_string_array`

### Cleanup Code Ordering

Cleanup happens **after** C function call but **before** return:

```c
/* Convert OCaml array to C */
int arg1_length = Wosize_val(arg1);
char** c_arg1 = (char**)g_malloc(...);
/* ... conversion loop ... */

/* Call GTK function */
gtk_function(c_arg1);

/* Cleanup (if TransferNone) */
g_free(c_arg1);

/* Return */
CAMLreturn(Val_unit);
```

This ensures:
- C arrays are available during GTK call
- Cleanup happens even if return is void
- No memory leaks from early returns

**Implementation**: Cleanup code stored in `param_acc.cleanups` list during parameter processing, emitted between call and return.

## Code Generation Pipeline

### 1. Type Mapping (`type_mappings.ml`)

```ocaml
(* Detect array types early *)
match gir_type.array with
| Some array_info ->
    let element_mapping = find_type_mapping_for_gir_type ~ctx array_info.element_type in
    { ocaml_type = element_mapping.ocaml_type ^ " array";
      c_to_ml = "ARRAY_INLINE";  (* Marker *)
      ml_to_c = "ARRAY_INLINE";  (* Marker *)
      ... }
```

### 2. ML Interface Generation (`ml_interface.ml`)

```ocaml
(* Automatically gets array type from type mapping *)
external set_authors : t -> string array -> unit = "ml_gtk_about_dialog_set_authors"
external get_artists : t -> string array = "ml_gtk_about_dialog_get_artists"
```

No special handling needed - relies on type mapping.

### 3. C Stub Generation (`c_stub_class.ml`)

**Parameter processing**:

```ocaml
(* Check if parameter has array type *)
match p.param_type.array with
| Some array_info ->
    (* Generate inline conversion *)
    let conv_code, c_var, length_var, cleanup_code =
      generate_array_ml_to_c ~ctx ~var:ml_var ~array_info
        ~element_c_type ~transfer_ownership
    in
    (* Track cleanup for later emission *)
    { acc with cleanups = cleanup_code :: acc.cleanups; ... }
| None -> (* Normal parameter handling *)
```

**Return value processing**:

```ocaml
(* Check if return type has array *)
match meth.return_type.array with
| Some array_info ->
    (* Generate inline conversion *)
    let conv_code, ml_var, cleanup_code =
      generate_array_c_to_ml ~ctx ~var:"result" ~array_info
        ~length_expr ~element_c_type ~transfer_ownership
    in
    (* Include cleanup in function body *)
| None -> (* Normal return handling *)
```

**Out-parameter processing**:

```ocaml
(* Detect out-parameter arrays *)
match p.direction with
| Out when Option.is_some p.param_type.array ->
    (* Declare pointer *)
    sprintf "%s* out%d = NULL;" c_type ocaml_idx
    
    (* After C call, convert array using companion length parameter *)
    let length_expr = Some (sprintf "out%d" (ocaml_idx + 1)) in
    generate_array_c_to_ml ~ctx ~var:(sprintf "out%d" ocaml_idx) ...
```

### 4. Array Conversion Helpers (`c_stub_array_conv.ml`)

Core conversion logic extracted to reusable functions:

- `generate_array_ml_to_c`: Input parameter conversion
- `generate_array_c_to_ml`: Return/out-parameter conversion
- `is_string_array`: String array detection heuristic
- `zero_terminated_conversion`: Zero-terminated array allocation
- `length_code_for_array`: Length computation code
- `cleanup_code_for_transfer_full`: Cleanup code generation

## Current Limitations

### 1. Constructors with Array Parameters (HIGH PRIORITY)

**Status**: Filtered out via `Filtering.constructor_has_array_params`

**Example filtered constructor**:
```xml
<constructor name="new_from_names">
  <parameters>
    <parameter name="iconnames">
      <array length="1"><type name="utf8"/></array>
    </parameter>
    <parameter name="len"><type name="gint"/></parameter>
  </parameters>
</constructor>
```

**What's needed**:
- Apply same array conversion logic used for methods
- Handle array length parameters
- Generate cleanup code
- Remove filter from `filtering.ml`

**Files to modify**:
- `c_stub_class.ml`: Add array handling to `generate_c_constructor`
- `c_stub_record.ml`: Add array handling to record constructors
- `filtering.ml`: Remove `constructor_has_array_params` filter
- `ml_interface.ml`: Remove array filter for constructors

### 2. Property Getters with Array Types (HIGH PRIORITY)

**Status**: Filtered out via `is_array_type` check in `should_generate_property`

**Example filtered property**:
```xml
<property name="argv" readable="1">
  <array><type name="utf8"/></array>
</property>
```

**What's needed**:
- Detect array return type in property getters
- Generate inline conversion using `generate_array_c_to_ml`
- Handle cleanup based on transfer ownership
- Remove filter from `filtering.ml`

**Files to modify**:
- `c_stub_class.ml`: Add array handling to `generate_c_property_getter`
- `filtering.ml`: Remove array check from `should_generate_property`

### 3. Property Setters with Array Parameters (HIGH PRIORITY)

**What's needed**:
- Detect array parameter type in property setters
- Generate inline conversion using `generate_array_ml_to_c`
- Handle cleanup code
- Remove filter from `filtering.ml`

**Files to modify**:
- `c_stub_class.ml`: Add array handling to `generate_c_property_setter`

### 4. ARRAY_INLINE Marker (MEDIUM PRIORITY)

**Location**: `type_mappings.ml` line 206-207

The `"ARRAY_INLINE"` marker is used to signal inline code generation. Consider whether a more explicit mechanism would be clearer (e.g., a variant type or dedicated flag).

### 5. Fixed-Size Arrays (LOW PRIORITY)

**Status**: Not implemented

GIR can specify `fixed-size="N"` for stack-allocated arrays. Currently these are treated as heap-allocated.

**Example**:
```xml
<array fixed-size="4">
  <type name="gdouble"/>
</array>
```

**What's needed**: Detect `array_info.fixed_size`, use stack allocation instead of `g_malloc`.

### 6. Generic Pointer Array Cleanup (LOW PRIORITY)

For `TransferFull` pointer arrays (non-string), we currently only free the container. Some element types may require per-element freeing (GObject, boxed types).

**Current behavior**: Conservative (free container only) to avoid crashes  
**Risk**: May leak elements that need freeing  
**Mitigation**: Most common case (strings) handled correctly  

**What's needed**: Heuristics or metadata to determine if elements need freeing based on element type.

## Testing

### Test Coverage (7 tests, all passing)

**File**: `src/tools/test_gir_gen/c_stubs/array_tests.ml`

1. ✅ Zero-terminated string array input
2. ✅ Zero-terminated string array return
3. ✅ Array with explicit length parameter
4. ✅ Out-parameter array with length
5. ✅ Out-parameter string array
6. ✅ Array cleanup with TransferNone
7. ✅ Array cleanup with TransferFull
8. ✅ GPtrArray return (transfer-none)
9. ✅ GPtrArray return (transfer-full)
10. ✅ GPtrArray with struct elements

### Test Helpers

**File**: `src/tools/test_gir_gen/infrastructure/c_validation.ml`

Validation helpers for generated code:
- `allocates_with_null_terminator`: Checks g_malloc calls
- `sets_null_terminator`: Verifies NULL terminator assignment
- `uses_const_pointer_array`: Validates const qualifiers
- `counts_to_null`: Checks for length computation
- `calls_caml_alloc`: Verifies OCaml array allocation
- `has_conversion_loop`: Checks for Store_field calls
- `computes_array_length`: Validates Wosize_val usage
- `passes_length_variable`: Checks length parameter passing
- `calls_g_free`: Verifies cleanup code

### Running Tests

```bash
# Run all array tests
cd ocgtk
xvfb-run dune exec src/tools/test_gir_gen/test_gir_gen.exe -- test "Arrays"

# Run specific test
xvfb-run dune exec src/tools/test_gir_gen/test_gir_gen.exe -- test "Arrays" 0
```

### Manual Testing

Generate bindings for classes with array methods:

```bash
mkdir -p /tmp/array_test
echo "AboutDialog" > /tmp/array_test/filter.txt

dune exec src/tools/gir_gen/gir_gen.exe -- \
    -f /tmp/array_test/filter.txt \
    /usr/share/gir-1.0/Gtk-4.0.gir \
    /tmp/array_test

# Check generated signatures
grep "array" /tmp/array_test/generated/about_dialog.mli

# Verify C code compiles
gcc -c /tmp/array_test/generated/ml_about_dialog_gen.c \
    -I$(ocamlc -where) \
    $(pkg-config --cflags gtk4) \
    -fsyntax-only
```

### Valgrind Testing

For runtime memory safety testing, see `VALGRIND_TESTING.md`.

## Design Decisions

### 1. Inline Loops Instead of Macros

**Decision**: Generate explicit loops for conversion, not conversion macros

**Rationale**:
- Better readability in generated code
- Proper variable scoping
- Easier debugging with debuggers
- Clear memory allocation/deallocation ordering

### 2. g_malloc Over malloc

**Decision**: Always use `g_malloc` for C array allocation

**Rationale**:
- GTK compatibility (some functions may internally realloc/free)
- Prevents allocator mismatch
- Consistent with GTK memory management conventions
- Allows GTK's memory profiling tools to track allocations

### 3. Transfer Ownership Drives Cleanup

**Decision**: Cleanup logic based strictly on GIR transfer-ownership attribute

**Rationale**:
- Respects GObject memory conventions
- Clear ownership semantics
- Prevents double-free and memory leaks
- Documented behavior in GObject Introspection

### 4. Cleanup Tracking Per-Parameter

**Decision**: Track cleanup code during parameter processing, emit after call

**Rationale**:
- Allows proper cleanup without goto statements
- Clean separation of conversion and cleanup
- Handles multiple array parameters correctly
- Works with existing error handling

### 5. Fail on Ambiguous Arrays

**Decision**: Fail code generation when array lacks length information

**Rationale**:
- Better than generating incorrect code
- Forces fix in GIR file or heuristics
- Clear error message guides resolution
- String array heuristic covers most cases

### 6. String Array Zero-Terminated Default

**Decision**: Default string arrays to zero-terminated when no length info

**Rationale**:
- GTK convention: string arrays are almost always NULL-terminated
- Reduces GIR file ambiguity
- Matches actual GTK behavior
- Can be overridden with explicit `length` attribute

## Common Patterns

### Finding Array Methods in GIR

```bash
# Find all array parameters
grep -B 5 -A 10 '<array' /usr/share/gir-1.0/Gtk-4.0.gir | less

# Find zero-terminated arrays
grep -B 3 'zero-terminated="1"' /usr/share/gir-1.0/Gtk-4.0.gir

# Find arrays with length parameters
grep -B 3 'length="' /usr/share/gir-1.0/Gtk-4.0.gir
```

### Understanding Transfer Ownership

```bash
# Find transfer-full arrays
grep -B 10 'transfer-ownership="full"' /usr/share/gir-1.0/Gtk-4.0.gir | grep -A 5 '<array'

# Find transfer-none arrays
grep -B 10 'transfer-ownership="none"' /usr/share/gir-1.0/Gtk-4.0.gir | grep -A 5 '<array'
```

## Related Documentation

- **`ARRAY_HANDLING_PLAN.md`**: Implementation plan and session notes
- **`VALGRIND_TESTING.md`**: Runtime memory safety testing guide
- **`SECURITY_GUIDELINES.md`**: Security best practices for C bindings
- **`FFI_GUIDELINES.md`**: General FFI implementation guidelines

## Quick Reference

### Key Files

```
src/tools/gir_gen/
├── type_mappings.ml                   - Array type detection
├── generate/
│   ├── c_stub_array_conv.ml          - Conversion code generation
│   ├── c_stub_class.ml               - Method/constructor/property integration
│   ├── c_stub_helpers.ml             - Re-exports array functions
│   └── filtering.ml                  - Array-based filtering (workarounds)
└── test/
    └── test_gir_gen/
        └── c_stubs/
            └── array_tests.ml        - Comprehensive test suite
```

### Key Functions

- `Type_mappings.find_type_mapping_for_gir_type`: Array type detection
- `Array_conv.generate_array_ml_to_c`: OCaml → C conversion
- `Array_conv.generate_array_c_to_ml`: C → OCaml conversion
- `Array_conv.is_string_array`: String array detection
- `Filtering.is_array_type`: Array type check (used in filters)

### Generated Code Patterns

**Zero-terminated string array parameter**:
```c
int arg_length = Wosize_val(arg);
char** c_arg = (char**)g_malloc(sizeof(char*) * (arg_length + 1));
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
CAMLlocal1(ml_result);
ml_result = caml_alloc(result_length, 0);
for (int i = 0; i < result_length; i++) {
    Store_field(ml_result, i, caml_copy_string(result[i]));
}
CAMLreturn(ml_result);
```

**Array with length parameter**:
```c
int arg1_length = Wosize_val(arg1);
int* c_arg1 = (int*)g_malloc(sizeof(int) * arg1_length);
for (int i = 0; i < arg1_length; i++) {
    c_arg1[i] = Int_val(Field(arg1, i));
}
gtk_function(c_arg1, arg1_length);  // Length passed automatically
g_free(c_arg1);
```

## Summary

The GIR generator's array handling provides:

✅ Automatic conversion between OCaml and C arrays  
✅ Proper memory management based on transfer ownership  
✅ Support for zero-terminated, length-based, and GPtrArray types  
✅ Correct handling of string arrays with per-element cleanup  
✅ Out-parameter array support with length coordination  
✅ Comprehensive test coverage with validation helpers  

⚠️ Constructors and properties with arrays are currently filtered (TODO)  
⚠️ Fixed-size arrays not yet implemented (low priority)  
⚠️ Generic pointer cleanup conservative (may leak in rare cases)  

The implementation is production-ready for methods, with clear paths forward for completing constructor and property support.
