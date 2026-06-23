> 3. Spot-check `ocgtk/src/gtk/generated/border.ml` — `get_left`, `set_left`, ..., `make`.
> 4. Spot-check `ocgtk/src/gdk/generated/rgba.ml` — `get_red`, `set_red`, ..., `make`.
> 5. Spot-check `ocgtk/src/gdk/generated/time_coord.ml` — `get_axes : t -> float array`.
> 6. Spot-check `ocgtk/src/gsk/generated/rounded_rect.ml` — `get_corner : t -> Graphene.Size.t array`.
> 7. Spot-check `ocgtk/src/gtk/generated/recent_data.ml` — getters absent (override), `make` present.
> 8. Spot-check `ocgtk/src/graphene/generated/point.ml` — `get_x`, `get_y`, `make`.
> Files involved: `ocgtk/src/*/generated/*.ml`

---

## Implementation Progress

### Completed
- **Epoch 1** — Override & Type Infrastructure (4 stages, all passing, committed)
  - Stage 1.1: Add `no_getter`/`no_setter` to `component_override`
  - Stage 1.2: Parse `(no_getter)` / `(no_setter)` qualifiers
  - Stage 1.3: Extend `gir_record_field` and `entity` in `types.ml`
  - Stage 1.4: Merge override flags into record fields
- **Epoch 2** — Shared Analysis Infrastructure (4 stages, all passing, committed)
  - Stage 2.1: Add `Val_strv` / `Strv_val` macros to `wrappers.h`
  - Stage 2.2: Create `field_filter.ml` with skip-rule predicates
  - Stage 2.3: Create `field_analysis.ml` with `field_info` computation
  - Stage 2.4: Add array / `gchar**` helpers to `c_stub_helpers`
- **Epoch 3** — C Stub Generation (bugs fixed, bindings regenerated, build passing)
  - `c_stub_field.ml` created with getter, setter, and make stubs
  - Wired into `gir_gen.ml` via `generate_c_stub_fields`
  - Fixed: `readable` attribute default in `gir_parser.ml` (absent = true per GIR spec)
  - Fixed: `is_gpointer_array` skip in `field_filter.ml` (GtkBitsetIter.private_data)
  - Fixed: `Tk_Record` branch in `field_analysis.ml` uses field's own type mapping
  - Fixed: `c_make_field_expr` (→ `obj->field`) vs `c_field_expr` (→ `rec->field`)
  - Fixed: method deduplication in `gir_gen.ml` prevents naming collisions
  - Fixed: `gdkpixbuf.sexp` overrides for GdkPixbufFormat opaque struct fields
  - Fixed: `pango.sexp` overrides for AttrXxx.attr / LayoutLine.layout module cycles
- **Epoch 4** — Layer 1 OCaml Declarations (committed, looks correct)
  - `layer1_field.ml` created with getter, setter, and make externals
  - Wired into `layer1_main.ml`

### Remaining
- **Section 5A** — Create `class_gen_field.ml` — getter/setter/make methods
- **Section 5B** — Wire L2 field methods into `class_gen_body.ml`, `class_gen.ml`, `gir_gen.ml`
- **Section 6A** — Add `RecentData` override, regenerate all bindings, verify build
- **Section 6B** — Test suite (C stub, L1, L2, integration)
