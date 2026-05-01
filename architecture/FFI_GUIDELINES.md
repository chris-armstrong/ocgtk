## FFI Guidelines

## OCaml/C FFI Critical Lessons

### 1. GValue Memory Management

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

### 2. GClosure Pattern (from lablgtk3)

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

### 3. Debugging FFI Issues

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

### 4. GC Safety: Always Use CAMLlocal for Local `value` Variables

**Rule**: Every local C variable of type `value` MUST be declared with `CAMLlocal1` (or `CAMLlocal2`, etc.), not as a plain C stack variable.

**Why**: The OCaml GC can only run during OCaml allocations, but this is a fragile invariant. A bare `value result = Val_*(...)` on the C stack is not a GC root. If any allocation is ever inserted between the `Val_*` call and `CAMLreturn`, the GC may move or collect the object that `result` points to, causing a silent use-after-free.

**Wrong** (currently safe but violates FFI contract):
```c
CAMLprim value ml_g_variant_get_variant(value v) {
    CAMLparam1(v);
    GVariant *child = g_variant_get_variant(GVariant_val(v));
    value result = Val_GVariant(child);   /* NOT a GC root! */
    g_variant_unref(child);
    CAMLreturn(result);
}
```

**Right**:
```c
CAMLprim value ml_g_variant_get_variant(value v) {
    CAMLparam1(v);
    CAMLlocal1(result);                   /* registered GC root */
    GVariant *child = g_variant_get_variant(GVariant_val(v));
    result = Val_GVariant(child);
    g_variant_unref(child);
    CAMLreturn(result);
}
```

**Also applies to `CAMLreturn(Val_*(...))`**: Calling `Val_*` directly inside `CAMLreturn` is fine — the macro captures the result into a compiler-managed variable before popping the GC frame. But if you need to use the value before returning, always use `CAMLlocal`.

**Note on C pointers (`GVariant*`, `GObject*`, etc.)**: These are GLib-managed heap pointers, not OCaml values. The OCaml GC does not move or collect them. Only OCaml `value` variables need GC root registration.

### 5. Common Pitfalls

| Pitfall | Symptom | Solution |
|---------|---------|----------|
| memcpy GValues | Segfault on access/finalization | Use g_value_init + g_value_copy |
| Forgetting ml_gvalue.initialized flag | Segfault in finalizer | Always set after initialization |
| `value result = Val_*(...)` without CAMLlocal | Silent GC corruption if allocation added later | Always use `CAMLlocal1(result)` |
| Not checking lablgtk3 | Hours of debugging | **ALWAYS check lablgtk3 first!** |

**Note**: `Val_pointer`/`Pointer_val` (a 2-field Abstract-block layout) were deleted in phase-0a as dead code. Do not reintroduce them. All GObject/record/variant values use Custom blocks — use the `ml_gobject_*`/`ml_gir_record_*` helpers and their per-class `<X>_val`/`Val_<X>` macros.
