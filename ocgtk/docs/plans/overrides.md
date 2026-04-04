# GIR Overrides System - Implementation Plan

## Overview

Introduce a s-expression-based override file (`overrides-gir.sexp`) that allows manual
configuration of GIR generation behaviour per-library. This replaces scattered hardcoded
exclusion lists (`exclude_list.ml`, `filtering.ml`) with a single, user-editable configuration.

The system covers:
- **Ignoring** entire entities (classes, interfaces, records, enums, bitfields, functions)
  or their sub-components (methods, constructors, properties, signals, fields, members)
- **Version overrides** on entities or sub-components (sets the `version` field used for
  C `#if` version guards)
- **Future extension points** for other per-entity configuration

## Reference: GIR Type Hierarchy

From `types.ml`, the data model that the override file must address:

```
generation_context
├── classes : gir_class list
│   ├── constructors : gir_constructor list   (ctor_name)
│   ├── methods : gir_method list             (method_name)
│   ├── properties : gir_property list        (prop_name)
│   └── signals : gir_signal list             (signal_name)
├── interfaces : gir_interface list
│   ├── methods : gir_method list             (method_name)
│   ├── properties : gir_property list        (prop_name)
│   └── signals : gir_signal list             (signal_name)
├── enums : gir_enum list
│   ├── members : gir_enum_member list        (member_name)
│   └── functions : gir_function list         (function_name)
├── bitfields : gir_bitfield list
│   └── flags : gir_bitfield_member list      (flag_name)
├── records : gir_record list
│   ├── fields : gir_record_field list        (field_name + field_version)
│   ├── constructors : gir_constructor list   (ctor_name)
│   ├── methods : gir_method list             (method_name)
│   └── functions : gir_function list         (function_name)
```

Standalone functions also exist at namespace level (parsed but currently less prominent).

## S-Expression Format

```sexp
(overrides
  (library "Gtk")

  ;; Ignore an entire class (all sub-components are skipped)
  (class Justification (ignore))

  ;; Class with sub-component overrides
  (class Widget
    (constructor new (ignore))
    (method create (ignore))
    (method notify_destroy (version "4.53"))
    (property sensitive (version "4.10"))
    (signal destroy (ignore))
  )

  ;; Interface overrides
  (interface Actionable
    (method get_action_name (ignore))
    (property action_name (version "4.12"))
    (signal activate (ignore))
  )

  ;; Record overrides
  (record TextIter
    (field user_data (ignore))
    (field start (version "4.14"))
    (constructor new (ignore))
    (method get_text (version "4.14"))
    (function get_slice (ignore))
  )

  ;; Enum overrides
  (enumeration RGBA
    (member RGB283 (ignore))
    (member NEW_COLOR (version "4.14"))
    (function parse (ignore))
  )

  ;; Bitfield overrides
  (bitfield StateFlags
    (member ACTIVE (ignore))
    (member NEW_STATE (version "4.14"))
  )

  ;; Standalone function ignore
  (function some_utility_function (ignore))
)
```

## Override File Storage

Override files live in a top-level `ocgtk/overrides/` directory, one per library:

```
ocgtk/overrides/
  cairo.sexp
  gio.sexp
  gdk.sexp
  graphene.sexp
  gdkpixbuf.sexp
  pango.sexp
  pangocairo.sexp
  gsk.sexp
  gtk.sexp
```

Naming convention: lowercase namespace name + `.sexp`. The file is passed to
`gir_gen generate` via `-o overrides/<ns>.sexp` in `generate-bindings.sh`.

### Design Decisions

1. **`ignore` means "do not generate"** - removes the entity/component from all
   generation stages (C stubs, Layer 1, Layer 2, signals, dune modules).

2. **`version` sets/overrides the version field** - if the GIR already has a version,
   the override replaces it. If not, it adds one. This feeds into `Version_guard`
   for `#if` guard generation.

3. **Entity names are GIR names** (e.g. `Widget`, `RGBA`, `StateFlags`) - the same
   names as they appear in the GIR XML. No normalization needed for matching.

4. **One `(overrides ...)` form per file** - the top-level form groups a `(library ...)`
   declaration and the entity overrides.

5. **Library name is metadata** - for documentation/validation but not currently used
   for filtering (the generator processes one library at a time anyway).

6. **Entity-level ignore takes precedence** - if `(class Widget (ignore) (method foo ...))`
   is specified, the entire class is ignored and sub-component overrides are silently
   skipped. No warning needed (the ignore is intentional and comprehensive).

7. **Duplicate entity names always rejected** - two `(class Widget ...)` entries in the
   same file is always a parse error that halts generation, regardless of content. To
   express a class-level ignore alongside component overrides, use a single entry:
   `(class Widget (ignore) (method foo ...))`. Duplicate component names within an
   entity (e.g., two `(method foo ...)` in the same class) are also rejected.

8. **Parse failure is a hard error** - a malformed override file halts generation
   immediately. No partial overrides are applied. Unknown entity/component names
   produce a warning but do not halt generation (catches typos).

9. **Bitfield members use `member` keyword** - bitfield overrides use `(member NAME ...)`
   not `(flag NAME ...)`. Both enum and bitfield member overrides use the same keyword.
   The parser stores these in the `flags` field of `bitfield_override` (matching
   `gir_bitfield.flags`). This is purely an internal naming distinction.

10. **`(function ...)` is context-disambiguated** - the `function` keyword is used for
    both standalone namespace-level functions (at the top level of `(overrides ...)`) and
    for record/enum-level functions (nested inside a `(record ...)` or `(enumeration ...)`
    form). The parser position provides unambiguous context; no separate keyword is needed.

---

## Phase 1: Override Types and S-Expression Parsing ✅ COMPLETE (2026-04-04)

**Goal**: Define the OCaml types for overrides and build a parser from s-expressions.

**Implementation notes:**
- Test files live in `src/tools/test_gir_gen/` (not `ocgtk/test_gir_gen/`) to match existing test structure
- Parser handles both `(ignore)` (list form) and `ignore` (atom form) for component actions, since sexplib parses `(ignore)` as `List [Atom "ignore"]`
- `parse_overrides_from_string` writes to a temp file and uses `Sexp.load_sexp` — avoids dealing with sexplib's incremental `parse` API
- `Sexp.load_sexp` raises `Failure` for malformed sexps (not `Parse_error`), so both are caught
- Duplicate detection uses a Hashtbl keyed by `(kind, name)` — first error stops iteration
- Fixed existing `gir_parser.ml` to include `member_version = None`, `flag_version = None`, `field_version = None` in record constructions (Task 1.1b dependency)
- Fixed ppxlib 0.35.0 API changes in `ml_ast_helpers.ml` (`Ptyp_alias` and `Pexp_function` constructors changed)

### Task 1.1: Define Override Types (new file: `override_types.ml`) ✅

Create `ocgtk/src/tools/gir_gen/override_types.mli` and `ocgtk/src/tools/gir_gen/override_types.ml`.

Types to define (following code guidelines: exhaustive matching, named intermediates,
`.mli` for public API, labelled arguments):

```ocaml
(* override_types.mli *)

(** What to do for a specific entity or sub-component *)
type override_action =
  | Ignore
  | Set_version of string
[@@deriving sexp, eq]

(** Override for a sub-component of an entity (method, property, etc.) *)
type component_override = {
  component_name : string;
  action : override_action;
}
[@@deriving sexp, eq]

(** Override for a class *)
type class_override = {
  class_name : string;
  class_action : override_action option;  (* None = no class-level override *)
  constructors : component_override list;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
[@@deriving sexp, eq]

(** Override for an interface *)
type interface_override = {
  interface_name : string;
  interface_action : override_action option;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
[@@deriving sexp, eq]

(** Override for a record *)
type record_override = {
  record_name : string;
  record_action : override_action option;
  fields : component_override list;
  constructors : component_override list;
  methods : component_override list;
  functions : component_override list;
  (** Record-level functions. Parsed from `(function ...)` inside a `(record ...)` block.
      Distinct from top-level `library_overrides.functions` (namespace-level). *)
}
[@@deriving sexp, eq]

(** Override for an enumeration *)
type enum_override = {
  enum_name : string;
  enum_action : override_action option;
  members : component_override list;
  functions : component_override list;
}
[@@deriving sexp, eq]

(** Override for a bitfield.
    NOTE: The sexp format uses `(member NAME ...)` for bitfield members, matching
    the enum keyword. The parser maps this to the `flags` field. See Design Decision #9. *)
type bitfield_override = {
  bitfield_name : string;
  bitfield_action : override_action option;
  flags : component_override list;
  (** Populated from `(member ...)` in the sexp (same keyword as enum members). *)
}
[@@deriving sexp, eq]

(** Top-level overrides container *)
type library_overrides = {
  library_name : string;
  classes : class_override list;
  interfaces : interface_override list;
  records : record_override list;
  enums : enum_override list;
  bitfields : bitfield_override list;
  functions : component_override list;
  (** Standalone namespace-level functions. Parsed from `(function ...)` at the
      top level of the `(overrides ...)` form, not nested inside any entity. *)
}
[@@deriving sexp, eq]
```

**Code guidelines reference**:
- `module-boundaries.md`: `.mli` file with documented types
- `type-safety.md`: variant types (`override_action`) instead of strings
- `pattern-matching.md`: exhaustive matching required

### Task 1.1b: Extend GIR Types with Member Version Fields ✅

GIR XML does not include `version` attributes on `<member>` elements within
`<enumeration>` or `<bitfield>`, nor on `<field>` elements within `<record>`.
However, we need per-member/per-field versioning to support version-guarded C code
generation for members added in newer library versions.

Add version fields to `types.ml`:

```ocaml
type gir_enum_member = {
  member_name : string;
  member_value : int;
  c_identifier : string;
  member_doc : string option;
  member_version : string option;   (* NEW - always None from GIR, set by overrides *)
}

type gir_bitfield_member = {
  flag_name : string;
  flag_value : int;
  flag_c_identifier : string;
  flag_doc : string option;
  flag_version : string option;     (* NEW - always None from GIR, set by overrides *)
}

type gir_record_field = {
  field_name : string;
  field_type : gir_type option;
  readable : bool;
  writable : bool;
  field_doc : string option;
  field_version : string option;    (* NEW - always None from GIR, set by overrides *)
}
```

No parser changes needed — GIR doesn't provide these. The fields are populated
exclusively by the override system (Phase 2 / `override_apply.ml`).

### Task 1.2: Write Unit Tests for Override Types ✅

Created `ocgtk/src/tools/test_gir_gen/test_override_types.ml` — 12 tests covering
construction of each override type, equality via `[@@deriving eq]`, and library_overrides.

### Task 1.3: Build S-Expression Parser (new file: `override_parser.ml`) ✅

Created `ocgtk/src/tools/gir_gen/override_parser.mli` and
`ocgtk/src/tools/gir_gen/override_parser.ml`.

Use `sexplib` (already a dependency) to parse s-expressions. The module provides:

```ocaml
(* override_parser.mli *)

(** Parse errors with context *)
type parse_error =
  | Invalid_format of { location : string; message : string }
  | Unknown_entity_kind of string
  | Duplicate_entity of { kind : string; name : string }
  | Duplicate_component of { entity : string; component_kind : string; name : string }
  | Invalid_version of { name : string; version : string; reason : string }

val format_error : parse_error -> string
(** Format a parse error as a human-readable message. *)

val parse_overrides : string -> (Override_types.library_overrides, parse_error) result
(** [parse_overrides filename] reads and parses the override file.
    Returns [Error] with context on any parse failure. *)

val parse_overrides_from_string : string -> (Override_types.library_overrides, parse_error) result
(** [parse_overrides_from_string content] parses overrides from a string.
    Useful for testing. *)
```

Implementation approach:
1. Use `Sexplib.Sexp.parse_string` / `Sexplib.Sexp.load_sexp_conv_exn` to read the file
2. Write a recursive function that pattern-matches on the s-expression structure
3. Use `Result` types for error handling (per `error-handling.md`)
4. Use bind operators to flatten chains (per `nesting-and-control-flow.md`)
5. Validate: no duplicate entity names, no duplicate component names within an entity,
   version strings are well-formed (reuse `Version_guard.parse_version` for validation)

Duplicate handling rules:
- **Duplicate entity names rejected**: two `(class Widget ...)` entries in the same file
  is always a hard error, regardless of their contents. To express class-level ignore with
  component overrides, put both in a single `(class Widget (ignore) (method foo ...))` entry.
- **Duplicate component names within an entity rejected**: two `(method foo ...)` entries
  in the same class override is a hard error

`(function ...)` disambiguation:
- `(function name ...)` at the **top level** of the `(overrides ...)` form → standalone
  namespace-level function, stored in `library_overrides.functions`
- `(function name ...)` **nested inside** a `(record ...)` or `(enumeration ...)` form →
  entity-level function, stored in `record_override.functions` / `enum_override.functions`
- No new keywords are needed — parser position provides unambiguous context

The parser must handle:
- `(class Name (ignore))` — class-level ignore with no component overrides
- `(class Name (ignore) (method m (ignore)))` — class-level ignore with component overrides
  in the same entry; class ignore takes precedence, component overrides silently skipped
- `(class Name (method m (ignore)) (method n (version "4.12")))` — component overrides only
- Nested forms for constructors, methods, properties, signals, fields, members, functions
- `(function ...)` at top level vs. inside record/enum (context-based disambiguation)

**Code guidelines reference**:
- `error-handling.md`: Result types, contextual errors
- `partial-functions.md`: no `List.hd`, use pattern matching
- `pattern-matching.md`: exhaustive, no catch-all

### Task 1.4: Write Parser Unit Tests ✅

Created `ocgtk/src/tools/test_gir_gen/test_override_parser.ml` — 22 tests covering:
- All entity types (class, interface, record, enumeration, bitfield, function)
- Version overrides and validation
- Error cases (malformed sexp, unknown entity, invalid version, duplicate entity)
- Class ignore + component overrides in same entry

### Task 1.5: Update Dune Build File ✅

Updated `ocgtk/src/tools/test_gir_gen/dune` (added `test_override_types` and
`test_override_parser` to modules list) and `test_gir_gen.ml` (registered
new test suites). No changes to gir_gen library dune — `include_subdirs qualified`
auto-discovers new `.ml` files.

---

## Phase 2: Override Application

**Goal**: Apply parsed overrides to the GIR data structures after parsing, before generation.

### Task 2.1: Define Override Application Module (new file: `override_apply.ml`)

Create `ocgtk/src/tools/gir_gen/override_apply.mli` and `ocgtk/src/tools/gir_gen/override_apply.ml`.

```ocaml
(* override_apply.mli *)

(** Result of applying overrides *)
type apply_result = {
  classes : Types.gir_class list;
  interfaces : Types.gir_interface list;
  enums : Types.gir_enum list;
  bitfields : Types.gir_bitfield list;
  records : Types.gir_record list;
  functions : Types.gir_function list;  (* standalone namespace-level functions *)
  ignored_entities : string list;  (* names of ignored entities for logging *)
  warnings : string list;          (* warnings for unknown entity/component names *)
}

val apply_overrides :
  overrides:Override_types.library_overrides ->
  classes:Types.gir_class list ->
  interfaces:Types.gir_interface list ->
  enums:Types.gir_enum list ->
  bitfields:Types.gir_bitfield list ->
  records:Types.gir_record list ->
  functions:Types.gir_function list ->
  apply_result
(** Apply overrides to parsed GIR data. Filters out ignored entities and
    applies version overrides to remaining ones.

    ORDERING: This must be called before building the type-mapping context (ctx).
    Ignored entities must be absent from ctx so that find_type_mapping_for_gir_type
    returns None for their types, causing methods that reference them to be skipped
    by the existing unknown-type checks in filtering.ml. *)
```

Implementation strategy:

1. **Entity-level ignore**: Filter the entity lists. For each class override with
   `(ignore)`, remove that class from the list. Similarly for interfaces, records,
   enums, bitfields.

2. **Component-level ignore**: For surviving entities, filter their sub-lists.
   For a class with `(method create (ignore))`, remove `create` from its `methods` list.

3. **Version override**: For surviving entities/components, update the `version` field.
   Use record update syntax (`{ entity with version = Some v }`).
   For enum members and bitfield flags, update `member_version` and `flag_version`
   respectively — this is the **only** source for these fields since GIR does not
   provide member-level versions. Same for record fields (`field_version`).

4. **Unknown name warnings**: When an override references an entity or component name
   that doesn't exist in the parsed GIR data, add a warning to `apply_result.warnings`.
   This catches typos without blocking generation.

Key implementation details:
- Use `List.filter` + `List.map` with named predicates (per `naming-and-intermediates.md`)
- Use record update syntax (per `code-reuse.md`)
- Extract entity name matching into a helper (e.g. `matches_class_override`)
- For enums/bitfields from external namespaces: overrides should only apply to the
   primary namespace being generated

**Code guidelines reference**:
- `code-reuse.md`: record update syntax, extract common patterns
- `naming-and-intermediates.md`: named predicates
- `module-boundaries.md`: `.mli` with labelled arguments

### Task 2.2: Write Override Application Unit Tests

Create `ocgtk/test_gir_gen/test_override_apply.ml`:

- Test class ignore removes it from the list
- Test method ignore removes it from the class's methods
- Test version override sets the version field
- Test version override replaces existing version
- Test interface, record, enum, bitfield overrides
- Test that ignored entities appear in `ignored_entities` list
- Test combined: class ignore + component ignore on surviving class
- Test empty overrides = no changes
- Test unknown entity name produces a warning in `apply_result.warnings`
- Test unknown component name produces a warning in `apply_result.warnings`
- Test class ignore takes precedence over component overrides (no warning for
  component overrides under ignored entity)

### Task 2.3: Integrate into Generation Pipeline

Modify `ocgtk/src/tools/gir_gen/gir_gen.ml`:

1. **Add CLI argument**:
   ```ocaml
   let overrides_arg =
     let doc = "Override file (s-expression) for GIR generation configuration" in
     Arg.(value & opt (some file) None & info [ "o"; "overrides" ] ~docv:"FILE" ~doc)
   ```

2. **Update `generate_bindings` signature** to accept `overrides_file`:
   ```ocaml
   let generate_bindings filter_file gir_file output_dir reference_files overrides_file =
   ```

3. **After parsing** (after the `Gir_parser.parse_gir_file` call, before building the
   type-mapping context), load and apply overrides. **Overrides must be applied before
   `ctx` is built** — ignored entities must be absent from the type-mapping so that
   `find_type_mapping_for_gir_type` returns `None` for their types, causing methods that
   reference them to be skipped by the existing unknown-type checks. A parse error is a
   **hard error** that halts generation. Unknown entity/component names produce a **warning**:
   ```ocaml
   let classes, interfaces, enums, bitfields, records, functions =
     match overrides_file with
     | None -> classes, interfaces, enums, bitfields, records, functions
     | Some file ->
       printf "Loading overrides from %s\n" file;
       match Override_parser.parse_overrides file with
       | Error e ->
         eprintf "Error: override parse failed: %s\n" (Override_parser.format_error e);
         exit 1
       | Ok ov ->
         let result = Override_apply.apply_overrides ~overrides:ov
           ~classes ~interfaces ~enums ~bitfields ~records ~functions in
         List.iter result.warnings ~f:(fun w -> eprintf "Warning: %s\n" w);
         result.classes, result.interfaces, result.enums,
         result.bitfields, result.records, result.functions
   (* Build type-mapping ctx AFTER this point *)
   ```

4. **Update `generate_cmd`** term to include the new argument:
   ```ocaml
   Term.(ret (const generate_bindings $ filter_arg $ gir_file_arg $
     output_dir_arg $ reference_files_arg $ overrides_arg))
   ```

5. **Update man page** with override examples.

**Code guidelines reference**:
- `abstractions.md`: layered module dependencies (parser → apply → pipeline)
- `module-boundaries.md`: labelled args for same-type params

### Task 2.4: Integrate Overrides into References Generation

The `gir_gen references` subcommand (line 1300 of `gir_gen.ml`) generates cross-namespace
reference files. Ignored entities must be excluded from references — otherwise another
namespace could reference a type that doesn't exist in the generated bindings.

Currently `generate_references` filters classes via `Filtering.should_generate_class`
and records via `Filtering.should_generate_record`, but includes all interfaces, enums,
and bitfields unconditionally. Overrides are not consulted.

Changes to `generate_references`:

1. **Add overrides argument** — accept an optional override file path
2. **Parse and apply overrides** — call `Override_parser.parse_overrides` and
   `Override_apply.apply_overrides` on the parsed GIR data before building the
   reference entity list
3. **Filter ignored entities** — use the filtered result from `apply_overrides`
   instead of the raw parsed lists

```ocaml
let generate_references gir_file output_file overrides_file =
  let repository, namespace, classes, interfaces, enums, bitfields, records =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file gir_file []
  in
  (* Apply overrides to filter ignored entities from references.
     References generation uses raw GIR data — no type-mapping context needed here. *)
  let classes, interfaces, enums, bitfields, records =
    match overrides_file with
    | None -> classes, interfaces, enums, bitfields, records
    | Some file ->
      match Override_parser.parse_overrides file with
      | Error e ->
        eprintf "Error: %s\n" (Override_parser.format_error e);
        exit 1
      | Ok ov ->
        let result = Override_apply.apply_overrides ~overrides:ov
          ~classes ~interfaces ~enums ~bitfields ~records ~functions in
        result.classes, result.interfaces, result.enums,
        result.bitfields, result.records
  in
  (* Build entities from filtered lists... *)
```

4. **Update `references_cmd`** term to include overrides argument:
   ```ocaml
   let overrides_arg_refs =
     let doc = "Override file for filtering references" in
     Arg.(value & opt (some file) None & info [ "o"; "overrides" ] ~docv:"FILE" ~doc)
   ```

5. **Update `generate-bindings.sh`** — pass `-o` to `gir_gen references` calls too

---

## Phase 3: Extract Versions from GIR and Generate Initial Override Files

**Goal**: Build a tool to extract "Since" version info from GIR doc comments, then
generate complete initial override files combining those versions with the ignore
entries migrated from hardcoded lists.

**Note**: This phase must be completed before Phase 4. Phase 4 removes hardcoded
exclusion lists and the `is_platform_specific_type` parser guards — the override files
created here must be in place first, and the gir_parser.ml guard removal and the override
file creation should land in the same commit to avoid a window where entities are parsed
but not yet filtered.

### Inventory of Hardcoded Static Lists (for reference)

These are the lists whose data feeds into the initial override files (code removal
happens in Phase 4). Note: `PageSetupUnixDialog` and `PrintUnixDialog` appear in
both `platform_specific_type_exclude_list` and `should_skip_class` — generate only
one `(class X (ignore))` entry each in the override file:

| Source | Entries | Override form |
|--------|---------|---------------|
| `exclude_list.ml` `variadic_function_exclude_list` | 3 functions | `(function <c_id> (ignore))` |
| `exclude_list.ml` `platform_specific_type_exclude_list` | 9 types | `(class <name> (ignore))` |
| `exclude_list.ml` `function_exclude_list` | 1 function | `(function <c_id> (ignore))` |
| `exclude_list.ml` `should_skip_class` | 8 classes | `(class <name> (ignore))` |
| `filtering.ml` `property_exclude_list` | 1 pair | `(class <name> (property <prop> (ignore)))` |
| `filtering.ml` `banned_records` | 3 records | `(record <name> (ignore))` |
| `gir_parser.ml` `is_platform_specific_type` | enum/bitfield parse skip | `(enumeration <name> (ignore))` |

### Task 3.1: Build Override Extraction Tool (`gir_gen overrides` subcommand)

Add a new `overrides` subcommand to `gir_gen` (following the pattern of the existing
`references` subcommand). This tool reads a GIR XML file and produces an override
sexp file containing version overrides extracted from `<doc>` "Since" comments.

**What it extracts**: For every `<member>` in `<enumeration>` and `<bitfield>`,
and every `<field>` in `<record>`, it looks for a `<doc>` child element whose text
matches `Since[: ]<version>` (with flexible spacing, punctuation, and position in
the doc string). When found, it emits:

```sexp
(enumeration ApplicationFlags
  (member default_flags (version "2.74"))
  (member non_unique (version "2.30"))
)
```

**Version extraction regex**: Match `Since[:\s]+(\d+\.\d+(?:\.\d+)?)` in doc text.
This handles:
- `Since 2.26`
- `Since: 2.74`
- `(Since: 1.16).`
- `Since 1.50` at end of multiline doc

**Parser changes required** to extract doc text:
- `parse_enumeration` member block: stop calling `skip_element input 1` after member
  attributes. Instead, parse child elements and extract `<doc>` text when present.
  Set `member_doc = Some doc_text` when found. (Search for `parse_enumeration` in
  `gir_parser.ml` — avoid hardcoded line numbers.)
- `parse_bitfield` member block: same change.
- Record field parsing: same change — extract `<doc>` text for fields instead of skipping.

**CLI**:
```
gir_gen overrides GIR_FILE OUTPUT_FILE
```

**Output**: A partial override file — only `(library ...)` and member/field version
entries. No `(ignore)` entries (those are added manually in Task 3.2).

### Task 3.2: Generate Complete Initial Override Files for All Libraries

For each namespace, create the final override file by combining:

1. **Version entries** from the extractor (Task 3.1 output)
2. **Ignore entries** migrated from the hardcoded lists (see `gtk.sexp` example below)
3. **Manually identified** entries (any additional known exclusions)

Example for `ocgtk/overrides/gtk.sexp`:

```sexp
(overrides
  (library "Gtk")

  ;; Migrated from should_skip_class skip_list
  (class PrintJob (ignore))
  (class PrintUnixDialog (ignore))
  (class PageSetupUnixDialog (ignore))
  (class Printer (ignore))
  (class PixbufNonAnim (ignore))
  (class BroadwayRenderer (ignore))
  (class NglRenderer (ignore))
  (class SettingsBackend (ignore))

  ;; Migrated from platform_specific_type_exclude_list
  ;; (PageSetupUnixDialog and PrintUnixDialog already above — no duplicate entries)
  (class PrintCapabilities (ignore))
  (class PageSetup (ignore))
  (class PrintSettings (ignore))
  (class PrintContext (ignore))
  (class PrintOperation (ignore))
  (class PrintOperationPreview (ignore))
  (class License (ignore))

  ;; Previously skipped at parse time via is_platform_specific_type
  ;; These enums/bitfields are now parsed but ignored by overrides
  (enumeration License (ignore))

  ;; Migrated from property_exclude_list
  (class IconPaintable
    (property is-symbolic (ignore))
  )

  ;; Migrated from banned_records
  (record PrintBackend (ignore))
  (record PixbufModule (ignore))
  (record PixbufModulePattern (ignore))

  ;; Migrated from variadic_function_exclude_list
  (function gtk_text_buffer_insert_with_tags (ignore))
  (function gtk_text_buffer_insert_with_tags_by_name (ignore))
  (function gtk_text_buffer_create_tag (ignore))

  ;; Migrated from function_exclude_list
  (function gtk_tree_model_filter_get_virtual_root (ignore))

  ;; Version entries extracted from GIR "Since" comments
  ;; (populated by gir_gen overrides output)
  (enumeration SomeEnum
    (member some_member (version "4.14"))
  )
  (record SomeRecord
    (field some_field (version "4.10"))
  )
  ;; ... etc
)
```

Create placeholder files for other namespaces (even if initially empty beyond
`(library ...)`):

```sexp
(overrides (library "Cairo"))
```

**Verification**: Run `gir_gen generate` with each override file and compare output
to the pre-override baseline. The only differences should be:
- Previously-excluded entities now absent (migrated to override ignores)
- Version guards now present on members that had "Since" comments

---

## Phase 4: Filtering Integration and Hardcoded List Removal

**Goal**: Verify that override-based ignores produce identical filtering behaviour
to the existing hardcoded lists, then remove the redundant hardcoded entries.

### Task 4.1: Remove Hardcoded Entries Covered by Overrides

With overrides now integrated into the pipeline (Phase 2) and the initial override
files created in Phase 3 (which immediately precedes this phase), the hardcoded
exclusion lists that have corresponding override entries become redundant dead code.
Remove them:

1. **`exclude_list.ml`**:
   - Remove `variadic_function_exclude_list` and `is_variadic_function` — the
     3 GTK functions are now `(function ... (ignore))` in the override file.
     Code-level `varargs` detection (`List.exists p.varargs`) stays active.
   - Remove `platform_specific_type_exclude_list`, `is_platform_specific_type`,
     `type_name_exclude_list`, `is_excluded_type_name` — all entries migrated to
     `(class ... (ignore))` overrides
   - Remove `function_exclude_list`, `is_excluded_function` — migrated
   - Remove `should_skip_class` skip_list — migrated

2. **`filtering.ml`**:
   - Remove `property_exclude_list` and its check in `should_generate_property` —
     migrated to `(class IconPaintable (property is-symbolic (ignore)))`
   - Remove `banned_records` from `should_skip_private_record` — migrated to
     `(record ... (ignore))`. Keep the `*Private` suffix check (structural).

3. **`gir_parser.ml`**:
   - Remove `is_platform_specific_type` call in `parse_enumeration` (line 65) —
     previously-skipped enums are now parsed and ignored by overrides
   - Remove `is_platform_specific_type` call in `parse_bitfield` (line 144) — same

4. **Update all callers** of removed functions:
   - `filtering.ml:has_simple_type` — remove `is_excluded_type_name` check at line 13
     (the `find_type_mapping_for_gir_type` call that follows is the authoritative guard;
     ignored types are already absent from `ctx` because overrides are applied first)
   - `filtering.ml:should_skip_method_binding` — remove `is_excluded_function`,
     `is_variadic_function`, and `is_excluded_type_name` checks on return/param types
     (lines ~222, ~224, ~247, ~258; the `varargs` param check and unknown-type check stay)
   - `filtering.ml:should_generate_class` — remove `should_skip_class` check
   - `filtering.ml:should_generate_interface` — remove `should_skip_class` check
   - `filtering.ml:should_generate_property` — remove `property_exclude_list` check
   - `library_module.ml` — remove `should_skip_class` check (search for it, line numbers shift)
   - `layer1_property.ml` — remove `is_excluded_type_name` check (search for it)

**Not removed** (stays in code — these are dynamic/structural, not name-based):
- `should_skip_method` / `should_skip_constructor` — unknown type checks
- `should_skip_private_record` `*Private` suffix pattern
- `is_gtype_struct_for` check
- `should_generate_function` — `introspectable` attribute check
- Code-level `varargs` detection

### Task 4.2: Write Integration Tests

Create `ocgtk/test_gir_gen/test_override_integration.ml`:

- Parse a minimal GIR XML string, apply overrides, verify filtered result
- Test that ignored class does not appear in `generation_context.classes`
- Test that ignored method does not appear in surviving class's methods
- Test version override propagates correctly to the generation context
- **Regression test**: run full generation with override file, compare against
  baseline from before hardcoded list removal — output must be identical
- Test that references generation also excludes ignored entities

---

## Phase 5: Round-Trip and End-to-End Tests

### Task 5.1: Round-Trip S-Expression Tests

In `test_override_parser.ml`, add:

- Generate override file content from `library_overrides` type using `sexplib`
  (enabled by `[@@deriving sexp]` on override types — see Task 1.1)
- Parse it back
- Verify structural equality using `[@@deriving eq]` derived `equal_library_overrides`
- Test with complex multi-entity override files

### Task 5.2: End-to-End Smoke Test

Create `ocgtk/test_gir_gen/test_override_e2e.ml`:

- Use a small synthetic GIR file (inline XML)
- Create an override file that ignores one class and one method
- Run the generation pipeline with overrides
- Verify the output does not contain the ignored class/method
- Verify the output contains the non-ignored entities

---

## Phase 6: Enum/Bitfield Member Version Guards in C Generation

**Goal**: Generate `#if` version guards around individual enum/bitfield member
cases in C converter functions, so that members added in newer library versions
produce compile-time-protected code.

### Background

Currently, version guards on enums/bitfields wrap the **entire** C converter function
(`enum_code.ml`, `c_stub_enum.ml`). Per-member versioning is absent because GIR
does not provide `version` on `<member>` elements.

With the override system, member versions become available (set via `(member FOO
(version "4.14"))` in the override file). The C converters must now emit `#if`
guards around individual `case` (enum) or `if (flags & ...)` (bitfield) branches.

**Approach A** (chosen): When the compiled GTK is older than the member's version,
the `#else` branch calls `caml_failwith` with a descriptive error. The OCaml type
always contains all variants (no conditional compilation in OCaml). This matches
the existing `emit_with_member_guard` pattern used for methods and constructors.

### Task 6.1: Write Version Guard Helper for Enum/Bitfield Members

Create a helper function in `enum_code.ml` (or `c_stub_helpers.ml` for reuse)
that wraps a single converter branch with a version guard:

```ocaml
val emit_member_guard :
  namespace:string ->
  class_version:string option ->
  member_version:string option ->
  fallback_msg:string ->
  stub:string ->
  Buffer.t ->
  unit
```

This is a simplified version of `c_stub_helpers.emit_with_member_guard`:
- On `Member_guard v`: emit `#if MACRO(...)` / `stub` / `#else` / `caml_failwith(msg)` / `#endif`
- On `No_guard` or `Class_guard`: emit `stub` unchanged
- Reuse `Version_guard.resolve_guard` and `Version_guard.emit_c_guard`

### Task 6.2: Update `generate_c_enum_converters` (`enum_code.ml`)

Modify the C-to-OCaml converter (`switch`/`case`):
```c
    case GTK_JUSTIFY_LEFT: return caml_hash_variant("LEFT");
#if GTK_CHECK_VERSION(4,14,0)
    case GTK_JUSTIFY_NEW_VALUE: return caml_hash_variant("NEW_VALUE");
#endif
```

Modify the OCaml-to-C converter (`if`/`else if` chain):
```c
  if (val == caml_hash_variant("LEFT")) return GTK_JUSTIFY_LEFT;
#if GTK_CHECK_VERSION(4,14,0)
  else if (val == caml_hash_variant("NEW_VALUE")) return GTK_JUSTIFY_NEW_VALUE;
#else
  else if (val == caml_hash_variant("NEW_VALUE"))
    caml_failwith("GtkJustification.NEW_VALUE requires GTK 4.14");
#endif
```

For the `switch` version (C-to-OCaml): the `default:` case already handles unknown
values by calling `caml_failwith`, so the `#else` branch just omits the `case`.

For the `if` chain (OCaml-to-C): the `#else` branch must have a handler so that
if OCaml code passes the variant to an older GTK, we fail at runtime rather than
silently reaching the final `else` handler.

The function needs:
- `~namespace:string` (already passed)
- `~class_version:string option` (add parameter — available from `enum.enum_version`)
- Per-member: `member.member_version`

### Task 6.3: Update `generate_c_bitfield_converters` (`enum_code.ml`)

Same pattern for bitfield converters.

C-to-OCaml (`if (flags & ...)`):
```c
  if (flags & GTK_STATE_FLAG_NORMAL) { ... }
#if GTK_CHECK_VERSION(4,14,0)
  if (flags & GTK_STATE_FLAG_NEW_FLAG) { ... }
#endif
```

OCaml-to-C (`if`/`else if` matching tag):
```c
  if (tag == caml_hash_variant("NORMAL")) result |= GTK_STATE_FLAG_NORMAL;
#if GTK_CHECK_VERSION(4,14,0)
  else if (tag == caml_hash_variant("NEW_FLAG")) result |= GTK_STATE_FLAG_NEW_FLAG;
#else
  else if (tag == caml_hash_variant("NEW_FLAG"))
    caml_failwith("GtkStateFlags.NEW_FLAG requires GTK 4.14");
#endif
```

### Task 6.4: Update `generate_enum_files` in `gir_gen.ml`

Pass `~class_version` to the updated converter generation functions. (Search for
`generate_c_enum_converters` in `gir_gen.ml` — line numbers shift with refactoring.) The call is currently:

```ocaml
Enum_code.generate_c_enum_converters ~namespace:namespace.name enum
```

Change to:

```ocaml
Enum_code.generate_c_enum_converters ~namespace:namespace.name
  ~class_version:enum.enum_version enum
```

Same for `generate_c_bitfield_converters` with `bitfield.bitfield_version`.

### Task 6.5: OCaml Type Definitions — No Change (Documented Limitation)

The `.mli` file always emits all enum/bitfield variants unconditionally.
OCaml has no preprocessor, so conditional compilation is impossible.

**Known limitation**: If OCaml code constructs a variant whose member requires a
newer GTK version, and the program runs against an older GTK, the C converter
will call `caml_failwith` at runtime. This is documented and acceptable — it
matches how versioned methods work (the OCaml function always exists, the C stub
may fail at runtime on older libraries).

### Task 6.6: Write Unit Tests

Create `ocgtk/test_gir_gen/test_enum_member_version.ml`:

- Test that enum member with `member_version = None` produces no guards (baseline)
- Test that enum member with `member_version = Some "4.14"` produces `#if` guards
   when `enum_version = None`
- Test that enum member with `member_version` <= `enum_version` produces no
   inner guard (covered by outer class guard)
- Test that enum member with `member_version` > `enum_version` produces an
   inner `#if` guard
- Test bitfield equivalents
- Test that `#else` branch contains `caml_failwith` with member name and version
- Test the C-to-OCaml direction (switch case guarded)
- Test the OCaml-to-C direction (if-else chain guarded with fallback)

---

## Phase 7: Build Script and Documentation Updates

### Task 7.1: Update `generate-bindings.sh`

Modify `scripts/generate-bindings.sh` to pass `-o` (overrides) to both
`gir_gen generate` and `gir_gen references` calls.

Add override directory constant:

```bash
OVERRIDES_DIR="$REPO_ROOT/ocgtk/overrides"
```

Then for each **generate** invocation, add `-o "$OVERRIDES_DIR/<ns>.sexp"`:

```bash
# Use an array to avoid word-splitting on the path
OVERRIDE_FLAGS=()
if [ -f "$OVERRIDES_DIR/gtk.sexp" ]; then
    OVERRIDE_FLAGS=(-o "$OVERRIDES_DIR/gtk.sexp")
fi

"$GIR_GEN" generate \
    "${OVERRIDE_FLAGS[@]}" \
    -r "$BUILD_DIR/cairo-references.sexp" \
    ... \
    "$GIR_PATH/Gtk-4.0.gir" \
    src/gtk
```

For each **references** invocation, also add the override flag so ignored entities
are excluded from cross-namespace references:

```bash
"$GIR_GEN" references \
    "${OVERRIDE_FLAGS[@]}" \
    "$GIR_PATH/Gtk-4.0.gir" \
    "$BUILD_DIR/gtk-references.sexp"
```

Apply the same pattern to all 9 generate and references invocations.

### Task 7.2: Update README_GIR_GEN.md

Update `ocgtk/src/tools/README_GIR_GEN.md`:

1. **Section "Command Options"** (near the generate/references command docs):
   Add `--overrides` / `-o FILE` option description
2. **New section "Override Files"** (after the command options section):
   - The override file format (with full sexp example covering all entity types)
   - File location convention (`ocgtk/overrides/<namespace>.sexp`)
   - What can be overridden (ignore, version) with examples at each level
   - How overrides interact with existing filtering (pre-filter, additive)
   - How entity-level ignore takes precedence over component-level
   - Error behaviour: parse failure halts generation, unknown names warn
3. **Section "Usage Examples"**: Add an example invocation with `-o` flag
4. **Section "Known Limitations"**: Add note about OCaml enum types always
   containing all variants (no conditional compilation)

### Task 7.3: Update Root README.md

Update `ocgtk/README.md`:

1. **Section "Code generation from GIR files"** (line ~28): Add one sentence
   mentioning the override system and linking to `README_GIR_GEN.md` for details

### Task 7.4: Update scripts/README.md

Update `ocgtk/scripts/README.md`:

1. **Section describing `generate-bindings.sh`**: Add note that the script
   automatically picks up override files from `ocgtk/overrides/`

---

## File Summary

| File | Purpose | Phase |
|------|---------|-------|
| `ocgtk/src/tools/gir_gen/override_types.mli` | Override type definitions (public) | 1 |
| `ocgtk/src/tools/gir_gen/override_types.ml` | Override type implementations | 1 |
| `ocgtk/src/tools/gir_gen/override_parser.mli` | Parser public interface | 1 |
| `ocgtk/src/tools/gir_gen/override_parser.ml` | S-expression parser | 1 |
| `ocgtk/src/tools/gir_gen/override_apply.mli` | Application public interface | 2 |
| `ocgtk/src/tools/gir_gen/override_apply.ml` | Apply overrides to GIR data | 2 |
| `ocgtk/src/tools/gir_gen/gir_gen.ml` | Add CLI arg, integrate pipeline | 2 |
| `ocgtk/test_gir_gen/test_override_types.ml` | Type tests | 1 |
| `ocgtk/test_gir_gen/test_override_parser.ml` | Parser tests | 1 |
| `ocgtk/test_gir_gen/test_override_apply.ml` | Application tests | 2 |
| `ocgtk/src/tools/gir_gen/parse/gir_parser.ml` | Extract doc text for members/flags/fields | 3 |
| `ocgtk/src/tools/gir_gen/gir_gen.ml` | Add `overrides` subcommand | 3 |
| `ocgtk/overrides/gtk.sexp` | GTK override file (versions + ignores) | 3 |
| `ocgtk/overrides/cairo.sexp` | Cairo override file (placeholder) | 3 |
| `ocgtk/overrides/gio.sexp` | GIO override file (placeholder) | 3 |
| `ocgtk/overrides/gdk.sexp` | GDK override file (placeholder) | 3 |
| `ocgtk/overrides/graphene.sexp` | Graphene override file (placeholder) | 3 |
| `ocgtk/overrides/gdkpixbuf.sexp` | GdkPixbuf override file (placeholder) | 3 |
| `ocgtk/overrides/pango.sexp` | Pango override file (placeholder) | 3 |
| `ocgtk/overrides/pangocairo.sexp` | PangoCairo override file (placeholder) | 3 |
| `ocgtk/overrides/gsk.sexp` | GSK override file (placeholder) | 3 |
| `ocgtk/src/tools/gir_gen/exclude_list.ml` | Remove migrated hardcoded lists | 4 |
| `ocgtk/src/tools/gir_gen/generate/filtering.ml` | Remove migrated hardcoded lists | 4 |
| `ocgtk/src/tools/gir_gen/parse/gir_parser.ml` | Remove is_platform_specific_type calls | 4 |
| `ocgtk/test_gir_gen/test_override_integration.ml` | Integration tests + regression | 4 |
| `ocgtk/test_gir_gen/test_override_e2e.ml` | End-to-end tests | 5 |
| `ocgtk/src/tools/gir_gen/generate/enum_code.ml` | Add member version guards to C converters | 6 |
| `ocgtk/src/tools/gir_gen/gir_gen.ml` | Pass class_version to enum/bitfield converters | 6 |
| `ocgtk/test_gir_gen/test_enum_member_version.ml` | Enum/bitfield member version tests | 6 |
| `scripts/generate-bindings.sh` | Add -o override flags to generate + references | 7 |
| `ocgtk/src/tools/README_GIR_GEN.md` | Document override system | 7 |
| `README.md` | Mention override system | 7 |
| `scripts/README.md` | Document override file pickup | 7 |

## Dependencies Between Phases

```
Phase 1 (Types + Parser)
  └──> Phase 2 (Apply + Pipeline Integration)
          ├──> Phase 3 (Extract Versions + Create Override Files)
          │         └──> Phase 4 (Remove Hardcoded Lists + Verify)
          │                    └──> Phase 5 (E2E Tests)
          └──> Phase 6 (Enum/Bitfield Member Version Guards)
                                                          └──> Phase 7 (Build Script + Docs)
```

Tasks within each phase can be worked on in parallel except:
- Task 1.3 depends on 1.1 and 1.1b (parser needs types)
- Task 1.4 depends on 1.3 (parser tests need parser)
- Task 2.2 depends on 2.1 (apply tests need apply module)
- Task 2.3 and 2.4 depend on 2.1 (pipeline integration needs apply module)
- Phase 3 depends on Phase 2 (extraction tool uses parser, override files applied via pipeline)
- Phase 4 depends on Phase 3 (override files must exist before removing hardcoded lists;
  gir_parser.ml guard removal and override file creation should land in the same commit)
- Phase 5 depends on Phase 4 (E2E tests verify the complete integrated system)
- Phase 6 depends on Phase 2 (needs member_version fields and override application)
- Phase 7 depends on Phase 3 and 4 (script needs override files to exist, code is clean)

## Design Considerations

### Why s-expressions and not TOML/YAML/JSON?

1. **Already in the toolchain**: `sexplib` + `ppx_sexp_conv` are existing dependencies
2. **Recursive structure**: Overrides are naturally hierarchical (entity → components)
3. **Simplicity**: No schema definition needed; sexplib handles parsing
4. **Consistency**: Reference files already use s-expressions

### Why filter at the list level rather than changing filtering functions?

1. **Minimal invasiveness**: No changes to ~15 existing `should_generate_*`/`should_skip_*`
   functions across `filtering.ml`, `exclude_list.ml`
2. **Clean layering**: Overrides operate at the data level, filtering operates at the
   generation decision level
3. **Composability**: Both systems compose naturally — ignore by override, then filter
   by type-mapping/technical constraints

### Why not merge overrides into `exclude_list.ml`?

1. **Separation of concerns**: User configuration vs. hardcoded technical exclusions
2. **Different lifecycle**: Overrides are user-editable; exclude lists are developer-maintained
3. **Override semantics**: Overrides also set versions, not just ignore

### Future Extensions

The override format can be extended with:
- `(rename new_name)` — rename an entity in generated code
- `(ocaml_type "custom_type")` — override the OCaml type mapping
- `(generate_layer2 false)` — skip Layer 2 generation for specific entities
- `(c_prefix "custom_")` — override C symbol prefix
- Multiple `(overrides ...)` blocks for multi-library configurations

These are not in scope for this plan but the type structure supports them via
new `override_action` variants.

## Code Style Requirements

All code must adhere to:
- **[Code Guidelines Index](../code_guidelines/index.md)** and all linked sub-documents
- **Max 2 levels of nesting** — use `let*`/`let+` bind operators
- **Result over exceptions** — parse errors as `Result`
- **Named intermediates** — no 3+ stage anonymous pipelines
- **Exhaustive matching** — no catch-all `_`
- **Total functions** — no `List.hd`, `Option.get`, `int_of_string`
- **Type-specific equality** — `String.equal`, not `Stdlib.(=)`
- **`.mli` files** for all public modules
- **Labelled arguments** for 2+ same-type params
- **Record update syntax** for partial record construction
