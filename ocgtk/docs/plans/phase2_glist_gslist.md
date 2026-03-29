# Phase 2: GList/GSList Container Support

## Status
Phase 2 of the GObject/GLib Type Mappings project.

## Goal
Support `GLib.List` (317 hits in GIR) and `GLib.SList` (88 hits) as parameterized container types in generated bindings.

## Design Decision
Use macro-based conversion instead of inline loop generation. This reduces code duplication while maintaining performance.

## Architecture

### Layer Definitions
- **Layer 0**: C stubs (.c files) - external declarations and conversion code
- **Layer 1**: OCaml external wrappers (.ml files) - module interfaces  
- **Layer 2**: OCaml classes (.ml files) - object-oriented API

### Macro Design

#### C Macros (ml_glib.h)

**IMPORTANT**: These macros must be used inside a function that already has `CAMLparam*` and `CAMLlocal*` declarations. The caller is responsible for declaring sufficient CAMLlocalN slots.

```c
/**
 * GList: C -> OCaml
 * 
 * REQUIRED: Function must declare CAMLlocal3(result, item, cell) before use
 * 
 * Example:
 *   CAMLprim value example(value self) {
 *       CAMLparam1(self);
 *       CAMLlocal3(result, item, cell);  // MUST be at function scope
 *       GList* c_list = gtk_something_get_list(...);
 *       Val_GList_with(c_list, result, item, cell, Val_GtkWidget((GtkWidget*)_tmp->data));
 *       g_list_free(c_list);
 *       CAMLreturn(result);
 *   }
 */
#define Val_GList_with(list, result_var, item_var, cell_var, elem_conv_expr) \
    do { \
        result_var = Val_emptylist; \
        GList *_tmp = g_list_last(list); \
        while (_tmp != NULL) { \
            item_var = (elem_conv_expr); \
            cell_var = caml_alloc_small(2, 0); \
            Field(cell_var, 0) = item_var; \
            Field(cell_var, 1) = result_var; \
            result_var = cell_var; \
            _tmp = _tmp->prev; \
        } \
    } while(0)

/**
 * GSList: C -> OCaml
 * 
 * REQUIRED: Function must declare CAMLlocal3(result, item, cell) before use
 * GSList is singly-linked, so we iterate forward (not reverse like GList)
 */
#define Val_GSList_with(list, result_var, item_var, cell_var, elem_conv_expr) \
    do { \
        result_var = Val_emptylist; \
        GSList *_tmp = (list); \
        while (_tmp != NULL) { \
            item_var = (elem_conv_expr); \
            cell_var = caml_alloc_small(2, 0); \
            Field(cell_var, 0) = item_var; \
            Field(cell_var, 1) = result_var; \
            result_var = cell_var; \
            _tmp = _tmp->next; \
        } \
    } while(0)

/**
 * OCaml list -> GList
 * Returns GList* (caller must free if transfer-ownership="none")
 */
#define GList_val_with(ml_list, result_var, elem_conv_expr) \
    do { \
        result_var = NULL; \
        value _iter = (ml_list); \
        while (_iter != Val_emptylist) { \
            gpointer _elem = (gpointer)(elem_conv_expr); \
            result_var = g_list_prepend(result_var, _elem); \
            _iter = Field(_iter, 1); \
        } \
        result_var = g_list_reverse(result_var); \
    } while(0)

/**
 * OCaml list -> GSList
 */
#define GSList_val_with(ml_list, result_var, elem_conv_expr) \
    do { \
        result_var = NULL; \
        value _iter = (ml_list); \
        while (_iter != Val_emptylist) { \
            gpointer _elem = (gpointer)(elem_conv_expr); \
            result_var = g_slist_prepend(result_var, _elem); \
            _iter = Field(_iter, 1); \
        } \
        result_var = g_slist_reverse(result_var); \
    } while(0)
```

**GC Safety Requirements:**

**CRITICAL:** CAMLlocal* macros MUST be declared at function scope, NOT inside the macro:

```c
/* WRONG - CAMLlocal inside macro block creates scope issues */
#define Bad_Macro \
    do { CAMLlocal1(tmp); ... } while(0)

/* RIGHT - CAMLlocal at function scope */
CAMLprim value example(value self) {
    CAMLparam1(self);
    CAMLlocal3(result, item, cell);  // At function scope
    
    Val_GList_with(c_list, result, item, cell, Val_Widget(...));
    
    CAMLreturn(result);  // 'result' is visible here
}
```

**Why CAMLlocal cannot be inside the macro:**
1. **Scope:** Variables declared inside do-while block are invisible outside it
2. **GC root chain:** CAMLlocal pushes onto OCaml's local root stack. Nested scopes can corrupt the frame chain
3. **CAMLreturn:** The result variable must be visible at function scope for CAMLreturn

**Required CAMLlocal slots per macro:**
- `Val_GList_with`: 3 slots (result, item, cell)
- `Val_GSList_with`: 3 slots (result, item, cell)  
- `GList_val_with`: 0 slots (returns C pointer, no OCaml allocation)
- `GSList_val_with`: 0 slots (returns C pointer, no OCaml allocation)

### Type Converters Required

All converters are `static inline` functions in `wrappers.h`:

#### Integer Types
| GIR Type | C Type | Val Converter | Val Function |
|----------|--------|---------------|--------------|
| `gint` | `gint` | `Val_gint_ptr` | `Gint_ptr_val` |
| `guint` | `guint` | `Val_guint_ptr` | `Guint_ptr_val` |
| `gint8` | `gint8` | `Val_gint8_ptr` | `Gint8_ptr_val` |
| `gint16` | `gint16` | `Val_gint16_ptr` | `Gint16_ptr_val` |
| `gint32` | `gint32` | `Val_gint32_ptr` | `Gint32_ptr_val` |
| `gint64` | `gint64*` | `Val_gint64_ptr` | `Gint64_ptr_val` |
| `guint64` | `guint64*` | `Val_guint64_ptr` | `Guint64_ptr_val` |
| `gshort` | `gshort` | `Val_gshort_ptr` | `Gshort_ptr_val` |
| `gushort` | `gushort` | `Val_gushort_ptr` | `Gushort_ptr_val` |
| `glong` | `glong` | `Val_glong_ptr` | `Glong_ptr_val` |
| `gulong` | `gulong` | `Val_gulong_ptr` | `Gulong_ptr_val` |
| `gchar` | `gchar` | `Val_gchar_ptr` | `Gchar_ptr_val` |
| `guchar` | `guchar` | `Val_guchar_ptr` | `Guchar_ptr_val` |
| `gssize` | `gssize` | `Val_gssize_ptr` | `Gssize_ptr_val` |
| `gsize` | `gsize` | `Val_gsize_ptr` | `Gsize_ptr_val` |

#### Floating Point
| GIR Type | C Type | Val Converter | Val Function |
|----------|--------|---------------|--------------|
| `gfloat` | `gfloat*` | `Val_gfloat_ptr` | `Gfloat_ptr_val` |
| `gdouble` | `gdouble*` | `Val_gdouble_ptr` | `Gdouble_ptr_val` |

#### Other Primitives
| GIR Type | C Type | Val Converter | Val Function |
|----------|--------|---------------|--------------|
| `gboolean` | `gboolean` | `Val_gboolean_ptr` | `Gboolean_ptr_val` |
| `gpointer` | `gpointer` | `Val_gpointer_ptr` | `Gpointer_ptr_val` |
| `utf8` | `gchar*` | `Val_string_ptr` | `String_ptr_val` |
| `filename` | `gchar*` | `Val_string_ptr` | `String_ptr_val` |
| `gchararray` | `gchar*` | `Val_string_ptr` | `String_ptr_val` |

#### GObject/Class Types
Use existing converters like `Val_GtkWidget`, `Val_GObject`, etc.

#### Enum Types
Use existing enum converters like `Val_GtkAlign`, etc.

### Implementation Tasks

#### Task 2.1: Infrastructure (4-5 hours)

**1. Add macros to ml_glib.h**
- Add the 4 conversion macros
- Test compilation with `dune build`

**2. Add converter wrappers to wrappers.h**
- Add all primitive converters (int, uint, float, bool, string, etc.)
- Ensure static inline to avoid linker issues
- Test compilation

**3. Add type mappings to type_mappings.ml**
```ocaml
(* GLib.List and GLib.SList use dynamic type resolution based on element type *)
(* The ocaml_type is computed by resolving the element type and appending " list" *)
(* Examples:
   - GList<Window> -> "Window.t list"
   - GSList<Texture> -> "Texture.t list"
   - GList<Gio.File> -> "Ocgtk_gio.Gio.Wrappers.File.t list" (cross-namespace)
*)
(* If element type cannot be resolved, the method is filtered out rather than using a generic type *)
```

#### Task 2.2: Generator Implementation (5-6 hours)

**4. Create c_stub_list_conv.ml**

Key functions:
```ocaml
(* Generate C code for GList/GSList conversion C -> OCaml *)
val generate_list_c_to_ml : 
  ctx:generation_context ->
  var:string ->
  element_type:gir_type ->
  list_kind:[`GList | `GSList] ->
  transfer_ownership:transfer_ownership ->
  string

(* Generate C code for GList/GSList conversion OCaml -> C *)
val generate_list_ml_to_c :
  ctx:generation_context ->
  var:string ->
  element_type:gir_type ->
  list_kind:[`GList | `GSList] ->
  transfer_ownership:transfer_ownership ->
  string
```

**5. Wire into c_stub_method.ml**
- Detect `LIST_INLINE` marker in `c_to_ml` or `ml_to_c` fields
- Call appropriate `c_stub_list_conv` function
- Handle transfer-ownership for cleanup

**6. Wire into Layer 1 generator (layer1_method.ml)**
- Resolve element type to concrete OCaml type
- Generate: `external func : t -> Element.t list = "..."`
- Handle cross-namespace element types

**7. Wire into Layer 2 generator (class_gen_method.ml)**
- Wrap returned list through constructor
- Pattern: `List.map (fun raw -> new Element.element raw) (Layer1.func obj)`

#### Task 2.3: Testing (2-3 hours)

**8. Intersection test**
```bash
cd ocgtk && bash scripts/generate-bindings.sh
cd ocgtk && dune build
# Count methods unlocked
```

**9. Test cases**
- GList of objects (CellRenderer) - return value
- GList of strings - parameter
- GSList of widgets - return value
- Cross-namespace element types
- Transfer ownership scenarios (none, container, full)

### Generated Code Examples

#### Example 1: GList of Widgets (Return Value)

**GIR:**
```xml
<method name="get_children">
  <return-value transfer-ownership="container">
    <type name="GLib.List" c:type="GList*">
      <type name="Widget"/>
    </type>
  </return-value>
</method>
```

**Layer 0 (C):**
```c
CAMLprim value ml_gtk_container_get_children(value self) {
    CAMLparam1(self);
    CAMLlocal3(result, item, cell);  // Required by Val_GList_with macro
    GList* c_list = gtk_container_get_children((GtkContainer*)self);
    Val_GList_with(c_list, result, item, cell, Val_GtkWidget((GtkWidget*)_tmp->data));
    g_list_free(c_list);
    CAMLreturn(result);
}
```

**Layer 1 (OCaml):**
```ocaml
external get_children : t -> Widget.t list = "ml_gtk_container_get_children"
```

**Layer 2 (OCaml Class):**
```ocaml
class container obj = object
  method get_children () : GWidget.widget_t list =
    List.map (fun raw -> new GWidget.widget raw) (Container.get_children obj)
end
```

#### Example 2: GList of Strings (Parameter)

**GIR:**
```xml
<method name="set_uris">
  <parameters>
    <parameter name="uris" transfer-ownership="none">
      <type name="GLib.List" c:type="GList*">
        <type name="utf8"/>
      </type>
    </parameter>
  </parameters>
</method>
```

**Layer 0 (C):**
```c
CAMLprim value ml_gtk_app_launch_context_set_uris(value self, value uris) {
    CAMLparam2(self, uris);
    GList* c_list = GList_val_with(uris, (gpointer)g_strdup(String_val(Field(_iter, 0))));
    gtk_app_launch_context_set_uris((GtkAppLaunchContext*)self, c_list);
    g_list_foreach(c_list, (GFunc)g_free, NULL);
    g_list_free(c_list);
    CAMLreturn(Val_unit);
}
```

**Layer 1 (OCaml):**
```ocaml
external set_uris : t -> string list -> unit = "ml_gtk_app_launch_context_set_uris"
```

**Layer 2 (OCaml Class):**
```ocaml
class app_launch_context obj = object
  method set_uris (uris : string list) =
    App_launch_context.set_uris obj uris
end
```

### Files Modified

| File | Changes |
|------|---------|
| `src/common/ml_glib.h` | +4 macros (~40 lines) |
| `src/common/wrappers.h` | +20 converter wrappers (~80 lines) |
| `src/tools/gir_gen/type_mappings.ml` | +2 type mapping entries |
| `src/tools/gir_gen/generate/c_stub_list_conv.ml` | New file (~150 lines) |
| `src/tools/gir_gen/generate/c_stub_method.ml` | Handle LIST_INLINE marker |
| `src/tools/gir_gen/generate/c_stub_helpers.ml` | Export list helpers |
| `src/tools/gir_gen/generate/layer1_method.ml` | Resolve element types |
| `src/tools/gir_gen/generate/class_gen_method.ml` | Wrap list returns |

### Expected Outcomes

**Methods unlocked:** Estimated 50-150 (depends on intersection with other missing types)

**Performance:** 
- O(n) conversion cost (n = list length)
- Acceptable for typical use (10-100 items)
- Macro expansion at compile time (no runtime overhead)

**API Ergonomics:**
- Native OCaml `'a list` type for cases where element type cannot be resolved
- Concrete typed lists (e.g., `Window.t list`, `Texture.t list`) when element type is resolved
- Works with List.map, List.iter, pattern matching
- Consistent with other language bindings

**Type Resolution Behavior:**
- When element type CAN be resolved: generates concrete type (e.g., `Window.t list`)
- When element type CANNOT be resolved: method is filtered out (no generic `'a list` fallback)
- This ensures type safety and prevents broken bindings

### Risk Areas

1. **64-bit types on 32-bit systems** - gint64/guint64 need heap allocation
2. **Transfer ownership** - Must correctly free lists vs elements
3. **Empty lists** - Ensure NULL GList -> [] works correctly
4. **Cross-namespace elements** - Type resolution must work across namespaces
5. **Interface element types** - We don't fully generate interfaces yet, so methods using GList/GSList of interfaces cannot be generated

### Robustness Approach

To ensure correctness and robustness:

1. **No generic types** - When element type cannot be resolved, we return `None` from type mapping instead of generating `'a list`
2. **Interface filtering** - Methods/constructors with GList/GSList of interface element types are filtered out since we can't generate proper C stubs for them
3. **Clear error messages** - Methods are skipped with descriptive messages indicating why

### Open Questions

1. Should we handle `GLib.PtrArray` with the same mechanism?
2. Do we need special handling for GList of `gpointer` (untyped)?
3. Should we add a variant for stealing the list (not copying)?

### Prototype and Validation Plan

#### Phase A: Manual Prototype (Strings) ✓ COMPLETED

**Status:** Successfully completed 2026-03-26

**Test Location:**
- `tests/test_glist_manual.c` - C stub with manual GList<string> conversion
- `tests/test_glist_manual.ml` - OCaml test using alcotest framework
- `tests/dune` - Build configuration with glib-2.0 flags

**Note:** Moved from `test/manual/` to `tests/` directory and converted to alcotest format to match other tests in the suite.

**Results:**
All 5 test cases passed:
1. ✓ Multiple elements (3 strings: hello, world, test)
2. ✓ Empty list (NULL GList -> [])
3. ✓ Single element list
4. ✓ GC stress test (1000 iterations)
5. ✓ Pattern matching on result

**Validated:**
- Val_GList_with macro works correctly with CAMLlocal
- Empty list (NULL) handling works
- caml_alloc_small properly registers with GC
- No memory leaks or corruption
- OCaml list is built in correct order (GList->prev iteration)

**Key Implementation Details:**
```c
#define Val_GList_string(list, result_var, item_var, cell_var) \
    do { \
        result_var = Val_emptylist; \
        GList *_tmp = g_list_last(list); \
        while (_tmp != NULL) { \
            item_var = caml_copy_string((const char*)_tmp->data); \
            cell_var = caml_alloc_small(2, 0); \
            Field(cell_var, 0) = item_var; \
            Field(cell_var, 1) = result_var; \
            result_var = cell_var; \
            _tmp = _tmp->prev; \
        } \
    } while(0)
```

**CAMLlocal Requirements Confirmed:**
- Must declare `CAMLlocal3(result, item, cell)` at function scope
- Variables used in macro must be registered with GC
- Cannot use CAMLlocal inside the macro (scope issues)

#### Phase B: Generator Validation (Real GTK APIs)

After the manual prototype succeeds, we'll validate the generator with two real GTK APIs:

**Test 1: GList of Objects (gtk_application_get_windows)**
- **Direction:** C → OCaml (return value)
- **Type:** GList of GtkWindow*
- **Setup:** Create GTK application with 2-3 windows
- **Validation:**
  - Verify OCaml list length matches window count
  - Verify each element is usable Window object
  - Test window methods on returned objects

**Test 2: GSList of Widgets (gtk_size_group_get_widgets)**
- **Direction:** C → OCaml (return value)
- **Type:** GSList of GtkWidget*
- **Setup:** Create SizeGroup, add 2-3 widgets
- **Validation:**
  - Verify OCaml list length matches widget count
  - Verify each element is usable Widget object
  - Tests GSList-specific macro path

**Success Criteria:**
- Both APIs generate compilable code
- Generated bindings work correctly
- List contents are valid GObject wrappers
- No memory leaks (valgrind check)

#### Phase C: Full Implementation

After Phase A and B validation:
1. Complete Task 2.1 (infrastructure)
2. Complete Task 2.2 (generator)
3. Run intersection testing
4. Measure actual methods unlocked

### Next Steps

1. ~~Review and approve this plan~~ DONE
2. ~~Execute Phase A: Manual Prototype~~ ✓ COMPLETED
3. ~~Execute Phase B: Generator Validation~~ ✓ COMPLETED
   - ~~Implement generator support for GList/GSList~~ DONE
   - ~~Test with `gtk_application_get_windows` (GList of Windows)~~ DONE - generates `Window.t list`
   - ~~Test with `gtk_size_group_get_widgets` (GSList of Widgets)~~ DONE
   - ~~Test cross-namespace element types~~ DONE - `new_from_list : Ocgtk_gio.Gio.Wrappers.File.t list`
4. ~~Implement Task 2.1 and 2.2 (full infrastructure)~~ DONE
5. **Run intersection testing** ← CURRENT
   - Regenerate all bindings
   - Count actual methods unlocked
   - Document results
6. Decide Phase 3 priorities based on results

### Known Limitations

See `architecture/todo/KNOWN_BUGS.md` for details on:
- **GList/GSList of interface types**: Cannot generate C stubs for interface element types (e.g., `GSList<Gio.File>`) due to opaque struct handling
- **Cross-namespace C stubs**: The C stub generator needs work to properly handle cross-namespace GObject references in list parameters

### Related Documentation

- Parent plan: `gobject_glib_type_mappings.md`
- Phase 1 completion: See TASKS.md entry for "GObject.Object + InitiallyUnowned type mappings"
- Cross-namespace type resolution: See `CROSS_NAMESPACE_PLAN.md`
- FFI Guidelines: `ocgtk/architecture/FFI_GUIDELINES.md`
