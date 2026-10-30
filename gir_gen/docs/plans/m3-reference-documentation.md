# M3 Reference Documentation — Design

GIR `<doc>` text is parsed into the AST, translated to odoc markup, linked to
the generated symbols it names, and emitted into the layer 1 and layer 2
bindings, so that `dune build @doc` produces browsable HTML with the upstream
prose. Every PR gets a rendered preview, and a local tool diffs the rendered
HTML of two commits.

This document records the design as built. The GIR → odoc mapping research
(corpus measurements, odoc probes, the alternatives considered) is in the
[research PRD](../research/reference-documentation.md); section numbers
below (§n) refer to it. Cross-namespace member links extend the resolver
described here; see
[cross-namespace-member-references](cross-namespace-member-references.md).

Module paths follow the per-package layout
([library-layout.md](./library-layout.md)): layer 1 is `Oc<ns>.Raw.<Type>`,
layer 2 is `Oc<ns>.<Type>`, enums are `Oc<ns>.Enums`, constants are
`Oc<ns>.Constants`.

## Pipeline

```
GIR <doc> ──Gir_parser──▶ AST fields (raw GIR markdown)
          ──Doc_parse───▶ Doc_ast.t        (incl. Doc_c_idiom rewrites)
          ──Doc_resolve─▶ Doc_ast.t        (Sym_ref → Ref, against Doc_index)
          ──Doc_render──▶ odoc markup
          ──Doc_emit────▶ doc comment / ocaml.doc attribute in the .mli/.ml
dune build @doc ──▶ odoc HTML ──▶ PR preview (gh-pages) / doc_diff (local)
```

| Module (`gir_gen/lib/generate/`) | Role |
|---|---|
| `Doc_ast` | The flat AST, the translation `context`, fallback events, `equal_t`. |
| `Doc_parse` | GIR markdown → AST. Owns sigil guards and parse-time strips. |
| `Doc_c_idiom` | C literal names, the C primitive lookup, null phrases, the ownership-sentence filter. |
| `Doc_index` | What a reference can link to: types, constants and members per namespace, by GIR and C name. |
| `Doc_resolve` | `env`, `resolve`: endpoint parsing, odoc paths, layer routing, miss reasons, the resolution summary. |
| `Doc_render` | AST → odoc markup. Escaping, heading policy, balance fallbacks, comment-hazard neutralisation. |
| `Doc_translate` | `translate` (= render ∘ parse) and the AST re-exports. |
| `Doc_emit` | `translate` (= render ∘ resolve ∘ parse) and `item_doc`: assembly, tags last, sanitisation, comment-vs-attribute form and placement. The one entry point emission sites use. |
| `Entity_doc` | Canned and assembled docs for modules, class types, classes, constructors, property accessors, headings. |
| `Emitted_members` | What each class, interface and record emits at each layer under its OCaml names. Drives both the emitters and the member index. |
| `Doc_str` | Shared character and string predicates for parse and render. |

## Decisions

1. **Emission is always on, and the bindings are committed with their
   docs.** There is no `--with-docs` flag. The committed tree stays
   byte-identical to a fresh regeneration, so a commit's rendered docs can be
   built from its tree alone, which both the preview and the HTML diff rely
   on.

2. **Both layers.** Every site kind that exists at layer 1 and layer 2 gets
   its doc at both. Enums and constants are shared by the layers.

3. **Link only to targets known to be generated.** A broken `{!…}` is an
   odoc warning, and the build has 0 odoc warnings. The resolver links a
   reference only when the index says the target was emitted at the doc's
   layer, and renders everything else as the code span it would otherwise
   be. Link text is the code span, so the only visible difference between a
   resolved and an unresolved reference is the link.

4. **Tags are terminal; prose goes first.** An odoc `@tag` runs to the end of
   the comment or the next tag. `@param` sigils in GIR prose render as code,
   any other literal `@` is escaped, and the real tags (`@since`) are
   appended after the prose. `@param`/`@return`/`@deprecated` tags are not
   emitted.

5. **C idioms are translated.** `%TRUE`/`%FALSE`/`%NULL` and `#gint`-style
   primitives become their OCaml readings; sentences telling the caller to
   free or unref a value are stripped, because the GC owns every value and
   the sentence is wrong for OCaml.

6. **Warnings are reported, not gated.** The preview workflow classifies
   odoc's warnings and reports them; there is no CI gate. The working
   standard is 0 odoc warnings, and a warning introduced by a generator
   change is treated as a bug.

7. **Rendered HTML never lands on a code branch.** It lives on the
   auto-managed `gh-pages` branch and in local build directories.

## Parsing

The parser captures every doc-carrying element and attribute the translator
and the page structure need (`gir_gen/lib/parse/gir_parser.ml`,
`gir_gen/lib/types.ml`). Doc text is read with `parse_doc_text` at every
site, which skips stray nested markup.

| Source | AST field |
|---|---|
| `<doc>` on class, interface, record, enum, bitfield | `class_doc`, `interface_doc`, `record_doc`, `enum_doc`, `bitfield_doc` |
| `<doc>` on method, constructor, function, signal, property, constant, field, member | `*_doc` on each |
| `<doc>` on `<parameter>` | `param_doc` |
| `<doc>` on `<return-value>` | `return_doc` on methods, functions, signals |
| `deprecated`, `deprecated-version`, `<doc-deprecated>` | `deprecation : gir_deprecation option` on every entity and member |
| `<doc:format name=…>` | `repository_doc_format` (diagnostics only, never a dispatch key, §3.2) |
| `abstract="1"` on a class | `abstract` (selects the no-constructor text) |
| `default-value=` on a property | `prop_default` (shown in the property fallback) |

```ocaml
type gir_deprecation = {
  deprecated : bool;
  deprecated_version : string option;
  deprecated_doc : string option;  (* <doc-deprecated> prose *)
}
```

`param_doc`, `return_doc`, `deprecation` and `repository_doc_format` are
parsed for the tag emission that is still out of scope. `<instance-parameter>`
docs, `<docsection>` (Graphene, Gtk) and a `Stability` attribute (no corpus
hits) are not captured.

## Translator

### AST

Two levels: a flat list of blocks, each a flat list of inline spans. GIR
prose never needs deeper nesting.

```ocaml
type inline =
  | Text of string                 (* raw prose; escaped at render *)
  | Code of string                 (* literal `code` from the source *)
  | Bold of inline list
  | Italic of inline list
  | Link of { text : inline list; url : string }      (* https:// links *)
  | Page_ref of { text : inline list; path : string; anchor : string option }
                                   (* relative gi-docgen .html links *)
  | Sym_ref of { kind : sym_kind option; endpoint : string;
                 anchor : string option; origin : sym_origin }
                                   (* [frag@endpoint], #Type, %CONST, foo() *)
  | Param_ref of string            (* @param sigils *)
  | C_lit of c_lit                 (* True | False | Null *)
  | C_prim of string               (* #gint and friends *)
  | Ref of { path : string; text : string }
                                   (* resolved {!path}; only Doc_resolve makes it *)

and sym_origin = Fragment | Hash | Percent | C_call

type block =
  | Para of inline list
  | Heading of int * inline list   (* raw GIR level; policy at render *)
  | List of bool * inline list list
  | Code_block of string

type t = { blocks : block list }
```

**References get their own nodes.** "This was literal code" (`Code`) and
"this is a reference" (`Sym_ref`, `Page_ref`) stay distinct, so resolution
and the upstream-URL mapping are pure AST rewrites rather than re-parses of
rendered text. Anchors are kept on the nodes even though odoc has no
equivalent to link them to.

**Stage boundaries.** Parse does no escaping and produces no odoc syntax;
render makes no policy decisions beyond the `context` (entity or member doc)
it is given, and looks nothing up. Only the resolver produces `Ref`.

### Parse

- gi-docgen fragments `[kind@endpoint]` → `Sym_ref { origin = Fragment }`
  with the kind from the keyword. An unclosed fragment (an upstream typo) is
  literal text.
- Legacy sigils `#Type`, `#Type:prop`, `#Type::sig`, `%CONST` → `Sym_ref`
  with origin `Hash` or `Percent`, under the §3.5 guards (uppercase start,
  `#` not after `/`, not a heading, URL fragment or hex colour). A hyphen
  between identifier characters is part of the name
  (`#GApplication::command-line`).
- C calls: an identifier containing `_` followed by `()` or ` ()`, not
  continuing a word, path or member access, and not after `[` (so a second
  parse of rendered output does not wrap it again) → `Sym_ref { origin =
  C_call }`. C calls inside code spans stay code.
- `@name` → `Param_ref`.
- C idioms (`Doc_c_idiom`): `%TRUE`/`%FALSE`/`%NULL` and backticked bare
  `TRUE`/`FALSE`/`NULL` → `C_lit`; `#g<primitive>` → `C_prim`. A code span
  holding more than the bare literal stays `Code`.
- Ownership filter: a sentence that instructs the caller to free, release,
  delete or unref with a `g_*` function is dropped; a paragraph it empties is
  removed. Patterns are instruction-shaped so explanatory mentions of
  `g_object_unref()` survive. Each strip is counted.
- Stripped to plain prose: admonitions (`::: …`), tables, `<picture>`,
  `<img>`, `>` quotes.

### Render policy

| Node | Rendering |
|---|---|
| `Text` | prose with `{ } [ ] @` escaped |
| `Code` | `[code]`, balance-checked |
| `Bold` / `Italic` | `{b …}` / `{i …}` |
| `Link` | `{{:url}text}` |
| `Page_ref` | bare text (counted) |
| `Sym_ref` | `[endpoint]`; a C call as `[name ()]` |
| `Ref` | `{{!path}[text]}`, text balance-checked |
| `Param_ref` | `[name]` |
| `C_lit` | `[true]`, `[false]`; `Null` → `[None]`, or "an [Error] result" in a "…%NULL on error" phrase on an item that throws (`ret_shape = Throws`); "non-%NULL" → "non-[None]"; "NULL-terminated" → "null-terminated" |
| `C_prim` | the generator's own type mapping (`gboolean` → `[bool]`, `gsize` → `[Gsize.t]`); `gpointer` → "pointer"; unmapped names stay literal |
| `Heading` | entity docs: normalised, shallowest → `{1 …}`, capped at `{5}`; member docs: `{b …}` lead-in (odoc demotes headings in item docs) |
| `List` | odoc shortcut lists |
| `Code_block` | `{[ … ]}` |

### Correctness invariants

Each has a unit test, and the corpus smoke test checks them over every
bundled `<doc>` (~39,700).

1. **Comment safety.** No emitted comment contains an unneutralised `*)` or
   `(*`, including inside code spans and `{v … v}` blocks, which OCaml lexes
   regardless of odoc. Sanitisation runs on the final assembled comment,
   after every fallback.
2. **Escaping** of odoc-special characters in prose.
3. **Balance.** A code span whose content contains `]` falls back to escaped
   prose; a `{[ … ]}` block containing `]}` falls back to `{v … v}`, else is
   stripped. Every fallback is counted.
4. **Tags last** (decision 4).
5. **No re-translation.** No emission site feeds translator output back
   through the translator. String idempotence is false by construction; the
   structural round trip `parse (render (parse x)) ≅ parse x` holds and is
   tested.

## Cross-reference resolution

### Index

`Doc_index` is built once per namespace and carried on the generation
context (`Types.doc_index`; `Types` cannot depend on `generate/`, so the
type lives there and the module builds it).

- **Types and constants** of the current namespace come from the context,
  filtered by the same `should_generate_*` predicates as the emitters. Those
  of every other generated namespace come from its references file, which
  lists only generated types and constants (`Constant_code.is_generated`).
- **Members** (methods, constructors, signals, properties, enum and bitfield
  members) come from `Emitted_members`, added by `Doc_index.with_members`
  once the context and its module groups exist. Other namespaces' members
  come from the member tables in their references files.
- **C names**: types by C type, constants by C identifier, and methods,
  constructors and enum/bitfield members by C identifier.

`Emitted_members` is the single selection of what an entity emits at each
layer and under which OCaml name. The emitters take their member lists from
it, so the index cannot disagree with the output. It accounts for every drop
and rename: `Filtering.should_skip_method_binding` (unknown types, varargs,
not introspectable, unsupported arrays, record copy/free/unref);
L2-only drops (out parameters, names declared by an ancestor or an
implemented interface, earlier duplicates); keyword renames
(`Utils.ocaml_function_name`, `Class_gen_helpers.ocaml_method_name`,
`Utils.ocaml_constructor_name`); `Signal_gen.classify` errors; and
`Filtering.should_generate_property` (array types, no mapping, claimed by a
method's `glib:get-property`/`glib:set-property`), plus L2 accessor-name
clashes.

### Resolver

`Doc_resolve.resolve : env -> Doc_ast.t -> Doc_ast.t * outcome list`, with
`env = { namespace; layer; index }` from `env_of_ctx`.

- **Endpoint parsing.** A first component naming a known namespace selects
  it; otherwise the endpoint is relative to the current one. Signal and
  property names match with either separator; enum members match in upper
  case with underscores.
- **Paths**, built with `Module_paths`, always with an explicit odoc kind so
  a type cannot resolve to a same-named value:

  | Target | From a layer 1 doc | From a layer 2 doc |
  |---|---|---|
  | class, interface, record | `Oc<ns>.Raw.<T>` | `Oc<ns>.<T>.class-type-<t>_t` |
  | method, signal (`on_<s>`) | `Oc<ns>.Raw.<T>.val-<m>` | `….class-type-<t>_t.method-<m>` |
  | constructor | `Oc<ns>.Raw.<T>.val-<c>` | `Oc<ns>.<T>.val-<c>` |
  | property | its getter, else its setter, at that layer | |
  | enum, bitfield | `Oc<ns>.Enums.type-<e>` (bitfield members: `type-<f>_flag`) | |
  | enum member | `….type-<e>.constructor-<TAG>` | |
  | constant | `Oc<ns>.Constants.<c>` | |

  Enum, bitfield and constant docs use layer 2 routing, since they are shared
  and layer 2 is the reader-facing layer.
- **By origin.** `#Type` resolves in any generated namespace; `#Type:prop`
  and `#Type::sig` to the member. `%CONST` tries constants (current namespace
  first), then enum and bitfield members. A C call and `[id@symbol]` resolve
  to a method or constructor by C identifier.
- **Misses** stay `Sym_ref` and render as code. Each outcome records a
  reason: `Namespace_not_generated` (GLib, GObject), `Unknown_target`
  (filtered, not emitted at this layer, or not a generated type),
  `Members_not_listed` (a member of a namespace whose references file has
  no member tables), `Kind_not_generated` (functions, callbacks, vfuncs,
  aliases, error domains).
- **Summary.** Generation prints, per namespace, linked and missed counts by
  kind, origin and miss reason, computed by a separate pure pass over every
  doc of the namespace (resolved as layer 2), and lists the distinct
  `Unknown_target` endpoints. Remaining misses are reasons decision 3
  accepts, plus upstream typos.

### odoc limitation: class member docs

odoc 3.2.1 resolves no reference in the doc of a method of a `class` or
`class type`; every form renders as unresolved, without a warning. It links
the declared class signature but renders the page from an expansion it never
links (`class_type` and `class_` in `src/xref2/link.ml`); linking the
expansion as well fixes it. Until odoc does, layer 2 method, signal and
property accessor docs are resolved with `Doc_resolve.class_member`, which
links nothing. Their references stay code. Layer 1 docs and layer 2 module,
class type, constructor, enum and constant docs link normally.

## Emission

### Doc_emit

`Doc_emit.item_doc` translates the raw GIR text, appends `@since` after the
prose, adds trusted `prefix`/`suffix`/`fallback` markup, and sanitises the
result. A new emission site costs one call.

- **Form.** A body OCaml's lexer could misread inside a comment (an ASCII
  `"`, which opens a string literal in a comment, or a quoted-string opener
  `{id|`) is carried as an `[@@ocaml.doc "…"]` attribute; anything else is a
  doc comment.
- **Placement.** A comment goes before a `val`/`external`, after a blank line
  so it cannot read as the previous item's doc (`around`); an attribute goes
  after the item. Polymorphic-variant member docs go after their tag, since
  odoc drops a member doc written before it. A module's floating doc is
  followed by a blank line, so it stays the module preamble (and odoc's
  synopsis) instead of attaching to the first item.

### Sites

| Site | Doc |
|---|---|
| Constants | GIR doc, `@since`; version-only fallback |
| Enum and bitfield types and members | GIR doc |
| L1 module (standalone and each `module rec` arm of a cyclic group) | class doc, then a pointer to the L2 module |
| L2 module | preamble (below), `{1:class Class}`, `{1:description Description}` when the class doc is longer than its synopsis |
| Combined (cyclic) modules, both layers | which public modules re-export their members; each arm, class type and class has its own doc |
| L1 and L2 methods | GIR doc, `ret_shape` from `throws` |
| L1 and L2 constructors | GIR doc, else "Create a new [<class>]. Wraps [<C function>]." linked to the upstream page |
| Signals (L1 `on_<s>`, L2 signal methods) | GIR doc |
| Property accessors, both layers | GIR doc on getter and setter, else the fallback below |
| Record fields | none: no layer emits record fields |
| Package and modules pages | see Pages |

**Property fallback.** An undocumented property's accessors read, for
example, ``Get property: [enable-grid-lines] ([TreeViewGridLines], default
[GTK_TREE_VIEW_GRID_LINES_NONE]). See {{:…}upstream docs}.`` The type is the
GIR type name as code; the default is `default-value=` with C literals
mapped (`NULL` → `[None]`), omitted when absent; "Construct-only." is added
where it applies. The line is built as AST and rendered, so the balance rules
apply. Namespaces without a gi-docgen site get no link. A property with a
`getter=`/`setter=` attribute never reaches the fallback: the named method
claims it, and carries its own doc.

**Upstream links** use a per-namespace base URL and gi-docgen's page
patterns (`ctor.<Type>.<name>.html`, `property.<Type>.<name>.html`).

### Layer 2 page structure

A reader of a layer 2 page is told how the module is laid out, where the
constructors are, and why a class may have none.

- **Module preamble.** The class doc, then a navigation paragraph: methods,
  signals and properties are on `{!class-type-<t>_t}`, constructors under
  `{!section-constructors}`, low-level functions in the layer 1 module. A
  class with no GIR doc starts with "Bindings for [<Class>]." instead, since
  odoc reuses the first paragraph as the synopsis on the parent page, where
  the navigation references do not resolve.
- **`class type <t>_t`.** A bold "The methods, signals and properties of a
  [<Class>]." line, then the inheritance block, then the class doc:

  ```
  Inherits from: {!Ocgtk.Widget.class-type-widget_t}
  Implements:
  - {!Ocgtk.Actionable.class-type-actionable_t}
  ```

  Every implemented interface is listed, including those inherited through
  the parent (the `inherit` lines skip those to avoid diamond inheritance).
  Link text is the ancestor's module path. A parent or interface with no
  layer 2 class (`GInitiallyUnowned`, `ParamSpec`) is code; `GObject.Object`
  is left out. Interfaces list their prerequisites under "Requires:".
  Records get no block. The body is grouped by floating `{2:signals}`,
  `{2:methods}`, `{2:properties}` and `{2:conversions}` (`as_*`) sections,
  each written only when it has emitted members.
- **`class <t>`.** A canned doc: it wraps a raw layer 1 handle; use the
  constructors, except when converting a handle obtained from layer 1.
- **`{1:constructors Constructors}`** on every class page. With no generated
  constructor it is followed by one line: abstract class (GIR `abstract`),
  interface, or "not instantiated directly — used as a return value". A
  missing constructor is almost always a gap in the C library, not the
  bindings.
- **Public paths.** Outside its cyclic group, a member is referenced through
  its own layer 2 module (`Widget.widget_t`), never the combined module, in
  `inherit` lines and member signatures alike. The shim's class type is an
  alias of the combined one, so the types are unchanged.
- No `type t` alias for the class type: `<t>_t` reads better in inferred
  types and errors, and renaming would break the API.

## Pages

odoc page trees are per package, so each package has its own pages under a
`(documentation)` stanza.

- **`<pkg>/index.mld`** (hand-written): synopsis; links to the main module,
  `Enums`, `Constants`, `Raw`, the modules page and the packages it builds
  on; a link to the conventions page. The bundled GIR has no namespace-level
  `<doc>`, so there is nothing to generate here.
- **`<pkg>/generated/modules.mld`** (generated by
  `Library_module.generate_modules_page`, with its own `(documentation)`
  stanza): an intro naming the class modules, `Raw`, `Enums` and
  `Constants`, then `{!modules: …}` lists of the classes, interfaces and
  records. It exists because dune generates the main module, which can carry
  no docs, so its page would otherwise list bare `sig … end`s.
- **`ocgtk/conventions.mld`** (hand-written): the layers, module anatomy,
  naming, type mappings, signals and properties, with Mermaid diagrams
  (`{@mermaid[…]}` blocks plus one script per page that renders each block
  with its own id). It belongs to `ocgtk`'s page tree; other packages link it
  with raw HTML (`../ocgtk/conventions.html`), since odoc cannot resolve page
  references across packages. That link assumes the `@doc` HTML layout.
- **Generated libraries' `.generated_stubs`** are hidden from the odoc index.

## Tooling

### Doc HTML diff

`gir_gen/tools/doc_diff/` ([README](../../tools/doc_diff/README.md)) answers
"what did this change do to the rendered docs": it builds the base commit in
a temporary `git worktree`, builds the working tree, and runs `diff -r` on
the two HTML trees, then removes the worktree. Nothing is regenerated
(decision 1). The diff is meaningful only between builds with the same odoc
and dune. dune's shared cache avoids rebuilds; there is no separate
artifact cache.

### Warning classification

`gir_gen/tools/doc_warnings/` (library `Odoc_warnings` and a CLI) parses a
`dune build @doc` log, keeps the `Warning:` lines that follow a location in a
`.ml`, `.mli` or `.mld` file, and sorts them by odoc's wording into
`own-line`, `misplaced-tag`, `not-allowed`, `empty-markup`, `unpaired`,
`bad-markup`, `unresolved-reference` and `other`. The buckets come from odoc
3.2's messages for deliberately broken comments; the tests use those
messages verbatim.

### PR preview

`.github/workflows/doc-preview.yml` builds and deploys;
`doc-preview-cleanup.yml` removes a preview when its PR closes;
`scripts/doc-preview-landing.sh` writes the landing page (also runnable
locally).

```
gh-pages/
  .nojekyll
  index.html             # links main/ and explains pr-preview/
  main/                  # latest push to main
  pr-preview/pr-<n>/     # one per open PR
```

- **Deploy:** `rossjrw/pr-preview-action` for PRs (one subdirectory per PR,
  one sticky comment with the URL), `JamesIves/github-pages-deploy-action`
  for `main`. Third-party actions are pinned by commit SHA.
- **Least privilege:** the build job has a read-only token and uploads the
  site as an artifact; the deploy job has `contents: write` and
  `pull-requests: write` and runs only the pinned actions. Checkouts use
  `persist-credentials: false`. Fork PRs are skipped.
- **Cleanup** runs on `pull_request_target: closed`, so it also runs for a
  PR with merge conflicts, and checks out no PR code. Both workflows share a
  per-PR concurrency group, so closing a PR cancels an unfinished deploy.
- **What is built:** the PR head commit, not the merge commit, so a preview
  matches what `doc_diff` builds; the committed tree, not a regeneration.
- **Warnings:** the doc build runs with `--cache=disabled` (dune does not
  replay warnings of cached rules); `doc_warnings` buckets them; the landing
  page shows the total and non-empty buckets, the job summary a table, and
  the full log is an artifact.
- **Landing page:** links each package root and records the ref, commit,
  warning count and build time.

**Repository setup:** Settings > Pages > "Deploy from a branch", `gh-pages`,
`/ (root)`.

## Testing

- Unit tests per module: `doc_parse_tests`, `doc_render_tests`,
  `doc_translate_tests`, `doc_emit_tests`, `doc_c_idiom_tests`,
  `doc_index_tests`, `doc_resolve_tests` (each §7.2 row from both layers,
  every miss reason), `emitted_members_tests` (every drop and rename),
  `entity_doc` and `class_gen` signature tests, and parser tests in
  `gir_gen/test/interface/doc_parsing_tests.ml`.
- Corpus smoke test (`gir_gen/test/corpus/doc_translate_corpus_tests.ml`):
  parse and render over every bundled `<doc>`, checking the invariants, the
  round trip and C-idiom counters, and that no rendered doc keeps
  `%TRUE`/`%FALSE`/`%NULL` or a free-with-`g_*` instruction outside code.
- Standing checks for any generator change: an empty regeneration diff,
  `dune build @doc` with 0 odoc warnings, and `doc_diff` against the base
  showing only the intended change.

## Known limitations

- Layer 2 class member docs link nothing (odoc limitation above).
- A cyclic group member's own module page shows its class type as an alias
  of the combined module's; odoc expands it on the class type page.
- The `.mld` link to the conventions page from other packages is raw HTML,
  which odoc does not check.

## Out of scope

- `@param`/`@return`/`@deprecated` tag emission (the AST fields exist);
  generalised `@since`.
- Alias pages and the rest of the page model (§11): synthetic synopses
  (§12), screenshots, folding `<docsection>` into index pages.
- Upstream-URL mapping for relative `.html` links (§6.3), a pure `Page_ref`
  rewrite.
- References to functions, callbacks, vfuncs, aliases and error domains, and
  to GLib and GObject, none of which are generated. Parsing top-level
  namespace `<function>`s is a prerequisite for `[func@]`.
- "Returned by" lists for classes without constructors, from the member
  index.
- Linking the type name in the property fallback.
- A CI gate on odoc warnings.
- C code-block translation (~210 blocks): labelling C blocks, translating a
  restricted C subset to layer-aware OCaml with a compile check, and
  hand-written examples. C blocks render as `{[ … ]}`.
