# Plan: Constants Support in gir_gen

Status: **complete** — all four phases implemented, reviewed, and verified.
Branch: `feature/girgen-constants` (from latest `main`)

## Progress

- **Phase 1 — done** (`feat(gir_gen): parse GIR <constant> elements`).
  `gir_constant` type, `constants` on `generation_context`, `parse_constant`
  + dispatch, 8-tuple return, `Glyph`/`PangoGlyph` → `int` mappings, all call
  sites updated.
- **Phase 3 — done (folded into the Phase 1 commit).** The `Crt_Constant`
  variant *and* the `references`-command emission
  (`cr_type = Crt_Constant`, `cr_c_type = constant_c_type`) landed together in
  the parse commit rather than as a separate step. The signal corpus baseline
  does not carry `Crt_Constant` entries (it is signal-specific), so that bullet
  in the parse commit message is slightly overstated.
- **Phase 2 — done** (`feat(gir_gen): generate <ns>_constants pure-OCaml
  bindings`). `generate/constant_code.ml`, wired into `generate_bindings`
  (after `generate_enum_files`) and re-exported from `library_module.ml`
  plus the wrapper module alias. Proof-of-regen: `gtk_constants.ml/.mli`
  (97 constants). Build (`dune build @all`) and `dune test gir_gen/` are green.
  - Note: no `dune_file.ml` change was needed — the `<ns>_constants` module
    is picked up by the main library's `(include_subdirs unqualified)` +
    `(modules :standard)`; `dune-generated.inc` lists only C stub modules.
    The plan's `dune_file.ml` row is therefore moot.
- **Review fixes — done.** A deepseek-v4-flash review pass (6 reviewers)
  flagged new-code issues, now addressed:
  - Added `generate/constant_code.mli` exposing only
    `generate_constants_files` and the two pure
    `generate_constants_{interface,implementation}`; internal helpers
    (`ocaml_name_of_constant`, `ocaml_type_of_gir_type_name`,
    `serialize_value`, `iter_mappable_constants`, `emit_doc`) are now private.
  - De-duplicated `constant_code.ml`: shared `iter_mappable_constants`
    (resolve/type-check/skip, warn once on the .mli pass) + `emit_doc`, and
    removed the redundant empty-list guard that the sub-generators already
    handled. The .ml pass passes `~warn_unmappable:false` so the warning for an
    unmappable constant fires once.
  - Added the missing tests the plan promised:
    `test/generate/constant_code_tests.ml` (17 cases: naming, per-value-type
    mapping, string escaping, float `.0`, bool passthrough, `@since`,
    version-only fallback, skip-with-warning, empty list);
    `test/cross_namespace/constant_references_tests.ml` (3 cases: `Crt_Constant`
    sexp round-trip, mixed namespace, sexp tag);
    5 constant cases in `test/integration/gir_parser_tests.ml` (utf8 fields,
    per value type, minimal, missing c:type, type without name).
  - Full suite green: `dune build @all`, `dune test gir_gen/`
    (416 unit + 125 integration), `xvfb-run dune test ocgtk/`.
- **PR-review fix -- done.** A reviewer noted `ocaml_type_of_gir_type_name`
  was a second hand-rolled table that (a) did not reuse `type_mappings.ml` and
  (b) wrongly mapped `gint32`/`gint64`/`guint32`/`guint64`/`gsize` to `int`
  instead of their own modules (`Int32.t`, `int64`, `UInt32.t`, `UInt64.t`,
  `Gsize.t`). Rewrote it to look up `Type_mappings.type_mappings` (single source
  of truth) and reject non-literal types (class/record/enum). Extended
  `serialize_value` to emit the right literal/construction per OCaml type
  (`Int32.t` -> suffix `l`, `int64` -> suffix `L`, `UInt32.t`/`UInt64.t`/`Gsize.t`
  -> `<Mod>.of_int ...`). No generated bindings change (the GIR corpus only
  contains `gint`/`guint`/`Glyph`/`utf8`/`gboolean`/`gdouble` constants), so this
  is a correctness fix for the un-exercised wide types; added a
  `wide_integer_serialization` test covering all five. Suite now 417 unit +
  125 integration, `xvfb-run dune test ocgtk/` green.
  - Out of scope (pre-existing tech debt flagged by reviewers, not introduced
    here): banned partial functions in `gir_parser.ml`/`type_mappings.ml`
    (`List.assoc`/`int_of_string`/`Option.get`+try/with), missing
    `open StdLabels` in `library_module.ml`/`gen_signal_baseline.ml`, and the
    broader `.mli` gap across `types.ml`/`gir_parser.ml`/`type_mappings.ml`/
    `library_module.ml`.
- **Phase 4 — done.** Updated `gir_gen/README.md` (Key Files row, Output
  Files, a Constants layer section, parsing/type-mapping capabilities) and
  `architecture/gir_gen/overrides.md` (constants deliberately outside the
  override workflow). Regenerated all 9 namespaces via
  `scripts/generate-bindings.sh`: new `<ns>_constants.ml/.mli` for Gdk,
  GdkPixbuf, Gio, Graphene, Pango (Cairo/Gsk/PangoCairo have none); constants
  re-exported from each library module + wrapper. The `Glyph`/`PangoGlyph` →
  `int` mapping also newly enables Pango glyph methods (`draw_glyph`,
  `get_glyph_extents`, …) and their C stubs, previously skipped. Full suite
  green: `dune build @all`, `dune test gir_gen/` (416 unit + 125 integration),
  `xvfb-run dune test ocgtk/`.

## Goal

Introduce generation of GIR `<constant>` elements into the gir_gen binding
pipeline, with OCamldoc documentation and cross-namespace reference support.
Constants are named literal values (e.g. `GTK_ACCESSIBLE_ATTRIBUTE_BACKGROUND`
or `GDK_EVENT_STOP`) currently **not parsed at all** — the parser has no
`constant` dispatch branch, so they are silently skipped.

## Findings (from GIR inspection)

- Counts: Gdk 2459, Gio 129, Gtk 97, Pango 13, Graphene 5, GdkPixbuf 4.
- GIR shape:
  ```xml
  <constant name="ACCESSIBLE_ATTRIBUTE_BACKGROUND" value="bg-color"
            c:type="GTK_ACCESSIBLE_ATTRIBUTE_BACKGROUND" version="4.14">
    <doc xml:space="preserve" ...>...</doc>
    <type name="utf8" c:type="gchar*"/>
  </constant>
  ```
- The `value` attribute is always a literal (string, int, float, or `true`/`false`).
- Observed `<type>` names: `gint` (2488), `utf8` (207), `gboolean` (4),
  `guint` (3), `gdouble` (2), `Glyph` (3).
- `gdouble` → graphene `PI`/`PI_2` (float literals).
- `Glyph` is a **primitive alias** (`<alias>` to `guint32`), not a record.
- Version info: **97** constants carry a native `version="X.Y"` XML attribute;
  only **2** have `Since` in doc text. The native attr is read directly by the
  parser, so the main `generate` command sees the version without any override
  file. The `overrides` command's `Since`-extraction workflow is therefore
  unnecessary for constants.

## Design decisions

| # | Decision |
|---|----------|
| Q1 | **Pure OCaml `let` bindings**, no C FFI stubs. The `value` literal is embedded directly. All observed types map cleanly. For any genuinely unmappable type (none observed), skip-with-warning. |
| Q2 | Separate `<ns>_constants.ml/.mli` file, re-exported from the library module. |
| Q3 | snake_case lower names (e.g. `accessible_attribute_background`). |
| Q4 | Emit the constant `doc` as an OCamldoc `(** ... *)` using the existing `Utils.sanitize_doc`. No new documentation infrastructure. |
| Q5 | Version handling is **doc-only**: emit `@since X.Y` in the OCamldoc from `gir_constant.version` (the native attr the parser reads). No filtering by version. |
| Q6 | **Override workflow dropped.** No `constant_override`, no override parser/apply changes, no `overrides`-command extraction, no regeneration of `ocgtk/overrides/*.sexp`. Pure-OCaml constants can't use C `#if` OS guards, so OS overrides are useless, and version is already available from the native attr. |
| Q7 | **Cross-namespace references required.** Add `Crt_Constant` (no extra data, mirroring `Crt_Enum`/`Crt_Bitfield`) to `cross_reference_type` and emit constants in the `references` command. |
| Q8 | `Glyph`/`PangoGlyph` is a primitive alias → add to base type mappings in `type_mappings.ml` as `int` (matches `guint32`). Non-opaque-record-typed constants, if any appear later, are skipped (none observed). |

Minor defaults: `Crt_Constant` carries no extra data; version rendered as the
OCamldoc `@since X.Y` tag.

## Phases

### Phase 1 — AST & parsing  *(done)*

- Add `gir_constant` to `types.ml`:
  `constant_name`, `constant_c_type`, `value : string`, `value_type : gir_type`,
  `constant_doc`, `version`, `os`, `introspectable`.
- Add `constants : gir_constant list` to `generation_context`.
- Add `parse_constant` to `parse/gir_parser.ml` (mirrors `parse_enumeration`),
  dispatched on `local_name tag = "constant"` in `parse_document`.
- Extend `parse_gir_file`'s return tuple from 7 → 8 (append `constants`);
  update all 3 call sites in `bin/gir_gen.ml` (`generate`, `references`,
  `overrides`).
- Add `Glyph`/`PangoGlyph` → `int` to `type_mappings.ml` base mappings.
- **Tests (folded in):** parser tests per type kind (utf8/gint/guint/gdouble/
  gboolean/Glyph) + skip behavior; type-mapping test for `PangoGlyph` → `int`.

### Phase 2 — Code generation  *(done)*

- New `generate/constant_code.ml` (parallel to `enum_code.ml`) emitting
  `<ns>_constants.ml/.mli`:
  - snake_case `let` bindings;
  - type annotation resolved via `type_mappings` (gint/guint/Glyph→`int`,
    gdouble→`float`, utf8→`string`, gboolean→`bool`);
  - OCamldoc `(** doc *)` from `constant_doc` via `Utils.sanitize_doc`, with
    `@since X.Y` appended from `version`;
  - value escaping for strings (quotes/backslashes).
- Wire into `generate_bindings` (write the file), `library_module.ml`
  (re-export the constants module), `dune_file.ml`/`dune-generated.inc`
  (module list). No C stub file.
- **Tests (folded in):** naming, value escaping, type mapping, doc + `@since`
  emission, skip-with-warning for unmappable types.

### Phase 3 — Cross-namespace references  *(done — folded into Phase 1 commit; dedicated tests added in review pass)*

- Add `Crt_Constant` (no fields) to `cross_reference_type` in `types.ml`
  ([@@deriving sexp]).
- Emit constants in `generate_references` (bin) with `cr_type = Crt_Constant`
  and `cr_c_type = constant.constant_c_type`.
- **Tests (folded in):** references-output contains constants with
  `Crt_Constant`; sexp round-trip via `sexp_of_cross_reference_namespace`.

### Phase 4 — Docs & regeneration  *(done)*

- Update `gir_gen/README.md` and `architecture/gir_gen/overrides.md` (constant
  handling, references, naming).
- Regenerate all 9 namespaces via `scripts/generate-bindings.sh`; commit new
  `<ns>_constants.ml/.mli`.
- **Verify:** `opam exec -- dune build @all`; `opam exec -- dune runtest gir_gen/`;
  `xvfb-run dune test ocgtk/` all green.

## Files touched (summary)

| File | Change |
|------|--------|
| `gir_gen/lib/types.ml` | `gir_constant` type; `constants` on `generation_context`; `Crt_Constant` variant |
| `gir_gen/lib/parse/gir_parser.ml` | `parse_constant`; `constant` dispatch; 8-tuple return |
| `gir_gen/lib/type_mappings.ml` | `Glyph`/`PangoGlyph` → `int` base mapping |
| `gir_gen/lib/generate/constant_code.ml` | **new** — OCaml emission |
| `gir_gen/lib/generate/library_module.ml` | re-export constants module |
| `gir_gen/lib/generate/dune_file.ml` | constants module in build |
| `gir_gen/bin/gir_gen.ml` | 8-tuple call sites; references emission; generation wiring |
| `gir_gen/test/...` | parser, mapping, generator, references tests |
| `gir_gen/README.md`, `architecture/gir_gen/overrides.md` | docs |
| `ocgtk/src/<ns>/generated/<ns>_constants.ml/.mli` | regenerated bindings |

## Out of scope

- Override `(ignore)` / `(os)` / `(version ...)` support for constants.
- `Since`-in-doc extraction for constants via the `overrides` command.
- General alias support (only `PangoGlyph` is added as a base mapping).
- C FFI stubs for constants.
- Documentation infrastructure beyond reusing `Utils.sanitize_doc`.