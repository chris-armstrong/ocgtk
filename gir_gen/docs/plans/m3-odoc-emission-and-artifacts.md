# M3 Odoc Translation Slice — emission, wiring, artifact cache, per-branch preview

**Status: DRAFT (revised after plan review; not yet implemented)**
**Created: 2026-09-08; revised: 2026-09-14**
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
   line (PRD §4.3 probe). Mitigation: (a) the translator escapes every
   literal `@` in GIR prose to `\@` (upstream `@self`, `@group` can never
   start a tag); (b) the emit helper appends the real tags — `@since` today,
   in the existing constant behaviour — at the very end of the comment,
   prose first. `@param`/`@return`/`@deprecated` remain deferred (AST
   fields are ready for their leg).

7. **Report-only warning policy.** `dune build @doc` warnings are captured,
   classified into buckets, trivially fixable classes are fixed at emission
   (paragraph-on-own-line, nested-tag re-parses), and the rest are recorded
   as TODO counts in the artifact manifest. No CI gate this leg; the gate
   arrives once classification stabilises.

## Translator scope (`gir_gen/lib/generate/doc_translate.ml` + `.mli`)

Pure translation `translate : context -> string -> string`, where `context`
distinguishes entity/module docs from member/item docs (heading policy
differs, PRD §6.6).

**Translated:**

| GIR markdown | odoc |
|---|---|
| paragraphs / blank lines | paragraphs |
| `**bold**` / `*italic*` | `{b …}` / `{i …}` |
| `` `code` `` | `[code]` |
| fenced code blocks | `{[ … ]}` (banner deferred) |
| `#`/`##`… headings | entity docs: normalised `{1 …}` (shallowest → `{1}`, cap `{5}`); member docs: `{b …}` lead-in (odoc demotes item-doc headings to plain paragraphs — PRD §4.3) |
| `- item` / `1. item` | odoc shortcut lists |
| `[text](https://…)` | `{{:url}text}` |
| odoc specials `{ } [ ] @` | escaped `\{` `\}` `\[` `\]` `\@` (prose contexts) |

**Stripped / fallback for now (each forward-compatible with the full PRD
design):**

- gi-docgen `[frag@Endpoint]` and legacy gtk-doc sigils → inline `[code]`
  — the PRD §7.6 miss-fallback; a later resolver (§7) replaces it without
  changing any other rule.
- admonitions (`::: …`), tables, `<picture>`/`<img>`, `>` quotes → stripped
  to plain prose.
- `[text](class.X.html#…)` relative gi-docgen links → inline `[code]` for
  now (later: §6.3 upstream-URL mapping).

## Correctness invariants (load-bearing; each gets a test)

1. **Comment safety.** The output can never contain unneutralised `*)` /
  `(*` — a raw `*)` in GIR prose would terminate the doc comment and break
  the *compile* of the generated bindings (this is `sanitize_doc`'s one real
  job, retained inside the emit helper).
2. **odoc-special escaping** in prose contexts: `\{ \} \[ \@`.
3. **Span/block balance check.** Escapes don't work inside odoc code: an
   inline `[code]` breaks if the content contains `]`, a `{[ … ]}` block
   breaks on `]}`. On violation: inline span falls back to escaped plain
   prose; a block falls back to verbatim `{v … v}` (when hazard-free), else
   is stripped. Every fallback is counted in the warnings report.
4. **Tag terminality** per decision 6: prose-first assembly, tags last.
5. **Idempotence**: `translate (translate x) = translate x` across the
   corpus.

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
  own assembly (prose → tags), comment safety and escaping;
  `Doc_translate.translate` stays the pure text transform. A new emission
  point costs one call.
- Unit/expect tests for the translator and `Doc_emit` in `gir_gen/test/`
  following the repo's test conventions.

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
  generator has the full AST; this is one emit pass per namespace.
- **Landing page**: the preview workflow drops a tiny static `index.html` at
  the artifact root linking each package's odoc index — odoc cannot
  cross-link page trees, a raw HTML link can.

## Doc artifact cache

**Location** — outside every worktree, per-box, so worktree churn, `git
clean`, and branch switching never destroy it:

- Default: `~/.cache/ocgtk-doc-artifacts/`
- Override: `OCGTK_DOC_ARTIFACTS` environment variable.

**Layout:**

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

**Keying and caching semantics** (coherent now that bindings are committed —
decision 1 — regeneration is idempotent and the tree stays clean):

- Key = `git rev-parse HEAD` (full sha).
- **Clean tree + artifact exists** → cache hit; no regeneration, no build.
  The tool prints the artifact path. This is the caching payoff.
- **Clean tree + no artifact** → regenerate bindings, `dune build @doc`
  (capturing stderr for the warning report), tar+gzip the HTML, write
  manifest + append `index.tsv`. Artifacts for a clean sha are immutable.
- **Dirty tree** → key gets a `-dirty` suffix; always rebuilt, always
  overwritten. A dirty artifact is scratch, never a benchmark candidate.

**Manifest fields (`<sha>.json`):** sha, branch, date, host odoc version,
dune version, artifact byte size, HTML file count, free-text note, and the
**odoc warning report** — classified bucket counts (report-only this leg,
decision 7). Manifests record tool versions so a tool-version bump showing up
in a diff is recognisable rather than misread as a regression.

**Benchmark semantics:** once translation stabilises, one artifact is blessed
as `benchmarks/BASELINE`; any later artifact can be byte-diffed against it
(`diff -r` between extracted trees is meaningful for identical tool versions;
the determinism claim gets one probe — clear cache, rebuild same sha, diff).

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
      - run: scripts/generate-bindings.sh            # idempotent: bindings committed
      - run: opam exec -- dune build @doc 2> warnings.log
      - run: # add static landing index.html linking package indexes
      - uses: rajyan/preview-pages@v1
        with:
          source-dir: _build/default/_doc/_html
          pr-per-commit: false
```

A cleanup workflow on `pull_request: closed` removes `pr-<n>` (snippet in the
action's README).

## Tooling

Per repo rules, the driver is written in **OCaml** (no shell beyond what it
shells out to via `Sys.command` for `git`/`dune`/`tar`). One standalone
script, `scripts/doc_artifacts.ml`, invoked as:

```bash
opam exec -- ocaml scripts/doc_artifacts.ml build [note]        # ensure artifact for HEAD
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

## odoc toolchain prerequisites (leg 0)

- **`dune build @doc` has never been run in this repo**: odoc is not
  installed on the dev box, no `(documentation)` stanza and no `.mld` file
  exists anywhere, and the PRD's odoc probe ran in a *scratch* workspace.
- Install via `opam install . --deps-only --with-doc` — both `.opam` files
  already carry `odoc {with-doc}` (dune's generator emits it), so **no new
  opam dependency** is being added.
- Add the two `(documentation)` stanzas and the generated `index.mld`s.
- First milestone of this leg: `dune build @doc` green from the repo root,
  producing HTML for both packages; translation work then proceeds against a
  rendered baseline.

## Verification for this leg

- `opam exec -- dune build @all`; `opam exec -- dune test gir_gen/` (and the
  ocgtk tests, per CONTRIBUTORS).
- Translator and `Doc_emit` unit/expect tests pass.
- **Corpus smoke test**: run the translator over all ~39,850 bundled `<doc>`
  elements asserting the invariants (comment safety, balance, idempotence) —
  the long tail is where curated unit tests are blind.
- Regenerated bindings committed; tree clean afterwards; the full test suite
  is green on the committed tree.
- `doc_artifacts.ml build` twice in a row: second run is a cache hit.
- Warning report recorded; trivial buckets eliminated at emission; the rest
  TODO-counted, not silently dropped.
- `doc_artifacts.ml diff` between two commits with a known translator change
  shows the expected HTML delta; between tool-identical commits shows none.
- Preview workflow posts a URL on this PR; eyeball the two member docs with
  headings (`{b …}` lead-ins) and the `about_dialog` C-fence page.

## Explicitly out of scope (later legs)

- L2 class-type docs, cyclic shims, alias pages (page model, PRD §11).
- Property and record-field docs; `@param`/`@return`/`@deprecated` tag
  emission; generalised `@since`.
- Cross-reference resolution (PRD §7) — the `[code]` fallback covers it.
- Page-model refinements: §11.2 grouping headings, Inherits/Implements
  blocks, synthetic synopses (§12), screenshots, upstream-URL link mapping
  (§6.3), `<docsection>` fold into index pages.
- Warning gate in CI (report-only this leg).