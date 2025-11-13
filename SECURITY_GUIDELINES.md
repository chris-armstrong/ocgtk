# Security Guidelines for OCaml C Bindings with GLib/GTK Integration

**Version**: 1.0
**Date**: November 2025
**Author**: LablGTK Security Review

This document provides comprehensive guidelines for writing secure, memory-safe C bindings for OCaml, with a focus on GLib/GTK integration. These guidelines are based on security analysis of the LablGTK codebase.

---

## Table of Contents

1. [Memory Safety](#memory-safety)
2. [OCaml GC Interaction](#ocaml-gc-interaction)
3. [String and Buffer Operations](#string-and-buffer-operations)
4. [GLib/GTK Specific Patterns](#glib-gtk-specific-patterns)
5. [Error Handling](#error-handling)
6. [Callback Safety](#callback-safety)
7. [Integer Safety](#integer-safety)
8. [Pointer Lifetime Management](#pointer-lifetime-management)
9. [Testing and Validation](#testing-and-validation)
10. [Code Review Checklist](#code-review-checklist)

---

## 1. Memory Safety

### 1.1 Always Check Allocation Results

**Bad:**
```c
ml_callback_data *cbd = g_new(ml_callback_data, 1);
cbd->closure = clos;  // Segfault if g_new returned NULL
```

**Good:**
```c
ml_callback_data *cbd = g_new(ml_callback_data, 1);
if (cbd == NULL) {
    caml_raise_out_of_memory();
}
cbd->closure = clos;
```

**Rule**: Always check return values from:
- `malloc()`, `calloc()`, `realloc()`
- `g_new()`, `g_new0()`, `g_malloc()`
- Any function that can return NULL on OOM

### 1.2 Check Integer Overflow Before Allocation

**Bad:**
```c
size_t size = sizeof(char *) * (len + 1);  // Can overflow!
char **array = malloc(size);
```

**Good:**
```c
if (len > (SIZE_MAX / sizeof(char *)) - 1) {
    caml_invalid_argument("array too long for allocation");
}
size_t size = sizeof(char *) * (len + 1);
char **array = malloc(size);
if (array == NULL) {
    caml_raise_out_of_memory();
}
```

**Rule**: Before any allocation of `count * item_size`:
1. Check `count > SIZE_MAX / item_size`
2. Check allocation result is not NULL

### 1.3 Validate Buffer Bounds for memcpy/strcpy

**Bad:**
```c
void *dest = malloc(dest_size);
void *src = get_source();
memcpy(dest, src, src_len);  // No check that dest_size >= src_len
```

**Good:**
```c
void *dest = malloc(dest_size);
if (dest == NULL) {
    caml_raise_out_of_memory();
}
void *src = get_source();
if (src_len > dest_size) {
    free(dest);
    caml_invalid_argument("source larger than destination");
}
if (src_len > 0 && src != NULL) {  // Guard against NULL
    memcpy(dest, src, src_len);
}
```

**Rule**: For every `memcpy(dest, src, len)`:
1. Validate `len <= allocated_size_of_dest`
2. Check `src != NULL` if `len > 0`
3. Check `dest != NULL` if `len > 0`

### 1.4 Free Resources on All Error Paths

**Bad:**
```c
char **keys = malloc(sizeof(char*) * len);
char **values = malloc(sizeof(char*) * len);
if (values == NULL) {
    caml_raise_out_of_memory();  // Leaks keys!
}
```

**Good:**
```c
char **keys = malloc(sizeof(char*) * len);
if (keys == NULL) {
    caml_raise_out_of_memory();
}
char **values = malloc(sizeof(char*) * len);
if (values == NULL) {
    free(keys);  // Clean up before raising
    caml_raise_out_of_memory();
}
```

**Rule**: Before calling any function that doesn't return (raises exception), free all locally allocated resources.

---

## 2. OCaml GC Interaction

### 2.1 Use CAMLparam/CAMLlocal/CAMLreturn Correctly

**Bad:**
```c
value my_function(value arg)
{
    value result = caml_alloc_string(100);  // Can trigger GC!
    // If GC runs, 'result' might be invalid
    return result;
}
```

**Good:**
```c
CAMLprim value my_function(value arg)
{
    CAMLparam1(arg);
    CAMLlocal1(result);

    result = caml_alloc_string(100);
    // GC knows about 'result', won't lose it

    CAMLreturn(result);
}
```

**Rules**:
1. Every function returning `value` or taking `value` parameters must use `CAMLparam*`
2. Every local variable of type `value` that survives across an allocation must use `CAMLlocal*`
3. Functions that allocate OCaml values:
   - `caml_alloc*`
   - `caml_copy_string`
   - `caml_callback*`
   - Any function that might call these
4. Return with `CAMLreturn(val)`, not `return val`
5. For functions returning non-value types but allocating, use `CAMLreturnT(type, val)`

### 2.2 Protect OCaml Values Held by C

**Bad:**
```c
GClosure *closure = g_closure_new_simple(sizeof(GClosure), (gpointer)callback);
// GC can collect 'callback' since C holds the only reference
```

**Good:**
```c
GClosure *closure = g_closure_new_simple(sizeof(GClosure), (gpointer)callback);
caml_register_global_root((value*)&closure->data);

// Later, when destroying:
static void invalidate_notifier(gpointer data, GClosure *closure) {
    caml_remove_global_root((value*)&closure->data);
}
```

**Rule**: Any OCaml value stored in C memory must be protected with `caml_register_global_root()` and later removed with `caml_remove_global_root()`.

### 2.3 Deep Copy GValues, Never Shallow Copy

**Bad:**
```c
ml_gvalue *mlgv = (ml_gvalue *)Data_custom_val(result);
memcpy(&mlgv->gvalue, source_gvalue, sizeof(GValue));  // Shallow copy!
// When both are unset: double-free of internal pointers
```

**Good:**
```c
ml_gvalue *mlgv = (ml_gvalue *)Data_custom_val(result);
g_value_init(&mlgv->gvalue, G_VALUE_TYPE(source_gvalue));
g_value_copy(source_gvalue, &mlgv->gvalue);  // Deep copy
mlgv->initialized = 1;
```

**Rule**: Never use `memcpy()` to copy GValues, GObjects, or any structure with internal pointers. Use the appropriate deep-copy function.

### 2.4 Young Generation Block Safety

**Bad:**
```c
value stable_reference = some_value;  // Might be young block
// Store stable_reference somewhere, GC compacts, pointer invalid
```

**Good:**
```c
value stable_reference;
if (Is_young_block(some_value)) {
    // Copy to old generation
    stable_reference = ml_stable_copy(some_value);
} else {
    stable_reference = some_value;
}
```

**Rule**: Values stored in C structures for later use should not be young generation blocks (check with `Is_young_block()` or ensure they're copied to old generation).

---

## 3. String and Buffer Operations

### 3.1 Use Proper String Conversion Functions

**Bad:**
```c
char *str = (char*)some_ocaml_value;  // Wrong!
```

**Good:**
```c
const char *str = String_val(ocaml_string);  // For reading
char *buf = Bytes_val(ocaml_bytes);          // For writing
```

**Rule**: Always use:
- `String_val(v)` to get `const char*` from OCaml string (read-only)
- `Bytes_val(v)` to get `char*` from OCaml bytes (writable)
- `caml_string_length(v)` to get length (not strlen!)

### 3.2 Validate String Lengths

**Bad:**
```c
int length = Option_val(len, Int_val, strlen(start));  // Unbounded strlen!
```

**Good:**
```c
int max_safe_length = 1000000;  // Application-specific limit
int length;
if (len != Val_none) {
    length = Int_val(Some_val(len));
} else {
    // Use strnlen with safe bound instead of strlen
    length = strnlen(start, max_safe_length);
    if (length == max_safe_length) {
        caml_invalid_argument("string too long or not NULL-terminated");
    }
}
```

**Rule**: Never use unbounded `strlen()` on pointers from external sources. Use `strnlen()` with a reasonable maximum.

### 3.3 NULL-Terminate String Buffers

**Bad:**
```c
char buffer[100];
strncpy(buffer, source, 100);  // Not NULL-terminated if source >= 100 chars
printf("%s", buffer);  // Buffer over-read
```

**Good:**
```c
char buffer[100];
strncpy(buffer, source, sizeof(buffer) - 1);
buffer[sizeof(buffer) - 1] = '\0';  // Ensure NULL termination
printf("%s", buffer);
```

**Rule**: After `strncpy()`, always explicitly NULL-terminate: `buffer[size-1] = '\0'`

### 3.4 Safe String Allocation from C to OCaml

**Good:**
```c
CAMLprim value ml_get_string(value unit) {
    CAMLparam1(unit);
    CAMLlocal1(result);

    const char *c_string = get_c_string();  // May be NULL
    if (c_string == NULL) {
        result = caml_copy_string("");  // Or raise exception
    } else {
        result = caml_copy_string(c_string);
    }

    CAMLreturn(result);
}
```

**Rule**: Use `caml_copy_string()` to create OCaml strings from C strings. Handle NULL by returning empty string or raising exception.

---

## 4. GLib/GTK Specific Patterns

### 4.1 Always Check g_object_new() Result

**Bad:**
```c
GObject *obj = g_object_new(type, NULL);
return Val_pointer(obj);  // Crash if obj is NULL
```

**Good:**
```c
GObject *obj = g_object_new(type, NULL);
if (obj == NULL) {
    caml_failwith("g_object_new: failed to create object");
}
return Val_pointer(obj);
```

### 4.2 Handle GError Properly

**Bad:**
```c
GError *error = NULL;
gdk_pixbuf_save(pb, filename, type, &error);
if (error) {
    char *msg = g_strdup_printf("Error: %s", error->message);
    g_error_free(error);
    caml_failwith(msg);  // Never returns
    g_free(msg);  // UNREACHABLE - memory leak
}
```

**Good - Option 1 (Document intentional leak):**
```c
GError *error = NULL;
gdk_pixbuf_save(pb, filename, type, &error);
if (error) {
    /* Note: msg intentionally leaked since caml_failwith never returns.
     * This is acceptable as errors are rare and leak is bounded. */
    char *msg = g_strdup_printf("Error: %s", error->message);
    g_error_free(error);
    caml_failwith(msg);
}
```

**Good - Option 2 (Use stack buffer):**
```c
GError *error = NULL;
gdk_pixbuf_save(pb, filename, type, &error);
if (error) {
    char msg[512];
    snprintf(msg, sizeof(msg), "Error: %.400s", error->message);
    g_error_free(error);
    caml_failwith(msg);  // msg on stack, caml_failwith copies it
}
```

**Rule**: `caml_failwith()` and `caml_raise*()` never return. Either:
- Document intentional leak if allocation is small and rare
- Use stack buffer (caml_failwith copies the string)
- Use static string: `caml_failwith("error message")`

### 4.3 Validate GList/GSList Structure

**Bad:**
```c
GList *GList_val(value list, gpointer (*func)(value)) {
    GList *res = NULL;
    while (list != Val_emptylist) {
        res = g_list_prepend(res, func(Field(list, 0)));
        list = Field(list, 1);  // Assumes valid list cell
    }
    return g_list_reverse(res);
}
```

**Good:**
```c
GList *GList_val(value list, gpointer (*func)(value)) {
    GList *res = NULL;
    while (list != Val_emptylist) {
        /* Validate list cell structure */
        if (!Is_block(list) || Wosize_val(list) < 2) {
            g_list_free(res);  // Clean up before raising
            caml_invalid_argument("GList_val: malformed list");
        }
        res = g_list_prepend(res, func(Field(list, 0)));
        list = Field(list, 1);
    }
    return g_list_reverse(res);
}
```

**Rule**: When converting OCaml lists to GLib lists:
1. Validate each cell with `Is_block()` and `Wosize_val() >= 2`
2. Free allocated GList on error before raising
3. Consider adding counter to detect infinite/circular lists

### 4.4 Reference Counting

**Good:**
```c
CAMLprim value ml_create_widget(value unit) {
    GtkWidget *widget = gtk_button_new();
    // GTK widgets are initially floating
    // g_object_ref_sink() takes ownership
    g_object_ref_sink(widget);
    return Val_GObject(widget);
}

// In finalizer:
static void finalize_gobject(value val) {
    GObject *obj = GObject_val(val);
    if (obj != NULL) {
        g_object_unref(obj);
    }
}
```

**Rule**:
- New GObjects have floating reference
- Use `g_object_ref_sink()` to take ownership
- Always `g_object_unref()` in finalizer
- Never access GObject after `g_object_unref()` (use-after-free)

---

## 5. Error Handling

### 5.1 Check for NULL Before Dereferencing

**Bad:**
```c
CAMLprim value ml_get_property(value obj, value name) {
    GObject *gobj = GObject_val(obj);
    return get_property(gobj, String_val(name));  // gobj might be NULL
}
```

**Good:**
```c
CAMLprim value ml_get_property(value obj, value name) {
    CAMLparam2(obj, name);

    if (obj == Val_unit || Pointer_val(obj) == NULL) {
        caml_invalid_argument("ml_get_property: NULL object");
    }

    GObject *gobj = GObject_val(obj);
    CAMLreturn(get_property(gobj, String_val(name)));
}
```

**Rule**: Validate pointer arguments before use:
- Check `Val_unit` for option types
- Check `Pointer_val() == NULL`
- Raise `caml_invalid_argument()` with descriptive message

### 5.2 Use Appropriate Exception Types

```c
// Out of memory
caml_raise_out_of_memory();

// Invalid function argument
caml_invalid_argument("function_name: description of error");

// General failure
caml_failwith("operation failed: reason");

// Custom exception
static const value *my_exception = NULL;
if (my_exception == NULL) {
    my_exception = caml_named_value("MyException");
}
caml_raise_with_arg(*my_exception, error_value);
```

---

## 6. Callback Safety

### 6.1 Always Check callback_exn Results

**Bad:**
```c
static void callback_func(gpointer data) {
    value *closure = (value*)data;
    caml_callback(*closure, Val_unit);  // Exception silently lost
}
```

**Good:**
```c
static void callback_func(gpointer data) {
    CAMLparam0();
    CAMLlocal1(result);
    value *closure = (value*)data;

    result = caml_callback_exn(*closure, Val_unit);

    if (Is_exception_result(result)) {
        // Log error for debugging
        value exn = Extract_exception(result);
        char *exn_str = caml_format_exception(exn);
        g_warning("Callback raised exception: %s", exn_str);
        g_free(exn_str);
    }

    CAMLreturn0;
}
```

**Rule**: Use `caml_callback_exn()` family and check `Is_exception_result()`. Log or handle exceptions appropriately.

### 6.2 Don't Store Pointers to Temporary Data

**Bad:**
```c
static void closure_marshal(GClosure *closure, GValue *return_value,
                            guint n_params, const GValue *param_values, ...) {
    value argv = caml_alloc(3, 0);
    Store_field(argv, 2, (value)param_values);  // DANGER!
    // param_values pointer is only valid during this call
    // If OCaml stores argv for later: use-after-free
}
```

**Good:**
```c
static void closure_marshal(..., const GValue *param_values, ...) {
    CAMLparam0();
    CAMLlocal1(argv);

    argv = caml_alloc(3, 0);

    /* IMPORTANT: param_values is only valid during this callback.
     * OCaml code MUST NOT store argv for later use. Document this
     * constraint in the OCaml interface. */
    Store_field(argv, 2, (value)param_values);

    value result = caml_callback_exn(callback, argv);
    // param_values goes out of scope here

    CAMLreturn0;
}
```

**Rule**:
- Never store C pointers in OCaml values if pointer lifetime is shorter than value lifetime
- Document lifetime constraints in OCaml interface
- Consider copying data if it must outlive the callback

### 6.3 Protect Closures with Global Roots

**Good:**
```c
typedef struct {
    value closure;  // OCaml callback
} callback_data;

CAMLprim value ml_set_timeout(value ms, value callback) {
    CAMLparam2(ms, callback);

    callback_data *cbd = g_new(callback_data, 1);
    if (cbd == NULL) {
        caml_raise_out_of_memory();
    }

    cbd->closure = callback;
    caml_register_global_root(&cbd->closure);  // Protect from GC

    guint id = g_timeout_add(Int_val(ms), timeout_func, cbd);

    CAMLreturn(Val_int(id));
}

static void destroy_callback_data(gpointer data) {
    callback_data *cbd = (callback_data*)data;
    caml_remove_global_root(&cbd->closure);  // Unprotect
    g_free(cbd);
}

static gboolean timeout_func(gpointer data) {
    CAMLparam0();
    CAMLlocal1(result);
    callback_data *cbd = (callback_data*)data;

    result = caml_callback_exn(cbd->closure, Val_unit);

    if (Is_exception_result(result)) {
        CAMLreturnT(gboolean, FALSE);  // Stop timeout
    }

    CAMLreturnT(gboolean, Bool_val(result));
}
```

---

## 7. Integer Safety

### 7.1 Validate Integer Ranges

**Bad:**
```c
CAMLprim value ml_create_pixbuf(value width, value height) {
    int w = Int_val(width);
    int h = Int_val(height);
    return create_pixbuf(w, h);  // No validation
}
```

**Good:**
```c
CAMLprim value ml_create_pixbuf(value width, value height) {
    CAMLparam2(width, height);

    int w = Int_val(width);
    int h = Int_val(height);

    if (w <= 0 || h <= 0) {
        caml_invalid_argument("create_pixbuf: width and height must be positive");
    }

    if (w > 32767 || h > 32767) {
        caml_invalid_argument("create_pixbuf: dimensions too large");
    }

    CAMLreturn(create_pixbuf(w, h));
}
```

**Rule**: Validate integer inputs:
- Check ranges (negative where invalid, maximum values)
- Check for overflow in calculations
- Document valid ranges

### 7.2 Safe Binary Search Midpoint

**Bad:**
```c
int mid = (first + last) / 2;  // Overflow if first + last > INT_MAX
```

**Good:**
```c
int mid = first + (last - first) / 2;  // No overflow
```

### 7.3 OCaml Int Range Limitations

**Important**: OCaml ints are tagged and have limited range:
- On 64-bit: -2^62 to 2^62-1 (not full 64-bit)
- On 32-bit: -2^30 to 2^30-1 (not full 32-bit)

```c
// For full range integers, use:
value Val_long(long);
long Long_val(value);

// For native integers:
value caml_copy_int32(int32_t);
value caml_copy_int64(int64_t);
value caml_copy_nativeint(intnat);
```

---

## 8. Pointer Lifetime Management

### 8.1 Custom Blocks for C Objects

**Good:**
```c
// Define custom operations
static void finalize_my_object(value val) {
    my_object *obj = (my_object*)Data_custom_val(val);
    if (obj->data != NULL) {
        cleanup_data(obj->data);
        obj->data = NULL;
    }
}

static struct custom_operations my_object_ops = {
    "my.object.v1",
    finalize_my_object,
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default,
    custom_compare_ext_default,
    custom_fixed_length_default
};

// Allocation
CAMLprim value ml_create_object(value unit) {
    CAMLparam1(unit);
    CAMLlocal1(result);

    result = caml_alloc_custom(&my_object_ops, sizeof(my_object), 0, 1);
    my_object *obj = (my_object*)Data_custom_val(result);

    obj->data = allocate_data();
    if (obj->data == NULL) {
        caml_raise_out_of_memory();
    }

    CAMLreturn(result);
}
```

**Rule**: Use custom blocks with finalizers for:
- C objects that need cleanup
- File handles, sockets, etc.
- GObjects (alternative to manual ref counting)

### 8.2 Avoid Use-After-Free

**Bad:**
```c
GtkWidget *widget = create_widget();
// Store pointer in OCaml value
// Later: widget destroyed, pointer invalid, OCaml still has reference
```

**Good:**
```c
// Option 1: Use custom block with finalizer that NULLs pointer
static void finalize_widget(value val) {
    GtkWidget **widget_ptr = (GtkWidget**)Data_custom_val(val);
    if (*widget_ptr != NULL) {
        // Cleanup if needed
        *widget_ptr = NULL;  // Prevent use-after-free
    }
}

// Option 2: Connect to "destroy" signal to NULL pointer
g_signal_connect(widget, "destroy",
                 G_CALLBACK(on_widget_destroyed), &widget_ptr);
```

---

## 9. Testing and Validation

### 9.1 Memory Leak Detection

```bash
# Run tests under Valgrind
valgrind --leak-check=full \
         --show-leak-kinds=all \
         --track-origins=yes \
         ./test_suite

# Check for:
# - "definitely lost" (memory leaks)
# - "possibly lost" (suspicious patterns)
# - "still reachable" (global allocations, often OK)
```

### 9.2 Test Error Paths

```ocaml
(* Test NULL arguments *)
let test_null_arg () =
  try
    let () = MyModule.function None in
    fail "Should have raised Invalid_argument"
  with Invalid_argument _ -> ()

(* Test integer bounds *)
let test_bounds () =
  Alcotest.check_raises "negative width"
    (Invalid_argument "width must be positive")
    (fun () -> MyModule.create ~width:(-1) ~height:10)

(* Test allocation failure simulation *)
(* This requires special build with fault injection *)

(* Test GC interaction *)
let test_gc_safety () =
  let obj = MyModule.create () in
  for i = 0 to 1000 do
    Gc.minor ();  (* Force GC *)
    Gc.full_major ();
    let _ = MyModule.get_property obj in
    ()
  done
```

### 9.3 Fuzz Testing

```c
// Add bounds checking that can be tested with AFL or libFuzzer
CAMLprim value ml_parse_data(value data_val) {
    CAMLparam1(data_val);

    const unsigned char *data = (unsigned char*)String_val(data_val);
    size_t len = caml_string_length(data_val);

    // Parse with strict validation
    if (len < MIN_SIZE || len > MAX_SIZE) {
        caml_invalid_argument("invalid data size");
    }

    // ... parsing with bounds checks ...

    CAMLreturn(result);
}
```

---

## 10. Code Review Checklist

Use this checklist when reviewing C bindings:

### Memory Safety
- [ ] All malloc/g_new results checked for NULL
- [ ] Integer overflow checked before allocation calculations
- [ ] All memcpy/strcpy have bounds validation
- [ ] Resources freed on all error paths
- [ ] No memory leaks on exception paths

### GC Safety
- [ ] CAMLparam/CAMLlocal/CAMLreturn used correctly
- [ ] All functions that allocate OCaml values use CAMLparam
- [ ] Global roots registered for OCaml values in C structures
- [ ] Global roots removed when C structure destroyed
- [ ] No shallow copies of GValue or complex structures

### String Safety
- [ ] String_val/Bytes_val used correctly
- [ ] No unbounded strlen on untrusted pointers
- [ ] caml_string_length used instead of strlen for OCaml strings
- [ ] NULL checks before string operations
- [ ] Buffer NULL-termination explicit after strncpy

### GLib/GTK Patterns
- [ ] g_object_new results checked for NULL
- [ ] GError handled correctly (freed, not leaked)
- [ ] GList/GSList structure validated during conversion
- [ ] Reference counting correct (ref_sink for new objects)
- [ ] Floating references handled

### Error Handling
- [ ] NULL pointer checks before dereferencing
- [ ] Appropriate exception types used
- [ ] Integer ranges validated
- [ ] Error messages descriptive

### Callback Safety
- [ ] callback_exn used and results checked
- [ ] Closures protected with global roots
- [ ] Temporary C pointers not stored in OCaml values
- [ ] Lifetime constraints documented
- [ ] Exceptions logged, not silently swallowed

### Integer Safety
- [ ] Integer ranges validated
- [ ] Binary search uses overflow-safe midpoint
- [ ] OCaml int range limitations considered
- [ ] Appropriate int type used (int32/int64/nativeint)

### Pointer Lifetime
- [ ] Custom blocks used for C objects needing cleanup
- [ ] Finalizers implemented correctly
- [ ] No use-after-free possibilities
- [ ] Pointer validity checked before use

### Documentation
- [ ] Lifetime constraints documented
- [ ] Thread safety documented
- [ ] Ownership transfer documented
- [ ] Error conditions documented

---

## Appendix A: Common Vulnerability Patterns

### Pattern: Unchecked Allocation
```c
// VULNERABLE
void *ptr = malloc(size);
use(ptr);  // Crash if malloc failed
```

### Pattern: Integer Overflow
```c
// VULNERABLE
size_t total = count * item_size;  // Overflow!
void *buf = malloc(total);
```

### Pattern: Buffer Overflow
```c
// VULNERABLE
char dest[100];
strcpy(dest, source);  // Overflow if source > 99 chars
```

### Pattern: Use-After-Free
```c
// VULNERABLE
free(ptr);
use(ptr);  // Use-after-free
```

### Pattern: Double-Free
```c
// VULNERABLE
free(ptr);
if (error) free(ptr);  // Double-free
```

### Pattern: Memory Leak on Exception
```c
// VULNERABLE
void *buf = malloc(size);
caml_failwith("error");  // buf leaked
```

### Pattern: Missing CAMLparam
```c
// VULNERABLE
value func(value arg) {
    value result = caml_alloc(...);  // May trigger GC
    return result;  // Might be invalid
}
```

### Pattern: Stack Variable Escape
```c
// VULNERABLE
void store_value(value arg) {
    g_value_set_boxed(gval, &arg);  // Stores stack pointer!
}
```

---

## Appendix B: Recommended Tools

### Static Analysis
- **Clang Static Analyzer**: `scan-build make`
- **Cppcheck**: `cppcheck --enable=all src/`
- **Coverity**: Commercial, excellent for C code
- **Infer**: Facebook's static analyzer

### Dynamic Analysis
- **Valgrind**: Memory error detection
  ```bash
  valgrind --leak-check=full --show-leak-kinds=all ./test
  ```
- **AddressSanitizer**: Compile with `-fsanitize=address`
- **UndefinedBehaviorSanitizer**: `-fsanitize=undefined`

### Fuzzing
- **AFL (American Fuzzy Lop)**: Coverage-guided fuzzing
- **libFuzzer**: LLVM's in-process fuzzer
- **Honggfuzz**: Feedback-driven fuzzer

---

## Appendix C: References

- [OCaml Manual - Interfacing C with OCaml](https://ocaml.org/manual/intfc.html)
- [GLib Reference Manual](https://docs.gtk.org/glib/)
- [GTK4 Reference Manual](https://docs.gtk.org/gtk4/)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [CWE Top 25 Most Dangerous Software Weaknesses](https://cwe.mitre.org/top25/)
- [SEI CERT C Coding Standard](https://wiki.sei.cmu.edu/confluence/display/c/)

---

## Version History

- **1.0** (November 2025): Initial version based on LablGTK security review
  - 21 security issues identified and documented
  - Comprehensive guidelines for secure OCaml/C FFI
  - Focus on GLib/GTK integration patterns
  - Code review checklist included

---

**License**: This document is released under the same license as LablGTK (LGPL 2.1 with linking exception).
