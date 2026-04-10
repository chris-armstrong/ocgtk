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

### DD4: GList/GSList — Macro-Based Typed Conversion ✅ IMPLEMENTED

**Design:** Macro-based conversion in `wrappers.h` rather than inline loop generation. Each macro takes caller-declared `CAMLlocal3` variables and an element converter expression. This provides code reuse, consistent GC safety, and easier maintenance vs emitting loops per call site.

**Macros (in `src/common/wrappers.h`):**

| Macro | Direction | CAMLlocal slots | Purpose |
|-------|-----------|----------------|---------|
| `Val_GList_with(list, result, item, cell, conv)` | C→OCaml | 3 (result, item, cell) | GList to OCaml list (iterates via `g_list_last`/`prev`) |
| `Val_GSList_with(list, result, item, cell, conv)` | C→OCaml | 3 (result, item, cell) | GSList to OCaml list (iterates forward, reverses) |
| `GList_val_with(ml_list, result, conv)` | OCaml→C | 0 (C pointer only) | OCaml list to GList (prepend + reverse) |
| `GSList_val_with(ml_list, result, conv)` | OCaml→C | 0 (C pointer only) | OCaml list to GSList (prepend + reverse) |

**Critical GC safety rule:** `CAMLlocal3(result, item, cell)` MUST be declared at function scope, never inside the macro. Nested scopes corrupt OCaml's GC root chain and hide variables from `CAMLreturn`.

**Generated code example (C→OCaml return):**
```c
CAMLprim value ml_gtk_application_get_windows(value self) {
    CAMLparam1(self);
    CAMLlocal3(result, item, cell);
    GList* c_result = gtk_application_get_windows(GtkApplication_val(self));
    Val_GList_with(c_result, result, item, cell, Val_GtkWindow((gpointer)_tmp->data));
    g_list_free(c_result);
    CAMLreturn(result);
}
```

**Generator architecture:**
- `type_mappings.ml`: `GLib.List`/`GLib.SList` entries use `LIST_INLINE` marker (not a real converter name)
- `c_stub_list_conv.ml`: New module — `generate_list_c_to_ml`, `generate_list_ml_to_c`, element converter resolution, transfer ownership cleanup
- `c_stub_method.ml`: Detects `LIST_INLINE` marker via `Type_mappings.is_list_type`, dispatches to `c_stub_list_conv`
- `gir_parser.ml`: Updated to parse nested `<type>` elements within `<type name="GLib.List">` for element type extraction
- `filtering.ml`: `is_interface_type`/`list_has_interface_element` filter out methods with interface element types

**Type resolution:** Element types resolved at generation time. Returns `None` (method filtered out) when element type can't be resolved — no generic `'a list` fallback.

**Transfer ownership handling:**
- `TransferNone`/`Container`: `g_list_free(c_list)` (free container only)
- `TransferFull`/`Floating`: `g_list_foreach(...g_object_unref...)` + `g_list_free()` (free elements + container)

**Limitation:** GList/GSList of interface types (e.g., `GSList<Gio.File>`) cannot be generated — interfaces have opaque struct definitions without proper C converters. Filtered out in `filtering.ml`.

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

### Phase 1: Wire Up Existing Types — PARTIALLY COMPLETED

**Goal:** Add type mappings for types that already have OCaml/C implementations.

#### Task 1.1: Introduce `object` tag and add GObject.Object type mapping ✅ COMPLETED

Type mappings added for `GObject.Object` (`` [`object_] Gobject.obj ``) and `GObject.InitiallyUnowned` (`` [`initially_unowned | `object_] Gobject.obj ``). Both use `ml_gobject_val_of_ext`/`GObject_ext_of_val` converters already in `wrappers.h`.

**Note:** These mappings unlock 0 methods on their own because every method that takes/returns `GObject.Object` also uses other unresolved types (e.g. `GObject.Value`, `GType`, `Gio.ListModel`). The mappings are a prerequisite for future unlocks.

#### Task 1.2: Add GObject.Value type mapping — DEFERRED

`GValue_val` exists in `wrappers.h` (ml→c) but there is no `Val_GValue` (c→ml). GValue has 73 hits in GTK and 50 in GDK, but GValue is typically used inline in property get/set patterns that the generator already handles specially. The remaining methods that need GValue as a parameter or return type are mostly blocked by other missing types too.

**Decision:** Defer until cross-namespace interface types (Gio.ListModel, Gio.File, etc.) are resolved, which would actually unlock the methods that also need GValue.

#### Task 1.3: Add GObject.Closure type mapping — DEFERRED

`GClosure_val` exists in `wrappers.h`, `Val_GClosure_sink` exists in `ml_gobject.c` (static). Only 16 hits in GIR. Most closure usage goes through the signal system which is already handled. Low priority.

#### Task 1.4: Add simple GLib type mappings — DEFERRED

Current skip counts from intersection testing (April 2026):

| Type | Gio hits | GTK hits | GDK hits | Notes |
|------|----------|----------|----------|-------|
| `GLib.Quark` | 45 | — | — | Mostly in GError domain APIs |
| `GLib.IOCondition` | 68 | — | — | GSocket/GPollableInputStream |
| `GLib.String` | — | — | — | Rare in public API |
| `GLib.SeekType` | — | — | — | Only in GSeekable |

These are blocked by the same pattern: methods using GLib.Quark also need other missing types (callbacks, GType). Low standalone unlock potential.

#### Task 1.5: Intersection test — COMPLETED (April 2026)

**Key finding:** The biggest blockers across all namespaces are NOT GObject/GLib primitive types but rather:

**GTK top blockers:**
| Type | Hits | Category |
|------|------|----------|
| `Gio.ListModel` | 283 | Cross-namespace interface |
| `Gio.File` | 213 | Cross-namespace interface |
| `void` (callbacks) | 190 | Callback support |
| `Gdk.Rectangle` | 141 | Missing value-type record |
| `Gio.MenuModel` | 139 | Cross-namespace interface |
| `Gio.AsyncResult` | 119 | Cross-namespace interface |
| `array` | 115 | Array parameter support |
| `Gdk.Paintable` | 109 | Cross-namespace interface |
| `GType` | 76 | Runtime type system |
| `GObject.Value` | 73 | See Task 1.2 |

**Gio top blockers:**
| Type | Hits | Category |
|------|------|----------|
| `AsyncReadyCallback` | 695 | Callback type |
| `array` | 287 | Array parameter support |
| `gsize` | 259 | Missing primitive mapping |
| `gssize` | 218 | Missing primitive mapping |
| `gpointer` | 187 | Raw pointer type |

**Conclusion:** Phase 1's remaining tasks (GObject.Value, GObject.Closure, GLib.Quark, etc.) have low standalone unlock potential. The actual bottlenecks are:
1. **Cross-namespace interface types** (Gio.ListModel, Gio.File, Gio.MenuModel, etc.)
2. **Callback parameter support** (AsyncReadyCallback, etc.)
3. **Array parameter support** (`array` type)
4. **Missing primitive mappings** (gsize, gssize, GType, guint32, gint64)

These are separate work streams that would unlock far more methods than the remaining Phase 1 tasks.

### Phase 2: GList/GSList Container Support ✓ COMPLETED

**Status:** ✅ **COMPLETED** — March 2026 (commit c517fe9c)

**Goal:** Support parameterized list container types in generated code.

**Implementation:** See DD4 for full design. Three phases executed:

1. **Phase A — Manual Prototype** (2026-03-26): Validated `Val_GList_with` macro with string lists in `tests/test_glist_manual.{c,ml}`. All 5 alcotest cases passed (multi-element, empty, single, GC stress ×1000, pattern matching). Confirmed CAMLlocal must be at function scope.

2. **Phase B — Generator Validation** (2026-03-29): Tested with real GTK APIs:
   - `gtk_application_get_windows` → `Window.t list` (GList of objects)
   - `gtk_size_group_get_widgets` → `Widget.t list` (GSList of widgets)
   - Cross-namespace: `new_from_list : Ocgtk_gio.Gio.Wrappers.File.t list`

3. **Phase C — Full Implementation** (2026-03-29): Created `c_stub_list_conv.ml`, wired into `c_stub_method.ml`, added type mappings and macros to `wrappers.h`.

**Files created/modified:**
- `src/tools/gir_gen/c_stub_list_conv.ml` (new — list conversion generation)
- `src/tools/gir_gen/type_mappings.ml` (GLib.List/GLib.SList entries with `LIST_INLINE` marker)
- `src/tools/gir_gen/generate/c_stub_method.ml` (`handle_list_return`, `handle_in_list_param`)
- `src/tools/gir_gen/generate/filtering.ml` (`is_interface_type`, `list_has_interface_element`)
- `src/tools/gir_gen/gir_parser.ml` (nested `<type>` element parsing)
- `src/common/wrappers.h` (4 conversion macros)

**Intersection test results:** 30+ methods unlocked across namespaces:
- **GTK:** `Application.get_windows`, `FlowBox.get_selected_children`, `ListBox.get_selected_rows`, `SizeGroup.get_widgets`, `TextBuffer.get_marks`, `IconView.get_selected_items`, etc.
- **GDK:** `Display.list_seats`, `Seat.get_devices`, `Toplevel.set_icon_list`
- **Gio:** `AppInfo.get_all`, `FileEnumerator.next_files_finish`, `DBusInterfaceSkeleton.get_connections`
- **Pango:** `AttrList.get_attributes`, `Layout.get_lines`

### Phase 3: Core Opaque Wrappers

**Goal:** Create opaque wrapper modules for the most-referenced GLib boxed types.

Work these in priority order, intersection testing after each:

#### Task 3.1: GLib.Variant + GLib.VariantType (495 combined hits) — ✅ COMPLETED

**Status:** ✅ Implementation complete — April 1, 2026  
**Files created:**
- `src/common/gvariant.ml` / `ml_gvariant.c` — Complete GVariant implementation with ALL scalar types
- `src/common/gvariant_type.ml` / `ml_gvariant_type.c` — GVariantType wrapper
- `tests/test_gvariant.ml` — 55 comprehensive tests (all passing)
- `tests/test_gvariant_type.ml` — 19 GVariantType tests (all passing)
- `tests/test_gvariant_text_format.c` — External verification of GVariant text format syntax

**Complete Type Coverage:**

| Type | OCaml Type | GVariant | Status |
|------|-----------|----------|--------|
| boolean | `bool` | b | ✅ |
| byte (uint8) | `int` | y | ✅ |
| int16 | `int` | n | ✅ |
| uint16 | `Unsigned.UInt16.t` | q | ✅ |
| int32 | `int32` | i | ✅ |
| uint32 | `Unsigned.UInt32.t` | u | ✅ |
| int64 | `int64` | x | ✅ |
| uint64 | `Unsigned.UInt64.t` | t | ✅ |
| double | `float` | d | ✅ |
| string | `string` | s | ✅ |
| object_path | `string` | o | ✅ |
| signature | `string` | g | ✅ |
| handle | `int` | h | ✅ |
| variant | `t` | v | ✅ |
| maybe | `t option` | m* | ✅ |
| string array | `string array` | as | ✅ |
| object_path array | `string array` | ao | ✅ |

**Implementation Details:**
- Reference counting via `g_variant_ref/unref` for GVariant
- Copy/free via `g_variant_type_copy/free` for GVariantType
- Type mappings added to `type_mappings.ml` for `GLib.Variant` → `Gvariant.t` and `GLib.VariantType` → `Gvariant_type.t`
- Helper macros added to `wrappers.h`: `Val_GVariant`, `GVariant_val`, `Val_GVariantType`, `GVariantType_val`
- Uses `integers` library for proper unsigned integer support (UInt16, UInt32, UInt64)

**Issues discovered during implementation:**

1. **GVariant text format parsing is strict and poorly documented**
   - Tests initially tried `<{'name': <'John'>}>` format but GLib rejects this
   - Error: *"can not parse as value of type '*'"* provides no guidance on correct syntax
   - Dictionary variants (a{sv}) and nested structures require specific syntax rules

2. **Type mapping added but activation not verified**
   - Mappings added to `type_mappings.ml` but bindings not yet regenerated
   - Need to verify the 436 methods using `GLib.Variant` are actually being generated
   - Potential issue: methods may have multiple unresolved types, so Variant alone may not unlock them

**Remediation Results:**

##### 3.1.R1: ✅ COMPLETED - GVariant text format syntax verified externally
Created `tests/test_gvariant_text_format.c` — standalone C program using GLib directly.

**Key Findings (GLib 2.80+):**
1. **Pass NULL for type parameter**, NOT `G_VARIANT_TYPE_ANY` — the ANY constant doesn't work as expected
2. **Dictionary syntax**: `{'key': <value>}` creates `a{sv}` (string→variant dict)
3. **String quoting is flexible**: Both `"double"` and `'single'` quotes work (output uses single)
4. **Variant syntax**: `<value>` works with any value: `<42>`, `<'hello'>`, `<(1, 2)>`

##### 3.1.R2: ✅ COMPLETED - Type mapping activation verified
Bindings successfully regenerated with GLib.Variant type mappings. Fixed parser bug where `readable` attribute was hardcoded to `true` instead of being read from GIR (caused duplicate function generation for write-only properties).

##### 3.1.R3: ✅ COMPLETED - C stub and test suite fixed
- Fixed `ml_gvariant.c` to pass `NULL` instead of `G_VARIANT_TYPE_ANY`
- Dictionary parse tests enabled and passing
- Added complete test coverage for all scalar types
- Added GVariantType test module (19 tests)

**Final Test Results:**
- GVariant Tests: **55/55 passing**
- GVariantType Tests: **19/19 passing**
- Total: **74 tests** covering all implemented types

##### 3.1.R4: ✅ COMPLETED - GVariantType test module
Created `tests/test_gvariant_type.ml` with 19 tests covering:
- Type constant constructors (boolean, int32, string, object_path, signature, variant, unit, int64, double)
- `of_string` / `to_string` roundtrip for basic, array, dict, and tuple types
- Predicate functions (is_basic, is_container, is_array, is_tuple, is_dict_entry, is_variant)

**Acceptance Criteria:**
- [x] External C test documents valid GVariant text format syntax
- [x] test_gvariant.ml dictionary tests pass with correct syntax
- [x] Bindings regenerate successfully with type mappings
- [x] At least 50 methods using GLib.Variant are verified unlocked — **76 methods confirmed** (April 2026)
- [x] GVariantType test module with 10+ tests (19 tests)

**Post-review fixes applied (code review 2026-03-30):**
- Added `.mli` files for `gvariant.ml` and `gvariant_type.ml`
- Replaced `g_variant_type_peek_string` with `g_variant_type_dup_string` in `ml_gvariant_type_get_string`
- Added `g_new()` NULL checks in `ml_g_variant_new_strv` and `ml_g_variant_new_objv`
- Removed duplicate `GVariant_val`/`GVariantType_val` macro definitions from `.c` files
- Replaced stub parse tests with real tests

**Known remaining issue:**
- `value result` declared without `CAMLlocal1` in `ml_g_variant_get_variant`, `ml_g_variant_get_child_value`, and `ml_g_variant_type_new`. Currently safe (no GC between allocation and return) but violates OCaml FFI convention.

#### Task 3.2: GLib.Bytes (291 hits) — ✅ COMPLETED

**Status:** ✅ Implementation complete — April 8, 2026
**Files created:**
- `src/common/glib_bytes.ml` / `glib_bytes.mli` — Opaque `t` type with `create`, `to_string`, `size`
- `src/common/ml_glib_bytes.c` — Custom block with `g_bytes_unref` finalizer, `g_bytes_compare`, `g_bytes_hash`
- `tests/test_glib_bytes.ml` — 13 tests (all passing)

**Implementation details:**
- Reference counting: `g_bytes_new` returns transfer-full, finalizer calls `g_bytes_unref`
- `Val_GBytes` rejects NULL with `caml_failwith`
- GC-safe ordering in `ml_g_bytes_new`: reads `String_val`/`caml_string_length` before any OCaml allocation
- Type mapping: `GLib.Bytes` → `Glib_bytes.t` with `Val_GBytes`/`GBytes_val` converters

**Review (Opus, April 2026):** No critical or important issues found. Minor:
- Fixed `CAMLexport` consistency across `Val_GVariant`, `Val_GVariantType`, `Val_GBytes`
- `.ml`/`.mli` byte-identical (expected for externals-only module)
- `gsize` → `long` truncation theoretical only (>4.6 EB)

**Intersection testing results:** 36 new methods unlocked across 5 namespaces:
- **Gsk:** 12 (GLShader args, ShaderArgsBuilder, RenderNode serialize)
- **Gio:** 8 (BytesIcon, MemoryInputStream/OutputStream, Resource)
- **GdkPixbuf:** 4 (Pixbuf save_to_png/tiff_bytes, PixbufLoader)
- **Gdk:** 4 (ContentProvider, Texture pixel_bytes)
- **Gtk:** 2 (CssProvider load_from_bytes, Snapshot serialize)

#### Task 3.3: GLib/GObject Primitive Integer Type Mappings — ✅ COMPLETED

**Status:** ✅ COMPLETED — April 2026

**Goal:** Add type mappings for primitive GLib/GObject integer types to unlock ~161 methods.

**Problem:** Types like `gsize`, `gssize`, `GType`, `guint32`, `gint64`, `guint64` were not in `type_mappings.ml`, causing methods that used them to be filtered out even when all other types were resolved.

**Types added to `type_mappings.ml`:**

| GIR Type | OCaml Type | C→OCaml | OCaml→C | Notes |
|----------|-----------|---------|---------|-------|
| `gsize` | `int` | `Val_long` | `Long_val` | size_t equivalent |
| `gssize` | `int` | `Val_long` | `Long_val` | ssize_t equivalent |
| `GType` | `int` | `Val_GType` | `GType_val` | macros already in wrappers.h |
| `guint16` | `int` | `Val_int` | `Int_val` | fits in OCaml int |
| `gint16` | `int` | `Val_int` | `Int_val` | |
| `gint32` | `int32` | `caml_copy_int32` | `Int32_val` | boxed |
| `guint32` | `int` | `Val_long` | `Long_val` | fits in 63-bit OCaml int |
| `gint64` | `int64` | `caml_copy_int64` | `Int64_val` | boxed |
| `guint64` | `Unsigned.UInt64.t` | `integers_copy_uint64` | `Uint64_val` | uses integers library |
| `gulong` | `int` | `Val_long` | `Long_val` | |
| `gunichar` | `int` | `Val_long` | `Long_val` | Unicode codepoint |
| `gchar` | `int` | `Val_int` | `Int_val` | single byte |

**`guint8` intentionally omitted:** Used almost exclusively as the element type of
`gpointer`/`void*` byte-buffer arrays (e.g. `g_input_stream_read`, `g_output_stream_write`).
These require length-erasure infrastructure (hiding the `gsize count` param, exposing the
buffer as `Bytes.t` or `string`) not yet implemented. See `architecture/todo/KNOWN_BUGS.md` for details.

**Additional fix:** Extended `is_primitive_converter` in both directions of
`c_stub_array_conv.ml` to cover the new converters. Without this, `GType` arrays
(e.g. `gtk_drop_target_set_gtypes`, `gtk_list_store_newv`) emitted `*GType_val(...)` with
a spurious pointer dereference, failing to compile.

**Intersection test results:** ~161 methods unlocked across all namespaces.
Notable examples:
- **GType arrays:** `drop_target_set_gtypes`, `list_store_newv`, `tree_store_newv`
- **Gio:** socket/stream count params (gsize/gssize) on non-async paths
- **GDK/GTK:** APIs using guint32, gint64 (e.g. timing, masks)

#### Task 3.3.1: Bounded Integer Wrapper Types — ⏳ PLANNED

**Status:** ⏳ PLANNED

**Goal:** Replace the bare `int`/`int32` mappings for bounded GLib integer types with opaque wrapper types that enforce range constraints at the OCaml level, eliminating silent truncation and providing self-documenting APIs.

**Problem with Task 3.3 mappings:**
- `guint16`, `gint16`, `guint32` exposed as `int`, `gint32` as `int32` — callers can pass any value and silent truncation occurs at the C boundary (e.g. passing `70000` for `guint16` silently wraps to `4464`)
- Generated `.mli` files show `int` with no hint the value is semantically bounded
- Inconsistent with `guint64` which already uses `Unsigned.UInt64.t` from the `integers` library

**Investigation: `ocaml_integers.h` is insufficient**

The `integers` library C header (`ocaml_integers.h`) was examined. It provides only:
- `Uint8_val` / `Integers_val_uint8` — backed by `Int_val` (no custom block, no safety)
- `Uint16_val` / `Integers_val_uint16` — same
- `Uint32_val` / `integers_copy_uint32` — custom block (heap allocated)
- `Uint64_val` / `integers_copy_uint64` — custom block (heap allocated)
- **No signed type support** — `Int16_val`, `Int32_val`, `integers_copy_int16`, etc. are absent

Since signed type C macros must be written from scratch regardless, and since `UInt16` in integers is just `Int_val` in disguise with no additional safety, the decision is to write a purpose-built `bounded_int` module rather than use the `integers` library for these types.

**Decision: Custom `bounded_int` module in `src/common/`**

Create `src/common/bounded_int.ml` and `bounded_int.mli` exposing flat top-level modules (deliberately shadowing stdlib where needed — users requiring both can qualify as `Stdlib.Int32`):

| Module  | Backing type  | Range                        | GLib types      |
|---------|--------------|------------------------------|-----------------|
| `UInt8` | `private int` | `[0, 255]`                   | `guint8`        |
| `Int8`  | `private int` | `[-128, 127]`                | `gint8`         |
| `UInt16`| `private int` | `[0, 65535]`                 | `guint16`       |
| `Int16` | `private int` | `[-32768, 32767]`            | `gint16`        |
| `UInt32`| `private int` | `[0, 4294967295]`            | `guint32`       |
| `Int32` | `private int` | `[-2147483648, 2147483647]`  | `gint32`        |

All types use `type t = private int` — no boxing, no heap allocation. On 64-bit OCaml, all six ranges fit within the 63-bit `int`. Each module exposes:
- `of_int : int -> t` — raises `Invalid_argument` if value is out of range
- `to_int : t -> int`
- `zero : t` (unsigned) / `minus_one : t` (signed)
- `min_int : t`, `max_int : t`

`guint64` is unchanged — it keeps `Unsigned.UInt64.t` from the `integers` library, which is already working and genuinely requires 64-bit custom-block storage.

**C macro layer** — add to `src/common/wrappers.h`:

```c
/* Bounded integer types — all backed by OCaml int (private int representation) */
#define UInt8_val(v)           ((uint8_t)(Long_val(v)))
#define Val_uint8(x)           (Val_long((uint8_t)(x)))
#define Int8_val(v)            ((int8_t)(Long_val(v)))
#define Val_int8(x)            (Val_long((int8_t)(x)))
#define UInt16_val(v)          ((uint16_t)(Long_val(v)))
#define Val_uint16(x)          (Val_long((uint16_t)(x)))
#define Int16_val(v)           ((int16_t)(Long_val(v)))
#define Val_int16(x)           (Val_long((int16_t)(x)))
#define UInt32_val(v)          ((uint32_t)(Long_val(v)))
#define Val_uint32(x)          (Val_long((uint32_t)(x)))
#define Int32_val_bounded(v)   ((int32_t)(Long_val(v)))   /* avoids conflict with caml Int32_val */
#define Val_int32_bounded(x)   (Val_long((int32_t)(x)))
```

**`type_mappings.ml` changes:**

| GIR Type | Old OCaml type | New OCaml type | Old C→OCaml        | New C→OCaml        | Old OCaml→C | New OCaml→C       |
|----------|---------------|---------------|--------------------|--------------------|-------------|-------------------|
| `guint16`| `int`         | `UInt16.t`    | `Val_int`          | `Val_uint16`       | `Int_val`   | `UInt16_val`      |
| `gint16` | `int`         | `Int16.t`     | `Val_int`          | `Val_int16`        | `Int_val`   | `Int16_val`       |
| `guint32`| `int`         | `UInt32.t`    | `Val_long`         | `Val_uint32`       | `Long_val`  | `UInt32_val`      |
| `gint32` | `int32`       | `Int32.t`     | `caml_copy_int32`  | `Val_int32_bounded`| `Int32_val` | `Int32_val_bounded` |

After updating `type_mappings.ml`, all bindings must be regenerated via `bash scripts/generate-bindings.sh` from the repository root.

**User-visible impact:**

```ocaml
(* Before: silent truncation, no type signal *)
Widget.set_something widget 70000

(* After: explicit conversion, raises Invalid_argument on bad input *)
Widget.set_something widget (UInt16.of_int 70000)
```

**Architecture reference:** See `ocgtk/architecture/integer_type_design.md` for full rationale.

#### Task 3.4: GLib.DateTime (90 hits)

Create `src/common/glib_date_time.ml`, `src/common/ml_glib_date_time.c`. Opaque type with ref-counting finalizer and basic accessors.

**Intersection analysis (April 2026):** 56 hits in Gio (mostly GFileInfo date properties). Likely blocked by other missing types on most methods, but GDateTime is used in Gtk.Calendar and other user-facing APIs. Moderate priority.

#### Task 3.5: GLib.KeyFile (50 hits) — DEFERRED

Low intersection potential. Most GKeyFile methods are in Gio and use additional missing types.

#### Task 3.6: GLib.Source (37 hits) — DEFERRED

41 hits in Gio. Most GSource methods use callbacks (GSourceFunc) that can't be auto-generated.

### Phase 4: On-Demand Additions

Add remaining types as specific API usage demands:
- Callback types — manually wrap specific ones as use cases arise
- `GObject.ParamSpec` — for property introspection
- `GLib.MainContext`, `GLib.VariantDict` — for advanced use cases

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
