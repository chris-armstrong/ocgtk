# GClosure Cleanup Issue - Analysis and Fix

**STATUS: ✅ FIXED** (as of commit fa9dab7)

This document explains the race condition that previously caused `test_gobject` (and sometimes `test_gdk` and `test_all_enums`) to segfault during cleanup, and how we fixed it.

## The Problem

When OCaml callbacks are stored in C structures (like GClosure), we need to prevent the OCaml GC from collecting them. The naive approach of registering `&closure->data` as a global root creates a race condition during program exit.

## The Problematic Code Pattern (BROKEN)

```c
CAMLprim value ml_g_closure_new(value callback)
{
    GClosure *closure = g_closure_new_simple(sizeof(GClosure), (gpointer)callback);

    // THIS IS THE PROBLEM LINE:
    caml_register_global_root((value*)&closure->data);

    g_closure_add_invalidate_notifier(closure, NULL, notify_destroy);
    g_closure_set_marshal(closure, ml_closure_marshal);
    return Val_GClosure_sink(closure);
}

static void notify_destroy(gpointer data, GClosure *closure)
{
    // Try to unregister the global root
    caml_remove_global_root((value*)&closure->data);  // SEGFAULT HERE
}
```

### Why This Causes a Segfault

The global root `&closure->data` **points INTO the GClosure struct**. During program exit:

1. GLib may free the GClosure (via `g_closure_unref`)
2. The GClosure memory is freed
3. OCaml GC does a final collection
4. GC scans global roots → accesses `&closure->data` → **FREED MEMORY** → SEGFAULT

```
Program Exit Sequence (Race Condition):
┌────────────────────────────────────────────────────┐
│  Option A (Works):                                 │
│  1. OCaml GC scans global roots (closure valid)   │
│  2. notify_destroy() called, unregisters root      │
│  3. GClosure freed                                 │
│  └─> No crash                                      │
│                                                     │
│  Option B (Crashes):                               │
│  1. GClosure freed by GLib                         │
│  2. OCaml GC scans global roots                    │
│  3. Tries to access closure->data (FREED!)         │
│  └─> SEGFAULT                                      │
└────────────────────────────────────────────────────┘
```

## How lablgtk3 Handles It

Looking at lablgtk3's code, **they have the exact same pattern**:

```c
// lablgtk3/src/ml_gobject.c
CAMLprim value ml_g_closure_new (value clos)
{
    GClosure* closure = g_closure_new_simple(sizeof(GClosure), (gpointer)clos);
    caml_register_global_root((value*)&closure->data);  // Same pattern!
    g_closure_add_invalidate_notifier(closure, NULL, notify_destroy);
    g_closure_set_marshal(closure, marshal);
    return Val_GClosure_sink(closure);
}

static void notify_destroy(gpointer unit, GClosure *c)
{
    caml_remove_global_root((value*)&c->data);  // Same cleanup!
}
```

### Why lablgtk3 Doesn't Crash (As Often)

**Key differences:**

1. **OCaml 4.x vs OCaml 5.x**
   - lablgtk3 primarily targets OCaml 4.14
   - lablgtk4 uses OCaml 5.3
   - OCaml 5.x has a different GC implementation (multicore runtime)
   - Different GC timing behavior during shutdown

2. **Test Framework**
   - lablgtk3 uses simpler test setups
   - lablgtk4 uses Alcotest which triggers GC more aggressively
   - Different shutdown sequences

3. **Luck/Timing**
   - The race condition exists in lablgtk3 too
   - It just happens to execute in the "safe" order more often
   - Can still crash under different conditions

## The Fix: Allocate Separate Storage

Instead of pointing the global root into GClosure memory, we allocate our own storage:

```c
CAMLprim value ml_g_closure_new(value callback)
{
    /* Allocate separate storage for the OCaml callback value
     * This memory is owned by us, not by GLib
     */
    value *callback_storage = (value*)malloc(sizeof(value));
    if (callback_storage == NULL) {
        caml_failwith("ml_g_closure_new: failed to allocate callback storage");
    }

    /* Store the callback value in our allocated storage */
    *callback_storage = callback;

    /* Register our storage as a global root to prevent GC of the callback
     * This is safe because we control the lifetime of callback_storage
     */
    caml_register_global_root(callback_storage);

    /* Create GClosure with pointer to our storage as data */
    GClosure *closure = g_closure_new_simple(sizeof(GClosure), (gpointer)callback_storage);

    /* Set up marshaller and invalidate notifier */
    g_closure_set_marshal(closure, ml_closure_marshal);
    g_closure_add_invalidate_notifier(closure, (gpointer)callback_storage, ml_closure_invalidate);

    return Val_GClosure_sink(closure);
}
```

The invalidate notifier can now safely clean up:

```c
static void ml_closure_invalidate(gpointer data, GClosure *closure)
{
    if (data == NULL) return;

    value *callback_storage = (value*)data;

    /* Remove from global roots - this is safe because:
     * 1. OCaml's runtime lock protects the global roots list
     * 2. If GC is scanning roots, it will finish before we modify the list
     * 3. We're not touching closure->data (which GLib may have freed)
     */
    caml_remove_global_root(callback_storage);

    /* Now safe to free our storage */
    free(callback_storage);
}
```

The marshaller dereferences the pointer:

```c
static void ml_closure_marshal(GClosure *closure, ...)
{
    /* Get the OCaml callback from our allocated storage */
    value *callback_storage = (value*)closure->data;
    if (callback_storage == NULL) {
        CAMLreturn0;
    }
    value callback = *callback_storage;

    /* ... invoke callback ... */
}
```

## Why This Fix Works

1. **Separate Memory Ownership:**
   - `callback_storage` is allocated by us with `malloc()`
   - We control when it's freed (in the invalidate notifier)
   - Not affected by GLib's GClosure lifecycle

2. **Safe Cleanup Order:**
   - Global root points to memory we own
   - Even if GClosure is freed, `callback_storage` is still valid
   - We unregister the global root BEFORE freeing the storage
   - GC either scans before we unregister (safe) or after (root removed, also safe)

3. **No Race Condition:**
   ```
   Safe Cleanup Sequence:
   ┌────────────────────────────────────────────────────┐
   │  1. GLib calls invalidate notifier                 │
   │  2. We unregister callback_storage from global     │
   │     roots (atomic operation, runtime protected)    │
   │  3. We free callback_storage                       │
   │  4. GLib frees GClosure                            │
   │  5. OCaml GC scans roots (our root already gone)   │
   │  └─> No crash!                                     │
   └────────────────────────────────────────────────────┘
   ```

## Benefits

**Pros:**
- ✅ No segfaults during exit
- ✅ Proper cleanup (no memory leaks)
- ✅ Works reliably with OCaml 5.x
- ✅ All tests pass with clean exit codes
- ✅ Can be used for long-running applications

**Cons:**
- Requires one additional malloc per closure (~8 bytes overhead)
- Slightly more complex code

## Why This Pattern Is Important

This same race condition can occur with ANY C library integration that stores OCaml callbacks:

- **Signal handlers:** `g_signal_connect()` with GClosures
- **Async callbacks:** Event loops, timers, I/O completion
- **Custom C code:** Any time you store an OCaml value in C memory

**Key principle:** Never register a global root that points into C-managed memory. Always allocate your own storage.

## Test Results

After the fix:

- ✅ **test_gdk:** All 32 tests pass, clean exit (exit code 0)
- ✅ **test_all_enums:** All 26 tests pass, clean exit (exit code 0)
- ✅ **test_gobject:** All 29 tests pass, clean exit (exit code 0)
- ✅ **No memory leaks:** Proper cleanup via invalidate notifier

## References

- See `lablgtk4/src/ml_gobject.c` for the full implementation
- See `lablgtk3/src/ml_gobject.c` for comparison with the old approach
- See `GCLOSURE_DIAGRAM.txt` for visual diagrams of the memory layout
