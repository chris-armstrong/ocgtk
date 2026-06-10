# Record Field Accessors — Implementation Plan

## Goal

For every non-opaque record with at least one non-gpointer field, generate:
- **Getter** per readable field
- **Setter** per writable field (suppressible via `(no_setter)` override)
- **Getter** suppressible via `(no_getter)` override
- **`make` labelled constructor** taking all writable, non-gpointer fields

Supported field types: primitives, enums, strings, nested records, SList, fixed-size
arrays, null-terminated string arrays (`gchar**`). The only exclusion is callback
function-pointer fields (deferred to Milestone 4).

## Scope (39 records across 6 namespaces)

### Fully handled (all fields are simple primitives, enums, or nested records)
| NS | Record | Fields | make params |
|----|--------|--------|-------------|
| Gtk | `Border` | left, right, top, bottom : int16 | `~left ~right ~top ~bottom` |
| Gtk | `Requisition` | width, height : int | `~width ~height` |
| Gtk | `PageRange` | start, end : int | `~start ~end` |
| Gtk | `AccessibleTextRange` | start, length : gsize | `~start ~length` |
| Gtk | `CssLocation` | bytes, chars, lines, line_bytes, line_chars : gsize | `~bytes ~chars ~lines ~line_bytes ~line_chars` |
| Gdk | `KeymapKey` | keycode : uint, group : int, level : int | `~keycode ~group ~level` |
| Gdk | `RGBA` | red, green, blue, alpha : float | `~red ~green ~blue ~alpha` |
| Gdk | `Rectangle` | x, y, width, height : int | `~x ~y ~width ~height` |
| Gsk | `ParseLocation` | bytes, chars, lines, line_bytes, line_chars : gsize | `~bytes ~chars ~lines ~line_bytes ~line_chars` |
| Pango | `Color` | red, green, blue : uint16 | `~red ~green ~blue` |
| Pango | `GlyphGeometry` | width, x_offset, y_offset : GlyphUnit (=int32) | `~width ~x_offset ~y_offset` |
| Pango | `LogAttr` | 16 bit-fields (all bool-like) | `~is_line_break ~is_mandatory_break ...` |
| Pango | `GlyphVisAttr` | is_cluster_start, is_color : bool | `~is_cluster_start ~is_color` |
| Pango | `Matrix` | xx, xy, yx, yy, x0, y0 : double | `~xx ~xy ~yx ~yy ~x0 ~y0` |
| Pango | `Rectangle` | x, y, width, height : int | `~x ~y ~width ~height` |
| GdkPixbuf | `PixbufModulePattern` | prefix, mask : string, relevance : int | `~prefix ~mask ~relevance` |
| Graphene | `Point` | x, y : float | `~x ~y` |
| Graphene | `Point3D` | x, y, z : float | `~x ~y ~z` |
| Graphene | `Size` | width, height : float | `~width ~height` |

### Fully handled (record fields with nested record types)
| NS | Record | Fields | Notes |
|----|--------|--------|-------|
| Gsk | `ColorStop` | offset : float, **color : Gdk.RGBA** | Uses `Val_GdkRGBA`/`GdkRGBA_val` |
| Gsk | `Shadow` | **color : Gdk.RGBA**, dx, dy, radius : float | Same |
| Graphene | `Rect` | **origin : Point**, **size : Size** | Uses `Val_graphene_point_t`/`..._val` |
| Pango | `AttrColor` | **attr : Attribute**, **color : Color** | Two nested records |
| Pango | `AttrFloat` | **attr : Attribute**, value : double | |
| Pango | `AttrFontDesc` | **attr : Attribute**, **desc : FontDescription** | |
| Pango | `AttrInt` | **attr : Attribute**, value : int | |
| Pango | `GlyphItem` | **item : Item**, **glyphs : GlyphString**, y_offset, start_x_offset, end_x_offset : int | |

### String fields (need `g_strdup` in make, `g_free` implied by record free)
| NS | Record | Fields | Notes |
|----|--------|--------|-------|
| Gtk | `PadActionEntry` | **type : enum**, index, mode : int, **label, action_name : string** | enum uses `Val_GtkPadActionType` |
| Gtk | `RecentData` | **display_name, description, mime_type, app_name, app_exec : string**, is_private : bool, **groups : gchar**[]** | `(no_getter)` for all fields; `groups` exposes `string list` |
| Pango | `AttrFontFeatures` | **attr : Attribute**, **features : string** | |
| Pango | `AttrString` | **attr : Attribute**, **value : string** | |
| GdkPixbuf | `PixbufFormat` | **name, domain, description, license : string**, **mime_types, extensions : gchar**[] | `string list` for mime_types/extensions |

### Records with gpointer → fully skipped
| NS | Record | Reason |
|----|--------|--------|
| Gtk | `TreeIter` | deprecated GTK 4.10, 3/4 fields are `gpointer` |
| Gtk | `RequestedSize` | primary field `data` is `gpointer` |

### Records with mixed fields (generated + callback-only skips)
| NS | Record | Generated | Skipped (callback fn ptrs) |
|----|--------|-----------|---------|
| Pango | `Analysis` | font, level, gravity, flags, script, language, extra_attrs:SList | shape_engine:gpointer, lang_engine:gpointer |
| Pango | `AttrShape` | attr, ink_rect, logical_rect | data:gpointer, copy_func:callback, destroy_func:callback |
| Pango | `AttrLanguage` | attr, **value : Language** | — |
| Pango | `AttrSize` | attr, size : int, absolute : bool | — |
| Pango | `Attribute` | start_index, end_index : uint | klass:`AttrClass` (struct-of-fn-ptrs) |
| Pango | `GlyphInfo` | glyph : Glyph, geometry : GlyphGeometry, attr : GlyphVisAttr | — |
| Pango | `GlyphItemIter` | start_glyph, start_index, start_char, end_glyph, end_index, end_char : int | glyph_item : GlyphItem, text : string (**not** writable) |
| Pango | `GlyphString` | num_glyphs : int, log_clusters : int | glyphs : `PangoGlyphInfo*[]` — dynamic C array (needs length + data, skip) |
| Pango | `Item` | offset, length, num_chars : int, **analysis : Analysis** | — |
| Pango | `LayoutLine` | start_index, length : int, is_paragraph_start, resolved_dir : bool, **runs : SList** | layout : Layout |
| GdkPixbuf | `PixbufModule` | module_name, module_path : string | module:pointer, info:format, + 9 callback fn ptrs |

### Records with fixed-size array fields
| NS | Record | Array field | Element type | Size | OCaml type |
|----|--------|------------|-------------|------|------------|
| Gdk | `TimeCoord` | axes | double | 12 | `float array` |
| Gsk | `RoundedRect` | corner | graphene_size_t | 4 | `Graphene.Size.t array` |

### Anonymous records → skip
| NS | Name | Reason |
|----|------|--------|
| Gsk | `(anonymous: GskTangent)` | No C type name, no GType |

---

## Fields to skip (universal rules)

A field is skipped when its type is any of:
1. **`gpointer`** — `type name="gpointer"` or `c:type="gpointer"`
2. **Callback function pointer** — `type name="SomeCallbackFunc"` referencing a `<callback>` GIR element. Detect via `is_callback_type` (already exists in the type system).
3. **Private fields** — `private="1"` on the `<field>` element.
4. **Dynamic C array with no terminator** — `PangoGlyphInfo*[]` in `GlyphString.glyphs`. These have a companion `num_glyphs` field carrying length, but we have no mechanism to tie them together. Skip; a future pass could add support with a paired length annotation.

---

## Array type support

### Fixed-size arrays (`<array zero-terminated="0" fixed-size="N">`)

These are inline C arrays like `double axes[12]` or `graphene_size_t corner[4]`. Represented
as OCaml `array` (boxed flat array, not a list).

| GIR array element type | OCaml type | OCaml `array` tag |
|------------------------|-----------|-------------------|
| `gdouble` / `gfloat` | `float array` | `Double_array_tag` |
| `gint` / `guint` | `int array` | `0` (default tag) |
| Nested record (e.g., `Graphene.Size`) | `Size.t array` | `0` (default tag, block holds values) |

**Getter:**
```c
CAMLprim value ml_gdk_time_coord_get_axes(value v_rec) {
  CAMLparam1(v_rec);
  CAMLlocal1(arr);
  GdkTimeCoord *rec = GdkTimeCoord_val(v_rec);
  arr = caml_alloc(12, 0);  /* 0 = Double_array_tag */
  for (int i = 0; i < 12; i++)
    Store_double_field(arr, i, rec->axes[i]);
  CAMLreturn(arr);
}
```

**Setter:**
```c
CAMLprim value ml_gdk_time_coord_set_axes(value v_rec, value v_arr) {
  CAMLparam2(v_rec, v_arr);
  GdkTimeCoord *rec = GdkTimeCoord_val(v_rec);
  for (int i = 0; i < 12; i++)
    rec->axes[i] = Double_field(v_arr, i);
  CAMLreturn(Val_unit);
}
```

**For nested record arrays** (e.g., `graphene_size_t corner[4]`):
```c
CAMLprim value ml_gsk_rounded_rect_get_corner(value v_rec) {
  CAMLparam1(v_rec);
  CAMLlocal1(arr);
  GskRoundedRect *rec = GskRoundedRect_val(v_rec);
  arr = caml_alloc(4, 0);
  for (int i = 0; i < 4; i++)
    caml_modify(&Field(arr, i), Val_graphene_size_t(&rec->corner[i]));
  CAMLreturn(arr);
}
```
Each element is a heap-allocated custom block (via `Val_<type>`), stored in a plain OCaml
array. Setter reverses with `<type>_val` and copies into each slot.

**Builder:**
```c
CAMLprim value ml_gdk_time_coord_make(value v_time, value v_flags, value v_axes) {
  CAMLparam3(v_time, v_flags, v_axes);
  GdkTimeCoord *rec = g_new0(GdkTimeCoord, 1);
  rec->time = Int32_val(v_time);
  rec->flags = GdkAxisFlags_val(v_flags);
  for (int i = 0; i < 12; i++)
    rec->axes[i] = Double_field(v_axes, i);
  CAMLreturn(Val_GdkTimeCoord(rec));
}
```

### Null-terminated string arrays (`<array c:type="gchar**">`)

Zero-terminated arrays of C strings, exposed as `string list` in OCaml. Requires new
`Val_strv`/`Strv_val` converter macros in `wrappers.h`.

```c
/* Val_strv: NULL-terminated gchar** → OCaml string list */
#define Val_strv(strv, result) \
  do { \
    result = Val_emptylist; \
    if (strv) { \
      gchar **p = strv; \
      int count = 0; \
      while (p[count]) count++; \
      while (count-- > 0) { \
        value cell = caml_alloc_small(2, 0); \
        Field(cell, 0) = caml_copy_string(strv[count]); \
        Field(cell, 1) = result; \
        result = cell; \
      } \
    } \
  } while(0)

/* Strv_val: OCaml string list → gchar** (caller owns, must g_strfreev) */
#define Strv_val(ml_list, result_strv) \
  do { \
    int count = 0; \
    value current = ml_list; \
    while (current != Val_emptylist) { count++; current = Field(current, 1); } \
    result_strv = g_new0(gchar*, count + 1); \
    current = ml_list; \
    for (int i = 0; i < count; i++) { \
      result_strv[i] = g_strdup(String_val(Field(current, 0))); \
      current = Field(current, 1); \
    } \
    result_strv[count] = NULL; \
  } while(0)
```

**Getter:**
```c
CAMLprim value ml_gdk_pixbuf_pixbuf_format_get_mime_types(value v_rec) {
  CAMLparam1(v_rec);
  CAMLlocal1(result);
  GdkPixbufFormat *rec = GdkPixbufFormat_val(v_rec);
  Val_strv(rec->mime_types, result);
  CAMLreturn(result);
}
```

**Setter:**
```c
CAMLprim value ml_gdk_pixbuf_pixbuf_format_set_mime_types(value v_rec, value v_val) {
  CAMLparam2(v_rec, v_val);
  GdkPixbufFormat *rec = GdkPixbufFormat_val(v_rec);
  g_strfreev(rec->mime_types);           /* free old */
  gchar **new_val = NULL;
  Strv_val(v_val, new_val);
  rec->mime_types = new_val;
  CAMLreturn(Val_unit);
}
```

**Builder:**
```c
CAMLprim value ml_gtk_recent_data_make(value v_display_name, ..., value v_groups) {
  CAMLparam5(v_display_name, v_description, v_mime_type, v_app_name, v_app_exec);
  CAMLxparam2(v_is_private, v_groups);
  CAMLlocal1(rec_val);
  GtkRecentData *rec = g_new0(GtkRecentData, 1);
  rec->display_name = g_strdup(String_val(v_display_name));
  /* ... other string fields ... */
  rec->is_private = Bool_val(v_is_private);
  Strv_val(v_groups, rec->groups);
  rec_val = Val_GtkRecentData(rec);
  CAMLreturn(rec_val);
}
```

---

## Override mechanism changes

Add two new field-level qualifiers: `(no_getter)` and `(no_setter)`. These are **composable**
with existing qualifiers like `(ignore)`, `(version)`, `(os)`.

Example usage (in `ocgtk/overrides/gtk.sexp`):
```sexp
(record RecentData
  (field groups (no_getter))
  (field display_name (no_getter))
  (field description (no_getter))
  (field mime_type (no_getter))
  (field app_name (no_getter))
  (field app_exec (no_getter))
  (field is_private (no_getter))
)
```

### Changes to `override_types.ml`

Add `no_getter` and `no_setter` as separate boolean fields on `component_override`,
leaving `action` as-is for ignore/version:

```ocaml
type component_override = {
  component_name : string;
  action : override_action option;
  os : Os_filter.t option;
  no_getter : bool;   (* NEW — default false *)
  no_setter : bool;   (* NEW — default false *)
}
```

### Changes to `override_parser.ml`

**`parse_component_qualifiers` (line 94):**

Change return type from `(action option * os option)` to
`(action option * os option * bool * bool)` — `(action, os, no_getter, no_setter)`.

Change `go` accumulators from 4 to 6:
```ocaml
let rec go action os_vals not_os_vals (no_getter, no_setter) = function
```

Add two new match cases after the existing `ignore` case (line 103):
```ocaml
| Sexp.Atom "no_getter" :: rest | Sexp.List [ Sexp.Atom "no_getter" ] :: rest ->
    go action os_vals not_os_vals (true, no_setter) rest
| Sexp.Atom "no_setter" :: rest | Sexp.List [ Sexp.Atom "no_setter" ] :: rest ->
    go action os_vals not_os_vals (no_getter, true) rest
```

**`parse_component` (line 128):** Update `Ok` return to populate `no_getter`/`no_setter`.

**`validate_body_elements` (line 201):** Add `"no_getter"` and `"no_setter"` to the
known qualifier atoms list (lines 210-213).

**Error message (line 120):** Update to mention `no_getter` and `no_setter`.

### Changes to `override_apply.ml`

**`apply_record_components` (line 167):** After `apply_components_by_name` returns the
filtered field list, add a second pass that merges `no_getter`/`no_setter` from
overrides into surviving `gir_record_field` records:

```ocaml
let fields =
  List.map
    (fun (f : gir_record_field) ->
      match find_component_override f.field_name ov.fields with
      | Some { no_getter; no_setter; _ } -> { f with no_getter; no_setter }
      | None -> f)
    fields
in
```

### Changes to `gir_record_field` (`types.ml`)

Add `no_getter : bool` and `no_setter : bool` fields (both default `false`):

```ocaml
type gir_record_field = {
  field_name : string;
  field_type : gir_type option;
  readable : bool;
  writable : bool;
  field_doc : string option;
  field_version : string option;
  field_os : Os_filter.t option;
  no_getter : bool;      (* NEW *)
  no_setter : bool;      (* NEW *)
}
```

---

## Architecture

Four new generation modules (mirroring the property pattern), plus pipeline wiring:

```
gir_gen/lib/generate/
  c_stub_field.ml          — C getter/setter/make stubs
  layer1_field.ml          — L1 .ml/.mli external declarations
  class_gen_field.ml       — L2 class methods

gir_gen/lib/types.ml       — carry fields through entity type (+ no_getter/no_setter)
gir_gen/lib/override_types.ml  — add no_getter/no_setter to component_override
gir_gen/lib/override_parser.ml — parse no_getter/no_setter qualifiers
gir_gen/lib/override_apply.ml  — merge no_getter/no_setter into gir_record_field
gir_gen/lib/gir_gen.ml     — wire into entity_generators + generation loops
ocgtk/src/common/wrappers.h    — add Val_strv / Strv_val macros
```

---

## Step-by-step

### 1. Add `Val_strv` / `Strv_val` macros to `wrappers.h`

New converter macros for null-terminated `gchar**` arrays. `Val_strv` produces an OCaml
`string list`; `Strv_val` converts an OCaml `string list` to a freshly-allocated
`gchar**` (caller responsible for `g_strfreev`). Implementation details above in the
"Null-terminated string arrays" section.

### 2. Extend `override_types.ml` — add `no_getter`/`no_setter` flags

Add `no_getter : bool` and `no_setter : bool` to `component_override` (default `false`).

### 3. Extend `override_parser.ml` — parse `(no_getter)` / `(no_setter)`

- Change `parse_component_qualifiers` return type to include the two bools.
- Add match cases for `"no_getter"` and `"no_setter"` atoms.
- Update `parse_component` to populate the new fields.
- Update `validate_body_elements` to accept the new atoms.
- Update the "Unknown qualifier" error message.

### 4. Extend `types.ml` — add flags and carry fields

- Add `no_getter : bool` and `no_setter : bool` to `gir_record_field` (default `false`).
- Add `fields : gir_record_field list` to the `entity` type. Initialize `fields = []` for
  classes/interfaces, `fields = rec_.fields` for records in `entity_of_record`.

### 5. Extend `override_apply.ml` — merge flags into fields

In `apply_record_components`, add a post-processing pass after `apply_components_by_name`
that merges `no_getter`/`no_setter` from overrides into surviving field records.

### 6. Add override entries to `ocgtk/overrides/gtk.sexp`

```sexp
(record RecentData
  (field display_name (no_getter))
  (field description (no_getter))
  (field mime_type (no_getter))
  (field app_name (no_getter))
  (field app_exec (no_getter))
  (field is_private (no_getter))
  (field groups (no_getter))
)
```

### 7. C stubs — `c_stub_field.ml` (new file)

For each non-opaque record entity, iterate `fields`, skipping gpointer/callback/private
fields. Generate three kinds of C functions per field (unless suppressed by overrides).

#### Skip detection

A field is skippable when:
- `gpointer` type — field_type `name="gpointer"` or `c:type="gpointer"`
- Callback type — field_type `name` references a `<callback>` element. Detect via
  `Type_mappings.is_callback_type` or by checking if the gir_type resolves to a
  callback.
- Private — `field.private = true` in parsed GIR data.
- `GlyphInfo*.glyphs` — dynamic array pointer without fixed size or zero-terminator
  (special-case via the GIR type name `PangoGlyphInfo` inside a non-fixed-size array).
  A general heuristic: `<array>` without either `fixed-size` or `c:type="gchar**"`.

#### Getter

```c
CAMLprim value ml_gtk_border_get_left(value v_rec) {
  CAMLparam1(v_rec);
  GtkBorder *rec = GtkBorder_val(v_rec);
  CAMLreturn(Val_int(rec->left));
}
```

- Use existing `<Prefix>_val` macros for the record pointer.
- Map GIR type → C/OCaml conversion expression. See table below for per-type conversions.
- For array types: `caml_alloc(N, tag)` loop pattern (fixed-size) or `Val_strv` (gchar**).
- For SList: `Val_GSList_with(...)` macro (existing, from `c_stub_list_conv.ml`).
- Skip if `no_getter` override flag is set.

#### Setter

```c
CAMLprim value ml_gtk_border_set_left(value v_rec, value v_val) {
  CAMLparam2(v_rec, v_val);
  GtkBorder *rec = GtkBorder_val(v_rec);
  rec->left = Int_val(v_val);
  CAMLreturn(Val_unit);
}
```

- Use ml→C conversion expressions. See table below.
- For string fields: `g_free(old)`, then `g_strdup`.
- For SList: `g_slist_free(old)`, then `GSList_val_with(...)`.
- For gchar**: `g_strfreev(old)`, then `Strv_val(...)`.
- For fixed-size arrays: loop with `Double_field(v_arr, i)` / `Field(v_arr, i)`.
- Skip if `no_setter` override flag is set, or if field is not `writable`.

#### make constructor

```c
CAMLprim value ml_gtk_border_make(value v_left, value v_right,
                                   value v_top, value v_bottom) {
  CAMLparam4(v_left, v_right, v_top, v_bottom);
  GtkBorder *rec = g_new0(GtkBorder, 1);
  rec->left = Int_val(v_left);
  rec->right = Int_val(v_right);
  rec->top = Int_val(v_top);
  rec->bottom = Int_val(v_bottom);
  CAMLreturn(Val_GtkBorder(rec));
}
```

- Name: `ml_<prefix>_<record>_make` (distinct from existing `new` stubs).
- Allocates with `g_new0(<CType>, 1)`.
- For string fields: `g_strdup(String_val(v_label))`. Record's own `free` function
  will `g_free` them later.
- For SList: `GSList_val_with(...)` to build the list. No old-value cleanup (fresh alloc).
- For gchar**: `Strv_val(...)` to build the array.
- For fixed-size arrays: loop to copy from OCaml array into C array.
- Uses `CAMLparamN`/`CAMLxparamN` for all parameters.
- Only includes fields that are `writable` and not gpointer/callback.

#### Integration

In `c_stub_record.ml:generate_record_c_code`, call `generate_c_stub_fields` after the
existing methods section but before the closing includes.

### 8. Layer 1 OCaml declarations — `layer1_field.ml` (new file)

For each record, generate in both `.mli` (val) and `.ml` (external):

```ocaml
(** Field accessors *)

(** [get_left border] returns the left border width. *)
external get_left : t -> int = "ml_gtk_border_get_left"

external set_left : t -> int -> unit = "ml_gtk_border_set_left"

(** [make ~left ~right ~top ~bottom] creates a new [border]. *)
external make : left:int -> right:int -> top:int -> bottom:int -> t
  = "ml_gtk_border_make_bytecode" "ml_gtk_border_make"
```

- Type mapping: use `Type_mappings.find_type_mapping_for_gir_type` to resolve the OCaml
  type. For enums → `<Ns>_enums.<name>`. For nested records → `<Module>.t`. For SList
  → `<element_type> list`. For fixed-size arrays → `<element_type> array`. For gchar**
  → `string list`.
- Name sanitization: `Utils.to_snake_case` for OCaml names.
- C function names derived from `ctx.c_prefix` (already set correctly per namespace).
- Doc comments from `field_doc` if present in GIR.
- `no_getter`/`no_setter` flags respected: suppress the corresponding `external`.
- `make` labels use snake_case field names. `make` is always generated (fields it
  depends on are individually suppressible via overrides).

### 9. Layer 2 class methods — `class_gen_field.ml` (new file)

For each record, generate in the L2 `.mli` class type and `.ml` class implementation:

```ocaml
method left : int
method set_left : int -> unit
method make : left:int -> right:int -> top:int -> bottom:int -> t
```

Implementation delegates to L1:

```ocaml
method left = Border.get_left obj
method set_left v = Border.set_left obj v
method make ~left ~right ~top ~bottom =
  Border.make ~left ~right ~top ~bottom
```

- Reuse `StringSet`-based name deduplication from `class_gen_property.ml`.
- `obj` is obtained from `self#as_<record>` (same as property methods).
- Only for `Record` entities — classes/interfaces have `fields = []`.
- `make` is a class-level method (delegates to L1 `make` directly, no `self`).
- Respect `no_getter`/`no_setter` on the underlying `gir_record_field`.

### 10. Pipeline wiring — `gir_gen/lib/gir_gen.ml`

Add three new fields to the `entity_generators` record:
- `generate_c_stub_fields : C_stub_field.generator_fn`
- `generate_l1_field_decls : Layer1_field.generator_fn`
- `generate_l2_field_methods : Class_gen_field.generator_fn`

For `Record` entities, wire them to the respective module functions. For
`Class`/`Interface`, use `noop_generator`.

In the generation loops:
- `generate_c_stub_fields` → call from `generate_record_c_code`
- `generate_l1_field_decls` → call from `generate_ml_interface_internal`
- `generate_l2_field_methods` → call from `generate_class_module_body`

### 11. dune file updates

Add the new modules to `gir_gen/lib/generate/dune`.

---

## Type-specific C conversion reference

| Field GIR type | OCaml type | C getter expr | C setter expr |
|---------------|-----------|---------------|---------------|
| `gint`, `gint16`, `guint`, `gsize` | `int` | `Val_int(rec->field)` | `rec->field = Int_val(v)` |
| `guint32`, `guint16` | `int` (or `int32`) | `Val_int(rec->field)` | `rec->field = Int_val(v)` |
| `gfloat`, `gdouble` | `float` | `caml_copy_double(rec->field)` | `rec->field = Double_val(v)` |
| `gboolean`, `guint:1` | `bool` | `Val_bool(rec->field)` | `rec->field = Bool_val(v)` |
| `utf8` | `string` | `caml_copy_string(rec->field)` | `g_free(rec->field); rec->field = g_strdup(String_val(v))` |
| `utf8` (nullable) | `string option` | `rec->field ? caml_copy_string(rec->field) : Val_none` via `Val_option` | `g_free(rec->field); rec->field = Is_block(v) ? g_strdup(String_val(Field(v,0))) : NULL` |
| `GLib.SList` | `E.t list` | `Val_GSList_with(rec->runs, result, item, cell, E_val(cell))` | `g_slist_free(rec->runs); GSList_val_with(v, rec->runs, E_val(Field(_iter,0)))` |
| Enum | `` `TAG `` via `<Ns>_enums.<name>` | `Val_GtkPadActionType(rec->type)` | `rec->type = GtkPadActionType_val(v)` |
| Nested record (inline) | `<Mod>.t` | `Val_graphene_size_t(&rec->corner[i])` (per element for arrays) or `Val_GdkRGBA(&rec->color)` (scalar) | `*graphene_size_t_val(v)` → copy into `&rec->corner[i]` |
| Fixed-size `double[N]` | `float array` | `caml_alloc(N,0)` + `Store_double_field(arr,i,rec->axes[i])` | loop: `rec->axes[i] = Double_field(v,i)` |
| Fixed-size record `[N]` | `T.t array` | `caml_alloc(N,0)` + `caml_modify(&Field(arr,i), Val_T(&rec->arr[i]))` | loop: copy `T_val(Field(v,i))` into `rec->arr[i]` |
| `gchar**` | `string list` | `Val_strv(rec->groups, result)` | `g_strfreev(rec->groups); Strv_val(v, rec->groups)` |

**Note on string memory**: In setters and `make`, string fields are `g_strdup`'d. The
record's own `free` function (when eventually called) is responsible for `g_free`'ing
them. For gchar** fields, `g_strfreev` handles both the array and its contents. This is
consistent with how GTK manages these structs internally.

**Note on inline nested records**: For records with inline struct fields (e.g.,
`GskColorStop.color : GdkRGBA`), the getter returns a heap-allocated copy via `Val_<Type>`
(which calls `g_boxed_copy` if boxed, or heap-allocates and copies otherwise). The setter
copies into the struct field directly via dereference. The builder copies from the Val'd
OCaml parameter into the freshly `g_new0`'d struct.

---

## Verification

1. `dune build` from repo root
2. `scripts/generate-bindings.sh` to regenerate all bindings
3. `dune build` again — should compile clean
4. `dune test gir_gen/ && xvfb-run dune test ocgtk/` — all tests pass
5. Spot-check generated code:
   - `ocgtk/src/gtk/generated/border.ml` — `get_left`, `set_left`, ..., `make`
   - `ocgtk/src/gdk/generated/rgba.ml` — `get_red`, `set_red`, ..., `make`
   - `ocgtk/src/gdk/generated/time_coord.ml` — `get_axes : t -> float array`, etc.
   - `ocgtk/src/gsk/generated/rounded_rect.ml` — `get_corner : t -> Graphene.Size.t array`
   - `ocgtk/src/gtk/generated/recent_data.ml` — getters absent (override), `make` present
   - `ocgtk/src/graphene/generated/point.ml` — `get_x`, `get_y`, `make`
6. Verify override tests still pass with new `no_getter`/`no_setter` fields

---

## Files changed

| File | Change |
|------|--------|
| `gir_gen/lib/types.ml` | Add `fields`, `no_getter`, `no_setter` to types |
| `gir_gen/lib/override_types.ml` | Add `no_getter`, `no_setter` to `component_override` |
| `gir_gen/lib/override_parser.ml` | Parse `(no_getter)` / `(no_setter)` qualifiers |
| `gir_gen/lib/override_apply.ml` | Merge flags into `gir_record_field` |
| `gir_gen/lib/generate/c_stub_field.ml` | **New** — C getter/setter/make stubs (all field types) |
| `gir_gen/lib/generate/c_stub_record.ml` | Call `c_stub_field.generate_c_stub_fields` |
| `gir_gen/lib/generate/layer1_field.ml` | **New** — L1 val/external declarations |
| `gir_gen/lib/generate/class_gen_field.ml` | **New** — L2 class method wrappers |
| `gir_gen/lib/gir_gen.ml` | Add generators, wire into loops |
| `gir_gen/lib/generate/dune` | Add new modules |
| `ocgtk/src/common/wrappers.h` | Add `Val_strv` / `Strv_val` macros |
| `ocgtk/overrides/gtk.sexp` | Add `(no_getter)` for RecentData fields |

---

## Deferred to future pass

- **Callback function pointer fields** — require callback marshalling (Milestone 4)
- **Dynamic C arrays with companion length fields** — `GlyphString.glyphs` relies on
  `num_glyphs`; would need infrastructure to pair length+data fields
