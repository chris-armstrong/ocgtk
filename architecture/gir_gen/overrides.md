# GIR Override System Architecture

The override system lets per-namespace sexp files control what the generator emits
without touching generator source. It replaces the former hardcoded exclusion lists
in `exclude_list.ml`, `filtering.ml`, and `gir_parser.ml`.

## Files

```
ocgtk/overrides/          # One file per namespace, committed to the repo
  cairo.sexp
  gio.sexp
  gdk.sexp
  graphene.sexp
  gdkpixbuf.sexp
  pango.sexp
  pangocairo.sexp
  gsk.sexp
  gtk.sexp

gir_gen/lib/
  override_types.ml/.mli  # Override type definitions
  override_parser.ml/.mli # S-expression parser
  override_apply.ml/.mli  # Apply overrides to parsed GIR data
```

## Pipeline Position

Override application happens **after GIR parsing, before ctx build**:

```
gir_parser.ml → raw AST → override_apply.ml → filtered AST → type_mappings ctx → generators
```

This ordering is required. Ignored entities must be absent from `ctx` so that
`find_type_mapping_for_gir_type` returns `None` for their types, causing any methods
that reference them to be silently skipped by the existing unknown-type filter in
`filtering.ml`. If overrides were applied after ctx build, ignored types would still
appear in the context and their referencing methods would be generated.

## Type Model (`override_types.ml`)

```ocaml
type override_action = Ignore | Set_version of string

type component_override = { component_name : string; action : override_action }

type class_override = {
  class_name : string;
  class_action : override_action option;
  constructors : component_override list;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
(* interface_override, record_override, enum_override, bitfield_override: similar *)

type library_overrides = {
  library_name : string;
  classes : class_override list;
  interfaces : interface_override list;
  records : record_override list;
  enums : enum_override list;
  bitfields : bitfield_override list;
  functions : component_override list;
}
```

`[@@deriving eq]` on all types enables structural equality for tests.
`[@@deriving sexp]` is also derived but is **not** used for the human-authored file
format — the derived sexp mirrors OCaml record structure verbatim and would be
unreadable. The hand-written parser in `override_parser.ml` is the authoritative
parser. The derived sexp is used only for round-trip tests.

## Parser (`override_parser.ml`)

Reads the human-friendly format:

```sexp
(overrides
  (library "Gtk")
  (class Widget
    (method foo (ignore))
    (property bar (version "4.14"))
  )
  (enumeration StateFlags
    (member new_flag (version "4.16"))
  )
)
```

Key parser decisions:
- **Hard error on malformed sexp**: halts generation immediately
- **Hard error on duplicate entities/components**: two `(class Widget ...)` in the
  same file is always rejected
- **Warning on unknown names**: override references an entity or component not in the
  GIR data — generation continues, warning is printed (catches typos)
- **`(function ...)` is context-disambiguated**: at the top level of `(overrides ...)`
  it's a namespace-level function; nested inside `(record ...)` or `(enumeration ...)`
  it's an entity-level function. No extra keyword needed.
- **Bitfield members use `member` keyword** (same as enum members), stored in
  `bitfield_override.flags`

## Apply (`override_apply.ml`)

`apply_overrides` processes entities in a single pass:

1. **Entity-level ignore** (`class_action = Some Ignore`): removes the entity from
   all lists. Silently drops any component overrides on the same entity.
2. **Entity-level version** (`class_action = Some (Set_version v)`): sets the version
   field on the surviving entity, then processes component overrides.
3. **Component-level ignore**: removes the method/property/etc. from the entity's list.
4. **Component-level version**: updates `member_version`/`flag_version`/`field_version`
   on the surviving component.

Implementation uses a single generic `apply_entity_overrides` helper to avoid the
5-way copy-paste that existed in the original draft.

`apply_result` contains:
- Filtered entity lists
- `ignored_entities : string list` — names of removed entities (for logging)
- `warnings : string list` — unknown entity/component name warnings

## Version Guards

Member versions feed into C code generation in `enum_code.ml`:

- **Enum converters**: each `case` in the C-to-OCaml switch and each `else if` branch
  in the OCaml-to-C chain can be individually wrapped in `#if MACRO(X,Y,0)`.
- **Bitfield converters**: same for `if (flags & ...)` branches.
- **`_decls.h` headers**: converter declarations in `<ns>_decls.h` are also guarded
  so dependent namespaces don't see symbols that don't exist at their compile target.

The `emit_member_branch` helper in `enum_code.ml` handles the `#if`/`#else caml_failwith`/`#endif`
pattern. The `#else` branch calls `caml_failwith` so that OCaml code passing a version-guarded
variant to an older library fails at runtime with a clear message rather than silently hitting
the unknown-value default handler.

Member version vs. class version:
- If `member_version <= class_version`, the member guard is redundant (the outer class
  guard already covers it) and is omitted.
- If `member_version > class_version` (or class has no version), the member guard is
  emitted as an inner `#if` inside the converter.

## Phase 2: Cross-Namespace Version Guards

### Problem

Some GIR entities depend on types from a *different* namespace. For example,
`GtkTextTag.text-transform` uses `PangoTextTransform` (Pango ≥ 1.50). The existing
`(version "4.6")` always emits `GTK_CHECK_VERSION(4,6,0)`, which is insufficient
when CentOS 9 ships GTK ≥ 4.6 with Pango < 1.50 — the guard is true but the type
is undefined, causing a build failure.

### New Syntax

```sexp
(property text-transform (version (pango "1.50")))
```

The library qualifier inside `version` selects the check macro for a *dependency*
namespace. Accepted library names (case-insensitive): `gtk`, `gdk`, `gsk`, `pango`,
`pangocairo`, `gio`, `glib`, `gdkpixbuf`, `graphene`, `cairo`.

The example above emits:
```c
#if PANGO_VERSION_CHECK(1,50,0)
/* getter/setter stubs */
#else
/* caml_failwith fallback */
#endif
```

### Type Model Changes

**`override_types.ml`** — extend `override_action`:

```ocaml
(* version string + optional namespace override (None = use current lib) *)
type version_spec = { vs_version : string; vs_namespace : string option }
[@@deriving sexp, eq]

type override_action =
  | Ignore
  | Set_version of version_spec   (* was: Set_version of string *)
[@@deriving sexp, eq]
```

**`types.ml`** — add `version_namespace : string option` to component-level GIR
types that participate in member-level version guards:
`gir_property`, `gir_method`, `gir_constructor`, `gir_signal`.

Initialised to `None` by the GIR XML parser; set from the override's `vs_namespace`
by `override_apply.ml`.

### Parser Changes (`override_parser.ml`)

Two forms are now accepted:

| Sexp | Result |
|------|--------|
| `(version "X.Y")` | `Set_version { vs_version="X.Y"; vs_namespace=None }` |
| `(version (pango "X.Y"))` | `Set_version { vs_version="X.Y"; vs_namespace=Some "Pango" }` |

The library name is validated via `Version_guard.normalize_namespace` (new function
exported from `version_guard.ml`). Unknown names produce a hard parse error.

### Version Guard Changes

**`version_guard.ml`** — export a normalisation helper:

```ocaml
val normalize_namespace : string -> (string, string) result
(* "pango" -> Ok "Pango", "gtk" -> Ok "Gtk", unknown -> Error msg *)
```

**`c_stub_helpers.ml`** — `emit_with_member_guard` gains a
`~version_namespace : string option` parameter. When `Some ns` is provided the
`#if`/`#endif` guards are emitted using `ns` instead of
`ctx.namespace.namespace_name`.  The fallback `caml_failwith` message uses the
same namespace display name.

**`gir_gen.ml`** — all call sites for `emit_with_member_guard` and the fallback
property/method stub emitters pass the component's `version_namespace` field.

### Apply Changes (`override_apply.ml`)

`apply_components_by_name` signature changes:

```ocaml
~set_version : version_spec -> 'a -> 'a
```

Each `~set_version` lambda sets `version = Some vs.vs_version` *and*
`version_namespace = vs.vs_namespace` on the component record (for types that have
the new field). Component types without `version_namespace` (e.g. enum members)
silently drop the namespace; a warning should be considered for a later phase.

### Affected Files Summary

| File | Change |
|------|--------|
| `override_types.ml` | Add `version_spec`; change `Set_version of string` |
| `override_parser.ml` | Parse `(version (lib "X.Y"))` form |
| `version_guard.ml` | Export `normalize_namespace` |
| `types.ml` | Add `version_namespace` to 4 component types |
| `gir_parser.ml` | Init `version_namespace = None` in all component record constructions |
| `override_apply.ml` | Thread `version_spec` through; set `version_namespace` |
| `c_stub_helpers.ml` | `emit_with_member_guard` accepts `~version_namespace` |
| `gir_gen.ml` | Pass `prop/meth/ctor.version_namespace` to guard calls |
| `overrides/gtk.sexp` | `(ignore)` → `(version (pango "1.50"))` for `TextTag.text-transform` |
| Generated files | Regenerate (or manually update) `ml_text_tag_gen.c` etc. |

### Tests to Add / Update

#### `test_override_parser.ml`

- **Cross-namespace parse round-trip**: parse `(overrides (library "Gtk") (class TextTag (property text-transform (version (pango "1.50")))))` and assert the resulting `component_override` has `action = Set_version { vs_version = "1.50"; vs_namespace = Some "Pango" }`.
- **Unknown library hard error**: parse `(version (unknownlib "1.0"))` and assert an `Error` result is returned (not a parse success with a bad value).
- **Same-namespace version still works**: `(version "4.14")` still produces `Set_version { vs_version = "4.14"; vs_namespace = None }` — regression guard.
- **All supported library names accepted**: at minimum `gtk`, `pango`, `gdk`, `gio`, `gsk`, `graphene`, `cairo`, `gdkpixbuf`, `pangocairo` produce `Ok` results from `normalize_namespace`.

#### `test_override_apply.ml`

- **Cross-namespace version sets `version_namespace` on method**: apply an override with `Set_version { vs_version = "1.50"; vs_namespace = Some "Pango" }` to a method; assert the surviving method has `version = Some "1.50"` and `version_namespace = Some "Pango"`.
- **Cross-namespace version sets `version_namespace` on property**: same as above for `gir_property`.
- **Same-namespace version leaves `version_namespace = None`**: `vs_namespace = None` override leaves `version_namespace = None` on the component (regression guard for existing behaviour).
- **Polymorphic equality**: the existing tests on lines 256, 272, 304, 383, 428, 469 use `Stdlib.(=)` for `option` comparison — replace with `Option.equal String.equal` as required by the code guidelines.

#### New file: `version_guard_tests.ml`

Create `gir_gen/test/version_guard_tests.ml` and register it in `dune`. Test:
- `normalize_namespace "pango"` → `Ok "Pango"`
- `normalize_namespace "PANGO"` → `Ok "Pango"` (case-insensitive)
- `normalize_namespace "pango-cairo"` → `Ok "PangoCairo"`
- `normalize_namespace "pangocairo"` → `Ok "PangoCairo"`
- `normalize_namespace "glib"` → `Ok "Gio"` (alias)
- `normalize_namespace "gtk"` → `Ok "Gtk"`
- `normalize_namespace "unknownlib"` → `Error _`

#### `c_stubs` integration tests

Add a test in `c_stubs/cross_namespace_tests.ml` (the file already exists) that:
- Builds a `gir_property` with `version = Some "1.50"` and `version_namespace = Some "Pango"`.
- Calls the property stub generator for it.
- Asserts the C output contains `PANGO_VERSION_CHECK(1,50,0)` and does **not** contain `GTK_CHECK_VERSION`.

### Known Code Quality Issues

The following issues were identified during review and should be addressed in a future cleanup pass. They do not affect correctness.

#### `set_version` lambda duplicated in `override_apply.ml`

`apply_components_by_name` is called ~12 times, each time passing a nearly identical `~set_version` lambda:

```ocaml
~set_version:(fun vs (m : gir_method) ->
  { m with version = Some vs.vs_version; version_namespace = vs.vs_namespace })
```

The code-reuse guideline requires extraction when a pattern appears 3+ times. Each call site should use a per-type helper defined once at the top of the file, e.g.:

```ocaml
let set_method_version vs m = { m with version = Some vs.vs_version; version_namespace = vs.vs_namespace }
let set_property_version vs p = { p with version = Some vs.vs_version; version_namespace = vs.vs_namespace }
(* etc. *)
```

#### Entity-level `Set_version` is dead code in `override_apply.ml`

`apply_entity_overrides` handles `Some (Set_version vs)` at the entity level, but `override_parser.ml` never produces an entity-level `Set_version` — it only produces `Some Ignore` or `None`. This path is unreachable and untested. Either:
- Add parser support for entity-level `(version "X.Y")`, or
- Remove the `Set_version` arm from `apply_entity_overrides`.

#### `namespace_display_name` duplicates knowledge from `version_guard.ml`

`c_stub_helpers.ml` maintains its own namespace → display-name mapping (line ~379) independent of `version_guard.ml`'s `namespace_macro_kind`. Adding a new namespace currently requires updating both. The display name should be derived from `version_guard.ml`'s table or a shared helper.

### Known Limitations

**Single guard per property.** The `(version ...)` syntax supports exactly one
version constraint per component. A property that requires *both* a GTK version
guard *and* a cross-namespace version guard cannot be expressed. For example,
`TextTag.text-transform` needs both GTK >= 4.6 (when the property was added) and
Pango >= 1.50 (when `PangoTextTransform` was defined). Currently the fix is to use
the stricter cross-namespace guard alone (`PANGO_VERSION_CHECK(1,50,0)`), which
happens to be sufficient in practice — but the intent is lost.

To support multiple guards, a future phase would need to:
1. Change `Set_version of version_spec` to `Set_version of version_spec list`
2. Update the parser to accept `(version "X.Y" (pango "A.B"))` or a list form
3. Update `emit_with_member_guard` to emit nested `#if` guards or a compound
   `&&` expression: `#if GTK_CHECK_VERSION(4,6,0) && PANGO_VERSION_CHECK(1,50,0)`

---

## Updating Override Files

Override files are generated once with `gir_gen overrides` (extracts `Since X.Y`
from GIR `<doc>` text), then hand-edited to add `(ignore)` entries. When GTK
upgrades, re-run `gir_gen overrides` and merge the diff.

The recommended workflow is `bash scripts/generate-bindings.sh` from the repository
root, which wires `-o overrides/<ns>.sexp` into all 9 `generate` and `references`
invocations automatically.
