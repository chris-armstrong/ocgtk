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

## Scope (~49 representative records across 6 namespaces)

> **Note:** The tables below are **representative illustrations**, not an exhaustive
> inventory. The generator must handle **all** non-opaque records with at least one
> non-skippable field (e.g. `Graphene.Box`, `Graphene.Euler`, `Pango.FontMetrics`, and
> many others not listed here).

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
| Graphene | `Frustum` | planes | `graphene_vec4_t` | 6 | `Graphene.Vec4.t array` |
| Graphene | `Quad` | points | `graphene_point_t` | 4 | `Graphene.Point.t array` |

### Bit-field records (`bits="N"` packed into `guint`)
| NS | Record | Fields | Notes |
|----|--------|--------|-------|
| Pango | `LogAttr` | 16 bool-like bit-fields (is_line_break, is_mandatory_break, …) | Parser must read `bits="1"`; C code needs `(word >> shift) & 1` / `word |= (1 << shift)`. **Currently parser ignores `bits`.** |

### Pointer-to-nested-record fields (nullable struct pointers)
| NS | Record | Field | Pointee | Notes |
|----|--------|-------|---------|-------|
| GdkPixbuf | `PixbufFormat` | `signature` | `GdkPixbufModulePattern*` | Nullable pointer; getter returns `t option` via `Val_option`. |
| Pango | `GlyphItem` | `item` | `PangoItem*` | Same; `glyphs` is `PangoGlyphString*`. |
| Pango | `LayoutLine` | `layout` | `PangoLayout*` | Not writable in GIR; skip setter. |

### Dynamic C arrays (no fixed-size, no zero-terminator) → skip
| NS | Record | Field | Type | Notes |
|----|--------|-------|------|-------|
| Pango | `GlyphString` | `glyphs` | `PangoGlyphInfo*[]` | Companion `num_glyphs` holds length; no field-pairing mechanism yet. |
| Pango | `GlyphString` | `log_clusters` | `gint*` | Same category — dynamic array with no GIR-level length annotation. **Skip.** |

### Anonymous records → skip
| NS | Name | Reason |
|----|------|--------|
| Gsk | `(anonymous: GskTangent)` | No C type name, no GType |

---

## Fields to skip (universal rules)

A field is skipped when its type is any of:
1. **`gpointer`** — `type name="gpointer"` or `c:type="gpointer"`
2. **Callback function pointer** — `type name="SomeCallbackFunc"` referencing a `&lt;callback&gt;` GIR element. Detect via `Signal_marshaller.is_callback_type` (already exists).
3. **Private fields** — `private="1"` on the `&lt;field&gt;` element.  
   ⚠️ **Prerequisite:** The GIR parser (`gir_parser.ml`) currently ignores the `private` attribute; it must be updated to read it, and `gir_record_field` must gain a `private : bool` field.
4. **Dynamic C array without fixed size or zero-terminator** — e.g. `PangoGlyphInfo*[]` in `GlyphString.glyphs` or `gint*` in `GlyphString.log_clusters`. These have a companion length field (`num_glyphs`) but we have no mechanism to pair length+data. Skip; a future pass could add a paired-length annotation.
5. **Bit-fields (`bits="N"`)** — e.g. `Pango.LogAttr` fields packed into a `guint`.  
   ⚠️ **Prerequisite:** The parser currently ignores `bits`. Until parser support is added, these fields will be treated as full-width `guint` fields, which corrupts adjacent bits on read/write. **Recommended:** either skip them for now, or add parser + `gir_record_field` support and generate `(word &gt;&gt; shift) &amp; mask` C code.
6. **`AttrClass` / struct-of-function-pointers** — e.g. `Pango.Attribute.klass`. This is not a callback field per se, but a struct whose members are all function pointers. It should be treated as callback-equivalent and skipped.

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
  arr = caml_alloc(12, Double_array_tag);  /* 254 on 64-bit; flat float array */
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
gir_gen/bin/gir_gen.ml     — wire into entity_generators + generation loops
gir_gen/lib/generate/layer1/layer1_main.ml — wire field decls into L1 generation
gir_gen/lib/generate/class_gen_body.ml   — wire field methods into L2 generation
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
  `Signal_marshaller.is_callback_type` or by checking if the gir_type resolves to a
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
- For SList: `Val_GSList_with(...)` macro (existing, in `ocgtk/src/common/wrappers.h`).
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

The live C-generation pipeline is in **`gir_gen/bin/gir_gen.ml:generate_c_stub`**
(around line 271), which dispatches via `entity_generators`. Add a new
`generate_c_stub_fields : C_stub_field.generator_fn` field to the `entity_generators`
record. For `Record` entities, wire it to `C_stub_field.generate_c_stub_fields`;
for `Class`/`Interface`, use the existing `noop_generator`.

> ⚠️ **Do NOT** wire into `c_stub_record.ml:generate_record_c_code` — that function
> is orphaned and has no caller in the live generator.

`generate_c_stub_fields` is called from `generate_c_stub` alongside the existing
`generate_c_stub_methods` / `generate_c_stub_properties` dispatch.

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

### 10. Pipeline wiring — `gir_gen/bin/gir_gen.ml`, `layer1_main.ml`, `class_gen_body.ml`

**C stubs (`gir_gen/bin/gir_gen.ml`):**
Add three new fields to the `entity_generators` record:
- `generate_c_stub_fields : C_stub_field.generator_fn`
- `generate_l1_field_decls : Layer1_field.generator_fn`
- `generate_l2_field_methods : Class_gen_field.generator_fn`

For `Record` entities, wire them to the respective module functions. For
`Class`/`Interface`, use `noop_generator`.

In `generate_c_stub` (around line 271), dispatch to `generate_c_stub_fields`
alongside constructors/methods/properties.

**Layer 1 (`gir_gen/lib/generate/layer1/layer1_main.ml`):**
Extend `generate_ml_interface_internal` to accept a `fields : gir_record_field list`
parameter (default `[]`). After generating constructors/methods/properties, call
`Layer1_field.generate_field_decls ~ctx ~buf ~fields`.

**Layer 2 (`gir_gen/lib/generate/class_gen_body.ml`):**
Extend `generate_class_module_body` to accept a `fields : gir_record_field list`
parameter (default `[]`). After generating property methods, call
`Class_gen_field.generate_field_methods ~ctx ~buf ~layer1_module_name ~fields`.

### 11. dune file updates

No manual dune edits are required. The directory `gir_gen/lib/` uses `(include_subdirs qualified)`,
so new `.ml` files in `generate/` and its subdirectories are auto-discovered.

---

## Type-specific C conversion reference

| Field GIR type | OCaml type | C getter expr | C setter expr |
|---------------|-----------|---------------|---------------|
| `gint`, `gint16`, `gint8`, `guint`, `guint16`, `guint8`, `gsize`, `gssize`, `gunichar` | `int` | `Val_int(rec->field)` | `rec->field = Int_val(v)` |
| `gint32`, `guint32`, `gint64`, `guint64` | `int` (or `int32`/`int64`) | `Val_int(rec->field)` / `caml_copy_int32(rec->field)` | `rec->field = Int_val(v)` / `Int32_val(v)` |
| `guintptr` | `nativeint` | `caml_copy_nativeint(rec->field)` | `rec->field = Nativeint_val(v)` |
| `gfloat`, `gdouble` | `float` | `caml_copy_double(rec->field)` | `rec->field = Double_val(v)` |
| `gboolean` | `bool` | `Val_bool(rec->field)` | `rec->field = Bool_val(v)` |
| `guint` with `bits="1"` | `bool` | `(rec->packed_word >> shift) & 1` | `rec->packed_word |= (1 << shift)` / `rec->packed_word &= ~(1 << shift)` |
| `utf8` | `string` | `caml_copy_string(rec->field)` | `g_free(rec->field); rec->field = g_strdup(String_val(v))` |
| `utf8` (nullable) | `string option` | `Val_option(rec->field, caml_copy_string)` | `g_free(rec->field); rec->field = Is_block(v) ? g_strdup(String_val(Field(v,0))) : NULL` |
| `GLib.SList` of records | `E.t list` | `Val_GSList_with(rec->field, result, item, cell, Val_E(cell))` | `g_slist_free(rec->field); GSList_val_with(v, rec->field, E_val(Field(_iter,0)))` |
| `GLib.SList` of strings | `string list` | `Val_GSList_with(rec->field, result, item, cell, caml_copy_string(cell))` | `g_slist_free_full(rec->field, g_free); GSList_val_with(v, rec->field, g_strdup(String_val(Field(_iter,0))))` |
| Enum | `` `TAG `` via `<Ns>_enums.<name>` | `Val_<Ns><Name>(rec->field)` | `rec->field = <Ns><Name>_val(v)` |
| Enum (nullable) | `` `TAG option `` | `Val_option(rec->field, Val_<Ns><Name>)` | `rec->field = Is_block(v) ? <Ns><Name>_val(Field(v,0)) : 0` |
| Nested record (inline) | `<Mod>.t` | `Val_<Type>(&rec->field)` (scalar) | `*<type>_val(v)` → copy into `&rec->field` |
| Nested record (inline array) | `<Mod>.t array` | `caml_alloc(N, 0)` + `caml_modify(&Field(arr,i), Val_<Type>(&rec->field[i]))` | loop: copy `<type>_val(Field(v,i))` into `rec->field[i]` |
| Nested record (pointer, nullable) | `<Mod>.t option` | `Val_option(rec->field, Val_<Type>)` | `if (rec->field) g_free(rec->field); rec->field = Is_block(v) ? <type>_val(Field(v,0)) : NULL` |
| Fixed-size `double[N]` / `gfloat[N]` | `float array` | `caml_alloc(N, Double_array_tag)` + `Store_double_field(arr,i,rec->field[i])` | loop: `rec->field[i] = Double_field(v,i)` |
| Fixed-size `gint[N]` / `guint[N]` | `int array` | `caml_alloc(N, 0)` + `Field(arr,i) = Val_int(rec->field[i])` | loop: `rec->field[i] = Int_val(Field(v,i))` |
| `gchar**` | `string list` | `Val_strv(rec->field, result)` | `g_strfreev(rec->field); Strv_val(v, rec->field)` |
| `gchar**` (nullable) | `string list option` | `Val_option(rec->field, Val_strv)` | `g_strfreev(rec->field); if (Is_block(v)) Strv_val(Field(v,0), rec->field) else rec->field = NULL` |

**Note on string memory**: In setters and `make`, string fields are `g_strdup`'d. For **boxed**
records (those with a registered `glib:get-type` and a boxed destructor), the record's own
`free` function will `g_free` them. For **non-boxed** records (simple structs like `GtkRecentData`,
`GdkRectangle`), the custom-block finalizer only calls `g_free(ptr)` on the struct allocation
itself — it does **not** free individual `char*` fields inside the struct. Therefore:

- **For non-boxed records with string fields:** either skip string setters and `make` entirely,
  or generate a **custom finalizer** that walks the struct and `g_free`s each string field
  before freeing the struct. The simplest safe default is to **skip string accessors for
  non-boxed records** until custom finalizers are implemented.

For `gchar**` fields, `g_strfreev` handles both the array and its contents. In setters, always
`g_strfreev` the old value before assigning the new one.

**Note on inline nested records**: For records with inline struct fields (e.g.,
`GskColorStop.color : GdkRGBA`), the getter returns a heap-allocated copy via `Val_<Type>`
(which calls `g_boxed_copy` if boxed, or heap-allocates and copies otherwise). The setter
copies into the struct field directly via dereference. The builder copies from the Val'd
OCaml parameter into the freshly `g_new0`'d struct.

---

## Abstraction Quality — Recommended Architecture

The plan below creates three new generator modules (`c_stub_field.ml`, `layer1_field.ml`,
`class_gen_field.ml`). To avoid code drift and duplication, **extract shared logic into a
single `Field_analysis` module** before writing the rendering layers.

### 1. Centralize skip logic in `Filtering`

Create `Filtering.should_generate_field` / `should_generate_field_getter` /
`should_generate_field_setter` that encode all skip rules (gpointer, callback, private,
dynamic array, bit-field, non-boxed string). Use these from **all three** generator layers.

This mirrors the existing pattern:
- `Filtering.should_generate_property` / `should_skip_method_binding`
- Called identically from C stub, L1, and L2 generators

### 2. Create `Field_analysis` module

For each field, compute **once** (reused by all layers):

```ocaml
type field_info = {
  field_name : string;                 (* OCaml snake_case *)
  c_field_name : string;               (* C struct member name *)
  getter_c_name : string;               (* ml_<prefix>_<record>_get_<field> *)
  setter_c_name : string;               (* ml_<prefix>_<record>_set_<field> *)
  ocaml_type : string;                  (* e.g. "int", "string option", "Gdk.RGBA.t" *)
  c_getter_expr : string;              (* C expression to produce an OCaml value *)
  c_setter_expr : string;              (* C statement to assign from OCaml value *)
  needs_g_free : bool;                  (* setter must g_free old string/SList *)
  needs_g_strdup : bool;                (* setter/make must g_strdup new strings *)
  is_array : bool;
  is_bitfield : bool;
  bit_shift : int option;
}
```

`Field_analysis` uses `Type_mappings.find_type_mapping_for_gir_type` for OCaml type
resolution and `C_stub_helpers` for C conversion expression templates (just like
properties/methods already do).

### 3. Make generator modules thin rendering layers

| Module | Responsibility |
|--------|-------------|
| `Field_analysis` | Compute `field_info` for every field on a record |
| `C_stub_field` | Iterate `field_info` list; emit C getter/setter/make functions |
| `Layer1_field` | Iterate `field_info` list; emit `external` / `val` declarations |
| `Class_gen_field` | Iterate `field_info` list; emit `method` / class-type declarations |

**No re-derivation** of skip rules, type mappings, or C conversion patterns in any layer.

### 4. Treat `make` as a synthetic constructor

The `make` function is a multi-parameter labeled constructor. Reuse existing helpers:
- **C stub:** `C_stub_helpers.generate_multi_param_function` (already used by method/constructor stubs)
- **L1:** `Layer1_constructor.format_constructor_external` (or extend it with a `~labelled` mode)
- **L2:** `Class_gen.generate_constructor_impl` (or create a `Class_gen_field` wrapper that delegates to L1 `make`)

Do **not** invent a new `CAMLparamN`/`CAMLxparamN` stub-writing pattern from scratch.

### 5. Handle deduplication

Field accessors may collide with existing record methods (e.g. a record that already has a
`get_width` method). Reuse the existing `StringSet`-based deduplication from
`class_gen_property.ml` and extend it to field accessors in `Class_gen_field`.

In L1, field `external` names must not clash with existing `external` declarations in the
same module. Prefix with `get_` / `set_` consistently and add a clash check in
`Layer1_field`.

### 6. Add array / `gchar**` helpers to `C_stub_helpers`

The two genuinely new C conversion patterns (fixed-size array loops and `Val_strv`/`Strv_val`)
belong in `C_stub_helpers` as reusable templates, not hardcoded in `c_stub_field.ml`:

```ocaml
val generate_array_getter : element_type:string -> size:int -> c_field:string -> string
val generate_array_setter : element_type:string -> size:int -> c_field:string -> string
val generate_strv_getter : c_field:string -> string
val generate_strv_setter : c_field:string -> string
```

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
| `gir_gen/lib/generate/layer1_field.ml` | **New** — L1 val/external declarations |
| `gir_gen/lib/generate/class_gen_field.ml` | **New** — L2 class method wrappers |
| `gir_gen/bin/gir_gen.ml` | Add generators, wire into loops |
| `gir_gen/lib/generate/layer1/layer1_main.ml` | Wire field decls into L1 generation |
| `gir_gen/lib/generate/class_gen_body.ml` | Wire field methods into L2 generation |
| `ocgtk/src/common/wrappers.h` | Add `Val_strv` / `Strv_val` macros |
| `ocgtk/overrides/gtk.sexp` | Add `(no_getter)` for RecentData fields |

---

## Deferred to future pass

- **Callback function pointer fields** — require callback marshalling (Milestone 4)
- **Dynamic C arrays with companion length fields** — `GlyphString.glyphs` relies on
  `num_glyphs`; would need infrastructure to pair length+data fields

---

## Epoch 1: Override & Type Infrastructure
> Goal: Extend override and type systems with `no_getter`/`no_setter` flags and carry record fields through the entity pipeline.

### Stage 1.1 — Add `no_getter`/`no_setter` to `component_override`
> Description: Add `no_getter : bool` and `no_setter : bool` fields to `component_override` in `override_types.ml`, both defaulting to `false`. No consumer uses them yet, so the build is unaffected.
> Acceptance criteria:
> 1. `component_override` record has `no_getter : bool` and `no_setter : bool` fields.
> 2. `dune build` passes clean.
> Files involved: `gir_gen/lib/override_types.ml`

### Stage 1.2 — Parse `(no_getter)` / `(no_setter)` qualifiers
> Description: Extend `override_parser.ml` to recognize `"no_getter"` and `"no_setter"` atoms in field qualifiers. Update `parse_component_qualifiers` return type, `parse_component`, and `validate_body_elements`.
> Acceptance criteria:
> 1. `parse_component_qualifiers` returns `(action option * os option * bool * bool)`.
> 2. `parse_component` populates `no_getter`/`no_setter` in the returned `component_override`.
> 3. `validate_body_elements` accepts the new atoms without error.
> 4. Existing override test suite passes (`dune test gir_gen/`).
> Files involved: `gir_gen/lib/override_parser.ml`

### Stage 1.3 — Extend `gir_record_field` and `entity` in `types.ml`
> Description: Add `no_getter : bool`, `no_setter : bool` (both default `false`) to `gir_record_field`. Add `fields : gir_record_field list` to the `entity` type (default `[]` for classes/interfaces, populated from `rec_.fields` in `entity_of_record`).
> Acceptance criteria:
> 1. `gir_record_field` carries `no_getter` and `no_setter`.
> 2. `entity` carries `fields : gir_record_field list`.
> 3. `entity_of_record` populates `fields` from the parsed record's field list.
> 4. `dune build` passes clean.
> Files involved: `gir_gen/lib/types.ml`

### Stage 1.4 — Merge override flags into record fields
> Description: In `override_apply.ml:apply_record_components`, add a post-processing pass after `apply_components_by_name` that merges `no_getter`/`no_setter` from matching overrides into each surviving `gir_record_field`.
> Acceptance criteria:
> 1. `apply_record_components` propagates `no_getter`/`no_setter` from overrides to `gir_record_field` values.
> 2. Fields without an override entry retain `no_getter = false`, `no_setter = false`.
> 3. Existing override test suite passes.
> Files involved: `gir_gen/lib/override_apply.ml`

---

## Epoch 2: Shared Analysis Infrastructure
> Goal: Build `Filtering`, `Field_analysis`, and `C_stub_helpers` modules that centralize skip logic, type resolution, and C conversion patterns — consumed by all generator layers.

### Stage 2.1 — Add `Val_strv` / `Strv_val` macros to `wrappers.h`
> Description: Add the two converter macros for null-terminated `gchar**` arrays. `Val_strv` produces an OCaml `string list`; `Strv_val` converts an OCaml `string list` to a freshly-allocated `gchar**`.
> Acceptance criteria:
> 1. `Val_strv` and `Strv_val` macros are defined in `wrappers.h`.
> 2. `dune build` passes (macros are not yet called).
> Files involved: `ocgtk/src/common/wrappers.h`

### Stage 2.2 — Create `Filtering` skip-rule predicates
> Description: Create `gir_gen/lib/generate/field_filter.ml` with functions `should_generate_field`, `should_generate_field_getter`, `should_generate_field_setter` encoding all skip rules: gpointer, callback type, private fields, dynamic C arrays (no fixed-size or zero-terminator), bit-fields (until parser support lands), and `AttrClass` struct-of-fn-ptrs.
> Acceptance criteria:
> 1. `should_generate_field` returns `false` for gpointer, callback, private, dynamic-array, bit-field, and AttrClass fields.
> 2. `should_generate_field_getter` additionally consults `no_getter`.
> 3. `should_generate_field_setter` additionally consults `no_setter` and `writable`.
> 4. `dune build` passes (module not yet consumed).
> Files involved: `gir_gen/lib/generate/field_filter.ml` (new)

### Stage 2.3 — Create `Field_analysis` module
> Description: Create `gir_gen/lib/generate/field_analysis.ml` with a `field_info` record type and a `compute_field_info` function that, for each record field, resolves: OCaml snake_case name, C struct member name, getter/setter C function names, OCaml type (via `Type_mappings`), C getter expression, C setter expression, and flags (`needs_g_free`, `needs_g_strdup`, `is_array`, `is_bitfield`, `bit_shift`). Delegates to `C_stub_helpers` for conversion templates.
> Acceptance criteria:
> 1. `field_info` type is defined with all fields listed in the architecture section.
> 2. `compute_field_info` resolves types correctly for primitives, enums, nested records, strings, SList, and arrays.
> 3. `dune build` passes.
> Files involved: `gir_gen/lib/generate/field_analysis.ml` (new)

### Stage 2.4 — Add array / `gchar**` helpers to `C_stub_helpers`
> Description: Add `generate_array_getter`, `generate_array_setter`, `generate_strv_getter`, `generate_strv_setter` functions to `C_stub_helpers`.
> Acceptance criteria:
> 1. Each function produces correct C code for the respective conversion pattern.
> 2. Fixed-size array helpers handle both primitive arrays (Double_array_tag) and nested-record arrays (caml_modify).
> 3. `dune build` passes.
> Files involved: `gir_gen/lib/generate/c_stub_helpers.ml`

---

## Epoch 3: C Stub Generation
> Goal: Generate getter, setter, and `make` C functions for all record fields, wired into the live `generate_c_stub` pipeline.

### Stage 3.1 — Create `c_stub_field.ml` — getter stubs
> Description: Create `gir_gen/lib/generate/c_stub_field.ml`. Implement getter-only C stub generation using `Field_analysis` for type info and `C_stub_helpers` for conversion expressions. Skip suppressed fields via `Field_filter`. Emit `CAMLprim value ml_<prefix>_<record>_get_<field>(value v_rec)` functions for every eligible readable field.
> Acceptance criteria:
> 1. Getters for primitives (int, float, bool) use `Val_int`/`caml_copy_double`/`Val_bool`.
> 2. Getters for enums use `Val_<Ns><Name>`.
> 3. Getters for strings use `caml_copy_string`.
> 4. Getters for nested records (inline) use `Val_<Type>(&rec->field)`.
> 5. Getters for nested records (pointer, nullable) use `Val_option`.
> 6. Getters for SList use `Val_GSList_with`.
> 7. Getters for fixed-size arrays use the `C_stub_helpers` array templates.
> 8. Getters for `gchar**` use `Val_strv`.
> 9. `no_getter` fields are skipped.
> 10. Module compiles (`dune build`).
> Files involved: `gir_gen/lib/generate/c_stub_field.ml` (new)

### Stage 3.2 — Create `c_stub_field.ml` — setter stubs
> Description: Extend `c_stub_field.ml` with setter C stub generation. Emit `CAMLprim value ml_<prefix>_<record>_set_<field>(value v_rec, value v_val)` functions. Handle old-value cleanup (g_free for strings, g_slist_free for SList, g_strfreev for gchar**).
> Acceptance criteria:
> 1. Setters for writable primitives use `Int_val`/`Double_val`/`Bool_val`.
> 2. Setters for strings free old value via `g_free`, assign `g_strdup(String_val(v))`.
> 3. Setters for nested records (inline) dereference and copy via `<type>_val`.
> 4. Setters for SList free old via `g_slist_free`, assign via `GSList_val_with`.
> 5. Setters for fixed-size arrays loop and copy from OCaml array.
> 6. Setters for `gchar**` free old via `g_strfreev`, assign via `Strv_val`.
> 7. `no_setter` and non-writable fields are skipped.
> 8. Module compiles.
> Files involved: `gir_gen/lib/generate/c_stub_field.ml`

### Stage 3.3 — Create `c_stub_field.ml` — `make` constructor stubs
> Description: Extend `c_stub_field.ml` with `make` constructor generation. Emit `CAMLprim value ml_<prefix>_<record>_make(value v_<field1>, ..., value v_<fieldN>)` using `C_stub_helpers.generate_multi_param_function`. Allocate with `g_new0`, assign each writable non-skippable field.
> Acceptance criteria:
> 1. `make` allocates via `g_new0(<CType>, 1)`.
> 2. String fields use `g_strdup(String_val(v))`.
> 3. SList fields use `GSList_val_with` (no old-value cleanup — fresh alloc).
> 4. `gchar**` fields use `Strv_val`.
> 5. Fixed-size array fields loop-copy from OCaml array.
> 6. Only writable, non-skippable fields are included as parameters.
> 7. Uses `CAMLparamN`/`CAMLxparamN` with correct param count.
> 8. Module compiles.
> Files involved: `gir_gen/lib/generate/c_stub_field.ml`

### Stage 3.4 — Wire C stub generators into `gir_gen.ml`
> Description: Add `generate_c_stub_fields : C_stub_field.generator_fn` to the `entity_generators` record. Wire `Record` entities to `C_stub_field.generate_c_stub_fields`; `Class`/`Interface` use `noop_generator`. Dispatch in `generate_c_stub` alongside existing method/property generators.
> Acceptance criteria:
> 1. `entity_generators` includes `generate_c_stub_fields`.
> 2. `generate_c_stub` calls `generate_c_stub_fields` for each entity.
> 3. `dune build` passes and `dune test gir_gen/` passes.
> Files involved: `gir_gen/bin/gir_gen.ml`

---

## Epoch 4: Layer 1 OCaml Declarations
> Goal: Generate `.ml` and `.mli` external declarations for field getters, setters, and `make`, wired into the L1 generation pipeline.

### Stage 4.1 — Create `layer1_field.ml` — external declarations
> Description: Create `gir_gen/lib/generate/layer1_field.ml`. For each record entity's `fields`, generate `val get_<field> : t -> <type>` / `external get_<field> : t -> <type> = "ml_..."` in `.mli`/`.ml`, and `val set_<field> : t -> <type> -> unit` / `external set_<field> : t -> <type> -> unit = "ml_..."`. Type mapping via `Type_mappings.find_type_mapping_for_gir_type`. Doc comments from `field_doc`.
> Acceptance criteria:
> 1. Getter `external` declarations match C stub names.
> 2. Setter `external` declarations match C stub names.
> 3. OCaml types are correctly resolved for primitives, enums, nested records, strings, SList, arrays, gchar**.
> 4. OCaml names use `Utils.to_snake_case`.
> 5. `no_getter`/`no_setter` suppress corresponding declarations.
> 6. Module compiles.
> Files involved: `gir_gen/lib/generate/layer1_field.ml` (new)

### Stage 4.2 — Generate L1 `make` declarations
> Description: Extend `layer1_field.ml` with `make` constructor declaration generation. Generate `val make : <label>:<type> -> ... -> t` / `external make : <label>:<type> -> ... -> t = "ml_..._bytecode" "ml_..."` with labelled parameters for all writable non-skippable fields.
> Acceptance criteria:
> 1. `make` uses labelled parameters with snake_case field names.
> 2. Dual bytecode/native C stubs are referenced.
> 3. `make` is generated even when all getters/setters are suppressed (independent existence).
> 4. Module compiles.
> Files involved: `gir_gen/lib/generate/layer1_field.ml`

### Stage 4.3 — Wire L1 field decls into `layer1_main.ml`
> Description: Extend `generate_ml_interface_internal` to accept `fields : gir_record_field list` (default `[]`). After generating constructors/methods/properties, call `Layer1_field.generate_field_decls ~ctx ~buf ~fields`.
> Acceptance criteria:
> 1. Field getter/setter/make declarations appear in generated `.mli` and `.ml` files for records.
> 2. Classes and interfaces (fields = `[]`) produce no field declarations.
> 3. `dune build` passes for `gir_gen/`.
> Files involved: `gir_gen/lib/generate/layer1/layer1_main.ml`

---

## Epoch 5: Layer 2 Class Methods
> Goal: Generate L2 class method wrappers for field accessors, wired into the L2 generation pipeline.

### Stage 5.1 — Create `class_gen_field.ml` — getter/setter methods
> Description: Create `gir_gen/lib/generate/class_gen_field.ml`. Generate `method <field> : <type>` / `method set_<field> : <type> -> unit` in class type and implementation. Implementation delegates to L1: `Border.get_left obj` / `Border.set_left obj v`. Use `StringSet`-based name deduplication from `class_gen_property.ml`.
> Acceptance criteria:
> 1. Getter methods delegate to L1 `get_<field>` via `self#as_<record>`.
> 2. Setter methods delegate to L1 `set_<field>` via `self#as_<record>`.
> 3. `no_getter`/`no_setter` suppress corresponding methods.
> 4. Name collisions with existing methods are handled via `StringSet` deduplication.
> 5. Module compiles.
> Files involved: `gir_gen/lib/generate/class_gen_field.ml` (new)

### Stage 5.2 — Generate L2 `make` class method
> Description: Extend `class_gen_field.ml` with `make` class-level method generation. `method make : <label>:<type> -> ... -> t` delegates directly to L1 `make` (no `self` reference).
> Acceptance criteria:
> 1. `make` is a class-level method (delegates to `Module.make`, not `self#as_*`).
> 2. `make` is generated even when all getters/setters are suppressed.
> 3. Module compiles.
> Files involved: `gir_gen/lib/generate/class_gen_field.ml`

### Stage 5.3 — Wire L2 field methods into `class_gen_body.ml`
> Description: Extend `generate_class_module_body` to accept `fields : gir_record_field list` (default `[]`). After generating property methods, call `Class_gen_field.generate_field_methods ~ctx ~buf ~layer1_module_name ~fields`.
> Acceptance criteria:
> 1. Field getter/setter/make methods appear in generated L2 `.ml` and `.mli` files for records.
> 2. Classes and interfaces (fields = `[]`) produce no field methods.
> 3. `dune build` passes for `gir_gen/`.
> Files involved: `gir_gen/lib/generate/class_gen_body.ml`

---

## Epoch 6: Override Entries & Verification
> Goal: Add override entries for known suppressible fields, regenerate bindings, and verify correctness.

### Stage 6.1 — Add `RecentData` override entries
> Description: Add `(no_getter)` qualifiers for all fields in `Gtk.RecentData` in `ocgtk/overrides/gtk.sexp`.
> Acceptance criteria:
> 1. `(record RecentData ...)` block suppresses getters for all 7 fields.
> 2. `dune build` passes (override parse is valid).
> Files involved: `ocgtk/overrides/gtk.sexp`

### Stage 6.2 — Full regeneration and compilation
> Description: Run `scripts/generate-bindings.sh` to regenerate all bindings, then `dune build` from repo root. Verify that generated code compiles for all 9 namespaces.
> Acceptance criteria:
> 1. `scripts/generate-bindings.sh` completes without error.
> 2. `dune build` passes clean (no compilation errors, no undefined references).
> 3. Generated files exist for representative records.
> Files involved: all generated files in `ocgtk/src/*/generated/`

### Stage 6.3 — Test suite
> Description: Run `dune test gir_gen/ && xvfb-run dune test ocgtk/` and confirm all existing tests pass. Run spot-checks on representative generated files.
> Acceptance criteria:
> 1. All `gir_gen/` tests pass.
> 2. All `ocgtk/` tests pass under xvfb-run.
> 3. Spot-check `ocgtk/src/gtk/generated/border.ml` — `get_left`, `set_left`, ..., `make`.
> 4. Spot-check `ocgtk/src/gdk/generated/rgba.ml` — `get_red`, `set_red`, ..., `make`.
> 5. Spot-check `ocgtk/src/gdk/generated/time_coord.ml` — `get_axes : t -> float array`.
> 6. Spot-check `ocgtk/src/gsk/generated/rounded_rect.ml` — `get_corner : t -> Graphene.Size.t array`.
> 7. Spot-check `ocgtk/src/gtk/generated/recent_data.ml` — getters absent (override), `make` present.
> 8. Spot-check `ocgtk/src/graphene/generated/point.ml` — `get_x`, `get_y`, `make`.
> Files involved: `ocgtk/src/*/generated/*.ml`
