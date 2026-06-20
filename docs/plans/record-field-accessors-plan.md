# Record Field Accessors — Implementation Plan

> Generates getter/setter/`make` accessors for GIR record fields across all
> three binding layers (C stubs, Layer 1 OCaml, Layer 2 classes).

---

## Status

| Epoch | Description | Status |
|-------|-------------|--------|
| 1 | Override & type infrastructure (`no_getter`/`no_setter` flags) | ✅ Done |
| 2 | Shared analysis infrastructure (`field_filter.ml`, `field_analysis.ml`) | ✅ Done |
| 3 | C stub generation (`c_stub_field.ml`, wired into `gir_gen.ml`) | ✅ Done |
| 4 | Layer 1 OCaml declarations (`layer1_field.ml`, wired into `layer1_main.ml`) | ✅ Done |
| 5 | Layer 2 class methods | 🔲 Remaining |
| 6 | Regeneration, overrides, verification, and tests | 🔲 Remaining |

---

## Section 5 — Layer 2 Class Methods

**Goal:** Generate object-oriented getter, setter, and `make` methods inside the
Layer 2 class wrapper for each record, so callers can read and write fields
without touching the L1 `external` layer directly.

### 5A — Create `class_gen_field.ml`

**File to create:** `gir_gen/lib/generate/class_gen_field.ml`

This is a new module with two exports:
- `generate_field_methods` — impl section of the class body
- `generate_field_signatures` — sig section of the class body

**Getter method form:**
```ocaml
method get_<field> = <L1>.get_<field> obj
```

**Setter method form:**
```ocaml
method set_<field> v = <L1>.set_<field> obj v
```

**`make` constructor method:**
```ocaml
(* For 0 writable fields: *)
method make () = new <class_snake> (<L1>.make ())

(* For ≥1 writable fields: *)
method make <params> = new <class_snake> (<L1>.make <params>)
```

**Key acceptance criteria:**
- Method names are deduplicated against `seen` (same `StringSet` pattern as
  `class_gen_property.ml` / `class_gen_method.ml`)
- Fields whose type resolves to a Layer 2 class get the standard coercion:
  `Option.map (fun x -> new <Class> x)` for nullable returns, `new <Class>`
  for non-nullable returns
- Module consumes `Field_analysis.field_info` values — no re-analysis of type
  classification here
- `make` is deduplicated against `seen` so it cannot collide with an existing
  method on the record
- Signatures match the same parameter types as the L1 `make` external
- The new module is added to `gir_gen/lib/generate/dune`

### 5B — Wire L2 Field Methods into Class Generation

**Files to edit:**
- `gir_gen/lib/generate/class_gen_body.ml`
- `gir_gen/lib/generate/class_gen.ml`
- `gir_gen/bin/gir_gen.ml`

**Key acceptance criteria:**
- `generate_class_module_body` and `generate_class_signature_body` in
  `class_gen_body.ml` call `Class_gen_field.generate_field_methods` /
  `generate_field_signatures` after the properties section and before the
  converter section
- `generate_class_module` / `generate_class_signature` in `class_gen.ml` pass
  `entity.fields` through to the body functions
- `generate_high_level_class` in `gir_gen.ml` passes `entity.fields` through
- `generate_combined_class_module` / `generate_combined_class_signature` also
  pass `entity.fields` through
- Spot-check after regeneration:
  - `ocgtk/src/gtk/generated/gBorder.ml` — `get_left`, `set_left`, …, `make`
    methods present in the class body
  - `ocgtk/src/gdk/generated/gRgba.ml` — `get_red`, `set_red`, …, `make`
    methods present
  - `ocgtk/src/graphene/generated/gPoint.ml` — `get_x`, `get_y`, `make`
    methods present

---

## Section 6 — Regeneration, Overrides, Verification, and Tests

### 6A — Add RecentData Override and Regenerate

**Purpose:** Suppress getters for `GtkRecentData` (write-only struct in typical
usage) while keeping the synthetic `make` constructor; then run a full binding
regeneration and verify the workspace compiles.

**Files to edit:** `ocgtk/overrides/gtk.sexp`

**Acceptance criteria for the override:**
- A `(record RecentData ...)` block is added to `gtk.sexp`
- Each field (`display_name`, `description`, `mime_type`, `app_name`,
  `app_exec`, `groups`, `is_private`) gets `(no_getter)`
- The `make` constructor is **not** suppressed

**Regeneration and build:**
```bash
bash scripts/generate-bindings.sh
dune build
```

**Acceptance criteria for the build:**
- `dune build` exits 0
- No new C compilation warnings or errors in generated `.c` files
- No new OCaml type errors in generated `.ml` / `.mli` files
- `ocgtk/src/gtk/generated/recent_data.ml` — `make` present, no `get_*`
- `ocgtk/src/gtk/generated/gRecent_data.ml` — `make` method present, no
  getter methods
- All spot-checks from Sections 5A/5B pass on the actual generated files

### 6B — Test Suite

**Purpose:** Automated tests that exercise the new field accessor infrastructure
end-to-end across C stub generation, L1 signatures, and L2 class methods.

**Files to edit/create:**
- `gir_gen/test/c_stubs/generation_tests.ml` (or new `field_accessor_tests.ml`)
- `gir_gen/test/ml_generation/signature_tests.ml` (or new test file)

**C stub tests** — for a synthetic record with `gint`, `gchar*`, and
fixed-size `gdouble` array fields:
- `generate_field_getters` produces the correct number of functions, each with
  a return statement
- `generate_field_setters` produces the correct number of functions
- `generate_field_make` produces exactly one function with the correct
  parameter count
- Bytecode/native split is triggered when >5 writable fields are present

**L1 tests** — for the same synthetic record:
- `Layer1_field.generate_field_getters` produces the correct `external` lines
- The `make` external has the correct type signature

**L2 tests** — for the same synthetic record:
- `Class_gen_field.generate_field_methods` produces the correct `method` lines
- The `make` method has the correct signature and wraps the L1 call

**Integration test** — uses a real record (`GtkBorder` or `GdkRGBA`) to verify
the full pipeline (GIR parse → override apply → C stub → L1 → L2) produces
compilable output for all three layers.

**Final gate:**
```bash
dune test gir_gen/ && xvfb-run dune test ocgtk/
```
All existing tests must continue to pass.

---

## Cross-Cutting Concerns

### Version Guards
Field-level `version` and `os` attributes from `gir_record_field` must be
respected in all three layers.  C stubs should use
`C_stub_helpers.emit_with_member_guard` (or `emit_with_os_guard`) exactly as
methods and properties do.

### Deduplication
`class_gen_field.ml` must deduplicate against:
1. Existing methods on the same record (check `seen` set)
2. Previously generated field accessors (check `seen` set)
3. Methods inherited from parent classes (already handled by
   `inherited_names` pre-population in `class_gen_body.ml`)

### Array / gchar** Handling
Fixed-size arrays and `gchar**` fields are supported by helpers already in
`c_stub_helpers.ml` (Epoch 2).  No new array conversion code should be
written in Sections 5–6; all layers delegate to `Field_analysis`.

### Cross-Namespace Records
Records from other namespaces (e.g. `GdkRGBA` used in `Gsk`) must resolve
correctly via `Type_mappings.find_type_mapping_for_gir_type`.  The `make`
constructor parameter for a cross-namespace record field must use the correct
qualified L1 type (`Ocgtk_gdk.Wrappers.Rgb_a.t`).

---

## Files Involved (Remaining Work)

| Layer | Files to create or modify |
|-------|--------------------------|
| L2 | `class_gen_field.ml` (new), `class_gen_body.ml`, `class_gen.ml` |
| Orchestration | `gir_gen.ml` (pass `~fields` to class generators) |
| Overrides | `ocgtk/overrides/gtk.sexp` (add `RecentData`) |
| Tests | `gir_gen/test/c_stubs/` and `gir_gen/test/ml_generation/` |
