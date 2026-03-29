# Plan: GObject/GLib Type Mappings for Cross-Namespace References

## Problem Statement

The GIR code generator skips ~2,235 method/constructor bindings across all namespaces because it cannot resolve GObject and GLib types. Unlike Cairo, Gio, Gdk, etc., there are no generated bindings for GObject or GLib — and generating them wholesale is unnecessary since most of the referenced types are either already implemented in `src/common/` or are simple enough to add as hardcoded type mappings.

### Impact by Namespace

| Namespace  | Skipped Bindings |
|------------|-----------------|
| Gio        | 1,238           |
| Gtk        | 635             |
| Gdk        | 162             |
| Gsk        | 107             |
| Pango      | 52              |
| GdkPixbuf  | 41              |
| PangoCairo | 0               |

### Root Cause

GLib types have no GIR file in the standard `/usr/share/gir-1.0/` location (only in `/usr/lib/x86_64-linux-gnu/gir-1.0/GLib-2.0.gir`), and GObject/GLib are not part of the generator's cross-namespace reference system. When the generator encounters `GObject.Object`, `GLib.Variant`, etc., `find_type_mapping_for_gir_type` returns `None`, causing `exclude_list.ml` to skip the method.

## Approach: Hardcoded Type Mappings

Add entries to the `type_mappings` list in `type_mappings.ml` for GObject/GLib types, pointing to existing or new OCaml wrappers in `src/common/`. This is the same mechanism already used for primitives like `guint`, `gboolean`, `gchararray`, etc.

### Key Design Decision

**Not generating GObject/GLib from GIR.** Rationale:
- The top 10 types cover ~90% of all skips
- Many types already have OCaml implementations in `src/common/gobject.ml` and `src/common/glib.ml`
- GLib container types (GList, GSList) already have C conversion helpers in `ml_glib.c`
- Callback types (DestroyNotify, CompareDataFunc) require manual OCaml callback wrapping that a generator can't produce
- The long tail of rarely-used types can be added incrementally on demand

### Progressive Unlocking Strategy

The hit counts per type overstate the number of bindings each type unlocks, because many methods reference **multiple** missing types. A method is only unblocked when **all** its parameter/return types are resolved. We will work progressively, adding types and running intersection testing after each phase to measure actual unlock counts and inform priorities for the next phase.

## Design Decisions

### DD1: GObject.Object — Introduce the `object` Type Tag

`GObject.Object` appears 311 times as a **parameter or return type** (not just as `parent=`). These are methods that deal with generic/untyped objects at the API boundary:

- **Builder pattern:** `gtk_builder_get_object` returns a generic `GObject*` the caller downcasts
- **List model items:** `gtk_list_item_get_item`, `gtk_drop_down_get_selected_item` — return the model's item type as generic `GObject*`
- **GIO generic object params:** `g_list_store_append`, `g_settings_bind` — accept any `GObject*`

**Design:** Introduce a `` `object `` polymorphic variant tag as the root of the GObject type hierarchy. Currently the codebase doesn't define one because there was no GObject definition to anchor it — this is the place to add it.

The OCaml mapping becomes `` [`object] Gobject.obj `` — a properly typed root rather than using `unit` as a "don't know" sentinel. This slots naturally into the existing variant-based hierarchy: every class already carries `` `object `` (or will, once parent chains are wired up to the root), so upcasting from e.g. `` [`button | `widget | `initially_unowned | `object] Gobject.obj `` to `` [`object] Gobject.obj `` works via the standard polymorphic variant subtyping.

The caller uses `Gobject.try_cast` to downcast from the generic object. No layer2 class is needed for GObject.Object itself.

**Implementation:**
1. Add `` `object `` to the parent chain in the generator's hierarchy resolution (so all classes ultimately include it)
2. Define the type mapping: `"GObject.Object"` → `` [`object] Gobject.obj ``
3. Add `GObject.InitiallyUnowned` mapping similarly (`` [`initially_unowned | `object] Gobject.obj ``), since 5 Gtk classes use it as parent

### DD2: GLib.Error — Already Handled via `throws`

**The generator already handles GError.** Investigation confirms:

- The GIR parser reads `throws="1"` attributes on methods/constructors (in `gir_parser.ml`)
- `c_stub_method.ml` emits `GError *error = NULL;` declarations and passes `&error` to C calls for throwing methods
- `c_stub_helpers.ml:build_return_statement` wraps results in `Res_Ok`/`Res_Error(Val_GError(error))`
- `layer1_method.ml` wraps the OCaml return type in `('a, GError.t) result` when `throws=true`

**What's remaining:** Constructors that throw are currently **skipped** by `filtering.ml:223`: `ctor.ctor_introspectable && (not ctor.throws)`. This drops 53 constructors across all namespaces:

| Namespace  | Throwing Constructors Skipped |
|------------|------------------------------|
| Gio        | 30                           |
| GdkPixbuf  | 15                           |
| Gtk        | 5                            |
| Gdk        | 3                            |

These include important ones like `gdk_texture_new_from_file`, `gdk_pixbuf_new_from_file`, `g_socket_new`, etc. Enabling throws support for constructors is a separate task (not gated on GObject/GLib type mappings) and should follow the same `Res_Ok`/`Res_Error` pattern already used for methods.

### DD3: GLib.Bytes — Opaque Type with Accessors

Create an opaque `Glib_bytes.t` (not `string`). Rationale:
- `GBytes` is used 291 times including Gsk render nodes and texture data where buffers can be large
- Copying on every boundary crossing is wasteful
- No concern about breaking existing bindings — they aren't in production
- Provide `to_string`/`of_string` convenience functions for the common small-payload case

```ocaml
(* glib_bytes.ml *)
type t  (* opaque, backed by GBytes* with g_bytes_ref/g_bytes_unref finalizer *)

external create : string -> t = "ml_g_bytes_new"
external to_string : t -> string = "ml_g_bytes_get_data_as_string"
external size : t -> int = "ml_g_bytes_get_size"
```

C side: custom block wrapping `GBytes*` with `g_bytes_unref` finalizer. `create` copies the OCaml string into a new `GBytes`. `to_string` copies the `GBytes` data into a new OCaml string.

### DD4: GList/GSList — Opaque Abstraction with Typed Accessors

The existing C helpers (`Val_GList`/`GList_val` in `ml_glib.c`) take a function pointer `value (*func)(gpointer)` for element conversion. This won't work directly with most `Val_*` macros (e.g., `Val_int` is a macro, not a function pointer).

**Design: Inline conversion in generated code.** The generator emits a conversion loop for each GList/GSList usage, parameterized by the element type. This follows the same pattern as array conversion in `c_stub_array_conv.ml`.

For return values (C → OCaml):
```c
// Generated for a method returning GList of GtkWidget*
GList *c_list = gtk_some_method(self);
value ml_list = Val_emptylist;
for (GList *l = g_list_last(c_list); l != NULL; l = l->prev) {
    value item = Val_GtkWidget((GtkWidget*)l->data);
    value cell = caml_alloc(2, 0);
    Store_field(cell, 0, item);
    Store_field(cell, 1, ml_list);
    ml_list = cell;
}
```

For parameters (OCaml → C):
```c
// Generated for a method taking GList of GObject*
GList *c_list = NULL;
value ml_iter = ml_param;
while (ml_iter != Val_emptylist) {
    c_list = g_list_append(c_list, GObject_ext_of_val(Field(ml_iter, 0)));
    ml_iter = Field(ml_iter, 1);
}
// ... call function ...
g_list_free(c_list);  // free the list container (not elements)
```

**Implementation Note:** We use macro-based conversion (`Val_GList_with`/`Val_GSList_with` in `wrappers.h`) rather than emitting inline loops. This provides:
- Better code reuse across generated bindings
- Consistent GC safety patterns
- Easier maintenance

**Limitation:** GList/GSList of interface types (e.g., `GSList<Gio.File>`) cannot be generated because:
- GObject interfaces have opaque struct definitions
- The C stub generator currently tries to copy them by value, which fails
- These are filtered out during generation (see `filtering.ml:is_interface_type`)

The generator needs to:
1. ✅ Recognize `GLib.List` and `GLib.SList` as container types (via `LIST_INLINE` marker)
2. ✅ Read the child `<type>` element from GIR for the element type (parser updated)
3. ✅ Resolve the element type's `Val_*`/`*_val` macros (via type_mappings)
4. ✅ Emit the appropriate conversion code (via `c_stub_list_conv.ml`)
5. ✅ Handle GIR transfer annotations (`transfer-ownership="container"` vs `"full"`)

### DD5: GLib.Variant — Primitives + Basic Collections

GVariant is the #1 type by hit count (436). Its primary consumers are:

- **GSettings:** `g_settings_get_value`/`set_value` — but GSettings also provides typed accessors (`get_string`, `get_int`, etc.), so variant is the fallback/generic path
- **GAction:** `g_action_activate`, `g_action_change_state` — action parameters and state are variants. Typically simple types (strings, booleans, ints) or `(sv)` for named parameters
- **GDBus:** Heavy variant usage for structured data. Typically `a{sv}` (string-keyed dictionaries), tuples, arrays of basic types
- **GtkActionable:** `set_action_target_value` — usually simple scalars

**Design: Opaque type + typed constructors/accessors + basic collections.**

```ocaml
(* gvariant.ml *)
type t  (* opaque, backed by GVariant* with g_variant_unref finalizer *)

(* Type introspection *)
external type_string : t -> string = "ml_g_variant_get_type_string"
external is_of_type : t -> string -> bool = "ml_g_variant_is_of_type"

(* Scalar constructors *)
external of_boolean : bool -> t = "ml_g_variant_new_boolean"
external of_int32 : int32 -> t = "ml_g_variant_new_int32"
external of_int64 : int64 -> t = "ml_g_variant_new_int64"
external of_double : float -> t = "ml_g_variant_new_double"
external of_string : string -> t = "ml_g_variant_new_string"

(* Scalar accessors *)
external to_boolean : t -> bool = "ml_g_variant_get_boolean"
external to_int32 : t -> int32 = "ml_g_variant_get_int32"
external to_int64 : t -> int64 = "ml_g_variant_get_int64"
external to_double : t -> float = "ml_g_variant_get_double"
external to_string : t -> string = "ml_g_variant_get_string"

(* Collections *)
external of_string_array : string array -> t = "ml_g_variant_new_strv"
external to_string_array : t -> string array = "ml_g_variant_get_strv"

(* Dictionary entries — for a{sv} pattern *)
external lookup_string : t -> string -> string option = "ml_g_variant_lookup_string"
external lookup_int32 : t -> string -> int32 option = "ml_g_variant_lookup_int32"
external lookup_boolean : t -> string -> bool option = "ml_g_variant_lookup_boolean"

(* Generic child access *)
external n_children : t -> int = "ml_g_variant_n_children"
external get_child_value : t -> int -> t = "ml_g_variant_get_child_value"

(* Serialization *)
external print : t -> bool -> string = "ml_g_variant_print"
external parse : string -> t = "ml_g_variant_parse"  (* parse from GVariant text format *)
```

**What we don't need initially:**
- Packing arbitrary GObjects/records into variants — GVariant cannot contain GObjects. It's a serialization format for plain data (scalars, strings, arrays, tuples, dictionaries, maybe types). Records would need manual serialization. This is not a concern.
- Tuple constructors/accessors — use `n_children`/`get_child_value` for now
- `GVariantBuilder` — for complex variant construction, use `parse` with the text format, or add builder API later
- `GVariantDict` — only 6 hits, defer

This covers the GAction/GSettings use case (pass/receive simple values) and provides escape hatches (`print`/`parse`, child access) for complex structures.

## Type Inventory

### Category A: Already Implemented — Need Type Mapping Only

| GIR Type | Hits | OCaml Type | C→ML | ML→C | Notes |
|----------|------|------------|------|------|-------|
| `GObject.Object` | 311 | `` [`object] Gobject.obj `` | `ml_gobject_val_of_ext` | `GObject_ext_of_val` | See DD1. Introduce `` `object `` tag as hierarchy root |
| `GObject.Value` | 129 | `Gobject.g_value` | Needs inline handling | Needs inline handling | Already have `Gobject.Value` module; used in property get/set |
| `GObject.Closure` | 12 | `Gobject.g_closure` | Existing closure wrapping | Existing closure wrapping | Already have `Gobject.Closure` module |

### Category B: Container Types — Need Generator Code Path

| GIR Type | Hits | OCaml Type | Notes |
|----------|------|------------|-------|
| `GLib.List` | 317 | `'a list` | See DD4. Inline conversion loops in generated code |
| `GLib.SList` | 88 | `'a list` | Same approach as GList |

### Category C: New Opaque Wrappers

| GIR Type | Hits | Proposed OCaml Type | C Type | Notes |
|----------|------|---------------------|--------|-------|
| `GLib.Variant` | 436 | `Gvariant.t` | `GVariant*` | See DD5. Ref-counted, rich API |
| `GLib.Bytes` | 291 | `Glib_bytes.t` | `GBytes*` | See DD3. Opaque with `to_string`/`of_string` |
| `GLib.DateTime` | 90 | `Glib_date_time.t` | `GDateTime*` | Ref-counted. Expose year/month/day/hour/minute/second/to_unix/to_iso8601 |
| `GLib.VariantType` | 59 | `Gvariant_type.t` | `GVariantType*` | Immutable, use `g_variant_type_copy`/`free`. Pairs with GVariant |
| `GLib.KeyFile` | 50 | `Glib_key_file.t` | `GKeyFile*` | `g_key_file_ref`/`unref` |
| `GLib.Source` | 37 | `Glib_source.t` | `GSource*` | `g_source_ref`/`unref` |
| `GLib.MainContext` | 6 | `Glib_main_context.t` | `GMainContext*` | `g_main_context_ref`/`unref` |

### Category D: Simple Typedefs / Enums / Flags

| GIR Type | Hits | Proposed OCaml Type | Notes |
|----------|------|---------------------|-------|
| `GLib.Quark` | 54 | `int` | `GQuark` is just a `guint32` used as an interned string ID |
| `GLib.IOCondition` | 59 | Polymorphic variant flags | `G_IO_IN`, `G_IO_OUT`, etc. — small flags type |
| `GLib.String` | 49 | `string` | `GString*` is a mutable C string; convert to/from OCaml `string` |
| `GLib.TimeVal` | 24 | Skip | Deprecated since GLib 2.62 |
| `GLib.SeekType` | 9 | Polymorphic variant enum | `G_SEEK_CUR`, `G_SEEK_SET`, `G_SEEK_END` |

### Category E: Callbacks — Cannot Auto-Generate

| GIR Type | Hits | Notes |
|----------|------|-------|
| `GObject.Callback` | 24 | Generic `GCallback`. Skip initially; used mainly in `GtkBuilder` callback registration |
| `GLib.DestroyNotify` | 17 | Destroy/cleanup callback paired with user_data. Skip; handle manually where needed |
| `GLib.CompareDataFunc` | 17 | Comparison with user data. Used in `GtkSortListModel`. Skip initially |
| `GLib.SourceFunc` | 12 | Main loop callback. Already handled by `Glib.Timeout`/`Glib.Idle` |
| `GLib.SpawnChildSetupFunc` | 6 | Process spawning callback. Very niche |

### Category F: Low Priority / Niche

| GIR Type | Hits | Notes |
|----------|------|-------|
| `GObject.ParamSpec` | 17 | Property introspection only |
| `GObject.TypeClass` | 6 | Type system internals |
| `GLib.Tree` | 6 | Balanced binary tree. Rarely used in GTK API |
| `GLib.HashTable` | 6 | Complex generic container |
| `GLib.PollFD` | 6 | Low-level polling |
| `GLib.OptionGroup` | 6 | CLI option parsing — better done in OCaml |
| `GLib.VariantDict` | 6 | Mutable variant dictionary. Defer — use GVariant child access |

## Implementation Phases

Each phase ends with intersection testing: regenerate bindings, count actual methods unlocked (not just type hit counts), and use the results to validate/adjust the next phase.

### Phase 1: Wire Up Existing Types

**Goal:** Add type mappings for types that already have OCaml/C implementations.

#### Task 1.1: Introduce `object` tag and add GObject.Object type mapping

1. Add `` `object `` to the generator's parent chain resolution so all generated classes include it at the root of their polymorphic variant type.
2. Add `GObject.InitiallyUnowned` with its own tag (5 Gtk classes inherit from it directly).
3. Add type mappings:

```ocaml
("GObject.Object", {
  ocaml_type = "[`object] Gobject.obj";
  c_to_ml = "ml_gobject_val_of_ext";
  ml_to_c = "GObject_ext_of_val";
  layer2_class = None;
  is_value_type_record = false;
})

("GObject.InitiallyUnowned", {
  ocaml_type = "[`initially_unowned | `object] Gobject.obj";
  c_to_ml = "ml_gobject_val_of_ext";
  ml_to_c = "GObject_ext_of_val";
  layer2_class = None;
  is_value_type_record = false;
})
```

The generated C stubs already include `wrappers.h` which provides `ml_gobject_val_of_ext` and `GObject_ext_of_val`.

#### Task 1.2: Add GObject.Value type mapping

Need to verify/add `Val_GValue`/`GValue_val` macros in `wrappers.h`. GValue is stack-allocated in C but uses custom block representation in OCaml — the existing `Gobject.Value.create`/`init` pattern handles this.

#### Task 1.3: Add GObject.Closure type mapping

Wire to existing `Gobject.Closure` module.

#### Task 1.4: Add simple GLib type mappings

- `GLib.Quark` → `int` (via `Val_int`/`Int_val`)
- `GLib.String` → `string` (convert `GString*` → `caml_copy_string(str->str)`)
- `GLib.IOCondition` → define flags type in `glib.ml`
- `GLib.SeekType` → define enum type in `glib.ml`

#### Task 1.5: Intersection test

Regenerate all bindings, build, count actual methods unlocked. Report results.

### Phase 2: GList/GSList Container Support ✓ COMPLETED

**Status:** ✅ **COMPLETED** - March 2026

**Goal:** Support parameterized list container types in generated code.

#### Task 2.1: Add LIST_INLINE code generation path ✓ DONE

Following the pattern of `c_stub_array_conv.ml`, create list conversion code generation that:
1. ✅ Recognizes `GLib.List`/`GLib.SList` via a `LIST_INLINE` marker in type mappings
2. ✅ Reads the GIR child `<type>` for element type
3. ✅ Resolves element type's `Val_*`/`*_val` converters
4. ✅ Emits inline conversion loops (see DD4)
5. ✅ Respects GIR `transfer-ownership` annotations for memory management

**Implementation details:**
- Created `c_stub_list_conv.ml` with macro-based conversion
- Parser updated to extract nested type elements from both return values and parameters
- Type resolution works for same-namespace and cross-namespace element types
- Methods with interface element types are filtered out (see KNOWN_BUGS.md)

#### Task 2.2: Intersection test

Regenerate, build, measure unlock count.

### Phase 3: Core Opaque Wrappers

**Goal:** Create opaque wrapper modules for the most-referenced GLib boxed types.

Work these in priority order, intersection testing after each:

#### Task 3.1: GLib.Variant + GLib.VariantType (495 combined hits)

Create `src/common/gvariant.ml`, `src/common/ml_gvariant.c`, `src/common/gvariant_type.ml`, `src/common/ml_gvariant_type.c`. See DD5 for API design.

#### Task 3.2: GLib.Bytes (291 hits)

Create `src/common/glib_bytes.ml`, `src/common/ml_glib_bytes.c`. See DD3.

#### Task 3.3: GLib.DateTime (90 hits)

Create `src/common/glib_date_time.ml`, `src/common/ml_glib_date_time.c`. Opaque type with ref-counting finalizer and basic accessors.

#### Task 3.4: GLib.KeyFile (50 hits) — if intersection testing shows significant unlocks

#### Task 3.5: GLib.Source (37 hits) — if intersection testing shows significant unlocks

### Phase 4: On-Demand Additions

Add remaining types as specific API usage demands:
- Callback types — manually wrap specific ones as use cases arise
- `GObject.ParamSpec` — for property introspection
- `GLib.MainContext`, `GLib.VariantDict` — for advanced use cases

### Separate Track: Throwing Constructors

Not gated on type mappings. Remove the `not ctor.throws` filter in `filtering.ml:223` and add `Res_Ok`/`Res_Error` result wrapping to `c_stub_constructor.ml`, following the existing pattern in `c_stub_method.ml` and `c_stub_helpers.ml`. This unlocks 53 constructors (30 Gio, 15 GdkPixbuf, 5 Gtk, 3 Gdk) including important ones like `gdk_texture_new_from_file` and `gdk_pixbuf_new_from_file`.

## Generator Changes Required

### 1. Type mapping entries in `type_mappings.ml`

Add GObject/GLib types to the `type_mappings` list. Simple types get a straightforward entry. Container types (GList, GSList) get a `LIST_INLINE` marker.

### 2. Include headers in generated C stubs

Verify that `wrappers.h` transitively includes `<glib.h>` and `<glib-object.h>`. If not, add the necessary includes. New wrapper modules (gvariant, glib_bytes, etc.) need their own header includes.

### 3. Dune library dependencies

Libraries using GObject/GLib type mappings need `ocgtk_common` in their dune dependencies. Verify this is already the case. New modules in `src/common/` need dune file entries.

### 4. LIST_INLINE code generation (Phase 2)

New code generation path in `c_stub_method.ml` or a new `c_stub_list_conv.ml` for emitting GList/GSList ↔ OCaml list conversion code, parameterized by element type. Handle transfer-ownership annotations.

### 5. Throwing constructor support (Separate Track)

Remove throws filter in `filtering.ml`, add result type wrapping in `c_stub_constructor.ml` and `layer1_constructor.ml`.
