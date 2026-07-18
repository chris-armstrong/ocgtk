# Milestone 3: API Documentation Generation Implementation Plan

This is the implementation plan for the API documentation generation work
described in [api_documentation_specification.md](./api_documentation_specification.md).

It is a design doc, divided into phases, that guides development agents. It is
intentionally separate from the specification so that the spec can be reviewed
and frozen before implementation begins. Every phase lists the concrete files
and functions it touches, the spec sections it satisfies, and the tests it adds.

## Codebase orientation (read first)

The generator lives in `gir_gen/lib`. Key facts that shape the plan:

- **Doc emission today is raw.** `Utils.sanitize_doc` (in `lib/utils.ml`) only
  escapes `*)` / `(*`. It is called from `lib/generate/layer1/layer1_main.ml`
  (module-level entity doc), `lib/generate/layer1/layer1_method.ml` (method
  docs), and `lib/generate/enum_code.ml` (enum/bitfield type + member docs).
  `%NULL`, `@param_name`, `` `GtkButton` ``, `[method@…]`, C types etc. pass
  through unconverted. The markup pipeline (Phase A) replaces these call sites.
- **Several docs are parsed but discarded, or never parsed.** In
  `lib/parse/gir_parser.ml`, `class_doc`, `interface_doc`, `prop_doc`,
  `enum_doc`, `bitfield_doc` are hardcoded `None` (the `<doc>` child is skipped
  by the catch-all; `prop_doc` is read into a local ref then dropped at
  construction). `record_doc`, `member_doc`, `flag_doc`, `field_doc`,
  method/function/signal `doc`, and `ctor_doc` *are* parsed. Phase A closes the
  capture gaps. Existing tests in `test/integration/gir_parser_tests.ml` assert
  `class_doc = None` and `prop_doc = None` and must be updated.
- **Constructors always emit synthetic text.** `layer1_constructor.ml`
  unconditionally writes `(** Create a new %s *)` and ignores `ctor_doc`.
- **Signals emit no docs at all.** `lib/generate/signal_gen.ml`
  `emit_l1_val` / `emit_l2_method_sig` / `emit_l2_method` write bare
  `val` / `method` lines.
- **There is no deprecation / stability capture.** No AST field, no parser
  support anywhere in `lib/`. Phase A adds it.
- **Cyclic L2 entities have shim modules.** `lib/generate/class_gen.ml`
  `generate_cyclic_shim_module` / `generate_cyclic_shim_signature` (lines
  ~381–449) emit a standalone `g<Entity>.mli` that re-exports
  `class type <entity>_t` from the combined file. The namespace entry module
  aliases the shim (`module Context = GContext`). The shim is the public L2
  page for cyclic entities and is the primary doc-lifting target (spec §13.2).
- **Reference paths in generated *signatures* use internal combined paths**
  (e.g. `Event_controller_and__…_widget.Widget.t`), via `lib/type_mappings.ml`
  and `lib/generate/library_module.ml` reading `ctx.module_groups` directly.
  Doc cross-references must instead use **public alias paths** (spec §13.4) and
  are a *separate* path builder from `type_mappings.ml`.
- **Module-path casing** comes from `Utils.internal_namespace_to_module_name`
  and `Utils.external_namespace_to_module_name` in `lib/utils.ml` (e.g.
  `GdkPixbuf` → `Gdkpixbuf` / `Ocgtk_gdkpixbuf.Gdkpixbuf`). The reference
  table reuses these helpers rather than hardcoding the spec's §9.5 table.
- **No `.mld` files or `(documentation)` stanzas exist today.** Package root
  is `ocgtk/src/dune` (`(public_name ocgtk)`); each namespace library is
  `ocgtk/src/<ns>/dune` with `(public_name ocgtk.<ns>)`. Phase F adds per-
  library `doc/` dirs (spec §14.3).

## 1. Phase A — Infrastructure and Data Capture

Goal: make GIR documentation data available in the AST and provide the
deterministic text pipeline that every later phase calls.

### A1. AST fields (spec §3, §10, §12.4, §12.5)

In `lib/types.ml`:

- Add `param_doc : string option` to `gir_param` (spec §10.1).
- Add `deprecated : string option` and `deprecated_version : string option`
  and `doc_deprecated : string option` to every documentable entity record:
  `gir_class`, `gir_interface`, `gir_record`, `gir_method`, `gir_constructor`,
  `gir_function`, `gir_property`, `gir_signal`, `gir_enum`, `gir_bitfield`,
  `gir_enum_member`, `gir_bitfield_member`, `gir_record_field`.
- Add `stability : string option` to the same set.
- Update the unified `entity` conversion in `types.ml` (`to_entity`-style
  helpers around lines 233/249/265) to propagate the new fields.

`gir_param` is not `[@@deriving sexp]`; no sexp/pretty-printer update is
needed. Only the construction site in `gir_parser.ml` `parse_parameters`
must be updated.

### A2. Parser capture (spec §3, §10.2, §12.4, §12.5)

In `lib/parse/gir_parser.ml`:

- **`parameter`**: in `parse_param_contents`, handle `| `El_start ((_, "doc"), _) -> param_doc := element_data input ()` (currently falls into the catch-all `skip_element`). Store into a new ref and set `param_doc` at construction.
- **`class` / `interface`**: handle the `<doc>` child in `parse_class_contents` / the interface contents loop (currently catch-all `skip_element`). Set `class_doc` / `interface_doc` from it instead of `None`.
- **`property`**: `parse_prop_contents` already reads `<doc>` into a local `doc` ref but constructs `prop_doc = None`. Change to `prop_doc = !doc`.
- **`enum` / `bitfield`**: capture the type-level `<doc>` and set `enum_doc` / `bitfield_doc` instead of `None` (currently hardcoded at construction).
- **`deprecated` / `doc-deprecated` / `stability`**: for every entity, read the `deprecated` attribute (and `deprecated-version`), the nested `<doc-deprecated>` element via `parse_doc_text`, and the `Stability` attribute; store in the new fields. Use the existing `get_attr` / `element_data` helpers.

Update `test/integration/gir_parser_tests.ml`: the assertions
`class_doc = None` and `prop_doc = None` become expectations of captured text;
add assertions for `param_doc`, `deprecated`, `stability`.

### A3. Doc model (spec §7.2, §11, §12)

Create `lib/generate/doc_generation.ml` (and `.mli`) with a `Doc.t` record:

- `synopsis : string option` — the first-line `[f x]`-style line (synthetic
  when there is no GIR doc, spec §11; absent when the GIR doc provides the
  first line).
- `body : string` — converted odoc markup (may be empty).
- `params : (string * string) list` — `@param` tags in declaration order.
- `return : string option` — `@return`, including the `throws`/`result`
  description (spec §12.2). **No `@raise` field exists.**
- `since : string option`.
- `deprecated : string option` — the `@deprecated` text (already
  cross-link-converted, spec §12.4).
- `stability_note : string option` — `{i Unstable API.}` for `Unstable`
  (spec §12.5).
- `heading : string option` — grouping heading for the item (e.g.
  `{1 Methods}`), when the item leads a section.

Provide `Doc.to_comment : Doc.t -> string` emitting `(** ... *)` with the
fixed tag ordering (spec §7.2): synopsis/body, `@param`*, `@return`,
`@since`, `@deprecated`. No `@raise` is ever emitted.

### A4. Markup pipeline (spec §8)

Create `lib/generate/doc_markup.ml` with deterministic, pure transformations:

- `sanitize_doc` — reuse/extend `Utils.sanitize_doc` (escape `*)`, `(*`).
- `escape_odoc_meta` — escape `{`, `}`, `[`, `]`, `@` outside recognised
  markup (spec §8.1).
- `convert_literals` — `%NULL`→`[None]`, `%TRUE`/`%FALSE`, bare `TRUE`/`FALSE`,
  `@param_name`→`[param_name]` (spec §8.2).
- `convert_c_types` — map `GtkFoo *` etc. to public L1 type paths using the
  reference table (spec §8.2); this and `convert_references` share the table.
- `convert_references` — parse `[kind@Ns.Name.member]` / `::signal` /
  `:property` and rewrite to odoc `{!...}`, external `{{:url}text}`, or
  stripped text (spec §9). The reference parser/rewriter is built in Phase D;
  this function is the integration point.
- `format_for_odoc` — assemble the final comment string with the §7.5
  whitespace rules (no blank line between comment and element; one blank line
  between sections).

`Doc.t` is built by running raw GIR text through this pipeline. The pipeline
must be layer-aware (L1 vs L2 reference targets, `self` adaptation — spec §4.2,
§9.5 layer-matching rule); pass the target layer and the owning entity as
parameters.

### A5. Reference resolution table (spec §9.2, §9.5, §13.4)

Create `lib/generate/reference_resolution.ml` (and `.mli`). Build a table from
the generation context mapping GIR `(namespace, kind, name, member)` to public
OCaml paths. Use the existing `ctx.cross_references` (entity-level metadata for
other namespaces) and `ctx.module_groups` (class_name → combined_module_name),
plus the current namespace's own entities. Reuse
`Utils.external_namespace_to_module_name` / `internal_namespace_to_module_name`
for casing. Key requirements:

- Paths are **public alias paths**, never internal `_and__` paths (spec §13.4):
  L1 → `Ocgtk_<ns>.<Ns>.Wrappers.<Entity>` (or the cyclic inner-module alias),
  L2 → `Ocgtk_<ns>.<Ns>.<Entity>.<entity>_t` (resolved through the shim for
  cyclic entities).
- This table is **separate from** `type_mappings.ml`, which keeps emitting
  internal combined paths for signature *type* references.
- Cross-namespace enum/bitfield resolution must target the *target* namespace's
  enums module (`Ocgtk_<ns>.<Ns>_enums.<enum>`); the current
  `Utils.enums_module_name` / `bitfields_module_name` use `ctx.namespace` and
  carry a FIXME — add a target-namespace variant here (Phase D implements the
  rewriter; the helper lands here).
- Member-existence for cross-namespace references is assumed when the target
  entity is generated (spec §9.2 step 1) — no per-member AST loading across
  namespaces.

### A6. Tests

- `gir_gen/test/documentation_markup_tests.ml` (new): unit tests for each
  pipeline stage (`escape_odoc_meta`, `convert_literals`, `convert_c_types`,
  `format_for_odoc`).
- Update `gir_gen/test/integration/gir_parser_tests.ml` for the new AST fields.

## 2. Phase B — Layer 1 Documentation

Goal: every Layer 1 `.mli` carries converted GIR docs, odoc grouping headings,
and synthetic synopses where no GIR doc exists.

### B1. Module-level comments and grouping headings (spec §5.1, §5.3, §6)

In `lib/generate/layer1/layer1_main.ml`:

- `generate_ml_interface` already emits `(** %s *)` from `class_doc` via
  `Utils.sanitize_doc`; replace with the markup pipeline producing a full
  `Doc.t` (heading `{1 <EntityName>}` + body + `@since` + `@deprecated` +
  stability note).
- Replace the plain `(* Methods *)` / `(* Properties *)` comments with odoc
  floating headings `(** {1 Methods} *)` etc., in the spec §6 order:
  `Hierarchy accessors`, `Constructors`, `Methods`, `Properties`, `Signals`.
  Emit a heading only when its section is non-empty. One blank line after a
  grouping heading; no blank line between a doc comment and its element
  (spec §7.5).

### B2. Constructor, method, property docs (spec §5.4, §5.5, §5.6)

- `layer1_constructor.ml`: stop unconditionally emitting
  `(** Create a new %s *)`. Build a `Doc.t` from `ctor.ctor_doc` when present
  (via the pipeline); otherwise emit the §11 synthetic synopsis
  (`[new_<…> args] creates a new [<entity>].`). Add `@param` tags from
  `param_doc`, `@return` from §12.2 (including `throws`/`result`), `@since`,
  `@deprecated`.
- `layer1_method.ml`: replace `Utils.sanitize_doc meth.doc` with the pipeline.
  Same tag set.
- `layer1_property.ml`: attach the converted property doc to both getter and
  setter externals, mechanically split/adapted per §5.6. When the property is
  not generated because a getter/setter method takes precedence, emit no
  property doc (the method carries it).

### B3. Signal docs (spec §5.7, §11)

`lib/generate/signal_gen.ml`: `emit_l1_val` (and `emit_l1_let`) currently emit
no doc. Add a `Doc.t` whose synopsis is the §11 synthetic first line
(`[on_<sig> ~callback t] connects [callback] to the [<sig>] signal.`) and
whose body is the converted `gir_signal.doc` (when present). Add `@param`
(`after`, `callback`, signal params), `@return`, `@since`. This is from-scratch
emission.

### B4. Enum/record docs (spec §5.9, §5.10)

- `enum_code.ml`: replace the four `Utils.sanitize_doc` call sites with the
  pipeline. Type-level comment = `{1 <Name>}` + converted `enum_doc`/
  `bitfield_doc` + `@since`. Per-constructor inline comment = converted
  `member_doc`/`flag_doc`. Add synthetic synopses for `_of_int`/`_to_int`
  converters (spec §11).
- Records: the module-level doc already flows through `generate_ml_interface`'s
  `class_doc` param (`entity.doc` ← `record_doc`, which is parsed), so Phase B1
  covers it. Record *field* comments (spec §5.10) apply only to non-opaque
  records with generated field accessors; until field accessors are generated,
  document the record type only. Locate the record-type emitter (records reuse
  the `layer1_main.ml` path via `bin/gir_gen.ml`) and attach `field_doc`
  comments when fields are emitted.

### B5. Synthetic synopses (spec §11)

Centralise the §11 synopsis producers (either in `doc_generation.ml` or a small
`doc_synopsis.ml`):

- Hierarchy accessor `as_<type>` (`layer1_main.ml` / `layer1_helpers.ml`).
- Enum/bitfield converters `_of_int` / `_to_int` (`enum_code.ml`).
- Signal connector `on_<sig>` (`signal_gen.ml`) — Phase B3.
- Docless `new_*` constructors (`layer1_constructor.ml`) — Phase B2.

A synthetic synopsis is prepended **only** when the underlying GIR element has
no doc. It carries no `@param`/`@return`/`@since`.

### B6. Tests

`gir_gen/test/documentation_corpus_tests.ml` (new): golden/corpus tests
recording the first ~40 lines of representative Layer 1 `.mli` files (e.g.
`button.mli`, `gtk_enums.mli`) so formatting changes are visible in diffs.

## 3. Phase C — Layer 2 Documentation

Goal: every Layer 2 `.mli` (standalone `g<Entity>.mli` and combined
`g<First>__and__<Rest>.mli`) carries the same GIR text, adapted to the class
API, with `self` rewriting and Inherits/Implements blocks.

### C1. Class type and module comments (spec §4.2, §5.1, §5.2)

`lib/generate/class_gen.ml`:

- `generate_class_module` / `generate_class_signature`: emit a module-level
  `Doc.t` (heading + converted entity doc + `@since` + `@deprecated` +
  stability) as the file's top comment, and a preceding comment on the
  `class type <entity>_t = object …` carrying the `{1 Inherits}` /
  `{1 Implements}` blocks (resolved L2→L2, spec §5.1, §9.5).
- The doc text uses the **same** pipeline as Layer 1 (spec §4.2); only the
  reference target paths and `self` adaptation differ. Pass the L2 layer to the
  pipeline so `gtk_button_set_label(button, label)` → `button#set_label label`,
  `GtkButton *button` → implicit `self`, `@button` → `self`.

### C2. Method and constructor wrapper comments (spec §5.4, §5.5)

`class_gen_method.ml` and the constructor wrapper generator
(`class_gen.ml` `generate_constructor_impl`/`generate_constructor_sig`):
attach a `Doc.t` to each `method` and `val new_*`, with C-style references
rewritten to `self` and L2 targets. Synthetic synopsis for docless `new_*`
(spec §11).

### C3. Cross-layer links (spec §4.2, §9.5)

L2 docs refer to L2 class types/methods where they exist and fall back to L1
values/types only when no L2 counterpart exists. The layer-matching rule
(reference site L2 → target L2 form; L1 → L1; fallback to the other layer) is
implemented in the reference rewriter (Phase D) and invoked from the pipeline.

### C4. Tests

Extend `documentation_corpus_tests.ml` with representative Layer 2 `.mli`
golden checks (e.g. `gButton.mli`).

## 4. Phase D — Cross-Linking and External References

Goal: GIR `[kind@…]` references become odoc references, external links, or
stripped text per spec §9.

### D1. Reference parser

A small parser for GIR reference syntax: `[kind@Namespace.Name.member]`,
`[kind@Namespace.Name::signal]`, `[kind@Namespace.Name:property]`,
`[kind@Namespace.Name]`. Kinds: `ctor`, `method`, `property`, `signal`,
`class`, `iface`, `struct`, `enum`, `flags`, `func`, `vfunc`, `alias`.

### D2. Reference rewriter (spec §9.1, §9.2, §9.4, §9.5)

Using the Phase A5 table:

- Map known kinds to odoc reference forms via the **public module path** and
  the **layer-matching rule** (site layer picks target layer; fallback to the
  other layer).
- Cross-namespace enums/bitfields resolve to the target namespace's
  `<Ns>_enums` module using the new target-namespace helper (not
  `ctx.namespace`).
- `vfunc`, `alias`, and any kind without a generated binding: strip markup,
  keep bare text wrapped in `[...]` if short code (spec §9.4). No external
  link.
- For `Graphene` / `Cairo` entities that are **not** generated: strip (no
  external link — they are not on `docs.gtk.org`, spec §9.3).

### D3. External URL builder (spec §9.3)

Hardcoded per-namespace slug table (verified against `docs.gtk.org`):

| GIR namespace | slug |
|---------------|------|
| `Gtk`         | `gtk4` |
| `Gdk`         | `gdk4` |
| `Gsk`         | `gsk4` |
| `Gio`         | `gio` |
| `Pango`       | `Pango` |
| `PangoCairo`  | `PangoCairo` |
| `GdkPixbuf`   | `gdk-pixbuf` |
| `GLib`        | `glib` (external only) |
| `GObject`     | `gobject` (external only) |

URL pattern: `https://docs.gtk.org/<slug>/<kind>.<Entity>[.<member>].html`
with gi-docgen kind segments (`class`, `iface`, `struct`, `enum`, `flags`,
`func`, `method`, `property`, `signal`, `ctor`, …). Make the base overridable
per namespace via a generator flag, but default to this table. `Graphene` and
`Cairo` are absent (strip, per D2).

### D4. Integration

Wire `convert_references` (Phase A4) to D1–D3. Cross-namespace internal links
always take precedence over external links for anything we generate.

### D5. Tests

- Unit tests for reference parsing and rewriting (each kind, same- and
  cross-namespace, layer-matching, fallback, stripping).
- A test that `[method@Gtk.Button.set_label]` becomes the expected odoc
  reference in both an L1 and an L2 site.
- A test that an ungenerated `vfunc`/`alias`/`Graphene` reference is stripped
  with no external link.

## 5. Phase E — Cyclic Entity Documentation

Goal: entities in combined cyclic files (and their shims/aliases) carry the
same documentation as standalone entities (spec §13).

### E1. Layer 1 inner-module doc-lifting (spec §13.2)

`lib/generate/layer1/layer1_main.ml` `generate_combined_module_entity` /
`generate_module_signature`: place the entity `Doc.t` as the **first special
comment inside each inner module's `sig`** (heading `{1 <EntityName>}` + body +
`@since`). Per-member docs follow inside the same `sig` as in §5.

### E2. Layer 2 shim as primary target (spec §13.1, §13.2)

`lib/generate/class_gen.ml` `generate_cyclic_shim_module` /
`generate_cyclic_shim_signature` (lines ~381–449): emit the entity `Doc.t` as
the shim file's top comment **and** as the preceding comment on the single
`class type <entity>_t = G<Combined>.<entity>_t` declaration, including the
`{1 Inherits}` / `{1 Implements}` blocks. The shim is the authoritative public
page; this always works because the class type is not `and`-chained.

### E3. Layer 2 combined file best-effort (spec §13.2)

`class_gen.ml` `generate_combined_class_module` /
`generate_combined_class_signature`: repeat the entity doc best-effort on each
`and`-chained `class type` (preceding comment attempted; fallback = leading
heading comment inside `object … end` if odoc rejects the preceding form —
confirmed in Phase G). This is a deliberate duplicate of the shim's docs so the
combined page is not bare.

### E4. Public alias pages (spec §13.3, §14.2)

`lib/generate/library_module.ml`:

- `Wrappers` submodule aliases (`module Button = Button` / cyclic
  `module Context = Context_and__….Context`): add the entity synopsis
  (`{1 <EntityName>}` + first paragraph + `@since`) and a pointer to the full
  page.
- L2 class aliases (`module Button = GButton` / cyclic
  `module Context = GContext`): add the synopsis + a pointer to
  `{!class-type:G<Button>.<button>_t}` (or the shim for cyclic entities).

### E5. Cross-reference targets (spec §13.4)

The Phase A5 reference table already maps cyclic entity names to public alias
paths. Verify references *into* cyclic entities (including Inherits/Implements)
resolve to `Ocgtk_<ns>.<Ns>.<Entity>.<entity>_t`, never the `_and__` path.

### E6. Tests

Corpus tests for a representative cyclic group (e.g. Pango
`font_face_and__font_family` / `gFont_face_and__font_family` + the
`gFont_face.mli` shim, and the `Pango.mli` alias lines).

## 6. Phase F — Namespace Overview and `index.mld`

Goal: each namespace has a useful landing page and a self-contained entry
module (spec §14).

### F1. Namespace entry module overview (spec §14.1)

`lib/generate/library_module.ml` `generate_library_interface`: emit a first
special comment with `{0 <Ns> bindings}`, a synopsis from the namespace
`<doc>`, `{1 Layer 1 wrappers}` and `{1 Layer 2 classes}` headings pointing at
`Wrappers` and the `G*` modules, and a `{!modules: ...}` index when useful.
The current file's first comment is a `Wrappers` section comment, not a module
overview — add the module overview above it.

### F2. Per-alias synopsis docs (spec §14.2)

Covered by E4 for class aliases; apply the same synopsis comment to every
public alias (class/interface/record), both L1 `Wrappers` and L2.

### F3. `index.mld` generation (spec §14.3)

For each of the nine namespace libraries, generate `ocgtk/src/<ns>/doc/index.mld`
with `{0 <NamespaceName> bindings}`, a short description (from the namespace
`<doc>` or a static template), and entry-point links
(`{!module:Gtk}` / `{!module:Gtk_enums}` or `{!modules: Gtk Gtk_enums}`).
Generate `ocgtk/src/<ns>/doc/dune` containing
`(documentation (package ocgtk.<ns>))`. Generate a root
`ocgtk/doc/index.mld` + `ocgtk/doc/dune` with
`(documentation (package ocgtk))` linking the nine namespace pages.

Wire generation into `bin/gir_gen.ml` so `scripts/generate-bindings.sh`
emits these files alongside the bindings. Add the `doc/` dirs to the relevant
`dune` includes / `(include_subdirs unqualified)` so dune picks them up.

### F4. Tests

Verify generated `index.mld` files appear at the per-library paths and contain
the expected `{0}` heading and module links; verify each `doc/dune` has the
`(documentation (package ocgtk.<ns>))` stanza.

## 7. Phase G — Verification and Cleanup

### G1. Regenerate bindings

Run `scripts/generate-bindings.sh`. Run `dune build` and fix compile errors
caused by malformed comments (unescaped `{`/`}`/`@`, ambiguous comments,
blank-line placement). Do not filter `dune build` output.

### G2. odoc L2-attachment experimentation gate (spec §15 risks 1–2)

**This is a decision gate, not just a verification step.** Before full
regeneration, build the smallest representative slice with `dune build @doc`:
one standalone L2 class (e.g. `gButton`) and one cyclic L2 group (e.g.
`gFont_face` shim + `gFont_face_and__font_family`). Inspect odoc warnings and
the rendered HTML to confirm:

1. The **shim** preceding-comment form attaches cleanly to its single
   `class type` (expected: yes).
2. Whether odoc attaches a preceding comment to an **`and`-chained** `class
   type` in the combined file, and whether the `object … end` fallback renders.
   Record the working form; if neither works, the combined-file page is
   best-effort-only (the shim remains authoritative) — update spec §13.2.
3. The exact disambiguated odoc form for a **class method** reference
   (`{!method:button_t.set_label}` vs `{!method:Ocgtk_gtk.Gtk.Button.button_t.set_label}`
   vs odoc3 `{!/…/…}`). Record the working form; update spec §9.1 if it differs.

Only after this gate confirms the forms, proceed to full regeneration.

### G3. Full odoc build

Run `dune build @doc`. Resolve all odoc warnings (broken references, ambiguous
comments, unescaped markup). Set `(env (odoc (warnings fatal)))` consideration
for CI once clean.

### G4. HTML inspection

Open `_build/default/_doc/_html/index.html` and spot-check:

- Namespace landing pages render with the `{0}` heading and module links.
- Class/module synopsis on index pages and in `{!modules:...}` lists.
- Grouped headings for constructors/methods/properties/signals.
- Working cross-links (L1↔L2, cross-namespace, cyclic public-alias paths).
- Correct external links for GLib/GObject; no external links for
  Graphene/Cairo/`vfunc`/`alias`.
- `%NULL` absent; `[None]` present. `@since`/`@deprecated` present where
  applicable.

### G5. Whitespace/placement audit (spec §7.5)

Verify across representative files: no blank line between a doc comment and its
element; exactly one blank line between sections; grouping comments are
`(** {1 …} *)`; no blank line between a record field and its inline comment.

### G6. Final tests

Run `dune test gir_gen/ && xvfb-run dune test ocgtk/` from the repo root. Do
not filter output.

## 8. Files to Touch

| File | Change |
|------|--------|
| `gir_gen/lib/types.ml` | add `param_doc`, `deprecated`, `deprecated_version`, `doc_deprecated`, `stability` fields; propagate in entity conversion |
| `gir_gen/lib/parse/gir_parser.ml` | capture `<doc>` for class/interface/property/enum/bitfield; capture `<parameter><doc>`; capture `deprecated`/`<doc-deprecated>`/`Stability` |
| `gir_gen/lib/utils.ml` | possibly extend `sanitize_doc` (shared with markup pipeline) |
| `gir_gen/lib/generate/doc_markup.ml` (new) | GIR→odoc text pipeline (spec §8) |
| `gir_gen/lib/generate/doc_generation.ml` (new) | `Doc.t` model + `to_comment` (spec §7.2, §11, §12) |
| `gir_gen/lib/generate/doc_synopsis.ml` (new, optional) | §11 synthetic synopsis producers |
| `gir_gen/lib/generate/reference_resolution.ml` (new) | GIR→public-alias path table; target-namespace enums helper (spec §9.2, §9.5, §13.4) |
| `gir_gen/lib/generate/layer1/layer1_main.ml` | module-level `Doc.t`; odoc `{1 …}` grouping headings; combined inner-module doc-lifting (spec §6, §13.2) |
| `gir_gen/lib/generate/layer1/layer1_method.ml` | pipeline-based method docs |
| `gir_gen/lib/generate/layer1/layer1_constructor.ml` | GIR-doc-when-present + synthetic-when-absent; stop unconditional `Create a new %s` |
| `gir_gen/lib/generate/layer1/layer1_property.ml` | getter/setter property docs (spec §5.6) |
| `gir_gen/lib/generate/signal_gen.ml` | from-scratch signal connector docs (spec §5.7, §11) |
| `gir_gen/lib/generate/enum_code.ml` | pipeline-based type + member docs; synthetic converter synopses |
| `gir_gen/lib/generate/class_gen.ml` | L2 class-type/module docs; method/ctor wrapper docs; shim doc-lifting (E2); combined best-effort (E3) |
| `gir_gen/lib/generate/class_gen_method.ml` | L2 method docs with `self` adaptation |
| `gir_gen/lib/generate/library_module.ml` | namespace overview comment (F1); per-alias synopsis docs (E4/F2) |
| `gir_gen/bin/gir_gen.ml` | wire `index.mld` + per-library `doc/dune` generation (F3) |
| `ocgtk/src/<ns>/doc/index.mld` (new, generated) | per-namespace landing page (spec §14.3) |
| `ocgtk/src/<ns>/doc/dune` (new, generated) | `(documentation (package ocgtk.<ns>))` |
| `ocgtk/doc/index.mld` (new, generated) | root package landing page |
| `ocgtk/doc/dune` (new, generated) | `(documentation (package ocgtk))` |
| `scripts/generate-bindings.sh` | emit per-library `doc/` files |
| `gir_gen/test/documentation_markup_tests.ml` (new) | pipeline unit tests |
| `gir_gen/test/documentation_corpus_tests.ml` (new) | golden file checks (L1, L2, cyclic) |
| `gir_gen/test/integration/gir_parser_tests.ml` | update doc/deprecation/stability assertions |

P4 (namespace-level free functions) is explicitly **out of scope** for this
milestone (spec §5.8); their docs will be added when P4 lands.

## 9. Verification Checklist

- [ ] `dune build` passes after regeneration (full, unfiltered output).
- [ ] `dune test gir_gen/` passes.
- [ ] `xvfb-run dune test ocgtk/` passes.
- [ ] Parser captures `class_doc`, `interface_doc`, `prop_doc`, `enum_doc`,
      `bitfield_doc`, `param_doc`, `deprecated`, `doc_deprecated`, `stability`.
- [ ] `gir_parser_tests.ml` updated assertions pass.
- [ ] odoc L2-attachment gate (G2) confirms the working forms; spec updated.
- [ ] `dune build @doc` produces HTML with no odoc warnings.
- [ ] Each namespace has a `doc/index.mld` landing page; root `ocgtk/doc/index.mld` links them.
- [ ] A representative class page has a synopsis and grouped `{1}` headings.
- [ ] Clicking a method cross-reference from a class doc reaches the target.
- [ ] Cross-references into cyclic entities resolve to public alias paths,
      not `_and__` paths.
- [ ] Cyclic L2 entity docs appear on the shim page (authoritative) and the
      combined page (best-effort).
- [ ] `%NULL` does not appear in generated docs; `[None]` does.
- [ ] `@since`/`@deprecated` tags appear on versioned/deprecated entities;
      `Unstable` entities carry `{i Unstable API.}`.
- [ ] No `@raise` tag is emitted anywhere; `throws` functions describe errors
      in `@return` (`[Ok …]`/`[Error e]`).
- [ ] External links use the correct per-namespace slug; no external links for
      `Graphene`/`Cairo`/`vfunc`/`alias`.
- [ ] Skipped methods (callbacks, unsupported arrays, variadic) are absent.
- [ ] Whitespace/placement matches spec §7.5 (G5 audit).