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

#### Task 3.1: GLib.Variant + GLib.VariantType (495 combined hits) — IMPLEMENTED with remediation needed

**Status:** ✅ Implementation complete — March 29, 2026
**Files created:**
- `src/common/gvariant.ml` / `ml_gvariant.c` — GVariant opaque wrapper
- `src/common/gvariant_type.ml` / `ml_gvariant_type.c` — GVariantType wrapper
- `tests/test_gvariant.ml` — 47 comprehensive tests (all passing)

**Implementation details:**
- Reference counting via `g_variant_ref/unref` for GVariant
- Copy/free via `g_variant_type_copy/free` for GVariantType
- Type mappings added to `type_mappings.ml` for `GLib.Variant` → `Gvariant.t` and `GLib.VariantType` → `Gvariant_type.t`
- Helper macros added to `wrappers.h`: `Val_GVariant`, `GVariant_val`, `Val_GVariantType`, `GVariantType_val`

**Issues discovered during implementation:**

1. **GVariant text format parsing is strict and poorly documented**
   - Tests initially tried `<{'name': <'John'>}>` format but GLib rejects this
   - Error: *"can not parse as value of type '*'"* provides no guidance on correct syntax
   - Dictionary variants (a{sv}) and nested structures require specific syntax rules

2. **Type mapping added but activation not verified**
   - Mappings added to `type_mappings.ml` but bindings not yet regenerated
   - Need to verify the 436 methods using `GLib.Variant` are actually being generated
   - Potential issue: methods may have multiple unresolved types, so Variant alone may not unlock them

**Remediation Plan for Phase 3.1:**

##### 3.1.R1: ✅ COMPLETED - GVariant text format syntax verified externally
Created `tests/test_gvariant_text_format.c` — standalone C program using GLib directly.

**Key Findings (GLib 2.80+):**
1. **Pass NULL for type parameter**, NOT `G_VARIANT_TYPE_ANY` — the ANY constant doesn't work as expected
2. **Dictionary syntax**: `{'key': <value>}` creates `a{sv}` (string→variant dict)
   - Keys are single-quoted strings: `'name'`
   - Values in angle brackets become variants: `<'John'>`
   - Alternative: `{'key': 'value'}` creates `a{ss}` (string→string dict)
3. **Large integers overflow int32**: `12345678901234` fails — use `int64 12345678901234` instead
4. **Empty containers need type annotation**: `@as []` for empty array, `@a{sv} {}` for empty dict
5. **String quoting is flexible**: Both `"double"` and `'single'` quotes work (output uses single)
6. **Variant syntax**: `<value>` works with any value: `<42>`, `<'hello'>`, `<(1, 2)>`

**Root cause of parse failures:**
The C stub `ml_gvariant_parse` was passing `G_VARIANT_TYPE_ANY` but should pass `NULL` to allow any type.

##### 3.1.R2: Investigate type mapping activation
Regenerate bindings and check if methods with `GLib.Variant` parameters are now being generated:

**Steps:**
1. Run `bash scripts/generate-bindings.sh`
2. Build: `cd ocgtk && dune build`
3. Check for compilation errors in generated code using Variant/VariantType
4. Count unlocked methods vs expected 436 hits
5. If methods still skipped, debug:
   - Check `filtering.ml` for additional filters beyond type resolution
   - Add debug logging to `find_type_mapping_for_gir_type` to verify mapping lookup
   - Check if methods have OTHER unresolved types blocking them

##### 3.1.R3: Fix C stub and test suite based on verified syntax
Fix `ml_gvariant.c` to pass `NULL` instead of `G_VARIANT_TYPE_ANY`, then update tests:
- Fix dictionary parse tests (currently skipped)
- Add tests for large int64 values with explicit type annotation
- Add tests for empty containers with type annotation
- Add comprehensive parse/roundtrip tests for complex structures

##### 3.1.R4: Add GVariantType tests
Create `tests/test_gvariant_type.ml` testing:
- Type constant constructors (boolean, int32, string, etc.)
- `of_string` / `to_string` roundtrip
- Predicate functions (is_basic, is_container, is_array, etc.)

**Acceptance Criteria:**
- [ ] External C test documents valid GVariant text format syntax
- [ ] test_gvariant.ml dictionary tests pass with correct syntax
- [ ] Bindings regenerate successfully with type mappings
- [ ] At least 50 methods using GLib.Variant are verified unlocked (intersection testing)
- [ ] GVariantType test module with 10+ tests

#### Task 3.2: GLib.Bytes (291 hits)

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
