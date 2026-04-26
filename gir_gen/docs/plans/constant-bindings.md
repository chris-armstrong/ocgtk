# Constant Bindings Plan

**Status: DRAFT**
**Created: 2026-04-24**

## Overview

Generate OCaml `let` bindings for GIR `<constant>` elements across all 9
namespaces. These are pure OCaml value declarations — no C FFI is required
because the values are embedded in the GIR file itself.

### Motivation

Several important GTK/Pango APIs require access to named constants:
- `Pango.scale` (= 1024, scale factor for Pango units)
- `Gtk.style_provider_priority_*` (CSS priority ordering)
- `Gdk.key_*` (2,285 keyboard key constants)
- `Gtk.accessible_attribute_*` (accessibility attribute names)

### Scope

| Namespace   | Constants |
|-------------|-----------|
| GDK         | 2,287     |
| GTK         | 97        |
| GIO         | 130       |
| Pango       | 13        |
| Graphene    | 5         |
| GdkPixbuf   | 4         |
| Cairo/Gsk/PangoCairo | 0 |
| **Total**   | **2,536** |

### Types in GIR

| GIR type   | OCaml type | Example                         |
|------------|------------|---------------------------------|
| `gint`     | `int`      | `PANGO_SCALE = 1024`            |
| `guint`    | `int`      | `INVALID_LIST_POSITION = 4294967295` |
| `gboolean` | `bool`     | `EVENT_STOP = true`             |
| `utf8`     | `string`   | `ACCESSIBLE_ATTRIBUTE_BACKGROUND = "bg-color"` |
| `Glyph` (custom int alias) | `int` | `GLYPH_EMPTY = 268435455` |

Note: `guint` values up to 2^32-1 fit in OCaml's 63-bit int on 64-bit targets.
32-bit platform support for large unsigned values is not guaranteed by this plan.

### Naming Convention

GIR constant names are `SCREAMING_SNAKE_CASE` (some with camel suffixes like
`KEY_BackSpace`). Apply `String.lowercase_ascii` to get the OCaml name:
- `PANGO_SCALE` (GIR `name` attr has already stripped the namespace prefix) →
  `scale`
- `STYLE_PROVIDER_PRIORITY_USER` → `style_provider_priority_user`
- `KEY_BackSpace` → `key_backspace`

No `sanitize_identifier` needed — lowercase constant names do not clash with
OCaml keywords.

### Output Format

For each namespace that has constants, generate two files in
`src/{ns}/generated/`:

**`{ns_lower}_constants.mli`:**
```ocaml
(* GENERATED CODE - DO NOT EDIT *)
(* {Namespace} Constants *)

val scale : int
(** [PANGO_SCALE] The scale factor for Pango units. *)

val version_string : string
(** [PANGO_VERSION_STRING] ... *)
```

**`{ns_lower}_constants.ml`:**
```ocaml
(* GENERATED CODE - DO NOT EDIT *)
(* {Namespace} Constants *)

let scale = 1024
let version_string = "1.52.1"
```

Version-guarded constants (with a GIR `version` attribute, e.g. GTK 4.14
accessible attribute names) are wrapped in `[@@if ...]` annotations **or**
simply emitted unconditionally — see Phase 4 for the decision.

Since all generated `src/{ns}/generated/dune` stanzas use `(modules :standard)`,
the new files are automatically compiled with no dune changes required.

---

## Phase 1 — Type System

**Goal:** Add `gir_constant` to `types.ml` and `constants` field to
`generation_context`.

### 1.1 — Add `gir_constant` record type

In `gir_gen/lib/types.ml`, add after the `gir_bitfield` block:

```ocaml
type gir_constant = {
  constant_name : string;         (* GIR name attr, SCREAMING_SNAKE_CASE *)
  constant_value : string;        (* literal value from GIR *)
  constant_c_identifier : string; (* c:type attr, e.g. PANGO_SCALE *)
  constant_type : gir_type;       (* the <type> child element *)
  constant_doc : string option;
  constant_version : string option;
}
```

### 1.2 — Add `constants` field to `generation_context`

```ocaml
type generation_context = {
  ...
  constants : gir_constant list;
}
```

Update all `generation_context` construction sites to pass `constants = []`
initially; the parser will populate it.

**Test gate:** `dune build` succeeds with no type errors.

---

## Phase 2 — GIR Parser

**Goal:** Parse `<constant>` elements in `gir_parser.ml`.

### 2.1 — Parse constant type child

Constants have a `<type>` child element with `name` and `c:type` attributes.
Reuse the existing `parse_simple_type` helper to build a `gir_type`. If the
type is absent or unparseable, skip the constant with a warning log.

### 2.2 — Add `parse_constant` function

```ocaml
let parse_constant attrs children =
  let name = get_attr "name" attrs in
  let value = get_attr "value" attrs in
  let c_identifier = get_attr_opt "c:type" attrs
    |> Option.value ~default:name in
  let doc = extract_doc children in
  let version = get_attr_opt "version" attrs in
  let gir_type = parse_constant_type children in
  match gir_type with
  | None -> None
  | Some constant_type ->
    Some { constant_name = name; constant_value = value;
           constant_c_identifier = c_identifier; constant_type;
           constant_doc = doc; constant_version = version }
```

### 2.3 — Hook into `parse_gir_file`

Add a `constants` ref alongside the existing `enums`, `classes`, etc. refs.
In the top-level element dispatch, handle `"constant"` → call `parse_constant`
and append to the ref. Populate `ctx.constants` after parsing.

**Test gate:** Parser tests for `<constant>` elements (added in Phase 5).

---

## Phase 3 — Code Generator

**Goal:** Create `constant_gen.ml` that emits `.ml` and `.mli` files.

### 3.1 — OCaml name derivation

```ocaml
let ocaml_name_of_constant name =
  String.lowercase_ascii name
```

No further transformation needed — GIR constant names are already
`UNDER_SCORED` and lowercase produces valid OCaml identifiers.

### 3.2 — OCaml type annotation

Map GIR type name to OCaml type string:

| GIR type name                              | OCaml |
|--------------------------------------------|-------|
| `utf8`, `filename`, `gchararray`           | `string` |
| `gint`, `gint32`, `gint64`, `guint`, `guint32`, `guint64`, `gsize`, `gssize` | `int` |
| `gdouble`, `gfloat`                        | `float` |
| `gboolean`                                 | `bool` |
| anything else (e.g. `Glyph`, `Unichar`)    | `int` (treat as opaque integer) |

### 3.3 — Value serialization

```ocaml
let serialize_value ~ocaml_type value =
  match ocaml_type with
  | "string" -> sprintf "%S" value       (* OCaml string literal with escaping *)
  | "bool"   -> value                    (* GIR has "true"/"false" literally *)
  | "float"  ->
      if String.contains value '.' then value
      else value ^ ".0"                  (* ensure OCaml float syntax *)
  | _        -> value                    (* int: decimal literal as-is *)
```

### 3.4 — File generation

`generate_constants_files ~ctx ~namespace ~output_dir` emits:

1. `{output_dir}/{ns_lower}_constants.mli` — signature with `val name : type` +
   optional doc comment `(** [C_IDENTIFIER] ... *)`
2. `{output_dir}/{ns_lower}_constants.ml` — implementation with `let name = value`

Skip generation entirely if `ctx.constants` is empty (covers Cairo, Gsk,
PangoCairo).

**Test gate:** Unit tests for value serialization (string escaping, float `.0`
suffix), type mapping, and name derivation. See Phase 5.

---

## Phase 4 — Version Guard Handling

**Goal:** Decide how to handle constants with a `version` attribute.

35 GTK constants (accessible attribute names) require GTK ≥ 4.14. 6 Pango
constants require Pango ≥ 1.16–1.44.

**Decision:** Emit versioned constants unconditionally in the OCaml binding,
matching the approach used for enums (enum members can be version-guarded in C
but the OCaml type is still emitted). The OCaml value is a literal, so it
compiles without any C header — no `#if` needed. At runtime, the GTK version
check only matters if the user passes the constant to a function that does not
exist on an older GTK.

**Rationale:** Pure OCaml constants have no C dependency. A constant like
`accessible_attribute_background = "bg-color"` is just a string literal; it
doesn't require GTK 4.14 headers. The version information can be surfaced in
the doc comment: `(** GTK ≥ 4.14. [GTK_ACCESSIBLE_ATTRIBUTE_BACKGROUND] ... *)`.

**Alternative rejected:** Wrapping in `#if GTK_VERSION_CHECK(4,14,0)` would
require C FFI, adding unnecessary complexity for literal values.

**Test gate:** Verify that GTK < 4.14 and Pango < 1.16 test environments still
compile generated constants (CI distro compat test — see Phase 6).

---

## Phase 5 — Tests

**Goal:** Add unit tests for the parser and generator.

### 5.1 — Parser tests

In `test_gir_gen/integration/gir_parser_tests.ml`, add a test that parses a
minimal GIR fragment containing two `<constant>` elements (one `gint`, one
`utf8`) and asserts:
- `constant_name`, `constant_value`, `constant_c_identifier` are correct
- `constant_type.name` matches
- `constant_doc` is populated when `<doc>` is present
- `constant_version` is populated when `version` attribute is present

### 5.2 — Generator unit tests

Create `c_stubs/constant_gen_tests.ml` (pure unit, no subprocess) that tests:
- `ocaml_name_of_constant`: `"STYLE_PROVIDER_PRIORITY_USER"` → `"style_provider_priority_user"`, `"KEY_BackSpace"` → `"key_backspace"`
- `ocaml_type_of_gir_type`: `gint` → `int`, `utf8` → `string`, `gboolean` → `bool`, `Glyph` → `int`
- `serialize_value`: string with quotes, backslash escaping; float without `.` gets `.0`; bool values; int decimal

### 5.3 — Integration test (generate + check)

Add an integration test to `test_gir_gen_integration.ml` that runs
`gir_gen.exe generate` against a minimal GIR file containing one constant, then
checks that the output `.mli` contains `val scale : int` and the `.ml` contains
`let scale = 1024`.

**Test gate:** All 344+ tests pass with new tests added.

---

## Phase 6 — Integration with `gir_gen.ml`

**Goal:** Wire the constant generator into the main generation command.

### 6.1 — Call `generate_constants_files` from `generate` command

After the existing `generate_enum_files` call in `gir_gen.ml`, add:

```ocaml
generate_constants_files ~ctx ~namespace ~output_dir
```

### 6.2 — Regenerate affected namespaces

Run `scripts/generate-bindings.sh` for the 6 affected namespaces, or manually
run `dune exec gir_gen.exe -- generate` for each. Do NOT regenerate all 9 if
only 6 are affected (saves time; script does all 9 but can be scoped).

Verify the generated files exist:
- `src/gdk/generated/gdk_constants.ml` / `.mli` (~2287 key constants)
- `src/gtk/generated/gtk_constants.ml` / `.mli` (~97 constants)
- `src/gio/generated/gio_constants.ml` / `.mli` (~130 constants)
- `src/pango/generated/pango_constants.ml` / `.mli` (~13 constants)
- `src/graphene/generated/graphene_constants.ml` / `.mli` (~5 constants)
- `src/gdk_pixbuf/generated/gdk_pixbuf_constants.ml` / `.mli` (~4 constants)

### 6.3 — Build verification

```bash
cd ocgtk && dune build
```

**Test gate:** All tests pass; `Gdk.Gdk_generated.Gdk_constants.key_tab` is
accessible in a test program (or via utop).

---

## Phase 7 — Exposure via Namespace Modules (Optional)

**Goal:** Make constants accessible without the `*_generated` module prefix.

Currently generated modules are exposed as e.g. `Gdk.Gdk_generated.Gdk_enums`.
If `src/gdk/dune` aliases or re-exports `Gdk_generated`, constants would be
available as `Gdk.Gdk_constants.key_tab`.

This phase is optional for the initial cut — the constants are immediately
usable through the generated module path. Decide based on whether the
Pango/GTK use cases work without additional aliasing.

---

## Implementation Order

```
Phase 1 (types.ml)  →  Phase 2 (parser)  →  Phase 3 (generator)
         ↓                                          ↓
    Phase 4 (version guards: decision only)   Phase 5 (tests)
                              ↓
                    Phase 6 (integration)
                              ↓
                    Phase 7 (optional exposure)
```

Phases 1–3 can be done in a single session. Phase 5 tests gate Phase 6
integration.
