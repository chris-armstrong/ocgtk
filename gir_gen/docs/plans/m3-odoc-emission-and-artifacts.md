# M3 Odoc Translation Slice — emission, wiring, artifact cache, per-branch preview

**Status: DRAFT (revised after second plan review; phased for implementation — not
yet implemented)**
**Created: 2026-09-08; revised: 2026-09-14 (testable phases added)**
**Branch: `feat/m3-odoc-translation-slice`** (from `origin/m3` @ `9cec9171`, which
contains the doc-parsing PR #184 and the
[research PRD](../research/reference-documentation.md))

## Purpose of this leg

First *visible* vertical slice of M3: GIR `<doc>` text (already captured in the
AST by PR #184) is translated to odoc markup, emitted across the L1 bindings,
and rendered to browsable odoc HTML with:

- a **per-branch GitHub Pages preview** (every PR gets a live doc-preview URL),
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

2. **Per-branch preview via `rajyan/preview-pages@v1`.** The action deploys a
   subdirectory per PR/branch/commit onto an auto-managed `gh-pages` branch
   and comments the preview URL on the PR. HTML never touches code branches.
   PR previews are removed on close by a cleanup workflow (snippet in the
   action's README). One preview per PR (`pr-per-commit: false`) keeps the
   cost down; branch pushes get per-branch directories.

3. **Local artifact cache stays** as the rebuild-avoidance and benchmark
   layer (local now, CI later). Reviewer-grade HTML without publishing,
   cross-commit comparison against a blessed baseline, and identical commits
   never pay the full regeneration + `@doc` build twice.

4. **Entity docs: L1 complete in this leg.** Un-suppress class/interface
   docs (standalone L1 module comments flow through the existing
   `layer1_main.ml` path), **thread docs into each `module rec X : sig` arm
   of combined cyclic modules** (new wiring — those emitters currently take
   no doc argument), and un-suppress enum/bitfield type docs (emitters
   already exist). **L2 (`g<Type>` class types), cyclic shims and alias
   pages stay doc-less until the page-model leg** (PRD §11) — accepted
   asymmetry, recorded deliberately.

5. **Member docs: methods, constructors, signals wired; properties and
   record fields deferred.** Methods: existing emission, now translated.
   Constructors: `ctor_doc` replaces the synthetic `Create a new X` when
   present (synthetic text stays as fallback). Signals: the signal `<doc>`
   is emitted on the L1 `on_<sig>` val/external; the L2 method site stays
   doc-less with the rest of L2. Properties keep the synthetic
   `Get/Set property` text; `prop_doc`/`field_doc` remain parsed-but-dropped
   until the next leg.

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

7. **Report-only warning policy.** `dune build @doc` warnings are captured,
   filtered to odoc-attributable lines (the raw stderr also carries dune's
   own messages), classified into buckets, trivially fixable classes are
   fixed at emission (paragraph-on-own-line, nested-tag re-parses), and the
   rest are recorded as TODO counts in the artifact manifest. No CI gate
   this leg; the gate arrives once classification stabilises.

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
| Enum/bitfield type docs | `enum_code.ml` | translate; **un-suppress** |
| Enum/bitfield member docs | `enum_code.ml` | translate (existing site) |
| L1 method docs | `layer1/layer1_method.ml` | translate (existing site) |
| L1 entity docs, standalone | `layer1/layer1_main.ml` module comment | translate; **un-suppress** class/interface |
| L1 combined cyclic modules | `generate_combined_ml_modules` / `generate_ml_interface_internal` (no doc param today) | **new wiring**: thread `class_doc` into each `module rec` arm |
| Constructors | `layer1/layer1_constructor.ml` | **new wiring**: `ctor_doc` when present, synthetic fallback |
| Signals (L1 `on_<sig>`) | `signal_gen.ml` | **new wiring**: signal `<doc>` |
| Properties | `layer1_property.ml` | deferred (synthetic text stays) |
| Record fields | — (`field_doc` parsed, dropped) | deferred |
| L2 class types/methods, shims | `class_gen*.ml` (no doc emission exists) | deferred (page-model leg) |
| Per-package `index.mld` | new | **new**: generated (below) |

- Delete the two suppression sites in `bin/gir_gen.ml` (class/interface
  entity-doc blanking ~line 603; `enum_doc`/`bitfield_doc` field blanking
  ~line 882). Note: they are two *different* mechanics, not byte-identical,
  and deleting them is necessary but not sufficient — the combined-module,
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
| `gir_gen/lib/generate/doc_translate.ml` / `.mli` | `parse`, `render`, `translate`, the AST types above, fallback/warning collection. |
| `gir_gen/lib/generate/doc_emit.ml` / `.mli` | `emit_item_doc`, `emit_entity_doc`: assembly, tags-last, final-comment sanitisation, `@since`. |
| `gir_gen/lib/generate/doc_index.ml` / `.mli` | Per-namespace `index.mld` emit pass — `{!…}` tables grouped by kind; called from the bindings pipeline. |
| `gir_gen/test/generate/doc_translate_tests.ml`, `doc_emit_tests.ml` | Unit/expect tests per the `constant_code_tests.ml` convention: every render-policy row, every invariant. |
| `gir_gen/test/corpus/…` smoke test | `parse`+`render` over all ~39,850 bundled `<doc>` elements; asserts comment safety, balance, the wiring property. |
| `scripts/doc_artifacts.ml` | Artifact cache driver (below): `build`/`list`/`extract`/`diff`/`diff-baseline`/`set-baseline`/`warnings` subcommands plus `--force`. Pure `Sys.command` shelling; invoked as `opam exec -- ocaml scripts/doc_artifacts.ml …` (no dune bootstrap needed — it shells out only). |
| `.github/workflows/doc-preview.yml` + cleanup workflow | As sketched; landing `index.html` step included. |

**Modified:**

| File | Change |
|---|---|
| `bin/gir_gen.ml` | Delete both suppression sites (~604, ~883). Necessary but not sufficient — see the three new-wiring rows above. |
| `lib/generate/enum_code.ml` | Un-suppress; type docs + member docs through `Doc_emit`. |
| `lib/generate/constant_code.ml` | Existing `emit_doc` site rerouted through `Doc_emit` (subsumes `Utils.sanitize_doc` + `@since`). |
| `lib/generate/layer1/layer1_method.ml` | Translate existing site. |
| `lib/generate/layer1/layer1_main.ml` | Un-suppress standalone class/interface module comment; `generate_ml_interface_internal` / `generate_combined_ml_modules` gain a doc parameter, thread `class_doc` into each `module rec` arm. |
| `lib/generate/ml_interface.ml` | Re-export updated `generate_combined_ml_modules` signature. |
| `lib/generate/layer1/layer1_constructor.ml` | New: `ctor_doc` when present, synthetic fallback. |
| `lib/generate/signal_gen.ml` | New: signal `doc` on the `on_<sig>` val/external. |
| `scripts/generate-bindings.sh` | Also emits the two `index.mld`s (via the binary). |
| `ocgtk/dune`, `gir_gen/dune` | `(documentation)` stanzas (leg 0). |

**No change:** `.opam` files (`odoc {with-doc}` already emitted by dune),
`lib/types.ml` (all doc fields already parsed by PR #184),
L2/class_gen/property/record-field sites (deferred, correctly).

## Root index pages (per package)

odoc page trees are per-package, so each package gets its own `index.mld`
under a `(documentation)` stanza (one per dune project: `ocgtk/` root,
`gir_gen/` root).

- **Corpus fact** (checked): there is no namespace-level `<doc>` in any
  bundled GIR file. The only namespace-level prose is `<docsection>` groups —
  Graphene 16, Gtk 1, all others 0 — parsed-and-dropped for now; folding them
  in later is forward-compatible.
- So each `index.mld` is **generated by gir_gen**: a short intro plus a table
  of `{!…}` links grouped by kind (Classes, Interfaces, Enums, Bitfields,
  Records, Constants, Functions) pointing at the stable public paths. The
  generator has the full AST; this is one emit pass per namespace
  (`doc_index.ml` above).
- **Provenance (deliberate):** `index.mld` is **committed, like the
  bindings**, and produced by the same regeneration pipeline
  (`generate-bindings.sh` runs the binary's index pass). Reason: decision 1's
  logic — everything generated is committed so the tree stays
  regeneration-idempotent and the artifact cache's clean-tree keying holds.
  It is not generated at build time.
- **Landing page**: the preview workflow drops a tiny static `index.html` at
  the artifact root linking each package's odoc index — odoc cannot
  cross-link page trees, a raw HTML link can.

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
**odoc warning report** — filtered to odoc-attributable lines (decision 7),
classified bucket counts (report-only this leg).

**Benchmark semantics:** once translation stabilises, one artifact is blessed
as `benchmarks/BASELINE`; any later artifact can be byte-diffed against it
(`diff -r` between extracted trees is meaningful for identical tool versions;
the determinism claim gets one probe — clear cache, rebuild same sha, diff).

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

## Per-branch preview workflow (sketch)

```yaml
# .github/workflows/doc-preview.yml
on:
  pull_request:
  push:
    branches: [main]
concurrency:
  group: preview-pages-${{ github.ref }}
  cancel-in-progress: true
permissions:
  contents: write          # gh-pages deploy with default GITHUB_TOKEN
  pull-requests: write     # preview URL comment
jobs:
  docs:
    steps:
      - uses: actions/checkout@v4
      # opam setup steps (reuse existing CI setup)
      - run: opam install . --deps-only --with-doc   # odoc rides the {with-doc} dep
      - run: scripts/generate-bindings.sh            # idempotent: bindings + index.mld committed
      - run: opam exec -- dune build @doc 2> warnings.log
      - run: # add static landing index.html linking package indexes
      - uses: rajyan/preview-pages@v1
        with:
          source-dir: _build/default/_doc/_html
          pr-per-commit: false
```

A cleanup workflow on `pull_request: closed` removes `pr-<n>` (snippet in the
action's README).

## odoc toolchain prerequisites (leg 0)

- **`dune build @doc` has never been run in this repo**: odoc is not
  installed on the dev box, no `(documentation)` stanza and no `.mld` file
  exists anywhere, and the PRD's odoc probe ran in a *scratch* workspace.
- Install via `opam install . --deps-only --with-doc` — both `.opam` files
  already carry `odoc {with-doc}` (dune's generator emits it), so **no new
  opam dependency** is being added.
- Add the two `(documentation)` stanzas in Phase 0; the committed, generated
  `index.mld`s arrive in Phase 4.
- Phase 0's milestone: `dune build @doc` green from the repo root,
  producing HTML for both packages; translation work then proceeds against a
  rendered baseline.

## Phased implementation (each phase independently testable)

This section replaces the earlier prose "Sequencing" list. Phases are ordered
so that each ends in a state its own test gate can certify without depending
on a later phase. Rules that hold for every phase:

- **One phase = one (or at most two) commits**: the code change, its tests,
  and — where generated files are affected — the regenerated bindings
  committed in the same change, leaving `git status` empty.
- **Standing invariant (checked in every phase):** `dune build @all` green,
  `dune runtest gir_gen/` + the ocgtk tests green, and a fresh bindings
  regeneration diff empty. Not repeated in each acceptance list below.
- **Stop-and-fix rule:** if a phase's gate fails, fix within the phase; do
  not push partial state forward. The committed-tree invariant makes every
  intermediate commit shippable.

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

*Goal:* every doc that is *already* emitted now goes through the
translator; no *new* docs appear. This isolates translator-induced diffs
from un-suppression-induced diffs (Phase 3).

*Changes:* new `lib/generate/doc_emit.ml`/`.mli` (`emit_item_doc` /
`emit_entity_doc`: assembly prose-first-tags-last on the AST, final-comment
sanitisation, `@since` append); rewire `constant_code.ml` `emit_doc`,
`enum_code.ml` **member** docs, `layer1_method.ml` method docs;
`test/generate/doc_emit_tests.ml` (comment safety, tag terminality,
`@since` placement). Regenerate bindings; the diff is confined to
doc-comment text at these three site kinds; commit it.

*Acceptance:*
```bash
opam exec -- dune test gir_gen/ && xvfb-run $(which dune) test ocgtk/
git status --porcelain        # empty — regenerated bindings committed
# diff review: only doc comments changed, only at the three site kinds
```
Belt-and-braces: grep the regenerated tree for unneutralised `*)` outside
legitimate comment syntax — any hit is a Phase-2 failure.

### Phase 3 — Un-suppression + the three new wirings

*Goal:* entity docs land; constructors, signals and combined modules carry
docs. Diffs here are *additive* (previously-doc-less output gains docs) and
must be reviewed as such.

*Changes (four commits, each independently revertible, tree clean after
each):*
1. Delete the two suppression sites in `bin/gir_gen.ml` (~604, ~883) —
   class/interface entity docs via the existing `layer1_main.ml` path;
   enum/bitfield type docs via `enum_code.ml`.
2. Thread entity docs into combined cyclic modules:
   `layer1_main.ml`'s `generate_ml_interface_internal` /
   `generate_combined_ml_modules` gain a doc parameter; one doc comment per
   `module rec X : sig` arm; `ml_interface.ml` re-exports the updated
   signature.
3. Constructors: `layer1_constructor.ml` uses translated `ctor_doc` when
   present, synthetic `Create a new X` as fallback.
4. Signals: `signal_gen.ml` emits the signal `<doc>` on the L1 `on_<sig>`
   val (Interface mode); L2 stays doc-less (deferred).

Accepted effect: `ocamlformat` may reposition module comments onto the
first declaration — fine (recorded in the inventory above).

*Acceptance (after each commit, and cumulatively):*
```bash
opam exec -- dune build @all
opam exec -- dune test gir_gen/ && xvfb-run $(which dune) test ocgtk/
git status --porcelain     # empty
opam exec -- dune build @doc   # renders new entity docs, no warning explosion
```
Spot checks against known corpus anchors: `Gtk.Button` class doc non-empty
in `button.mli`; `gtk_enums.mli` gains ≥1 enum/bitfield type-level doc; a
combined cyclic-module file gains one doc comment per `module rec` arm; a
constructor with real `<doc>` shows GIR-derived text; a signal `on_<sig>`
val carries its `<doc>`.

### Phase 4 — `doc_index.ml`: committed, generated `index.mld`s

*Goal:* per-package landing pages in the odoc HTML, produced by the
bindings pipeline (provenance decision above).

*Changes:* new `lib/generate/doc_index.ml`/`.mli` (one emit pass per
namespace: intro + `{!…}` tables grouped by kind); called from
`bin/gir_gen.ml` and hence from `scripts/generate-bindings.sh`; committed
like the bindings; `doc_index` unit test (one fixture namespace → expected
link groups).

*Acceptance:*
```bash
opam exec -- dune build @all && opam exec -- dune test gir_gen/
git status --porcelain        # empty — index.mld committed, idempotent
opam exec -- dune build @doc
# every {!…} link target resolves — odoc warnings for broken links are
# Phase-4 BLOCKERS, not TODO counts
```

### Phase 5 — Artifact cache driver + warning report

*Goal:* the local cache works; odoc warnings are classified, not dropped.

*Changes:* `scripts/doc_artifacts.ml` with the full CLI (including
`--force`) per the driver interface above; manifest + keying semantics as
specified; warning capture from `dune build @doc` stderr, filtered to
odoc-attributable lines, classified into buckets; trivially fixable
classes fixed at emission here. Small OCaml test for the purely testable
parts (manifest serialisation, bucket classification of synthetic warning
lines, key/dirty-suffix logic); cache behaviour certified by the script
itself.

*Acceptance:*
```bash
opam exec -- ocaml scripts/doc_artifacts.ml build            # build + cache
opam exec -- ocaml scripts/doc_artifacts.ml build            # cache hit, no rebuild
opam exec -- ocaml scripts/doc_artifacts.ml build --force    # rebuilds
opam exec -- ocaml scripts/doc_artifacts.ml list             # index.tsv entry
opam exec -- ocaml scripts/doc_artifacts.ml warnings <sha>   # classified buckets
opam exec -- ocaml scripts/doc_artifacts.ml set-baseline <sha> probe
opam exec -- ocaml scripts/doc_artifacts.ml diff-baseline    # identical → empty
# determinism probe: clear cache, rebuild same sha, diff-baseline → empty
```
Manifest carries sha, branch, date, odoc + dune versions, byte size, HTML
file count, note, warning buckets. Dirty-tree build keys `<sha>-dirty` and
is never a baseline candidate.

### Phase 6 — Per-branch preview workflow (CI only)

*Changes:* `.github/workflows/doc-preview.yml` + cleanup workflow per the
sketch above (landing `index.html` step included).

*Acceptance:* the workflow YAML passes `actionlint`/`yamllint` locally;
on the PR, the preview URL comment's page shows (a) the member docs with
`{b …}` heading lead-ins and (b) the `about_dialog` C-fence page as
`{[ … ]}`. HTML appears **only** on `gh-pages`.

### Phase dependencies

- 0 blocks everything (baseline).
- 1 → 2 → 3 (translator and emit helper must exist before sites consume
  them; un-suppression must be separable from translation diffs).
- 4 needs 0 only (can run parallel to 1–3); 5 needs 0 + a green `@doc`;
  6 needs 4's landing-page semantics conceptually but is authored last —
  `@doc` must be stable for the preview to be meaningful.

## Verification for the whole leg (after all phases)

Per-phase acceptance gates above are the primary verification; this is the
closing checklist on top of them:

- `opam exec -- dune build @all`; `opam exec -- dune test gir_gen/` (and the
  ocgtk tests, per CONTRIBUTORS).
- Translator and `Doc_emit` unit/expect tests pass; corpus smoke test green
  (re-run at close).
- Regenerated bindings (and `index.mld`s) committed; tree clean afterwards;
  the full test suite is green on the committed tree.
- `doc_artifacts.ml build` twice in a row: second run is a cache hit;
  `build --force` rebuilds.
- Warning report recorded, filtered to odoc-attributable lines; trivial
  buckets eliminated at emission; the rest TODO-counted, not silently
  dropped.
- `doc_artifacts.ml diff` between two commits with a known translator change
  shows the expected HTML delta; between tool-identical commits shows none.
- Preview workflow posts a URL on this PR; eyeball the two member docs with
  headings (`{b …}` lead-ins) and the `about_dialog` C-fence page.

## Explicitly out of scope (later legs)

- L2 class-type docs, cyclic shims, alias pages (page model, PRD §11).
- Property and record-field docs; `@param`/`@return`/`@deprecated` tag
  emission; generalised `@since`.
- Cross-reference resolution (PRD §7) — the `Sym_ref` → `[code]` fallback
  covers it; the resolver leg is a pure AST rewrite.
- Upstream-URL mapping for relative `.html` links (PRD §6.3) — likewise a
  pure `Page_ref` rewrite.
- Page-model refinements: §11.2 grouping headings, Inherits/Implements
  blocks, synthetic synopses (§12), screenshots, `<docsection>` fold into
  index pages.
- Warning gate in CI (report-only this leg).