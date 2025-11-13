# Development Notes for lablgtk4 Port

## Essential: Always Check lablgtk3 First

**CRITICAL RULE**: When working on lablgtk4, ALWAYS check the lablgtk3 implementation first before writing new code.

### Why This Matters:
- lablgtk3 has battle-tested patterns that work correctly
- Saves hours of debugging subtle FFI issues
- Avoids reinventing solutions that already exist
- Provides correct reference for memory management

### How to Check lablgtk3:
```bash
# Find relevant files
find lablgtk3/src -name "*<module>*"

# Check implementation patterns
grep -A 20 "<function_name>" lablgtk3/src/*.c

# Compare approach
diff lablgtk3/src/<file>.c lablgtk4/src/<file>.c
```

## OCaml/C FFI Critical Lessons

### 1. Pointer Wrapping is NOT Trivial

**Problem**: `Val_pointer`/`Pointer_val` macros in lablgtk4 wrappers.h are incompatible:
```c
#define Val_pointer(p) ((value)(p))          // Just casts pointer to value
#define Pointer_val(val) ((void*)Field(val,1)) // Expects a block, accesses field 1!
```

**Solution**: Create proper wrapper functions like lablgtk3:
```c
/* Proper way to wrap pointers */
static value Val_GClosure_wrapped(GClosure *closure)
{
    CAMLparam0();
    CAMLlocal1(val);
    val = caml_alloc_small(1, Abstract_tag);
    Field(val, 0) = (value)closure;
    CAMLreturn(val);
}

static GClosure *GClosure_val_wrapped(value val)
{
    return (GClosure *)Field(val, 0);
}
```

**Key Insight**: For closure data storage, can cast pointers directly when storing in GLib structures:
```c
/* In closure->data, direct cast works */
Store_field(argv_val, 2, (value)param_values);  // Direct cast
const GValue *params = (const GValue *)Field(argv_val, 2);  // Direct extract
```

### 2. GValue Memory Management

**Critical**: GValues cannot be shallow-copied with memcpy. Use g_value_copy:

```c
/* WRONG - shallow copy, dangling pointers */
memcpy(dest_gvalue, src_gvalue, sizeof(GValue));

/* RIGHT - deep copy */
g_value_init(dest_gvalue, G_VALUE_TYPE(src_gvalue));
g_value_copy(src_gvalue, dest_gvalue);
```

**ml_gvalue wrapper pattern**:
```c
typedef struct {
    GValue gvalue;
    int initialized;  // Track initialization for safe finalization
} ml_gvalue;
```

### 3. GClosure Pattern (from lablgtk3)

Store OCaml closure **directly** in `closure->data`:
```c
GClosure *closure = g_closure_new_simple(sizeof(GClosure), (gpointer)callback);
caml_register_global_root((value*)&closure->data);  // Prevent GC
g_closure_set_marshal(closure, ml_closure_marshal);
g_closure_add_invalidate_notifier(closure, NULL, ml_closure_invalidate);
g_closure_ref(closure);
g_closure_sink(closure);
```

In marshaller:
```c
value callback = (value)closure->data;  // Direct access
caml_callback_exn(callback, argv_val);
```

In invalidate notifier:
```c
caml_remove_global_root((value*)&closure->data);  // Cleanup
```

### 4. Debugging FFI Issues

**File-based debugging** when stderr doesn't work:
```c
FILE *f = fopen("/tmp/debug.txt", "a");
if (f) {
    fprintf(f, "Debug: value = %p\n", (void*)val);
    fclose(f);
}
```

**Check pointer values** to catch corruption early:
```c
fprintf(f, "Created: %p, Received: %p\n", original_ptr, received_ptr);
// If different, wrapping/unwrapping is broken!
```

### 5. Common Pitfalls

| Pitfall | Symptom | Solution |
|---------|---------|----------|
| Using Val_pointer/Pointer_val incorrectly | Garbage pointer values | Create proper wrapper functions |
| memcpy GValues | Segfault on access/finalization | Use g_value_init + g_value_copy |
| Forgetting ml_gvalue.initialized flag | Segfault in finalizer | Always set after initialization |
| Not checking lablgtk3 | Hours of debugging | **ALWAYS check lablgtk3 first!** |

## Testing Strategy

### Test Incrementally
1. Test pointer creation (non-null check)
2. Test void invocation (no parameters)
3. Test with simple parameter (int)
4. Test with complex parameter (string)
5. Test multiple invocations

### Use Test Helpers
Create C test helpers for direct invocation:
```c
CAMLprim value ml_test_invoke_closure_void(value closure_val);
CAMLprim value ml_test_invoke_closure_int(value closure_val, value arg);
```

Expose via test-only module:
```ocaml
module Test : sig
  val invoke_closure_void : g_closure -> unit
  val invoke_closure_int : g_closure -> int -> unit
end
```

## Memory Safety

### GC Interaction
- Custom blocks with finalizers need careful initialization tracking
- Don't call g_value_unset on uninitialized GValues
- Check `initialized` flag before cleanup

### Global Roots
```c
/* Register to prevent GC */
caml_register_global_root((value*)&ptr);

/* Always unregister in cleanup */
caml_remove_global_root((value*)&ptr);
```

## When You Get Stuck

1. **Check lablgtk3** - probably already solved
2. **Add debug output to file** - stderr may not work
3. **Check pointer values** - catch wrapping issues early
4. **Test incrementally** - isolate the failing case
5. **Verify GValue copying** - use g_value_copy, not memcpy

## Success Metrics

Phase 2.2 Final Results:
- **26/26 tests passing** (100%)
- All closure invocation tests working
- Proper memory management verified
- Foundation for signals/callbacks complete

Key insight: Following lablgtk3 patterns and proper pointer wrapping are essential for FFI correctness.
