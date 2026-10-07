# M3 Odoc Translation Slice — emission, wiring, artifact cache, PR doc preview

**Status: Phases 0–2 and 4 implemented; Phase 3 and Phases 5 onwards not
yet done (per-phase status below).** Phase 0 and 1: PRs #188 and #190,
merged into `m3`. Phase 2 and the start of Phase 5: PR #191 (branch `m3-p2`),
merged into `m3`. Phase 4: branch `m3-p4`, based on `m3` because Phase 3 has not
started; the workflow does not use the cache driver. Phase 3 onwards: one
branch and PR per phase (see the rules below).
**Created: 2026-09-08; revised: 2026-10-05 (both layers in this leg; phases
renumbered plainly from 3; cache driver and preview moved up to Phases 3 and 4;
one PR per phase); 2026-10-07 (Phase 4: preview action replaced, previews
for PRs and `main` only; L2 page structure (decision 10), new Phase 7,
Phases 7–13 renumbered to 8–14, Phase 9 replaced by a conventions page)**
**Branch: `feat/m3-odoc-translation-slice`** (from `origin/m3` @ `9cec9171`, which
contains the doc-parsing PR #184 and the
[research PRD](../research/reference-documentation.md))

## Purpose of this leg

First *visible* vertical slice of M3: GIR `<doc>` text (already captured in the
AST by PR #184) is translated to odoc markup, emitted across the L1 and L2
bindings, and rendered to browsable odoc HTML with:

- a **GitHub Pages preview** for every PR (a live doc-preview URL) and for
  `main`; pushes to other branches are not previewed,
- a **local artifact cache** so outputs from different commits can be compared
  against a benchmark without rebuilding.

Rendered HTML is never committed to any code branch — it exists only on the
auto-managed `gh-pages` branch and in the local cache.

## Decisions (recorded deliberately; supersede earlier suggestions)

1. **Emission is always-on, and the regenerated bindings are committed.** No
   `--with-docs` flag: every doc-carrying emit site routes raw GIR text through
   the translator. Unlike the earlier draft, this leg **commits the
   regenerated doc-carrying bindings** — the one-time generated-file diff is
   part of this PR. Consequences: the committed tree is again byte-identical
   to a fresh regeneration (CI and the doc pipeline agree on one source of
   truth), and the artifact cache's clean-tree keying below works as
   specified. The earlier "keep committed bindings doc-less" idea is
   superseded: it permanently dirtied the tree and defeated the cache.

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

3. **Local artifact cache stays** as the rebuild-avoidance and benchmark
   layer (local now, CI later). Reviewer-grade HTML without publishing,
   cross-commit comparison against a blessed baseline, and identical commits
   never pay the full regeneration + `@doc` build twice.

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
   rest are recorded as TODO counts in the artifact manifest. Capture is
   available from Phase 3; classification follows in Phase 10. No CI gate this
   leg; the gate arrives once classification stabilises.

8. **C idioms are translated, not just degraded (added 2026-10-04).** GIR
   prose and examples are written for C. Two phase groups handle them:
   **Phase 8** (after Phases 5–7) does the trivial, deterministic AST
   rewrites; **Phases 11–14** (end of cycle) do code-block translation.
   Ownership boilerplate (`Free the returned object with g_object_unref()`,
   `should be freed with g_free()`) is **stripped**: the GC owns every value,
   so the sentence is actively misleading. Every strip is counted in the
   warnings manifest. Code-block translation is **layer-aware**: L1 emission
   uses L1 idioms (modules and functions of the `Wrappers` module,
   `Label.set_text l "x"`), L2 emission uses L2 idioms (classes and methods,
   `l#set_text "x"`).

9. **One PR per phase, stacked, with the preview as the checkpoint (added
   2026-10-05).** Each phase is its own PR, branched from the previous phase's
   branch and merged in order. A phase's acceptance gate is the checkpoint for
   its PR. From Phase 4 on, every PR gets a preview URL, so the rendered docs
   are reviewed on the PR, not only in the local cache.

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

## Translator design: parse → flat AST → render

`gir_gen/lib/generate/doc_translate.ml` + `.mli` is split into two pure
stages joined by an intermediate AST, with `translate` kept as the
composition for emission sites:

```ocaml
val parse : context -> string -> t      (* GIR markdown -> AST *)
val render : t -> string               (* AST -> odoc markup *)
val translate : context -> string -> string   (* = render ∘ parse *)
```

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
  (* RESOLVED odoc {!path} — produced ONLY by the future resolver leg;
     parse never emits this *)
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

- **Cross-reference resolver (PRD §7)**: `Sym_ref → Ref` on hit,
  `Sym_ref → Code` on miss (§7.6), parameterised by layer (§7.8). Zero
  parser changes, zero render-policy changes.
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
| `Sym_ref` | `[endpoint]` code span (degraded; counted) | §7 resolver |
| `Param_ref` | `[name]` code span (PRD §6.5) | — |
| `Ref` | unreachable in v1 | resolver output |
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
| `scripts/doc_artifacts.ml` | Artifact cache driver (Phase 3; warning classification added in Phase 10): `build`/`list`/`extract`/`diff`/`diff-baseline`/`set-baseline`/`warnings` subcommands plus `--force`. Pure `Sys.command` shelling; invoked as `opam exec -- ocaml scripts/doc_artifacts.ml …` (no dune bootstrap needed — it shells out only). |
| `.github/workflows/doc-preview.yml` | Phase 4. Builds `@doc` (read-only job), deploys PR previews and `main` (write job). |
| `.github/workflows/doc-preview-cleanup.yml` | Phase 4. Removes a PR's preview on close (`pull_request_target`, no PR code run). |
| `scripts/doc-preview-landing.sh` | Phase 4. Writes the landing `index.html` linking the package roots, with build provenance. Runs locally too. |

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
| `ocgtk/dune`, `gir_gen/dune` | `(documentation)` stanzas (leg 0). |

**No change:** `.opam` files (`odoc {with-doc}` already emitted by dune),
`lib/types.ml` (all doc fields already parsed by PR #184).

## Root index pages (per package)

odoc page trees are per-package, so each package gets its own `index.mld`
under a `(documentation)` stanza (one per dune project: `ocgtk/` root,
`gir_gen/` root).

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

## Doc artifact cache

**What and why.** The driver caches **rendered odoc HTML artifacts per
commit** — the gzipped `_build/default/_doc/_html` tree plus a JSON
manifest. Not the bindings, not odoc's intermediate `.odoc` files. Three
consumers:

1. **Skip the expensive pipeline on repeat work.** `build` = regenerate
   bindings + `dune build @doc`. Both are slow and fully deterministic on a
   clean tree (that is why decision 1 commits the bindings — the tree at a
   given sha *always* produces byte-identical HTML). Same sha, artifact
   exists → cache hit, zero rebuild.
2. **Benchmark diffing.** Once a baseline is blessed (`benchmarks/BASELINE`),
   `diff-baseline` extracts two artifacts and runs `diff -r` across the HTML
   trees — the review workflow: "what did this translator change do to the
   rendered docs across all 39k docs?", answered without publishing or
   hand-browsing. Only meaningful because identical tool versions produce
   identical output; the manifest records odoc/dune versions so a version
   bump is not misread as a translator regression (and `--force` forces
   regeneration when that happens).
3. **Reviewer-grade local preview.** `extract <sha>` untars an artifact into
   `view/` for browsing, without deploying to gh-pages.

It deliberately is **not**: CI infrastructure (preview publishing goes
through the gh-pages workflow), a build cache for `dune` itself, or
versioned in git — a per-box scratch/benchmark layer, outside every
worktree so `git clean` and branch switches cannot destroy it.

**Location** — default `~/.cache/ocgtk-doc-artifacts/`, override
`OCGTK_DOC_ARTIFACTS`:

```
<cache>/
  artifacts/
    <full-commit-sha>.tar.gz      # gzipped tar of _build/default/_doc/_html
    <full-commit-sha>.json        # manifest (below)
  benchmarks/
    BASELINE                      # blessed benchmark sha + one-line note
  view/                           # extracted trees for local browsing (scratch)
  index.tsv                       # append-only: sha, date, branch, note
```

**Keying** (coherent now that bindings are committed — decision 1 —
regeneration is idempotent and the tree stays clean):

| Tree state | Key | Semantics |
|---|---|---|
| Clean (`git status` empty) | `git rev-parse HEAD` (full sha) | **immutable**: hit → reuse, print artifact path; miss → build once, write once, never overwrite |
| Dirty | `<sha>-dirty` | scratch: always rebuilt, always overwritten, never a baseline candidate |

The asymmetry is the point: a clean-sha artifact is a pure function of the
commit (deterministic pipeline ⇒ same output forever), so immutability is
safe and cache hits are trustworthy. A dirty-tree build depends on
uncommitted state, so it cannot be keyed by sha alone and gets no
immutability guarantees. Because hits are keyed on sha alone, a toolchain
bump (odoc/dune upgrade) will keep serving the old-toolchain artifact for a
known sha — `--force` exists for exactly that; the manifest's recorded
versions make the situation recognisable.

**Manifest fields (`<sha>.json`):** sha, branch, date, host odoc version,
dune version, artifact byte size, HTML file count, free-text note, and the
**odoc warning report** — filtered to odoc-attributable lines (decision 7).
Phase 3 records the filtered raw warning count; Phase 10 adds the classified
bucket counts (report-only this leg).

**Benchmark semantics:** once translation stabilises, one artifact is blessed
as `benchmarks/BASELINE`; any later artifact can be byte-diffed against it
(`diff -r` between extracted trees is meaningful for identical tool versions;
the determinism claim gets one probe — clear cache, rebuild same sha, diff).
Phase 3 blesses the Phase 2 commit as the first baseline, so Phase 5's wiring
diff is reviewed against it.

**Driver interface:**

```bash
opam exec -- ocaml scripts/doc_artifacts.ml build [note]        # ensure artifact for HEAD
opam exec -- ocaml scripts/doc_artifacts.ml build --force [note] # rebuild even on hit
opam exec -- ocaml scripts/doc_artifacts.ml list                # print index.tsv
opam exec -- ocaml scripts/doc_artifacts.ml extract <sha> [dir] # untar for browsing
opam exec -- ocaml scripts/doc_artifacts.ml diff <shaA> <shaB>  # diff -r two artifacts
opam exec -- ocaml scripts/doc_artifacts.ml diff-baseline       # diff HEAD artifact vs BASELINE
opam exec -- ocaml scripts/doc_artifacts.ml set-baseline <sha> ["note"]
opam exec -- ocaml scripts/doc_artifacts.ml warnings <sha>      # print stored warning report
```

`build` internally runs the regeneration the bindings pipeline already
provides (`scripts/generate-bindings.sh` semantics) then
`opam exec -- dune build @doc` from the workspace root, capturing the odoc
warning log for classification.

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
  matches the SHA that keys the local artifact cache.
- **Warnings are counted, not fatal:** the count of odoc `Warning:` lines
  (compiler warnings excluded) goes into the landing page and the job
  summary, and the full log is uploaded as a workflow artifact
  (decision 7). The doc build runs with `--cache=disabled`: dune does not
  replay the warnings of rules restored from its cache, so a cached build
  under-counts. The same applies to the Phase 3 driver's warning capture.
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

### Phase 3 — Doc artifact cache driver (local)

*Goal:* the local cache works, and Phase 2 is blessed as the first benchmark
baseline, so every later PR can be diffed against it.

*Changes:* `scripts/doc_artifacts.ml` with the CLI per the driver interface
above (`build`, `build --force`, `list`, `extract`, `diff`, `diff-baseline`,
`set-baseline`); keying and dirty-suffix semantics as specified; manifest
(sha, branch, date, odoc and dune versions, byte size, HTML file count, note,
and the filtered raw warning count). Bucket classification is left to Phase 10.
Small OCaml test for the purely testable parts: manifest serialisation and
key/dirty-suffix logic.

*Acceptance:*
```bash
opam exec -- ocaml scripts/doc_artifacts.ml build            # build + cache
opam exec -- ocaml scripts/doc_artifacts.ml build            # cache hit, no rebuild
opam exec -- ocaml scripts/doc_artifacts.ml build --force    # rebuilds
opam exec -- ocaml scripts/doc_artifacts.ml list             # index.tsv entry
opam exec -- ocaml scripts/doc_artifacts.ml set-baseline <sha> "phase 2"
opam exec -- ocaml scripts/doc_artifacts.ml diff-baseline    # identical → empty
# determinism probe: clear cache, rebuild same sha, diff-baseline → empty
```
Dirty-tree build keys `<sha>-dirty` and is never a baseline candidate.

### Phase 4 — PR preview workflow (CI)

*Goal:* every PR from here on gets a rendered-docs preview URL, which is the
review surface for Phases 5–14.

**Status: implemented; acceptance pending the first run** (branch `m3-p4`;
the checks below need the workflow to have run on the PR and the Pages
setup to be done). The action changed from
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
(previously-doc-less output gains docs) and must be reviewed as such, against
the Phase 2 baseline from Phase 3.

**Status: partly done.** Class/interface entity docs are un-suppressed for L1
(`adc30fe6`, `742d1a77`). The remaining steps are below, in order. Additional
items done in this phase so far, which the original list did not contain:

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
opam exec -- ocaml scripts/doc_artifacts.ml build          # cache the commit
opam exec -- ocaml scripts/doc_artifacts.ml diff-baseline   # additive diff only
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

*Goal:* every L2 class page follows the decision 10 layout, so a reader can
find a class's members and learn how to get an instance without knowing the
generator's conventions.

*Changes:*
- Class type sections: `class_gen` emits `{2 Signals}`, `{2 Methods}`,
  `{2 Properties}` and `{2 Conversions}` as floating comments in the
  `class type` body (in the `.mli`; the probe showed odoc renders them and
  lists them in the contents sidebar). Sections with no members are not
  emitted. Properties need Phase 6, so their section has docs.
- Inheritance block in the canned `class type` doc: "Inherits from:" the
  parent class, and "Implements:" with one list item per interface.
- No-constructor text: when a class has no constructors, the
  `Constructors` heading is followed by the canned line for abstract
  classes, interfaces or other classes (decision 10).
- Public inheritance paths: classes outside a cyclic group `inherit` the
  public shim's class type (`GWidget.widget_t`) instead of the combined
  module's (`GEvent_controller_and__..._widget.widget_t`). The shim's class
  type is an alias, so the type is unchanged, but the pages stop showing
  internal names. 126 gtk L2 files use the combined path today. This is a
  generator change, so the standing invariant covers it.

*Tests:* `class_gen` expect tests for section emission (including empty
sections), the inheritance block with zero, one and several interfaces, the
three no-constructor variants, and the shim inherit path.

*Acceptance:* the standing invariant; in the PR's preview, the `Button`
class type page has the four sections in its contents sidebar, the
inheritance block, and no internal cyclic module names; `Widget` shows the
abstract-class line, an interface page shows the interface line, and
`Display` shows the third line.

### Phase 8 — C-idiom AST rewrites (scalars, primitive types, ownership)

Corpus anchors (sampled over Gtk/Gio/Gdk/Pango/Gsk/GdkPixbuf/cairo/Graphene,
~39,700 docs): `%TRUE`/`%FALSE`/`%NULL` ≈ 4,200 docs, backticked
`` `TRUE` ``/`` `NULL` `` ≈ 490, ownership/free sentences ≈ 430, `#gboolean`-style
primitive sigils ≈ 130. All are context-free or need only the method's
return shape, so no symbol index is required — this phase does not wait for
the resolver leg.

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
  the manifest.
- **Code blocks keep their language:** `Code_block of string` becomes
  `Code_block of { lang : string option; body : string }`; `parse` records
  the fence language (`c`, `C`, `xml`, …, or `|[ <!-- language="C" --> ` form)
  and `render` still emits `{[ … ]}` for now. Phases 11–14 consume `lang`.

*Deferred to the resolver leg (need a symbol index, not just a table):*
`%GTK_FOO` constants → enum constructors, `foo_bar()` function references →
`Ref`, bare `::signal` / `Type:prop` sigils. They stay `Sym_ref` here.

*Tests:* parse and render unit tests for every row above; the corpus smoke
test gains counters (`C_lit`, `C_prim`, ownership strips) and a
**no-residual check**: after Phase 8, no rendered doc contains `%TRUE`,
`%FALSE`, `%NULL`, or `g_object_unref`/`g_free` outside a code block.

*Acceptance:*
```bash
opam exec -- dune build @all
opam exec -- dune test gir_gen/ && xvfb-run $(which dune) test ocgtk/
git status --porcelain     # empty (regenerated bindings committed)
grep -rE '%(TRUE|FALSE|NULL)\b' ocgtk/src/*/generated/*.mli   # empty
grep -rE 'g_object_unref|freed with g_free' ocgtk/src/*/generated/*.mli  # only code blocks, if any
```

### Phase 9 — Conventions page and namespace module intros

*Revised 2026-10-07:* this phase previously generated a committed
`index.mld` per package with `doc_index.ml`. `ocgtk/index.mld` is hand-written
and the namespace modules already list their contents, so that is dropped.

*Goal:* a reader who lands on any namespace module or the package index
finds one page that explains how the bindings are organised.

*Changes:*
- `ocgtk/conventions.mld`, written by hand from the committed outline
  (sections, suggested points and draft Mermaid diagrams), linked from
  `index.mld`.
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

*Goal:* odoc warnings are classified, not just counted.

*Changes:* classify the warnings captured since Phase 3 into buckets
(decision 7); trivially fixable classes fixed at emission here
(paragraph-on-own-line, nested-tag re-parses); the manifest gains bucket
counts; the `doc_artifacts.ml warnings <sha>` subcommand prints them. Unit
tests: bucket classification of synthetic warning lines and the odoc-line
filter.

*Acceptance:*
```bash
opam exec -- ocaml scripts/doc_artifacts.ml build            # manifest now has buckets
opam exec -- ocaml scripts/doc_artifacts.ml warnings <sha>   # classified buckets
```
The trivially fixable buckets are zero at emission; the rest are recorded as
TODO counts, not silently dropped.

### C code-block translation (Phases 11–14, end of cycle; layer-aware)

Corpus: ~210 fenced C blocks (`c`/`C`/`|[ language="C" ]|`) plus ~66 other
languages (xml 53, css 4, glsl 4, plain 5). The C blocks range from 2-line
snippets to whole functions (`connect_to_host`, `bake_cake_thread`), so the
translator is deliberately conservative: it either translates a block fully
or leaves it as honestly-labelled C. It never emits wrong OCaml.

**Layer awareness.** The emission site passes `layer : L1 | L2` into the
translator context. L1 docs (modules/functions of the `Wrappers` module)
render `Label.new_with_mnemonic "_Hello"` and `Label.set_mnemonic_widget
label (Some entry)`; L2 docs (classes/methods) render
`new label ~label:"_Hello" ()` / `label#set_mnemonic_widget (Some entry)`.
The C → symbol step (below) is layer-independent; only the final rendering
of each call differs. *Dependency:* L2 docs land in Phase 5, so the L2
renderer is visible as soon as Phase 13 ships.

### Phase 11 — Tier A: label C blocks honestly

`Code_block {lang=Some ("c"|"C")}` that is not translated renders as `{v … v}`
(verbatim, no OCaml highlighting) with a lead-in `C example:`. `xml`/`css`/
`glsl`/`plain` render as `{v … v}` too (they are real languages applied as-is,
e.g. GtkBuilder UI). `{[ … ]}` is reserved for translated OCaml. The
balance/comment-safety fallbacks (invariant 3) still apply. Replaces the
plan's "banner deferred" row. Depends on Phase 8 (`Code_block.lang`).

### Phase 12 — Tier B: census and subset parser (go/no-go gate)

**Tier B: mechanical translation of a restricted C subset.** Input
subset: sequences of `T *x = fn (args);`, `fn (obj, args);`, `x = fn (args);`,
`GTK_FOO (x)`/`G_OBJECT (x)` cast macros (dropped), `NULL`/`TRUE`/`FALSE`,
`GTK_TYPE_*`/`G_TYPE_*` constants, string and numeric literals, and `//`
comments. Anything outside the subset (control flow, struct/typedef,
`static`, `->`, `&` out-params, varargs, `g_autoptr`) rejects the whole
block to Tier A.

This phase builds the C tokenizer and the subset statement parser, then runs
the **corpus census**: how many of the ~210 blocks fit the subset, with the L1
result eyeballed. The census result is recorded in this plan. **Gate:** if the
fraction is small, stop here. Phase 11 and Phase 14 then cover the C blocks,
and Phase 13 is not built.

### Phase 13 — Tier B: resolution, adaptation and rendering

Only if the Phase 12 gate passes. Pipeline: C tokenizer → statement parser
(subset only; built in Phase 12) → symbol resolution via the generator's
C-identifier table (`c:identifier` → namespace, type, method, constructor) →
signature-driven adaptation (nullable param → `Some`/`None`, out/`GError**` →
`result` with a `match`, `void` → `unit` sequencing, `let … in` chaining) →
layer renderer (L1 or L2). Rejection reasons are counted in the manifest, so
the translated fraction is a tracked number. This phase also adds the compile
check (below).

### Phase 14 — Tier C: hand-written overrides for prominent examples

A new override form in the existing s-expression system:
`(doc-example <gir-entity> <index> (l1 "…ocaml…") (l2 "…ocaml…"))`, which
replaces the nth code block of that entity's doc (checked: the C block must
still be the one the override was written against, via a short hash, so a
GIR update flags stale overrides instead of silently misapplying). Target
the 10–20 most prominent examples (`GtkEntry` mnemonic, `GtkExpression`,
`GTask`, `GtkBuilder`, `GtkListView` factory). Independent of Phase 13, so it
also applies if the Phase 12 gate stops the translator.

*Tests (Phases 12–14):* tokenizer/parser/translator unit tests per construct;
golden tests for ~10 real corpus blocks in L1 and L2; a **compile check** for
translated blocks — extract each emitted `{[ … ]}` OCaml snippet and typecheck
it against the built `ocgtk` library (translated examples must at least
typecheck; this is what makes Tier B trustworthy); override staleness test.

*Acceptance (Phases 11–14):* the compile check is green; no `{[ … ]}` block in
generated docs contains C tokens (`->`, `;` after a `)` call with `NULL`, `g_`);
the manifest reports translated / labelled / rejected counts per rejection
reason; `dune build @doc` shows no new warnings.

### Phase dependencies

- 0 blocks everything (baseline).
- 1 → 2 → 3: the translator and emit helper must exist before sites consume
  them; the cache must bless the Phase 2 baseline before wiring diffs are
  reviewed.
- 4 (preview) needs 0 only: the workflow does not use the cache driver, so it
  landed before 3. It must precede 5, so that every later PR has a preview.
- 5 (wiring) needs 2 and 3 (its diff is reviewed against the cached baseline).
- 6 (properties) needs 5: it reuses the both-layer pattern Phase 5 establishes.
- 7 (L2 page structure) needs 6: the Properties section should have docs
  when it first appears.
- 8 (C idioms) needs 5 (translated output must already flow through all sites
  so the diff is only the idiom rewrites).
- 9 (conventions page and namespace intros) needs 7, so the page describes
  the final layout. The hand-written text can be drafted earlier.
- 10 (warning classification) needs 3 (captured warnings) and a stable `@doc`
  from 5–9, so the buckets are not classified against a moving target.
- 11–14 are end of cycle: 11 needs 8 (`Code_block.lang`); 12 needs 5 (the L2
  renderer is only visible once L2 docs exist) and 10 (stable warning counts);
  13 needs 12's gate; 14 needs only 5.

## Verification for the whole leg (after all phases)

Per-phase acceptance gates above are the primary verification; this is the
closing checklist on top of them:

- `opam exec -- dune build @all`; `opam exec -- dune test gir_gen/` (and the
  ocgtk tests, per CONTRIBUTORS).
- Translator and `Doc_emit` unit/expect tests pass; corpus smoke test green
  (re-run at close).
- Regenerated bindings committed; tree clean afterwards;
  the full test suite is green on the committed tree.
- `doc_artifacts.ml build` twice in a row: second run is a cache hit;
  `build --force` rebuilds.
- Warning report recorded, filtered to odoc-attributable lines; trivial
  buckets eliminated at emission; the rest TODO-counted, not silently
  dropped.
- `doc_artifacts.ml diff` between two commits with a known translator change
  shows the expected HTML delta; between tool-identical commits shows none.
- Preview workflow posts a URL on each PR from Phase 4 on; eyeball the member
  docs with headings (`{b …}` lead-ins) and the `about_dialog` C-fence page.
- Layer check: every entity, method, constructor, signal and property site
  that emits at L1 also emits its doc at L2, or is recorded here as a named
  exception.

## Explicitly out of scope (later legs)

- Alias pages (page model, PRD §11).
- `@param`/`@return`/`@deprecated` tag emission; generalised `@since`.
- Constants (`%GTK_FOO`), `foo_bar()` function refs and bare `::signal`
  sigils → resolver leg (need a symbol index; Phase 8 only does the
  table-driven idioms).
- Cross-reference resolution (PRD §7) — the `Sym_ref` → `[code]` fallback
  covers it; the resolver leg is a pure AST rewrite.
- Upstream-URL mapping for relative `.html` links (PRD §6.3) — likewise a
  pure `Page_ref` rewrite.
- Page-model refinements: synthetic synopses (§12), screenshots,
  `<docsection>` fold into index pages. (Class-type grouping headings and
  the Inherits/Implements block moved into this leg as Phase 7.)
- "Returned by" lists for classes without constructors (the functions and
  methods whose return type is the class) → resolver leg; Phase 7 states
  only the canned no-constructor line.
- Warning gate in CI (report-only this leg).
