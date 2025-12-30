## FFI Guidelines

## OCaml/C FFI Critical Lessons

### 1. Pointer Wrapping is NOT Trivial

**Problem**: `Val_pointer`/`Pointer_val` macros in ocgtk wrappers.h are incompatible:
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
