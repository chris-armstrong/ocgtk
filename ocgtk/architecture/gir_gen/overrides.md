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

src/tools/gir_gen/
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

## Updating Override Files

Override files are generated once with `gir_gen overrides` (extracts `Since X.Y`
from GIR `<doc>` text), then hand-edited to add `(ignore)` entries. When GTK
upgrades, re-run `gir_gen overrides` and merge the diff.

The recommended workflow is `bash scripts/generate-bindings.sh` from the repository
root, which wires `-o overrides/<ns>.sexp` into all 9 `generate` and `references`
invocations automatically.
