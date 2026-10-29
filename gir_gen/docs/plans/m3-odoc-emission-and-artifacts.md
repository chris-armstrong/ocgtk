# M3 Odoc Translation Slice — emission, wiring, doc HTML diff, PR doc preview

**Status: Phases 0–11 implemented (per-phase status below). The C code-block
translation phases (formerly 11–14) are dropped from this leg. Phases 11–13,
cross-reference resolution (PRD §7), added 2026-10-28; Phase 11 done, 12 and
13 not started. Phase 14,
property doc fallbacks, added 2026-10-29; not started.** Phase 0 and 1: PRs #188 and #190, merged into
`m3`. Phase 2 and the start of Phase 5: PR #191 (branch `m3-p2`). Phase 4:
PR #193 (branch `m3-p4`), landed before Phase 3 because the workflow does not
need it. Conventions page: PR #194. Phase 3: PR #207 (branch
`m3-phase3`). Phase 5: PR #208 (branch `m3-phase5`). Phase 6: PR #209
(branch `m3-phase6`). Phase 7: PR #211 (branch `m3-phase7`). Phase 8: branch `m3-phase8`. Phase 9: PR #215 (branch `m3-phase9`). Phase 10: PR #216 (branch `m3-phase10`). Phase 11: branch `m3-phase11`. Phase 7 onwards: one branch and PR per phase (see the rules below).
**Created: 2026-09-08; revised: 2026-10-05 (both layers in this leg; phases
renumbered plainly from 3; cache driver and preview moved up to Phases 3 and 4;
one PR per phase); 2026-10-07 (Phase 4: preview action replaced, previews
for PRs and `main` only; L2 page structure (decision 10), new Phase 7,
Phases 7–13 renumbered to 8–14, Phase 9 replaced by a conventions page); 2026-10-27 (artifact cache
dropped for a local HTML diff, decision 3); 2026-10-28 (Phase 7 revised for
the per-package layout and the Phase 6 page structure; C code-block
translation, Phases 11–14, dropped as too much for this leg; cross-reference
resolution added as new Phases 11–13, decision 11)**
**Branch: `feat/m3-odoc-translation-slice`** (from `origin/m3` @ `9cec9171`, which
contains the doc-parsing PR #184 and the
[research PRD](../research/reference-documentation.md))

> **Library layout (reconciled 2026-10-26).** This plan was written for the
> old layout: one `ocgtk` package with a sub-library per namespace, layer 1
> in each namespace's `Wrappers` module, layer 2 in `G`-prefixed modules
> under `ocgtk/src/<ns>/generated/`. The layout change
> ([library-layout.md](./library-layout.md)) replaced that in one step, not
> through the intermediate (deleting `ocgtk_gtk.ml` first) that
> [unresolved-inherit-links.md](../research/unresolved-inherit-links.md)
> accepted. Read the old names as the new ones: one package per namespace
> (`ocgtk` is Gtk only), layer 1 is `Oc<ns>.Raw.<Class>`, layer 2 is
> `Oc<ns>.<Class>` in `<pkg>/generated/`, enums are `Oc<ns>.Enums`. Every
> `inherit` line now links. Phase 9 (conventions page and namespace intros)
> is the only phase whose design changes; see Root index pages.

## Purpose of this leg

First *visible* vertical slice of M3: GIR `<doc>` text (already captured in the
AST by PR #184) is translated to odoc markup, emitted across the L1 and L2
bindings, with GIR symbol references turned into odoc links where the target
is generated (Phases 11–13), and rendered to browsable odoc HTML with:

- a **GitHub Pages preview** for every PR (a live doc-preview URL) and for
  `main`; pushes to other branches are not previewed,
- a **local HTML diff** so the rendered output of the working tree can be
  compared with that of a base commit.

Rendered HTML is never committed to any code branch — it exists only on the
auto-managed `gh-pages` branch and in local build directories.

## Decisions (recorded deliberately; supersede earlier suggestions)

1. **Emission is always-on, and the regenerated bindings are committed.** No
   `--with-docs` flag: every doc-carrying emit site routes raw GIR text through
   the translator. Unlike the earlier draft, this leg **commits the
   regenerated doc-carrying bindings** — the one-time generated-file diff is
   part of this PR. Consequences: the committed tree is again byte-identical
   to a fresh regeneration (CI and the doc pipeline agree on one source of
   truth), and a commit's rendered docs can be built from its tree alone, as
   the HTML diff does. The earlier "keep committed bindings doc-less" idea is
   superseded: it permanently dirtied the tree.

2. **PR preview via `rossjrw/pr-preview-action`** (revised
   2026-10-07; the earlier choice, `rajyan/preview-pages`, was archived in
   January 2026). The action deploys one subdirectory per PR
   (`pr-preview/pr-<n>/`, overwritten on each push) onto an auto-managed
   `gh-pages` branch and keeps one sticky comment with the preview URL on the
   PR. HTML never touches code branches. The same action removes the preview
   when the PR closes, from a small cleanup workflow on
   `pull_request_target` (so it also runs for a PR with merge conflicts,
   which `pull_request` skips). Pushes to
   `main` deploy to `main/` with `JamesIves/github-pages-deploy-action`, the
   deploy action the preview action uses internally. Third-party actions are
   pinned by commit SHA, because they run with a write token.

3. **A local HTML diff, not an artifact cache** (revised 2026-10-27). The
   one local need is "what did this change do to the rendered docs",
   answered by `diff -r` against a base commit built in a temporary git
   worktree. A persistent per-commit cache was built and dropped: dune's
   shared cache already avoids rebuilds, and the preview covers browsing
   and warning counts.

4. **Entity docs: both layers in this leg.** Un-suppress class/interface
   docs (standalone L1 module comments flow through the existing
   `layer1_main.ml` path), **thread docs into each `module rec X : sig` arm
   of combined cyclic modules** (new wiring — those emitters currently take
   no doc argument), un-suppress enum/bitfield type docs (emitters already
   exist), and give L2 modules (`g<Type>`, combined class modules) and
   cyclic shims the same entity docs. At L2 the GIR class doc is the
   **module** preamble, and the `class type` and `class` get canned docs
   (decision 10, revised 2026-10-07; earlier text put the class doc on the
   `class type` header). Each site kind lands in both layers in the same
   phase; no layer waits for a later leg. Alias pages stay doc-less until the
   page-model leg (PRD §11).

5. **Member docs: methods, constructors, signals in both layers (Phase 5);
   properties and record fields in Phase 6.** Methods: existing L1 emission,
   now translated; L2 method wrappers gain the same docs. Constructors:
   `ctor_doc` is used when present; otherwise a synthetic fallback,
   `Create a new <class name>. Wraps <link to the online C docs>` (revised
   2026-10-07), at L1 and L2. Signals: the signal `<doc>` goes on
   the L1 `on_<sig>` val/external and the L2 signal methods. Properties keep
   the synthetic `Get/Set property` text until Phase 6, which covers both
   layers together; `prop_doc`/`field_doc` remain parsed-but-dropped until then.

6. **Tags: two rules, no machinery.** odoc tags are terminal — a `@tag`
   extends to the end of the comment or the next tag, *not* to the end of a
   line (PRD §4.3 probe). Mitigation: (a) `@param`-style sigils in GIR prose
   become inline code at render (PRD §6.5 — mandatory, since `@` is an odoc
   tag sigil); (b) any other literal `@` in prose is escaped to `\@` (so
   upstream `@self`, `@group` can never start a tag); (c) the emit helper
   appends the real tags — `@since` today, in the existing constant
   behaviour — at the very end of the comment, prose first.
   `@param`/`@return`/`@deprecated` tag *emission* remains deferred (AST
   fields are ready for their leg). Escape-vs-code for `@param` is a
   one-line render policy (see the AST design below), deliberately chosen to
   match gi-docgen's rendered output.

7. **Report-only warning policy.** `dune build @doc` warnings are captured
   filtered to odoc-attributable lines (the raw stderr also carries dune's
   own messages), classified into buckets, trivially fixable classes are
   fixed at emission (paragraph-on-own-line, nested-tag re-parses), and the
   rest are recorded as TODO counts in the doc preview's job summary. Capture
   is in the preview workflow (Phase 4); classification follows in Phase 10. No CI gate this
   leg; the gate arrives once classification stabilises.

8. **C idioms are translated, not just degraded (added 2026-10-04).** GIR
   prose and examples are written for C. **Phase 8** (after Phases 5–7)
   does the trivial, deterministic AST rewrites in prose; translating C code
   blocks is out of scope for this leg (see the end of this plan).
   Ownership boilerplate (`Free the returned object with g_object_unref()`,
   `should be freed with g_free()`) is **stripped**: the GC owns every value,
   so the sentence is actively misleading. Every strip is counted in the
   generator's report.

9. **One PR per phase, stacked, with the preview as the checkpoint (added
   2026-10-05).** Each phase is its own PR, branched from the previous phase's
   branch and merged in order. A phase's acceptance gate is the checkpoint for
   its PR. From Phase 4 on, every PR gets a preview URL, so the rendered docs
   are reviewed on the PR, not only locally.

10. **L2 page structure (added 2026-10-07).** Reviewing the Phase 4 preview
    showed that a reader of an L2 page is not told how the module is laid
    out, where the constructors are, or why some classes have none. Agreed
    layout for each L2 class module:

    - **Module preamble:** the GIR class doc, followed by a fixed navigation
      paragraph: methods, signals and properties are on
      `{!class-type-<name>_t}`; constructors are at
      `{!section-constructors}`; low-level functions are in the L1 module.
      The L1 module preamble gets the matching pointer to the L2 module.
    - **`class type <name>_t`:** canned doc. "The methods, signals and
      properties of a <Class>." Then the inheritance block, with interfaces
      as a list because there can be many:

      ```
      Inherits from: <class name>
      Implements:
      - <interface 1>
      - <interface 2>
      ```

      Then a pointer to the constructors. The class type body is grouped by
      floating section comments: `{2 Signals}`, `{2 Methods}`,
      `{2 Properties}`, `{2 Conversions}` (the `as_*` methods).
    - **`class <name>`:** canned doc. It wraps an existing Layer 1 handle;
      use the constructors instead, except when converting a handle obtained
      from Layer 1. (Direct instantiation stays supported.)
    - **`{2:constructors Constructors}`** heading before the constructors.
      When a class has no constructors, the heading is followed by one canned
      line instead:
      - abstract (GIR `abstract="1"`): "This is an abstract class that can't
        be instantiated directly. Refer to its subclasses for a concrete
        implementation."
      - interface: "This is an interface which can't be instantiated
        directly, but which may be returned from a method or function."
      - otherwise: "This class is not instantiated directly - it is used as
        a return value by methods on other classes."

      A missing constructor is a documentation gap, not a binding gap: 342 of
      699 L2 modules have no `new*`, and only one of them (gio
      `AsyncInitable`) has an L1 constructor that L2 lacks. The rest have no
      constructor in the C library.
    - **No `type t` alias** for the class type: `<name>_t` reads better in
      inferred types and errors, and renaming would break the API.
    - **Conventions page:** a hand-written `ocgtk/conventions.mld` explains
      the layers, the module anatomy, naming and type mappings, signals and
      properties once. `index.mld` and each generated namespace module
      (`GdkPixbuf.mli`, ...) link to it. An outline with draft diagrams is
      committed; the text is written by hand.

    **odoc probe (odoc 3.2.1, 2026-10-07):** floating section comments inside
    a `class type` render as headings with anchors and appear in the page's
    contents sidebar; `{2:constructors Constructors}` gives a linkable
    anchor; `{!class-type-button_t}`, `{!section-constructors}` and a
    reference from an L1 module to the L2 module that depends on it all
    resolve with no warnings. Mermaid diagrams work in `.mld` pages as
    `{@mermaid[ … ]}` blocks (odoc emits `<pre class="language-mermaid">`)
    plus one `{%html: <script …> %}` block per page that loads a pinned
    Mermaid from jsDelivr. The script renders each block with its own id,
    because `mermaid.run()` derives ids from `Date.now()` and diagrams
    rendered in the same millisecond collide.

11. **Cross-references link only to targets known to be generated (added
    2026-10-28).** Phases 11–13 implement the PRD §7 resolver. The PRD
    accepts broken links to filtered members in v1 (§7.7); this plan does
    not, because every phase since Phase 2 ends with 0 odoc warnings and a
    broken `{!…}` is a warning. So the resolver links a reference only when
    the index says the target was emitted, and renders everything else as
    the code span it renders today. Consequences:

    - **Types and constants link in every generated namespace** (current
      namespace from the generation context, others from the references
      files). **Members** (methods, constructors, signals, properties, enum
      members) **link only within the current namespace**, where the
      generator knows what it emitted. Cross-namespace member references
      are about 4% of Gtk's member fragments (about 100 of 2,449, to Gdk,
      Gio, Gsk and Pango) and stay code; a references-file member table is
      out of scope.
    - **Link text is unchanged.** A resolved reference renders as
      `{{!path}[endpoint]}`: the code span readers see today, now a link.
      The HTML diff of the resolver phases is therefore links only.
    - **Paths and layer routing** follow PRD §7.2 and §7.8: from an L1 doc to
      `Oc<ns>.Raw.<Type>` and its values, from an L2 doc to
      `Oc<ns>.<Type>.class-type-<t>_t` and its methods (constructors to the
      module-level `val`), and from either to `Oc<ns>.Enums` and
      `Oc<ns>.Constants`. Enum, bitfield and constant docs use the L2
      routing: they are shared by both layers, and L2 is the reader-facing
      one.
    - **Not linked at all:** functions and callbacks (not generated),
      vfuncs, aliases, error domains, and types of namespaces that are not
      generated (GLib, GObject).

## Translator design: parse → flat AST → render

`gir_gen/lib/generate/doc_translate.ml` + `.mli` is split into two pure
stages joined by an intermediate AST, with `translate` kept as the
composition for emission sites:

```ocaml
val parse : context -> string -> t      (* GIR markdown -> AST *)
val render : t -> string               (* AST -> odoc markup *)
val translate : context -> string -> string   (* = render ∘ parse *)
```

From Phase 11 a third pure stage sits between them, `Doc_resolve.resolve :
env -> t -> t * fallback list` (`Sym_ref` → `Ref` on a hit), and the emission
path is render ∘ resolve ∘ parse. `env` carries the namespace, the layer
being emitted and the symbol index (Phase 11). Parse and render do not
change role: parse never produces `Ref`, render never looks anything up.

`context` distinguishes entity/module docs from member/item docs (heading
policy differs, PRD §6.6). **Parse must not bake in escaping or odoc
syntax; render must not make policy decisions** (heading demotion for member
context is applied from `context` at render). Keeping that line clean is
what lets later legs rearrange or upgrade without re-parsing raw text.

### The AST

Two levels, mostly flat: one flat list of blocks, each holding a flat list
of inline spans. GIR prose never needs deeper nesting.

```ocaml
type inline =
  | Text of string                          (* raw prose; escaped at render *)
  | Code of string                          (* literal `code` from the source *)
  | Bold of inline list
  | Italic of inline list
  (* pure https:// links — render {{:url}text} *)
  | Link of { text : inline list; url : string }
  (* relative gi-docgen .html page links — v1: degrade; later:
     {{:baseURL + path#anchor}text} (PRD §6.3) *)
  | Page_ref of { text : inline list; path : string; anchor : string option }
  (* gi-docgen [frag@endpoint] fragments and legacy #/% sigils; `kind`
     comes from the fragment keyword now, from index lookup for sigils
     later (PRD §3.4, §3.5, §7.1) *)
  | Sym_ref of { kind : sym_kind option; endpoint : string;
                 anchor : string option }
  (* @param sigils — always [code] at render, never bare @ (tag hazard,
     PRD §6.5) *)
  | Param_ref of string
  (* RESOLVED odoc {!path} — produced ONLY by the resolver (Phase 11);
     parse never emits this. Phase 11 makes it
     Ref of { path : string; text : string } (decision 11) *)
  | Ref of string

and sym_kind =
  | Class | Iface | Enum | Flags | Struct | Alias | Callback | Const
  | Ctor | Func | Method | Property | Signal | Vfunc | Error | Id | Type

type block =
  | Para of inline list
  | Heading of int * inline list        (* raw GIR level, 1..6; policy at render *)
  | List of bool * inline list list     (* ordered? * items (items carry markup) *)
  | Code_block of string                (* fenced; verbatim *)

type t = { blocks : block list }
```

**Why references get their own nodes.** The corpus (PRD §3.9) carries
~5,900 `[frag@]` fragments, ~9,000 legacy `#Type`/`%CONST` sigils and ~10k
`@param`s. The slice's v1 fallback for fragments/sigils (below) is
*rendering*-correct, but the degradation must happen at render, not parse:
"This was literal code in the source" (`Code`) and "this was a reference we
degraded" (`Sym_ref`/`Page_ref`) must be distinct, or the §7 resolver leg
would have to re-parse raw text to find upgradable references. With the
nodes in place, both deferred legs are **pure AST rewrites**:

- **Cross-reference resolver (PRD §7, Phases 11–13)**: `Sym_ref → Ref`
  on a hit; a miss stays `Sym_ref` and keeps its code-span rendering
  (§7.6), parameterised by layer (§7.8). No render-policy changes; the
  one parser change is recording which sigil a `Sym_ref` came from
  (Phase 13).
- **Upstream-URL mapping (PRD §6.3)**: rewrite `Page_ref` against the
  per-namespace base-URL table. Also a pure node rewrite.

`anchor` is preserved on both even though v1 drops it (`[class@Foo#anchor]`
is legal per PRD §3.4; anchors have no odoc equivalent — §6.3 explicitly
rejected internal resolution on those grounds). The §3.5 sigil guard rules
(uppercase-no-space, `#` not preceded by `/`) live in `parse`, where they
are unit-testable.

### v1 render policy

| AST node | v1 rendering | Later leg |
|---|---|---|
| `Text` | odoc-escaped prose (`\{ \} \[ \] \[@`) | — |
| `Code` | `[code]`, balance-checked (below) | — |
| `Bold` / `Italic` | `{b …}` / `{i …}` | — |
| `Link` | `{{:url}text}` | — |
| `Page_ref` | bare text (degraded; counted) | §6.3 upstream URLs |
| `Sym_ref` | `[endpoint]` code span (degraded; counted) | §7 resolver (Phases 11–13): unresolved ones keep this rendering |
| `Param_ref` | `[name]` code span (PRD §6.5) | — |
| `Ref` | unreachable in v1 | `{{!path}[text]}` (Phase 11) |
| `Para` / blank lines | paragraphs | — |
| `Heading` | entity docs: normalised `{1 …}` (shallowest → `{1}`, cap `{5}`); member docs: `{b …}` lead-in (odoc demotes item-doc headings to plain paragraphs — PRD §4.3) | — |
| `List` | odoc shortcut lists | — |
| `Code_block` | `{[ … ]}` (banner deferred) | — |

Stripped to plain prose at parse (each forward-compatible with the full PRD
design, recorded as fallbacks for the warnings report): admonitions
(`::: …`), tables, `<picture>`/`<img>`, `>` quotes.

## Correctness invariants (load-bearing; each gets a test)

1. **Comment safety.** The output can never contain unneutralised `*)` /
   `(*` — a raw `*)` in GIR prose would terminate the doc comment and break
   the *compile* of the generated bindings. Sanitisation is owned by
   `Doc_emit` and runs on the **final assembled comment, after all
   span/block fallbacks** — a fallback must not be able to reintroduce a
   hazard, and the rule applies inside code spans and `{v … v}` blocks too
   (OCaml terminates the comment regardless of odoc semantics).
2. **odoc-special escaping** in prose contexts: `\{ \} \[ \@`.
3. **Span/block balance check.** Escapes don't work inside odoc code: an
   inline `[code]` breaks if the content contains `]`, a `{[ … ]}` block
   breaks on `]}`. On violation: inline span falls back to escaped plain
   prose; a block falls back to verbatim `{v … v}` (when hazard-free), else
   is stripped. Every fallback is counted in the warnings report.
4. **Tag terminality** per decision 6: prose-first assembly, tags last.
5. **No re-translation in the pipeline.** Literal string idempotence
   (`translate (translate x) = translate x`) is *false by construction* —
   the translator parses GIR markdown, and its odoc output contains `{`/`}`
   that a second pass would escape. The invariant the pipeline actually
   needs is a wiring property: **no emission site feeds translator output
   back through the translator** (testable by inspection; every emission
   point calls `parse` on raw GIR text only). Where a structural
   round-trip property is wanted for tests, use the AST:
   `parse (render (parse x)) ≅ parse x`.

## Emission wiring (inventory)

| Emission point | Code | This leg |
|---|---|---|
| Constants | `constant_code.ml` (`emit_doc`, incl. `@since`) | translate (existing site) |
| Enum/bitfield type docs | `enum_code.ml` | translate; **un-suppress** (Phase 5) |
| Enum/bitfield member docs | `enum_code.ml` | translate (existing site) |
| L1 method docs | `layer1/layer1_method.ml` | translate (existing site) |
| L2 method docs | `class_gen_method.ml`, `class_gen_body.ml` | **new wiring** (Phase 5) |
| L1 entity docs, standalone | `layer1/layer1_main.ml` module comment | translate; **un-suppress** class/interface |
| L1 combined cyclic modules | `generate_combined_ml_modules` / `generate_ml_interface_internal` (no doc param today) | **new wiring** (Phase 5): thread `class_doc` into each `module rec` arm |
| L2 modules, combined class modules, cyclic shims | `class_gen.ml` (no doc emission today) | **new wiring** (Phase 5): class doc as module preamble + navigation paragraph; canned `class type` / `class` docs (decision 10) |
| Constructors (L1 and L2) | `layer1/layer1_constructor.ml`; `class_gen.ml` `generate_constructor_*` | **new wiring** (Phase 5): `ctor_doc` when present, else `Create a new <class>. Wraps <C docs link>`; L2 `Constructors` heading |
| L2 class type sections, inheritance block, no-constructor text | `class_gen.ml`, `class_gen_body.ml` | **new wiring** (Phase 7) |
| Signals (L1 `on_<sig>` and L2 signal methods) | `signal_gen.ml` (`emit_l1_val`, `emit_l2_method*`) | **new wiring** (Phase 5): signal `<doc>` |
| Properties (L1 and L2) | `layer1_property.ml`, `class_gen_property.ml` | **new wiring** (Phase 6), both layers together |
| Record fields | — (`field_doc` parsed, dropped) | Phase 6, if a layer has a counterpart; else the one site |
| Alias pages | — | deferred (page-model leg, PRD §11) |
| Namespace module intros (`GdkPixbuf.mli`, ...) | `library_module.ml` | **new**: short generated intro linking the conventions page (Phase 9) |
| Every site above | `Doc_emit.item_doc` and the direct `Doc_translate` calls in `entity_doc.ml` | **new wiring** (Phase 11): pass the resolver `env` built from `ctx` (namespace, `target_library`, index) |

- Delete the two suppression sites in `bin/gir_gen.ml` (class/interface
  entity-doc blanking, now gone; `enum_doc`/`bitfield_doc` field blanking in
  `generate_enum_files`, ~lines 897 and 901). Note: deleting the enum/bitfield
  blanking is necessary but not sufficient — the combined-module, shim,
  constructor and signal rows above are the wiring that makes un-suppression
  land somewhere.
- Known effect, accepted: `ocamlformat -i` repositions module comments (seen
  with record docs landing on `type t`); entity docs may attach to the first
  declaration rather than the module — fine for this leg.
- All sites call one shared **`Doc_emit`** module (beside `Doc_translate`):
  `emit_item_doc buf ~context doc` and `emit_entity_doc buf ~context doc`
  own assembly (prose first, tags last — a node-level operation on the AST,
  not string surgery), final-comment sanitisation and `@since` append;
  `Doc_translate` owns `parse`/`render`. A new emission point costs one call.
- Unit/expect tests for the translator and `Doc_emit` in `gir_gen/test/`
  following the repo's test conventions (`test/generate/constant_code_tests.ml`
  is the pattern).

## Module inventory (create / modify)

**New:**

| Module | Role |
|---|---|
| `gir_gen/lib/generate/doc_ast.ml` / `.mli` | The flat AST types (`inline`, `block`, `t`), `context`, the `fallback` event type, and derived equality (`equal_t`). Shared by parse and render. |
| `gir_gen/lib/generate/doc_parse.ml` / `.mli` | `parse`, `parse_with_fallbacks`: GIR markdown → AST. Parse-time strips (admonitions, tables, pictures, images, quotes). |
| `gir_gen/lib/generate/doc_render.ml` / `.mli` | `render`, `render_as`, `render_with_fallbacks`: AST → odoc markup; heading policy per context; render-time fallbacks; comment-hazard neutralisation. |
| `gir_gen/lib/generate/doc_translate.ml` / `.mli` | Composition: `translate`, `translate_with_fallbacks` (= render ∘ parse), re-exports of the AST types, `equal_t`. The entry point emission sites call. |
| `gir_gen/lib/generate/doc_emit.ml` / `.mli` | `emit_item_doc`, `emit_entity_doc`: assembly, tags-last, final-comment sanitisation, `@since`. |
| `ocgtk/conventions.mld` | Hand-written conventions page (Phase 9; outline with draft Mermaid diagrams committed 2026-10-07). Replaces the generated `doc_index.ml` / `index.mld` of the earlier plan. |
| `gir_gen/test/generate/doc_parse_tests.ml`, `doc_render_tests.ml`, `doc_translate_tests.ml` (+ `doc_translate_test_helpers.ml`), `doc_emit_tests.ml` (Phase 2) | Unit/expect tests per the `constant_code_tests.ml` convention: every render-policy row, every invariant. |
| `gir_gen/test/corpus/doc_translate_corpus_tests.ml` | Corpus smoke test (Phase 1): `parse`+`render` over the bundled `<doc>` elements; asserts comment safety, balance, the wiring property. |
| `gir_gen/tools/doc_diff/` | Phase 3. `diff -r` of the rendered HTML of a base commit (default `origin/m3`) and the working tree. |
| `.github/workflows/doc-preview.yml` | Phase 4. Builds `@doc` (read-only job), deploys PR previews and `main` (write job). |
| `.github/workflows/doc-preview-cleanup.yml` | Phase 4. Removes a PR's preview on close (`pull_request_target`, no PR code run). |
| `scripts/doc-preview-landing.sh` | Phase 4. Writes the landing `index.html` linking the package roots, with build provenance. Runs locally too. |
| `gir_gen/lib/generate/doc_index.ml` / `.mli` | Phase 11. The symbol index the resolver reads: generated types and constants per namespace (Phase 11), current-namespace members (Phase 12), C-name tables (Phase 13). Built once per namespace with the generation context. |
| `gir_gen/lib/generate/doc_resolve.ml` / `.mli` | Phase 11. `env`, `env_of_ctx`, `resolve`: endpoint parsing, PRD §7.2 paths through `Module_paths`, layer routing, miss reasons. |
| `gir_gen/lib/generate/emitted_members.ml` / `.mli` | Phase 12. The members a class, interface or record emits at each layer, under their OCaml names; used by the emitters and by the index. |
| `gir_gen/test/generate/doc_resolve_tests.ml`, `doc_index_tests.ml`, `emitted_members_tests.ml` | Phases 11–13. One case per PRD §7.2 row at both layers, every miss reason. |

**Modified:**

| File | Change |
|---|---|
| `bin/gir_gen.ml` | Enum/bitfield suppression removed (Phase 5); class/interface suppression already gone. |
| `lib/generate/enum_code.ml` | Un-suppress; type docs + member docs through `Doc_emit`. |
| `lib/generate/constant_code.ml` | Existing `emit_doc` site rerouted through `Doc_emit` (subsumes `Utils.sanitize_doc` + `@since`). |
| `lib/generate/layer1/layer1_method.ml` | Translate existing site. |
| `lib/generate/layer1/layer1_main.ml` | Un-suppress standalone class/interface module comment; `generate_ml_interface_internal` / `generate_combined_ml_modules` gain a doc parameter, thread `class_doc` into each `module rec` arm. |
| `lib/generate/ml_interface.ml` | Re-export updated `generate_combined_ml_modules` signature. |
| `lib/generate/class_gen.ml`, `class_gen_method.ml`, `class_gen_body.ml` | L2 class type header, combined class modules, shims, L2 methods, constructors (Phase 5). |
| `lib/generate/layer1/layer1_constructor.ml` | New: `ctor_doc` when present, synthetic fallback. |
| `lib/generate/signal_gen.ml`, `signal_gen.mli` | New: signal `doc` on the L1 `on_<sig>` val and the L2 signal methods; `signal_emission` carries the doc. |
| `lib/generate/layer1/layer1_property.ml`, `lib/generate/class_gen_property.ml` | Property docs, both layers (Phase 6). |
| `lib/generate/doc_ast.ml`, `doc_render.ml`, `doc_emit.ml`, `entity_doc.ml` | Phase 11: `Ref` record, its rendering, the `Sym_ref_unresolved` fallback, the `env` parameter. Phase 13: `Sym_ref` records which sigil it came from. |
| `lib/types.ml` | Phase 11: the generation context carries the doc index. |
| `lib/generate/doc_parse.ml` | Phase 13: sigil origin on `Sym_ref`; `symbol()` C-call references. |
| L1/L2 member emitters (`layer1_*`, `class_gen_*`, `signal_gen.ml`) | Phase 12: take their member lists from `Emitted_members` (no output change). |
| `ocgtk/dune`, `gir_gen/dune` | `(documentation)` stanzas (leg 0). |

**No change:** `.opam` files (`odoc {with-doc}` already emitted by dune),
`lib/types.ml` (all doc fields already parsed by PR #184).

## Root index pages (per package)

odoc page trees are per-package, so each package gets its own `index.mld`
under a `(documentation)` stanza (one per package directory, `ocglib/` to
`ocgtk/`, and `gir_gen/`).

- **Corpus fact** (checked): there is no namespace-level `<doc>` in any
  bundled GIR file. The only namespace-level prose is `<docsection>` groups —
  Graphene 16, Gtk 1, all others 0 — parsed-and-dropped for now; folding them
  in later is forward-compatible.
- **Revised 2026-10-07:** `ocgtk/index.mld` was written by hand before this
  leg (per-library headings and descriptions), so it is not generated. The
  per-namespace listing it would have held already exists: each generated
  namespace module (`GdkPixbuf.mli`, ...) lists its classes, enumerations
  and constants under headings. Phase 9 adds a short generated intro to
  each namespace module and the hand-written conventions page (decision 10).
  The earlier generated `index.mld` and `doc_index.ml` are dropped.
- **Landing page**: the preview workflow (Phase 4) drops a tiny static
  `index.html` at the artifact root that links each package's odoc root. In
  Phase 4 it links whatever roots `@doc` produces. odoc cannot cross-link
  page trees, a raw HTML link can.
- **Since the library layout change** (reconciled 2026-10-26, see
  [library-layout.md](./library-layout.md)), each of the ten packages has a
  hand-written `<pkg>/index.mld`: a synopsis, links to the main module,
  `Enums`, `Constants` and `Raw`, and the packages it builds on. These stay
  hand-written (Phase 9 does not generate index pages). The main modules are
  now generated by dune, not by `library_module.ml`, so Phase 9 puts the
  namespace intro at the top of the generated modules page (below) and a
  one-line conventions link in each `index.mld`.
- **Modules page** (added with Phase 3): dune's main module carries no
  docs, so its page lists the modules as bare `sig ... end`, and the
  indexes linked only the hand-written modules. The generator writes
  `<pkg>/generated/modules.mld` (one `{!modules: ...}` list each for the
  classes, interfaces and records) with its own `(documentation)` stanza in
  the generated `dune`, and each `index.mld` links it. The lists have no
  synopses until the layer 2 module preambles land (Phase 5, step 2).
- **Conventions page** (moved with Phase 3): it covers every package, so it
  is linked from the preview landing page's Reference section rather than
  from `ocgtk/index.mld`. It stays in ocgtk's page tree, since every page
  must belong to a package and odoc cannot resolve page references across
  packages (checked with both `@doc` and `@doc-new`).

## Doc HTML diff

**What and why.** Reviewing a translator change means knowing what it did
to the rendered docs across all 39k of them, which browsing cannot answer.
`gir_gen/tools/doc_diff/` (a dune executable; usage in
[gir_gen/tools/doc_diff/README.md](../../tools/doc_diff/README.md)) runs
`diff -r` between the odoc HTML of a base commit and that of the working
tree:

```bash
dune exec gir_gen/tools/doc_diff/doc_diff.exe -- [--brief] [BASE]   # BASE defaults to origin/m3
```

The working tree is built in its own `_build`; the base is checked out with
`git worktree add` into a fresh temporary directory, built there, and
removed with `git worktree remove`. Nothing is regenerated: decision 1
commits the bindings, so a commit's tree is already the generator's output.
The diff is only meaningful between builds with the same odoc and dune.

It replaces an earlier design, a persistent per-commit cache of HTML
tarballs with manifests, a blessed baseline, local extraction for browsing
and odoc warning capture. Its only needed job was the diff. Rebuild
avoidance comes from dune's shared cache, browsing from the PR preview, and
the warning count from the preview workflow, which builds with the cache
disabled so every warning is reported (decision 7).

## PR preview workflow

Implemented in Phase 4 as `.github/workflows/doc-preview.yml` (build and
deploy) and `.github/workflows/doc-preview-cleanup.yml` (removal on close),
with `scripts/doc-preview-landing.sh` writing the landing page. The earlier
sketch used `rajyan/preview-pages`, which was replaced (decision 2).

`gh-pages` layout:

```
gh-pages/
  .nojekyll              # Pages serves files as-is (no Jekyll pass)
  index.html             # links main/ and explains pr-preview/
  main/                  # latest push to main
  pr-preview/pr-<n>/     # one per open PR; removed when the PR closes
```

Each deployed tree is `_build/default/_doc/_html`, with dune's root
`index.html` replaced by the landing page. The landing page links each
package root and records the ref, commit, odoc warning count and build time.

Behaviour, and where it differs from the sketch:

- **Triggers:** `pull_request` (`opened`, `reopened`, `synchronize`) and
  `push` to `main` deploy. The cleanup workflow removes the preview on
  `pull_request_target: closed`. It uses `pull_request_target` because GitHub
  does not run `pull_request` workflows for a PR with merge conflicts, which
  would leave the preview behind. It checks out no PR code. Both workflows
  share a per-PR concurrency group, so closing a PR cancels an unfinished
  deploy before the removal.
- **Two jobs, least privilege:** the build job (opam installs, dune, the
  landing page) has a read-only token and uploads the site as a workflow
  artifact. The deploy job has `contents: write` and `pull-requests: write`
  and runs only the SHA-pinned deploy actions. Checkouts use
  `persist-credentials: false`.
- **No regeneration.** The workflow renders the committed tree. Decision 1
  makes the committed bindings the source of truth, so regenerating in CI
  would either be a no-op or publish docs that are not in the PR.
  Regeneration drift is a separate check, not part of the preview.
- **The PR head commit is built**, not the merge commit, so a preview
  matches the commit a local HTML diff builds.
- **Warnings are counted, not fatal:** odoc's warnings (compiler warnings
  and dune's messages excluded) are classified into buckets by
  `gir_gen/tools/doc_warnings/` (Phase 10). The landing page shows the
  total and the non-empty buckets, the job summary a table of every
  bucket, and the full log is uploaded as a workflow artifact
  (decision 7). The doc build runs with `--cache=disabled`: dune does not
  replay the warnings of rules restored from its cache, so a cached build
  under-counts.
- **Root files:** `.nojekyll` and the root `index.html` are deployed on
  pushes to `main`, and on any run where `gh-pages` has no `.nojekyll`
  yet.
- **Fork PRs are skipped:** their token is read-only.

**One-time repository setup (user action):** after the first run creates
`gh-pages`, set Settings > Pages > Build and deployment to "Deploy from a
branch", branch `gh-pages`, folder `/ (root)`. Workflow permissions are
declared per job (`contents: write`, `pull-requests: write`, on the deploy
and cleanup jobs only). The
repository's default workflow permission is already `write`, so no change
is needed there. These are repo settings, not code, so the PR itself does
not verify them.

## odoc toolchain prerequisites (leg 0)

- **`dune build @doc` has never been run in this repo**: odoc is not
  installed on the dev box, no `(documentation)` stanza and no `.mld` file
  exists anywhere, and the PRD's odoc probe ran in a *scratch* workspace.
- Install via `opam install . --deps-only --with-doc` — both `.opam` files
  already carry `odoc {with-doc}` (dune's generator emits it), so **no new
  opam dependency** is being added.
- Add the two `(documentation)` stanzas in Phase 0.
- Phase 0's milestone: `dune build @doc` green from the repo root,
  producing HTML for both packages; translation work then proceeds against a
  rendered baseline.

## Phased implementation (one PR per phase)

This section replaces the earlier prose "Sequencing" list. Phases are ordered
so that each ends in a state its own test gate can certify without depending
on a later phase. Phases are numbered plainly, with no letter suffixes. Rules
that hold for every phase:

- **One phase = one PR**, branched from the previous phase's branch and
  merged in order. A phase is one commit, or a short sequence where each step
  is independently revertible (Phase 5 has five). Each commit carries the code
  change, its tests, and — where generated files are affected — the
  regenerated bindings, leaving `git status` empty.
- **The phase gate is the PR checkpoint.** A PR is ready when its phase's
  acceptance block passes. From Phase 4 on, the PR's preview URL is part of
  that review.
- **Standing invariant (checked in every phase):** `dune build @all` green,
  `dune runtest gir_gen/` + the ocgtk tests green, and a fresh bindings
  regeneration diff empty. Not repeated in each acceptance list below.
- **Stop-and-fix rule:** if a phase's gate fails, fix within the phase; do
  not push partial state forward. The committed-tree invariant makes every
  intermediate commit shippable.
- **Both layers together:** a site kind that exists at L1 and L2 lands in
  both layers in the same phase. No layer ships docs before the other.
- **Sizing:** a phase is split only when it has a go/no-go gate between parts
  or independently shippable deliverables. Phase 5 stays whole: five commits,
  one theme, each site kind complete in both layers.

### Phase 0 — odoc toolchain green (no generator changes)

*Goal:* the rendered-HTML baseline every later phase works against.

*Changes:* install odoc via `opam install . --deps-only --with-doc` (both
`.opam` files already carry `odoc {with-doc}`); add the two
`(documentation)` stanzas (`ocgtk/dune`, `gir_gen/dune`). No `.mld`, no
generator edits — the bindings must be untouched.

*Acceptance:*
```bash
opam exec -- dune build @doc          # exits 0 from the repo root
find _build/default/_doc/_html -name index.html | head   # HTML for BOTH packages
# + standing invariant (bindings regeneration diff empty — nothing wired yet)
```

### Phase 1 — `Doc_translate` (parse → AST → render) + tests, no wiring

*Goal:* the pure translation engine exists and is certified against the
corpus with **zero change to any emitted file**.

*Changes:* new `lib/generate/doc_translate.ml`/`.mli` per the AST design
above; new `test/generate/doc_translate_tests.ml` (following
`constant_code_tests.ml` conventions); corpus smoke test covering all
~39,850 bundled `<doc>` elements asserting invariants 1 (comment safety),
2 (escaping), 3 (balance/fallbacks) and the AST round-trip
`parse (render (parse x)) ≅ parse x` (invariant 5).

*Unit cases (minimum set):* each render-policy table row; all four prose
escapes; a `*)`-bearing doc; an unbalanced `[code` (inline fallback); a
`{[ … ]}` block containing `]}` (verbatim fallback, else strip); headings in
both contexts (entity normalisation incl. cap `{5}`, member `{b …}`
lead-in); lists (bullet + ordered); https link; `[frag@…]` and legacy
sigils → `Sym_ref`-degraded `[code]`; relative `.html` links → degraded
bare text; `@param` sigil → `[name]`; `:::`/table/`<picture>`/quote
stripping; idempotence-unfriendly fixture proving the wiring property
holds.

*Acceptance:*
```bash
opam exec -- dune build @all && opam exec -- dune test gir_gen/
xvfb-run $(which dune) test ocgtk/    # unchanged bindings, still green
# regenerate bindings for one namespace and diff — MUST be empty
```

### Phase 2 — `Doc_emit` + translator at the *existing* emit sites
(suppressions stay)

**Status: done** (branch `m3-p2`). Commits: `1d372dc4` (`Doc_emit`),
`f75c7cde` (constant, enum/bitfield member, method docs), `759d373b` (remove 42
stale generated files), `351b2720` (record/class entity docs through `Doc_emit`),
`dca00048` (escape `]`), `c2edb1e2` (remove gtk enum interface copies), and
`59069346` (carry unsafe doc bodies as `ocaml.doc` attributes). The additions
this phase needed beyond the original text are recorded below; the original
text is kept for reference.

*Goal:* every doc that is *already* emitted now goes through the
translator; no *new* docs appear. This isolates translator-induced diffs
from un-suppression-induced diffs (Phase 5).

*Changes:* new `lib/generate/doc_emit.ml`/`.mli` (`item_doc`: translation,
tags-last `@since`, final-comment sanitisation, constant version-only
fallback; `emit_entity_doc` waits for Phase 5); rewire `constant_code.ml`
`emit_doc`, `enum_code.ml` **member and bitfield flag** docs,
`layer1_method.ml` method docs, and the class/record entity doc in
`layer1_main.ml` (already emitted raw before Phase 2; found by the residual
odoc warnings, so it is routed through `Doc_emit` here as well);
`test/generate/doc_emit_tests.ml` (comment safety, tag terminality,
`@since` placement). Regenerate bindings; the diff is confined to
doc-comment text at these site kinds; commit it.

*Placement change (found by testing):* polymorphic-variant member docs must
follow their tag. Before the tag, odoc silently drops them from the HTML (and
the compiler warns, warning 50). Member docs are therefore emitted as
`` | `TAG (** doc *) ``. This is a visible change beyond the "doc text only"
wording, and it makes enum and bitfield member docs appear on their pages for
the first time.

*Stale generated files (found by testing):* 42 tracked `.ml`/`.mli` files
under `ocgtk/src/*/generated/` were never produced by a clean regeneration.
The generator only writes and never deletes, so these survived relocations
(e.g. `unix_fd_message.mli`, `gUnix_fd_message.mli`, `tooltip.mli`). They
were removed in a separate commit. The six gtk `*_enums.mli` copies are not
produced either; they were removed in a follow-up commit (see residue below).

*Residue, now resolved:* odoc warnings went from 5,237 to 0. The bare `]` in
prose was a translator gap (the Phase 1 policy wrongly assumed odoc treated it
as literal text); `]` is now escaped with `[`. The six gtk `*_enums.mli` copies
the generator no longer writes were removed, and their `modules_without_implementation`
entry in `gtk/dune` with them, since gtk builds against the enum types in the
other libraries.

*Acceptance:*
```bash
opam exec -- dune test gir_gen/ && xvfb-run $(which dune) test ocgtk/
git status --porcelain        # empty — regenerated bindings committed
# diff review: only doc comments changed, only at the three site kinds
```
Belt-and-braces: grep the regenerated tree for unneutralised `*)` outside
legitimate comment syntax — any hit is a Phase-2 failure.

### Phase 3 — Doc HTML diff tool (local)

**Status: done** (branch `m3-phase3`). First built as the per-commit
artifact cache of the earlier design (tarballs, manifests, a blessed
baseline, warning capture), then cut down to the diff, the one job later
phases need: `gir_gen/tools/doc_diff/` (see Doc HTML diff). Two fixes were
needed first, in the same PR: `generate-bindings.sh` now formats the
generated dune files, without which a regeneration never left the tree
clean; and the package indexes now link a generated modules page (see Root
index pages).

*Goal:* every later PR's effect on the rendered docs can be listed against
its base.

*Acceptance:*
```bash
dune exec gir_gen/tools/doc_diff/doc_diff.exe -- --brief          # against origin/m3: the new modules pages and indexes
dune exec gir_gen/tools/doc_diff/doc_diff.exe -- --brief HEAD     # clean tree: empty, exit 0
git worktree list                                                 # no worktree left behind
```

### Phase 4 — PR preview workflow (CI)

*Goal:* every PR from here on gets a rendered-docs preview URL, which is the
review surface for Phases 5–10.

**Status: done** (PR #193; previews have deployed for every PR since). The action changed from
`rajyan/preview-pages` (archived) to `rossjrw/pr-preview-action`; removal on
close is a `pull_request_target` workflow. See
decision 2 and the preview workflow section for this and the other
differences from the sketch. Phase 3 is not done; this phase does not need
it.

*Changes:* `.github/workflows/doc-preview.yml` and
`doc-preview-cleanup.yml` per the preview workflow section above, with
`scripts/doc-preview-landing.sh` for the landing `index.html`. The landing
page links the package roots `@doc` produces.
Requires the one-time repository setup described in the preview section.

*Acceptance:* the preview URL comment appears on the PR; the preview shows
the Phase 2 docs (member docs with `{b …}` lead-ins, and the `about_dialog`
C-fence page rendered as `{[ … ]}`). The landing page links the package
roots. HTML appears **only** on `gh-pages`. Linting is the reviewer's
responsibility, not part of the gate.

### Phase 5 — Un-suppression + entity, method, constructor and signal wiring (both layers)

*Goal:* entity docs land at both layers; L2 methods, constructors and signals
carry docs; combined and cyclic modules carry docs. Diffs here are *additive*
(previously-doc-less output gains docs) and must be reviewed as such, with
the Phase 3 HTML diff against the phase's base.

**Status: done** (branch `m3-phase5`; L1 class and interface entity docs were
un-suppressed earlier in `adc30fe6` and `742d1a77`). The five steps landed as
five commits. Differences from the text below:

- *Constructors heading only where there are constructors.* The
  `{2:constructors Constructors}` heading, and the navigation paragraph's
  sentence linking it, appear only when a class has at least one generated
  constructor. Phase 7 adds the heading with the canned no-constructor line.
- *Synopsis fallback.* odoc reuses a module doc's first paragraph as the
  synopsis on the parent page, where `{!class-type-…}` does not resolve, so a
  module without a GIR class doc starts with "Bindings for [<class name>]."
  instead of the navigation paragraph (20 warnings without it).
- *Combined modules* get a preamble naming the modules that re-export their
  members ("use that module rather than this one"), at both layers; each
  `module rec`/`and` arm, class type and class carries its own doc.
- *Constructor fallback* ("Create a new [<class name>]. Wraps [<C function>].",
  linked for gi-docgen namespaces): every generated constructor in the
  current corpus has a GIR doc, so it shows only in unit tests for now.
- *Placement:* ocamlformat moves type, method, constructor and signal docs
  after their item (its default); odoc attaches them the same way. A doc
  comment between two items is preceded by a blank line so it is not
  ambiguous.
- *Result:* 2956 HTML files, 0 odoc warnings; against Phase 3 (`doc_diff`),
  2820 pages change and one is added (the generator's `Entity_doc`).

Items done in this phase earlier, which the original list did not contain:

- *Comment safety for quotes:* OCaml lexes string literals inside comments, and
  GIR prose can leave one open. `Doc_emit` replaces every `"` in an emitted
  comment with a typographic quote (`adc30fe6`). This changes rendered quotes
  in existing docs too.
- *Module comment placement:* a class description must be a floating module
  comment, so it needs a blank line after it. Without one, it attaches to the
  first type, `ocamlformat` keeps it there, and odoc no longer uses it as the
  module synopsis on parent pages (`742d1a77`). This resolves the "accepted
  effect" noted below.

*Changes (five commits, each independently revertible, tree clean after
each; every site kind lands in both layers where it has both):*
1. Delete the enum/bitfield suppression in `bin/gir_gen.ml`
   (`generate_enum_files`, the `enum_doc`/`bitfield_doc` blanking) and emit
   the type docs through `enum_code.ml`. Layer-neutral: enums have no L2
   counterpart.
2. Entity docs for combined and cyclic modules, both layers. L1:
   `layer1_main.ml`'s `generate_ml_interface_internal` /
   `generate_combined_ml_modules` gain a doc parameter; one doc comment per
   `module rec X : sig` arm; `ml_interface.ml` re-exports the updated
   signature. L2: the module preamble of each class module, and of each
   combined class module in `class_gen.ml`, takes the class doc followed by
   the navigation paragraph (decision 10); the L1 module preamble gets the
   pointer back to L2. The `class type` and `class` get their canned docs.
   Cyclic shims (`generate_cyclic_shim_*`) take the same entity doc.
3. Method docs at L2: `class_gen_method.ml` and `class_gen_body.ml` emit the
   translated method doc (L1 method docs already exist from Phase 2).
4. Constructors, both layers: `layer1_constructor.ml` and
   `generate_constructor_impl` / `generate_constructor_sig` use translated
   `ctor_doc` when present; otherwise `Create a new <class name>. Wraps
   <link to the online C docs>`, with the C function name as the link text.
   L2 constructors follow a `{2:constructors Constructors}` heading. The
   link needs the per-namespace base URL (PRD §6.3) and gi-docgen's
   `ctor.<Type>.<name>.html` page pattern. This phase pulls in just that
   part of the table. Namespaces without gi-docgen docs (cairo) get the C
   name without a link.
5. Signals, both layers: `signal_gen.ml` emits the signal `<doc>` on the L1
   `on_<sig>` val (Interface mode) and on the L2 signal methods
   (`emit_l2_method`, `emit_l2_method_sig`); `signal_emission` gains the doc.

Accepted effect: `ocamlformat` may reposition module comments onto the
first declaration. Superseded: a blank line after the module comment keeps it
in place (`742d1a77`); see the status note above.

*Resolved from the earlier draft:* the L2 class-method docs (`class-button/`
pages) were previously out of scope. They are now step 3 of this phase.

*Acceptance (after each commit, and cumulatively):*
```bash
opam exec -- dune build @all
opam exec -- dune test gir_gen/ && xvfb-run $(which dune) test ocgtk/
git status --porcelain     # empty
dune exec gir_gen/tools/doc_diff/doc_diff.exe -- BASE      # additive diff only
```
Spot checks against known corpus anchors: `Gtk.Button` class doc non-empty
in `button.mli`, and as the L2 `GButton` module preamble with the navigation
paragraph; `gtk_enums.mli`
gains ≥1 enum/bitfield type-level doc; a combined cyclic-module file gains one
doc comment per `module rec` arm; a cyclic shim carries its entity doc; a
constructor with real `<doc>` shows GIR-derived text at L1 and L2; a signal
`on_<sig>` val and its L2 signal method both carry the `<doc>`; a `class-button`
method page shows its doc. Each is visible in the PR's preview.

### Phase 6 — Property and record-field docs (both layers)

**Status: done** (branch `m3-phase6`). The property's GIR doc goes on both
its getter and its setter at both layers; the synthetic `Get/Set property:
<name>` text is the fallback. No layer emits record fields (they appear only
in the override system), so there are no field docs to wire. Two additions:
the newly emitted docs exposed a translator gap, an unclosed fragment
(`[signal@Gtk.Entry::icon-press[`, an upstream typo) that put an unbalanced
`[` in a code span (8 odoc warnings), now parsed as literal text; and
`Doc_emit.around` replaces the blank-line-before-comment code repeated at
the method, constructor, signal and property sites. Result: 0 odoc
warnings.

*Goal:* property docs replace the synthetic `Get/Set property` text at every
layer that emits properties.

*Changes:* `layer1_property.ml` uses translated `prop_doc` when present,
synthetic text as fallback; `class_gen_property.ml` does the same for L2
property methods. Record fields: check whether a layer other than L1 emits
them. If one does, the fields land in the same both-layer pattern here; if
none does, the L1 site is the only site and it is wired here.

*Tests:* `doc_emit_tests` cases for the property fallback; a fixture property
with and without `prop_doc`.

*Acceptance:* the standing invariant; a property with a real `<doc>` shows
GIR-derived text at L1 and L2 in the PR's preview.

### Phase 7 — L2 page structure (sections, inheritance, no-constructor text)

**Status: done** (branch `m3-phase7`). *Revised 2026-10-28* for the
per-package layout and for the page structure Phase 6 settled. Implemented as
the four commits below. Notes: the inheritance block's link text is the
ancestor's OCaml module path (`Ocgtk.Widget`); a `GObject.Object` parent is
left out (216 class types), and the 9 class types with another GObject parent
(`InitiallyUnowned`, `ParamSpec`, `TypeModule`), which has no layer 2 class
type, name it as code. All 677 class modules have a `Constructors` heading (the 22 files
without one are combined modules). Change 4 also moves combined modules'
references to other groups' members onto public paths; it changed 386
generated files and kept the build green, which is the check that no member
modules depend on each other. Result: 0 odoc warnings.

*Goal:* every L2 class page follows the decision 10 layout, so a reader can
find a class's members and learn how to get an instance without knowing the
generator's conventions.

*Starting point (after Phase 6).* An L2 module page reads: a short preamble
(synopsis and navigation paragraph); `{1:class Class}`; the `class type` with
a bold "The methods, signals and properties of a [<Class>]." line followed by
the whole class doc; the `class`, with "Wraps a raw handle of
{!<L1 module>.t}."; `{1:description Description}` when the class doc is
longer than its synopsis; and `{1:constructors Constructors}` only when there
is at least one constructor. The module preamble and `class` doc parts of
decision 10 are therefore done. The `inherit` lines are links, but a cyclic
group member's parent links to the combined module's page
(`Event_controller_and__…_widget/class-type-widget_t`), not to `Widget`'s.

*Changes (one commit each):*
1. **Class type sections.** Floating `{2:signals Signals}`,
   `{2:methods Methods}`, `{2:properties Properties}` and
   `{2:conversions Conversions}` comments in the `class type` body (the
   `.mli`), in the body's existing order: signals, methods, property
   accessors, `as_*` methods. They sit at level 2 under the page's
   `{1:class Class}` heading. A section with no emitted members is not
   written, so the generator decides from what it emitted, not from the GIR
   lists (filtered methods, skipped signals and properties covered by
   methods leave a section empty). The `inherit` lines stay before the first
   section. Labels are per class type page, so they do not collide with the
   module page's `class`, `description` and `constructors` labels.
2. **Inheritance block.** In the class type doc, between the bold line and
   the class doc, so it is visible without scrolling past a long description:

   ```
   Inherits from: {!<parent L2 module>.class-type-<parent>_t}
   Implements:
   - {!<iface L2 module>.class-type-<iface>_t}
   ```

   Every interface the class implements is listed, including those already
   provided through the parent chain (the `inherit` lines skip those, to
   avoid diamond inheritance; the block is a reader's list, not the type).
   Paths are the public L2 module of each class (`Ocgtk.Widget`, never the
   combined module), qualified with the package's main module so they
   resolve across packages (`{!Ocgdk.Paintable.class-type-paintable_t}`).
   A parent or interface with no L2 class (not bound, or filtered) is named
   as code (`[GInitiallyUnowned]`) rather than linked. "Inherits from" is
   left out for a class with no parent and for interfaces; an interface's
   page lists its prerequisites under "Requires:" instead. Records get no
   block.
3. **No-constructor text.** The `{1:constructors Constructors}` heading is
   written on every L2 class page. When the class has no generated
   constructor, the heading is followed by one canned line (decision 10):
   abstract class, interface, or other. The abstract case needs GIR's
   `abstract="1"`, which the parser does not read today: add `abstract : bool`
   to `gir_class` (17 abstract classes in Gtk-4.0, including `Widget`). The
   module preamble's "Its constructors are under {!section-constructors}."
   sentence becomes unconditional. Records without constructors take the
   "other" line.
4. **Public paths to cyclic group members.** Outside its cyclic group, a
   member is referenced through its own L2 module (`Widget.widget_t`), not the
   combined module's (`Event_controller_and__…_widget.widget_t`). The shim's
   class type is an alias of the combined one, so the types are unchanged.
   The path comes from `layer2_class.class_module` in `Type_mappings`, so the
   fix there covers `inherit` lines and method, property and signal types
   together: 358 occurrences of the combined name in gtk's L2 `.mli` files
   today, most of them in member signatures (`get_child`, `set_child`), not
   `inherit` lines. Inside the combined module, members still refer to each
   other directly. This is a generator change, so the standing invariant
   covers it, and it is the commit to drop if it does not hold up (the other
   three do not depend on it).

*Tests:* `class_gen` tests on the parsed signature for: section emission,
including a class whose methods are all filtered (no `Methods` section) and
one with no signals; the inheritance block with no parent, a parent only,
and several interfaces including one provided by the parent; a cross-package
parent; an unbound parent (code, not a link); the three no-constructor lines;
parser test for `abstract`; the public path for a cyclic group member
referenced from a non-member, and the direct path between members.

*Acceptance:* the standing invariant; `dune build @doc` with 0 odoc
warnings; in the PR's preview:
- `Ocgtk.Button`'s class type page lists Signals, Methods, Properties and
  Conversions in its contents sidebar, and its inheritance block links to
  `Widget` and `Actionable`;
- no combined module name appears on `Button`'s pages, in the `inherit`
  lines or in member signatures;
- `Widget` shows the abstract-class line, an interface page (`Actionable`)
  shows the interface line and its "Requires:" list, and `Ocgdk.Display`
  shows the third line;
- `doc_diff` against `m3` shows only the changes above.

### Phase 8 — C-idiom AST rewrites (scalars, primitive types, ownership)

**Status: done** (branch `m3-phase8`). New module `Doc_c_idiom` holds the
literal names, the primitive lookup, the null-phrase pass and the ownership
filter; `doc_c_idiom_tests.ml` covers them. Corpus: about 5,700 C literals,
91 primitive sigils, and 858 ownership sentences stripped (678/98/82 over the
three patterns). 0 odoc warnings. Departures from the plan below:

- **`ret_shape` is `Plain | Throws`**, built by
  `Doc_translate.ret_shape_of_throws`. `Option` would have rendered exactly
  like `Plain`. Contrary to "no emission-site changes", three sites pass it:
  L1 methods, L2 methods and `Entity_doc.constructor` (both layers). Only
  `Throws` changes output: "%NULL on error" (and six similar phrases)
  becomes "an [Error] result"; on a non-throwing item it stays
  "[None] on error".
- **`C_prim` reads `Type_mappings.type_mappings`**, the generator's own
  table, so docs name the types the signatures use: `#gsize` →
  `[Gsize.t]`, `#gchar` → `[int]`, not the table above. Names it does not
  list (`goffset`, `guchar`, `gint8`) stay literal text, as before.
  `gpointer`/`gconstpointer` read as the word "pointer" rather than being
  dropped, so the sentence keeps its noun.
- **Ownership patterns are instruction-shaped**: "free/release/delete …
  with/using g_*", "use/call g_*free/unref*", "unref(f)ed … with/using". The
  bare `g_object_unref`/`g_free` patterns stripped explanatory sentences
  (Initable's "all operations … except g_object_ref() and g_object_unref()
  are considered to be invalid", "using g_realloc() and g_free() for memory
  allocation"). All 97 distinct stripped sentences were reviewed.
- **No-residual check** skips inline code spans as well as code blocks, and
  matches `freed? with g_(free|object_unref)` rather than any mention. The
  acceptance grep still finds `` [@sibling == %NULL] `` in
  `Grid.attach_next_to` (a C expression in a code span, which the guard
  keeps as `Code`) and C comments inside Gio `Task` code blocks.
- "non-%NULL" renders as "non-[None]".

Corpus anchors (sampled over Gtk/Gio/Gdk/Pango/Gsk/GdkPixbuf/cairo/Graphene,
~39,700 docs): `%TRUE`/`%FALSE`/`%NULL` ≈ 4,200 docs, backticked
`` `TRUE` ``/`` `NULL` `` ≈ 490, ownership/free sentences ≈ 430, `#gboolean`-style
primitive sigils ≈ 130. All are context-free or need only the method's
return shape, so no symbol index is required — this phase does not wait for
the resolver (Phases 11–13).

*Changes (all pure parse/AST/render; no emission-site changes):*

- **AST:** add `C_lit of c_lit` (`True | False | Null`) to `inline`, and
  `C_prim of string` (the C primitive name) for `#gint` and friends. `parse`
  recognises `%TRUE`/`%FALSE`/`%NULL`, backticked bare `TRUE`/`FALSE`/`NULL`,
  and `#g<primitive>` sigils; they no longer become `Sym_ref {kind=None}`.
  Guards follow the §3.5 sigil rules (a token inside a `Code` span that is
  more than the bare literal stays `Code`).
- **Render (`C_lit`):** `True`/`False` → `[true]`/`[false]`. `Null` is
  context-dependent (render takes a small `ret_shape` context from the
  emission site: `Plain | Option | Result`): `[None]` for nullable
  params/returns; for "…or %NULL on error" on a method that returns
  `result`, "an [Error] result"; `NULL-terminated` → "null-terminated"
  (prose, no literal).
- **Render (`C_prim`):** table lookup — `gboolean`→`bool`;
  `gint`/`guint`/`gint8..64`/`guint8..64`/`gsize`/`gssize`/`goffset`→`int`;
  `gdouble`/`gfloat`→`float`; `gchar`/`guchar`→`char`; `utf8`/`gchar*`→
  `string`; `gpointer`/`gconstpointer`→ dropped. Unlisted names degrade as
  before (`Sym_ref`).
- **Ownership stripping:** a sentence-level AST filter drops sentences
  matching `free(d)? with g_\w+`, `unref(f)?ed with`, `g_object_unref`,
  `g_free`, `g_strfreev`, `g_list_free\w*` (allowlist, one place, unit-tested).
  The emptied-paragraph case removes the paragraph. Counted per pattern in
  the generator's report.

*Deferred to Phase 13 (need a symbol index, not just a table):*
`%GTK_FOO` constants and enum members, `foo_bar()` C-call references, bare
`::signal` / `Type:prop` sigils. They stay `Sym_ref` here.

*Tests:* parse and render unit tests for every row above; the corpus smoke
test gains counters (`C_lit`, `C_prim`, ownership strips) and a
**no-residual check**: after Phase 8, no rendered doc contains `%TRUE`,
`%FALSE`, `%NULL`, or `g_object_unref`/`g_free` outside a code block.

*Acceptance:*
```bash
opam exec -- dune build @all
opam exec -- dune test gir_gen/ && xvfb-run $(which dune) test ocgtk/
git status --porcelain     # empty (regenerated bindings committed)
grep -rE '%(TRUE|FALSE|NULL)\b' oc*/generated/*.mli oc*/raw/generated/*.mli   # empty
grep -rE 'g_object_unref|freed with g_free' oc*/generated/*.mli oc*/raw/generated/*.mli  # only code blocks, if any
```

### Phase 9 — Conventions page and namespace module intros

**Status: done** (branch `m3-phase9`). Departures from the plan below:

- **The intro is on the modules page, not the namespace module.** dune
  generates the main module (a written one breaks odoc's links to layer 2
  parents), so it cannot carry a preamble. `Library_module.generate_modules_page`
  opens each `<pkg>/generated/modules.mld` with the intro: the class modules,
  then `Raw`, `Enums` and (when the namespace has constants) `Constants`,
  and a link to the conventions page. Each hand-written `<pkg>/index.mld`,
  `ocglib` included, gains a one-line link to it.
- **Outside ocgtk the link is raw HTML.** odoc cannot resolve a page
  reference across packages, so ocgtk uses `{!page-conventions}` and the
  other packages `{%html:<a href="../ocgtk/conventions.html">…</a>%}`, which
  matches the `@doc` layout (`_html/<pkg>/` beside `_html/ocgtk/`) the
  preview publishes. A different HTML layout (`@doc-new`) would break it
  silently: odoc does not check raw HTML.
- 0 odoc warnings.

*Revised 2026-10-07:* this phase previously generated a committed
`index.mld` per package with `doc_index.ml`. `ocgtk/index.mld` is hand-written
and the namespace modules already list their contents, so that is dropped.

*Goal:* a reader who lands on any namespace module or the package index
finds one page that explains how the bindings are organised.

*Changes:*
- `ocgtk/conventions.mld`, written by hand from the committed outline
  (sections, suggested points and draft Mermaid diagrams), linked from
  the preview landing page (see Root index pages; written early, PR #194).
- A short generated intro on each namespace module (`GdkPixbuf.mli`, ...,
  emitted by `library_module.ml`):
  two sentences on the module's contents (class modules, the `Wrappers`
  submodule, enumerations, constants) and a link to the conventions page.
  The intro is fixed text with the namespace name substituted.
- Generator unit test for the intro.

*Acceptance:*
```bash
opam exec -- dune build @all && opam exec -- dune test gir_gen/
git status --porcelain        # empty — regenerated namespace modules committed
opam exec -- dune build @doc --cache=disabled
# every {!…} link target resolves — odoc warnings for broken links are
# Phase-9 BLOCKERS, not TODO counts
```
The diagrams render in the PR's preview.

### Phase 10 — Warning classification

**Status: done** (branch `m3-phase10`). `gir_gen/tools/doc_warnings/` (a
library, `Odoc_warnings`, and a CLI; usage in its README) parses a
`dune build @doc` log, keeps the `Warning:` lines that follow a location
in a `.ml`, `.mli` or `.mld` file, and sorts them into eight buckets by
odoc's wording: `own-line` and `misplaced-tag` (the paragraph-on-own-line
and nested-tag classes, fixed at emission), `not-allowed`, `empty-markup`,
`unpaired`, `bad-markup`, `unresolved-reference` and `other`. The preview
workflow runs it in place of `grep -c`. Departures from the plan below:

- **Nothing to fix at emission.** A clean `@doc` build has 0 odoc
  warnings (as at the end of every phase since Phase 2), so every bucket,
  the fixable ones included, is zero.
- **The buckets were derived from odoc 3.2 output** for deliberately broken
  comments in a scratch project, not from this tree's (empty) warnings. The
  tests use those messages verbatim.
- **No landing-page table:** the landing page shows the one-line form
  ("5 (own-line 2, unpaired 3)") where it showed the count; the table is in
  the job summary.

*Goal:* odoc warnings are classified, not just counted.

*Changes:* classify the warnings the preview workflow captures into buckets
(decision 7); trivially fixable classes fixed at emission here
(paragraph-on-own-line, nested-tag re-parses); the preview's job summary
and landing page gain bucket counts. Unit tests: bucket classification of
synthetic warning lines and the odoc-line filter.

*Acceptance:*
```bash
opam exec -- dune build @doc --cache=disabled 2>&1 | tee doc-build.log
# classify doc-build.log locally; the PR preview's job summary shows the buckets
```
The trivially fixable buckets are zero at emission; the rest are recorded as
TODO counts, not silently dropped.

### Phase 11 — Cross-references I: the resolver, and links to types and constants

**Status: done** (branch `m3-phase11`). `Doc_index` builds the index from
the context and the references files; `Doc_resolve` rewrites `Sym_ref` to
`Ref { path; text }`; `Doc_emit.translate` (parse, resolve, render) is the
one translation emission sites use, and every site passes `~refs`. A fresh
`@doc` build has 0 odoc warnings and no unresolved link; 2,808 references
render as links (the summary's L2 count of linked fragments: Gtk 533,
Gio 365, Gdk 47, Pango 45, Gsk 20, GdkPixbuf 4). `doc_diff` against
`m3-phase10` shows only code spans becoming links in every binding package.
The acceptance links are as planned: `Ocgtk.Button`'s `[Gtk.ToggleButton]`
goes to `Ocgtk/Toggle_button/class-type-toggle_button_t/` (L2) and to
`Ocgtk_raw/Toggle_button/` (L1, through `Ocgtk.Raw.Toggle_button`), and
`Ocgtk.Drag_source`'s `[Gdk.ContentProvider]` links into `ocgdk`.
Departures from the plan below:

- **No links in class member docs.** odoc 3.2.1 resolves no reference in
  the doc of a method of a `class` or `class type`: a probe showed every
  form (another module, a type, a value, a module, `{!method-…}` in the
  same class type) rendered as `xref-unresolved`, with no warning. The
  class type's own doc and `val` docs resolve. So L2 method, signal and
  property accessor docs resolve with `Doc_resolve.class_member`, which
  links nothing, and their references stay code. The first build without
  it had 0 warnings but over 400 unresolved links, all in such docs.
  *Root cause* (odoc 3.2.1 source; `master` is the same): compiling a
  class or class type builds an `expansion`, a copy of its class signature
  with the method docs (`src/xref2/compile.ml`), and the HTML page is
  rendered from that copy (`src/document/generator.ml`). The link step
  (`class_type` and `class_` in `src/xref2/link.ml`) links the declared
  signature and the top doc but never the expansion, so the rendered
  method docs are unlinked. Warnings come from linking the declared
  signature, which is why a missing target warns but a valid one is still
  shown unresolved. Linking the expansion too (one line in each function)
  fixes it: a locally built odoc with that change renders the links, and
  reports a missing target twice. A bare `{!method-m}` naming a method of
  the same class type still fails, a separate limitation that full paths
  avoid. When odoc links the expansion, the three `class_member` sites can
  pass the normal refs.
  **Phase 12 is affected:** member links can be made from L1 docs and from
  L2 module, class type, enum and constant docs, but not from L2 member
  docs, until odoc resolves them.
- **Index type in `Types`.** The context carries the index, and `Types`
  cannot depend on `generate/`, so `Types.doc_index` is the data
  (namespace → GIR name → kind, and constant → OCaml name) and `Doc_index`
  builds it. Entries hold no C names yet (Phase 13 adds them) and no OCaml
  module names: the resolver derives them through `Module_paths`.
- **PRD §14 question 10.** The references files list only generated
  classes and records, and all interfaces, enums and bitfields, which are
  all generated. They listed every constant, including those the
  generator skips because their type has no OCaml literal form; they now
  list only generated ones (`Constant_code.is_generated`).
- **Outcomes, not fallbacks.** `render` cannot know why a `Sym_ref` was not
  resolved, so it still reports `Sym_ref_degraded`. `resolve` returns one
  outcome per reference (linked, or a miss reason) instead of a
  `Sym_ref_unresolved` fallback. `Member_in_other_namespace` is reported
  already.
- **The summary is a pure pass.** `generate` prints it per namespace from
  every GIR doc of the namespace's generated types, enums, bitfields and
  constants, resolved as L2 docs, rather than counting at the emission
  sites. It ends with the distinct `Unknown_target` endpoints. Named
  exceptions, all correct misses: `Gio.SettingsBackend`,
  `Gtk.PrintUnixDialog` and `Gtk.License` (not generated),
  `Gio.AsyncReadyCallback` (a callback named with `[type@]`),
  `PangoAttrInt` and `GtkColumnViewCell` (C names), and
  ``GdkPixbuf.PixbufLoader` `` (a stray backtick upstream).
- **Explicit kinds in paths.** Enum and bitfield links use
  `Enums.type-<e>`, so they cannot resolve to a value of the same name.

*Goal:* gi-docgen fragments that name a type or a constant become odoc links,
from both layers, to every generated namespace (decision 11). The resolver,
its index and the wiring to every emission site land here; Phases 12 and 13
only add index tables and resolver cases.

*Corpus anchors* (bundled GIR, all namespaces): `[class@]` 1,294,
`[iface@]` 319, `[type@]` 201, `[enum@]` 198 (some name a member, Phase 12),
`[struct@]` 195, `[const@]` 50, `[flags@]` 29: about 2,300 fragments.

*Changes:*
1. **`Ref` and its rendering.** `Ref of string` becomes
   `Ref of { path : string; text : string }`, rendered `{{!path}[text]}`,
   where `text` is the endpoint the degraded form shows today. Before
   wiring, a one-off odoc probe (like decision 10's) confirms that a
   code-span link text renders and resolves across packages. `Ref`'s text
   goes through the same balance check as `Code`.
2. **`Doc_index`, type level.** Built once per namespace and carried on the
   generation context (a new field, filled where the context is created).
   For the current namespace it lists the generated classes, interfaces,
   records, enums, bitfields and constants from the context, using the same
   `should_generate_*` predicates as the emitters. For every other namespace
   it reads `ctx.cross_references`. Each entry has the GIR name, the C name
   (for Phase 13), the kind and the OCaml names (module, class type, enum
   type, constant). First check PRD §14 question 10: whether the references
   files list only generated types (class structs are already absent). If
   they list ungenerated ones, add what the index needs to the references
   file in this phase.
3. **`Doc_resolve`.** `env = { namespace; layer : target_library; index }`,
   `env_of_ctx ctx`, and `resolve`, a pure rewrite of `Sym_ref` nodes.
   - *Endpoint parsing:* a first component that is a known namespace
     (current, or in `cross_references`) is the namespace; otherwise the
     endpoint is relative to `env.namespace`. Anchors are dropped, as today.
   - *Paths:* built with `Module_paths` (`main_module`, `raw_alias_module`,
     `enums_alias_module`, `constants_module`, `layer2_module_name`) per the
     PRD §7.2 table and the layer rule in decision 11. `[type@]` takes its
     kind from the index.
   - *Kinds:* `class`, `iface`, `struct`, `enum` (type only), `flags`,
     `const`, `type`. Every other kind is left as `Sym_ref` for Phases 12
     and 13, or for good (decision 11).
   - *Misses:* `Sym_ref_degraded of string` becomes
     `Sym_ref_unresolved of { endpoint; reason }`, where `reason` is one of
     `Namespace_not_generated`, `Unknown_target`, `Member_in_other_namespace`,
     `Kind_not_generated` and `Not_resolved_yet` (kinds a later phase
     handles). The node itself stays `Sym_ref`, so the rendering is
     unchanged.
4. **Wiring.** `Doc_emit.item_doc` and the direct `Doc_translate` calls in
   `entity_doc.ml` take `~refs:Doc_resolve.env`. Every caller already has
   `ctx`. Enum and constant sites pass the L2 layer (decision 11). Unit
   tests that have no context pass an empty index, which resolves nothing.
5. **Resolution summary.** Generation logs counts per namespace, per kind
   and per miss reason. This is the report the phase's acceptance reads; the
   corpus smoke test keeps testing parse and render without an index.

*Tests:* `doc_resolve_tests` with a fixture index: each type-level row of
PRD §7.2 from both layers; a relative endpoint; a cross-package type
(`[class@Gdk.Texture]` from Gtk); a record (class type, not module); a flags
type (`paintableflags`); `[type@]` resolved by kind lookup; GObject and GLib
types (`Namespace_not_generated`); an unknown type (`Unknown_target`); a
method fragment (`Not_resolved_yet`); an anchor; a backticked endpoint.
`doc_render_tests` for `Ref`, including the balance fallback.
`doc_index_tests` for the generated-type filter.

*Acceptance:* the standing invariant; `dune build @doc` with 0 odoc
warnings (a warning is a wrong path or a missing type: a blocker); the
resolution summary shows no `Unknown_target` for a current-namespace class,
interface, record or enum, other than named exceptions recorded here;
`doc_diff` against the phase's base shows only code spans becoming links; in
the PR's preview, `Ocgtk.Button`'s class doc links `[Gtk.ToggleButton]` to
`Ocgtk/Toggle_button/class-type-toggle_button_t/` on the L2 page and to
`Ocgtk_raw/Toggle_button/` on the L1 page, and `Ocgtk.Drag_source`'s
`[Gdk.ContentProvider]` links into the `ocgdk` package.

### Phase 12 — Cross-references II: members in the current namespace

**Status: done** (branch `m3-phase12`). `Emitted_members` selects what each
class, interface and record emits at each layer, the L1 and L2 emitters take
their member lists from it, and the commit that moved them left the
regeneration diff empty. `Doc_index.with_members` adds per-type member tables
from it, and `Doc_resolve` links methods, constructors, signals, properties,
and enumeration and bitfield members of the current namespace. A clean `@doc`
build has 0 odoc warnings and no unresolved doc reference. The resolution
summary (as L2 docs, all namespaces) goes from 1,014 to 3,755 linked
references of 7,211; per kind, linked of total: method 1,594 of 2,085, signal
382 of 457, property 519 of 535, ctor 113 of 141, enum 178 of 185, flags 12 of
12. `doc_diff` against `m3-phase11` shows, outside `gir_gen`'s own pages, only
code spans becoming links. The acceptance links are as planned:
`[signal@Gtk.Button::activate]` goes to
`Ocgtk/Button/class-type-button_t/#method-on_activate` from L2 docs and to
`Ocgtk_raw/Button/#val-on_activate` from L1 docs, and
`[Gtk.MenuButton:direction]` links to `Ocgtk.Raw.Menu_button.val-get_direction`
from L1 docs and stays code in L2 docs. Notes and departures:

- **Inventory of drops and renames** (also in `emitted_members.mli`):
  - methods, both layers: `Filtering.should_skip_method_binding` (unknown
    types, varargs, not introspectable, unsupported arrays and out arrays,
    record copy, free and unref);
  - methods, L2 only: an out parameter (`Class_gen_helpers.should_skip_method`);
    a name an ancestor or an implemented interface declares
    (`collect_inherited_method_names`, which also holds the ancestors'
    property accessor names); a name an earlier method of the same entity
    took;
  - methods, renamed: `Utils.ocaml_function_name` at L1 and
    `Class_gen_helpers.ocaml_method_name` at L2 (keywords get a `_`);
  - constructors, both layers: `Filtering.should_generate_constructor`;
    renamed by `Utils.ocaml_constructor_name` (`new` → `new_`);
  - signals, both layers: `Signal_gen.classify` errors (out parameters,
    unsupported boxed or primitive types); renamed `on_<s>`;
  - properties, both layers: `Filtering.should_generate_property` (array
    type, no type mapping, or claimed by a method's `get-property` or
    `set-property`); L2 only: a getter or setter whose name is already
    declared; named `get_<p>`/`set_<p>` at L1, `<p>`/`set_<p>` at L2;
  - C stubs: the `Failure` catches in `c_stub_helpers.ml` skip a stub but not
    its OCaml declaration, and none fires on the bundled GIR, so they do not
    change what the modules declare.
- **The L2 conflict comment is unreachable.** `detect_method_conflicts` and
  `collect_inherited_method_names` both read the same ancestors, so a method
  whose name an ancestor declares with another signature is dropped as
  inherited before the conflict check. No generated file has a `CONFLICT`
  comment. `Emitted_members.l2_method` keeps the `conflict` flag so the
  emitters' behaviour is unchanged; removing the dead branch is left out of
  this phase.
- **Explicit kinds in member paths.** Values are `val-<name>` (L1 externals
  and L2 constructors), methods `class-type-<t>_t.method-<name>`, and
  enumeration members `type-<e>.constructor-<TAG>` (`type-<f>_flag` for a
  bitfield). An odoc probe confirmed each, including `val-` on an `external`
  and a method reached through a cyclic shim's class type alias.
- **Separators in endpoints.** Signal and property names are looked up with
  hyphens and enumeration members in upper case with underscores, whichever
  separator the doc uses (`[enum@Gtk.DirectionType.tab-forward]`).
- **The property target falls back to a setter** whenever no getter is
  emitted at the layer, not only for write-only properties: the link still
  goes to an emitted accessor of the property.
- **The member index needs the context.** Deciding what an entity emits needs
  type mappings, so `Doc_index.build` still makes the type-level index when
  the context is created, and `Doc_index.with_members` adds the member tables
  once the context, with its module groups, exists.
- **More generator output.** Building the member tables runs the method
  filter once more per method, and `Exclude_list` prints its `Skipping
  method` line to stderr again; those lines were already repeated per
  emitter.
- **L2 member docs still link nothing** (Phase 11's odoc limitation): member
  links appear in L1 docs and in L2 module, class type, constructor, enum and
  constant docs.
- Remaining `unknown-target` misses are members the doc's layer does not
  emit: async methods (callback parameters), L2 methods with out parameters,
  varargs, skipped signals, and members of types that are not generated
  (class structs such as `Gtk.WidgetClass`, `Gtk.License`). A stray `)` in
  upstream `[signal@Gtk.CellArea::apply-attributes)` is a named exception.

*Goal:* method, constructor, signal, property and enum-member fragments link
when they name the current namespace, from both layers.

*Corpus anchors:* `[method@]` 2,529, `[property@]` 579, `[signal@]` 508,
`[ctor@]` 160, and the member form of `[enum@]`. About 96% of Gtk's member
fragments name Gtk itself.

*Changes:*
1. **Inventory every place a member is dropped or renamed** before it is
   written: `filtering.ml` (methods, properties, constructors), the
   signature-conflict checks and `ocaml_method_name` in
   `class_gen_conflict_detection.ml`, the signal skip rules in
   `signal_gen.ml`, the `Failure` catch that skips methods in
   `c_stub_helpers.ml`, and properties a method claims (PRD §7.2). Record
   the list in this phase's notes. Any drop that is only known after
   emission must be made computable first.
2. **`Emitted_members`.** One pure function per entity kind that returns
   what the entity emits at each layer under its OCaml names: L1 and L2
   methods, constructors (L1 `external`, L2 module-level `val`), signals
   (`on_<s>`), and each property's accessor (getter or setter, per the PRD
   §7.2 order). The emitters are changed to take their member lists from it.
   This commit must leave the regeneration diff empty, which is the check
   that the selection matches the emitters.
3. **Index and resolver.** `Doc_index` gains per-type member tables for the
   current namespace, from `Emitted_members`, and enum and bitfield member
   tables. `Doc_resolve` handles `method`, `ctor`, `signal`, `property` and
   `enum` with a member, along the PRD §7.2 rows at both layers. A flags
   member links to the `<flags>_flag` type's tag
   (`type-paintableflags_flag.constructor-SIZE`). A member of another
   namespace is `Member_in_other_namespace`. A member the entity does not
   emit at the doc's layer is `Unknown_target`.

*Tests:* `emitted_members_tests` for every drop and rename in the inventory,
and for the property rule's four cases (claimed getter, generated getter,
setter only, none). `doc_resolve_tests` for each member row from both
layers: a filtered method (code), a renamed method (the renamed target), a
property claimed by `get_label`, a property-only getter (`method <p>` at L2,
`get_<p>` at L1), a property whose accessors exist at one layer only
(`Gtk.MenuButton:direction`: L1 has `get_direction`, L2 drops it and
`set_direction` because they clash with `Widget`'s, so the L2 reference is
code), a constructor (L2 `val`, L1 `external`), a signal, an enum member, a
flags member, and a cross-namespace method (code).

*Acceptance:* the standing invariant, including an empty regeneration diff
after change 2; `dune build @doc` with 0 odoc warnings (a warning means
`Emitted_members` and an emitter disagree: a blocker); in the PR's preview,
`[signal@Gtk.Button::activate]` in `Button`'s class doc links to
`method-on_activate` on its class type page (L2) and to
`Ocgtk_raw/Button/#val-on_activate` (L1); `MenuButton`'s
`[Gtk.MenuButton:direction]` links to `get_direction` from L1 docs and stays
code in L2 docs.

### Phase 13 — Cross-references III: legacy sigils and C symbols

**Status: done** (branch `m3-phase13`). `Sym_ref` records its `origin`, and
`parse` turns a C call in prose into a `Sym_ref { origin = C_call }` that
renders as `[gtk_widget_show ()]`, linked or not. `Doc_index` lists types by C
type and constants by C identifier in every indexed namespace, and, for the
current namespace, methods, constructors and enumeration and bitfield members
by C identifier. `Doc_resolve` resolves each origin along the rows above;
`Not_resolved_yet` is gone. A clean `@doc` build has 0 odoc warnings and no
unresolved doc reference. The resolution summary (as L2 docs, all namespaces)
goes from 3,755 to 6,795 linked references of 8,974; the 1,763 new
references are the C calls. Linked of total, per origin: `#` sigil 958 of
1,212, `%` sigil 1,098 of 1,258, C call 984 of 1,763. Outside `gir_gen`, every
changed binding file differs from `m3-phase12` only by references becoming
links, unresolved C calls becoming code spans, and the hyphen fix below
(checked by normalising both sides). Acceptance: no Gtk doc has a
`%GDK_KEY_*` sigil; `%GDK_BUTTON_PRIMARY` in `Gtk.GestureSingle`'s doc links
to `Ocgdk.Constants.button_primary`, and `gtk_widget_activate()` in Gtk docs
links to `Ocgtk.Raw.Widget.val-activate`. Notes and departures:

- **C calls.** An identifier with an underscore, followed by `()` or ` ()`.
  It must not continue a word, a path or a member access (`obj.do_it()`,
  `/path_to()`), nor follow `[`: a rendered call starts with one, and
  without that guard a second parse wraps it again (the corpus convergence
  check caught this). C calls in code spans stay code. ocamlformat may break
  a long linked call between the name and `()`; odoc renders it on one line.
- **`[id@symbol]` resolves like a C call**: methods and constructors of the
  current namespace only. A `%` sigil tries constants first (the current
  namespace, then the others), then enumeration and bitfield members of the
  current namespace.
- **Hyphens in `#Type:prop` and `#Type::sig`.** The sigil used to end at the
  first hyphen, so `#GApplication::command-line` degraded to
  `[GApplication::command]-line`. A hyphen between identifier characters is
  now part of the name, which links 100 more `#` sigils.
- **The summary** counts sigils and C calls on their own lines (`#sigil`,
  `%sigil`, `c-call`) and lists missed ones as the source wrote them
  (`#GtkFoo`, `%FOO`, `foo()`).
- Remaining misses are mostly symbols of namespaces that are not generated
  (`g_*()`, `%G_*`, `#GObject`, `#GBytes`), free functions
  (`gtk_accelerator_parse()`), callback types and class structs, methods a
  layer does not emit (varargs, out parameters at L2, async), and members of
  other namespaces.

*Goal:* the gtk-doc sigils and C-symbol references that PRD §3.5 and §7.4–7.5
say are resolvable link, under the same rule as the fragments (decision 11).

*Changes:*
1. **AST.** `Sym_ref` records where it came from:
   `origin : Fragment | Hash | Percent | C_call`. Today a `#Type` and a
   `%CONST` sigil both parse to `Sym_ref { kind = None }`, and the resolver
   cannot tell them apart. `parse` also recognises a C call, an identifier
   with an underscore followed by `()` (`gtk_widget_show()`), as
   `Sym_ref { origin = C_call }`. Its degraded rendering is the code span
   `[gtk_widget_show ()]`, the gi-docgen rendering, so these become code
   even where they do not resolve.
2. **C-name tables in `Doc_index`:** types by C type (`GtkWidget`, from the
   context and from `cr_c_type`); constants by C identifier (`GDK_KEY_a`;
   the references files carry it as `cr_c_type`); for the current namespace,
   enum and bitfield members by C identifier, and methods and constructors
   by `c_identifier`.
3. **Resolver cases.**
   - `#Type` → the type, in any generated namespace.
   - `#Type:prop`, `#Type::sig` → the member, current namespace only.
   - `%CONST` → the constant, in any generated namespace
     (`%GDK_KEY_a` → `{!Ocgdk.Constants.key_a}`).
   - `%ENUM_MEMBER` → the member, current namespace only.
   - `symbol()` and `[id@symbol]` → the method or constructor, current
     namespace only.

   Misses render as code, as today.

*Tests:* parse cases for each origin, including the PRD §3.5 guards (URL
fragments, headings, hex colours) and C calls inside code spans (left as
code); resolver cases for each row above at both layers; a sigil whose name
is also a constant in another namespace; `%TRUE` is not looked up (Phase 8
made it `C_lit`).

*Acceptance:* the standing invariant; `dune build @doc` with 0 odoc
warnings; the resolution summary per origin; in the PR's preview, a
`%GDK_KEY_*` sigil in a Gtk doc links into `Ocgdk.Constants`, and a
`gtk_widget_*()` call in a Gtk doc links to the method.

### Phase 14 — Property doc fallbacks: accessor method docs and a fuller canned line

*Goal:* fewer properties fall back to the bare `Get/Set property: <name>`
text, and the ones that still do tell the reader the type, the default and
where the upstream docs are. Added 2026-10-29.

*Corpus anchors* (bundled GIR): Gtk has 1,289 properties, and 89 of them have
no `<doc>`. Of those 89, 34 name a `getter=` or `setter=` method and 79 have
a `default-value=`. Gio and GdkPixbuf have one undocumented property each;
the other namespaces have none. The committed Gtk L2 `.mli` files have 50
`Get property:` fallbacks. Example: `Gtk.TreeView:enable-grid-lines` has no
doc and no `getter=`/`setter=`, so it is covered by change 2 but not by
change 1.

*Changes:*
1. **Accessor method docs.** The parser records the property's `getter=`,
   `setter=` and `default-value=` attributes on `Types.gir_property`
   (`prop_getter`, `prop_setter`, `prop_default`; all `string option`). When
   `prop_doc` is absent, `Entity_doc.property` uses the doc of the class's
   method named by `getter=` for the getter, and of the method named by
   `setter=` for the setter. If the property names only one of them, both
   accessors use that method's doc. The lookup goes through the class's (or
   interface's) own method list. A method that is not found, or has no
   doc, falls through to change 2. Method docs are translated in the
   `Member` context as now. Check in the regeneration diff whether `@param`
   names in setter docs (`@enabled`) read badly on a property setter. If
   they do, strip the parameter sigil to plain code for docs borrowed this
   way.
   No heuristic name matching (`enable-grid-lines` → `get_grid_lines`):
   only the GIR attributes are used.
2. **A fuller canned line.** The fallback becomes, for example,
   ``Get property: [enable-grid-lines] ([TreeViewGridLines], default
   [GTK_TREE_VIEW_GRID_LINES_NONE]). See {{:…/property.TreeView.enable-grid-lines.html}upstream docs}.``
   - The type is the GIR type name as code. It is not an OCaml link until
     Phase 11's resolver can produce one, so this phase does not depend on it.
   - The default is `default-value=` as code, left out when absent.
     The attribute is a bare C value, not a `%` sigil, so it does not go
     through the translator: `TRUE`, `FALSE` and `NULL` are mapped with
     `Doc_c_idiom`'s literal names (`true`, `false`, `None`); any other
     value (an enum member's C name, a number, a string) is shown as is.
   - The link uses `upstream_base_url`, as the constructor fallback does:
     `property.<Class>.<prop-name>.html`. Namespaces without a gi-docgen site
     get no link. gi-docgen writes a page for every property, documented or
     not, so the link never points at a missing page. Check this for one
     undocumented property before wiring.
   - The setter line also says "Construct-only." when `construct_only` is set.
   `Entity_doc.property` takes `~namespace` and `~class_name` for the link.
   Both call sites (`layer1_property.ml`, `class_gen_property.ml`) already
   have them in scope.

*Tests:* `entity_doc` tests for each case: a property with a doc
(unchanged); no doc with `getter=` and `setter=` (each accessor takes its
own method's doc); no doc with only `getter=` (both use it); `getter=` naming
a method with no doc (canned line); no attributes, with and without a
default; a namespace without an upstream site (no link); a construct-only
setter. A parser test for the three new attributes.

*Acceptance:* the standing invariant; `dune build @doc` with 0 odoc
warnings; the count of `Get property:` lines in the committed Gtk L2 `.mli`
files falls from 50, and every one left has a type and a link; `doc_diff`
against the phase's base shows only property accessor docs changing; in the
PR's preview, `Ocgtk.Tree_view`'s `enable_grid_lines` shows the fuller line
with a working upstream link at L1 and L2.

### Phase dependencies

- 0 blocks everything (baseline).
- 1 → 2 → 3: the translator and emit helper must exist before sites consume
  them; the HTML diff must exist before wiring diffs are reviewed.
- 4 (preview) needs 0 only: the workflow does not use the HTML diff, so it
  landed before 3. It must precede 5, so that every later PR has a preview.
- 5 (wiring) needs 2 and 3 (its diff is reviewed with the HTML diff).
- 6 (properties) needs 5: it reuses the both-layer pattern Phase 5 establishes.
- 7 (L2 page structure) needs 6: the Properties section should have docs
  when it first appears.
- 8 (C idioms) needs 5 (translated output must already flow through all sites
  so the diff is only the idiom rewrites).
- 9 (conventions page and namespace intros) needs 7, so the page describes
  the final layout. The hand-written text can be drafted earlier.
- 10 (warning classification) needs 4 (captured warnings) and a stable `@doc`
  from 5–9, so the buckets are not classified against a moving target.
- 11 (resolver, types) needs 7: the class type and constructor anchors it
  links to are Phase 7's. It does not need 8–10, and can land before them.
  The resolver adds no odoc warnings by design (decision 11), so Phase 10
  does not wait for it.
- 12 (members) needs 11.
- 13 (sigils) needs 12 (member tables) and 8 (`%TRUE`, `%NULL` and `#gint`
  are no longer `Sym_ref`, so they are never looked up).
- 14 (property fallbacks) needs 6 (property doc wiring) and 8 (C literal
  rewrites for defaults). It is independent of 11–13 and can land before
  them. Once 11 lands, the type in the canned line could become a link; that
  is a follow-up, not part of 14.

## Verification for the whole leg (after all phases)

Per-phase acceptance gates above are the primary verification; this is the
closing checklist on top of them:

- `opam exec -- dune build @all`; `opam exec -- dune test gir_gen/` (and the
  ocgtk tests, per CONTRIBUTORS).
- Translator and `Doc_emit` unit/expect tests pass; corpus smoke test green
  (re-run at close).
- Regenerated bindings committed; tree clean afterwards;
  the full test suite is green on the committed tree.
- Warning report recorded, filtered to odoc-attributable lines; trivial
  buckets eliminated at emission; the rest TODO-counted, not silently
  dropped.
- `doc_diff` against a commit before a known translator change shows the
  expected HTML delta; against `HEAD` on a clean tree it shows none.
- Preview workflow posts a URL on each PR from Phase 4 on; eyeball the member
  docs with headings (`{b …}` lead-ins) and the `about_dialog` C-fence page.
- Layer check: every entity, method, constructor, signal and property site
  that emits at L1 also emits its doc at L2, or is recorded here as a named
  exception.
- Cross-references: 0 odoc warnings with the resolver on; the resolution
  summary's misses are all reasons decision 11 accepts (ungenerated
  namespaces and kinds, other-namespace members), apart from named
  exceptions recorded with Phases 11–13.

## Known limitations

- **A cyclic group member's own page shows its class type as an alias.**
  `Ocgtk.Widget`'s module page reads `class type widget_t =
  Event_controller_and__…_widget.widget_t`; odoc expands the alias on the
  class type's page, so its members are listed there. Everywhere else, layer
  2 refers to the member through its own module (Phase 7, change 4).

## Explicitly out of scope (later legs)

- Alias pages (page model, PRD §11).
- `@param`/`@return`/`@deprecated` tag emission; generalised `@since`.
- Cross-namespace member references (about 100 in Gtk): need a member
  table in the references files (the PRD §7.7 emitted-symbol map). They
  stay code (decision 11).
- References to functions, callbacks, vfuncs, aliases and error domains,
  which are not generated, and to GLib and GObject types, which have no
  generated namespace.
- Upstream-URL mapping for relative `.html` links (PRD §6.3) — likewise a
  pure `Page_ref` rewrite.
- Page-model refinements: synthetic synopses (§12), screenshots,
  `<docsection>` fold into index pages. (Class-type grouping headings and
  the Inherits/Implements block moved into this leg as Phase 7.)
- "Returned by" lists for classes without constructors (the functions and
  methods whose return type is the class) → a later leg, on Phase 12's
  member index; Phase 7 states
  only the canned no-constructor line.
- Warning gate in CI (report-only this leg).
- C code-block translation (~210 C blocks): labelling untranslated C blocks
  as C, mechanical translation of a restricted C subset into layer-aware
  OCaml with a compile check, and hand-written OCaml for prominent examples.
  Planned here as Phases 11–14 until 2026-10-28; dropped as too much for this
  leg. C blocks render as `{[ … ]}` meanwhile.
- Library layout change (one library per namespace, dune-generated main
  module, flat public class modules); makes the `inherit` lines links. See
  [library-layout-proposal](../research/library-layout-proposal.md).
