# M3 Odoc Translation Slice — emission, artifact cache, benchmark

**Status: DRAFT (agreed design, not yet implemented)**
**Created: 2026-09-08**
**Branch: `feat/m3-odoc-translation-slice`** (from `origin/m3` @ `9cec9171`, which
contains the doc-parsing PR #184 and the
[research PRD](../research/reference-documentation.md))

## Purpose of this leg

First *visible* vertical slice of M3: GIR `<doc>` text (already captured in the
AST by PR #184) is translated to odoc markup and rendered to browsable odoc
HTML, with a local artifact cache so outputs from different commits can be
compared against a benchmark without rebuilding. **No generated-file diff is
committed in this leg** and no CI preview is published — the rendered HTML
lives in a filesystem cache outside any worktree, indexed by commit hash.

## Decisions (recorded deliberately; supersede earlier suggestions)

1. **Emission is always-on. No `--with-docs` flag.** gir_gen gains one
   unconditional code path: every doc-carrying emit site routes raw GIR text
   through the translator. Rationale: the doc pipeline never trusts committed
   bindings — it always regenerates them from `gir/*.gir` before building
   `@doc`. A flag would exist only to keep committed bindings byte-identical,
   and the decision below makes that moot.

   **Consequence, accepted:** after this leg, a plain regeneration produces
   bindings whose doc comments differ from the committed tree. The committed
   generated files are *not* updated in this leg; whether/when to commit the
   regenerated doc-carrying bindings is a separate, later decision. Until
   then, treat `ocgtk/src/*/generated/` as doc-less snapshots and the artifact
   pipeline as the source of truth for rendered docs.

2. **Local artifact cache instead of GitHub Pages / CI preview.** The
   earlier Pages-based preview idea is superseded for now (it can be layered
   on later without changing anything here). Reasons: reviewer-grade HTML
   without publishing anything, cheap cross-commit comparison against a
   benchmark, and rebuild avoidance — regenerating bindings + `dune build
   @doc` over the full workspace is expensive, and identical commits should
   not pay it twice.

3. **Tags deferred.** This slice translates prose only. No `@param`,
   `@return`, `@deprecated` emission (the existing constant `@since`
   behaviour stays as-is). The AST fields parsed in PR #184 remain ready for
   a later tag leg.

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
| odoc specials `{ } [ ] @` | escaped `\{` `\}` `\[` `\]` `\@` |

**Stripped / fallback for now (each forward-compatible with the full PRD
design):**

- gi-docgen `[frag@Endpoint]` and legacy gtk-doc sigils → inline `[code]`
  — this is exactly the PRD §7.6 miss-fallback, so a later resolver (§7)
  replaces the fallback without changing any other rule.
- admonitions (`::: …`), tables, `<picture>`/`<img>`, `>` quotes → stripped
  to plain prose.
- `[text](class.X.html#…)` relative gi-docgen links → inline `[code]` for
  now (later: §6.3 upstream-URL mapping).

## Emission wiring

- Replace the raw `Utils.sanitize_doc` pass-through at the doc emit sites
  (constants: `constant_code.ml`; classes/interfaces/methods: `class_gen*.ml`,
  `ml_interface.ml`; enums/bitfields: `enum_code.ml`; records/properties and
  the rest of `bin/gir_gen.ml`) with `Doc_translate.translate`.
- Delete the two byte-identical suppression sites in `gir_gen/bin/gir_gen.ml`
  (~lines 605 and 884, blanking class/interface and enum/bitfield docs) —
  they were scaffolding for the parsing PR and the PRD says the emission leg
  removes them.
- Unit/expect tests for the translator in `gir_gen/test/` following the
  repo's test conventions.

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

**Keying and caching semantics:**

- Key = `git rev-parse HEAD` (full sha).
- **Clean tree + artifact exists** → cache hit; no regeneration, no build.
  The tool prints the artifact path. This is the caching payoff.
- **Clean tree + no artifact** → regenerate bindings (always, never trust
  the committed tree — decision 1), `dune build @doc`, tar+gzip the HTML,
  write manifest + append `index.tsv`. Artifacts for a clean sha are
  immutable (never overwritten).
- **Dirty tree** → key gets a `-dirty` suffix; always rebuilt, always
  overwritten. A dirty artifact is scratch, never a benchmark candidate.

**Manifest fields (`<sha>.json`):** sha, branch, date, host odoc version,
dune version, GIR corpus state (the `gir/*.gir` files are committed, so the
sha already pins them), artifact byte size, HTML file count, and a free-text
note passed on the command line.

**Benchmark semantics:** once the translation stabilises, one artifact is
blessed as `benchmarks/BASELINE`. Any later artifact can be diffed against
it; because odoc HTML output is deterministic for the same input and tool
versions, a byte-level `diff -r` between two extracted trees is meaningful —
differences are real translation changes, not nondeterminism. (Manifests
record odoc/dune versions so a tool-version bump showing up as a diff can be
recognised and explained rather than misread as a regression.)

## Tooling

Per repo rules, the driver is written in **OCaml** (no shell beyond what it
shells out to via `Sys.command` for `git`/`dune`/`tar`). One standalone
script, `scripts/doc_artifacts.ml`, invoked as:

```bash
opam exec -- ocaml scripts/doc_artifacts.ml build [note]   # ensure artifact for HEAD
opam exec -- ocaml scripts/doc_artifacts.ml list            # print index.tsv
opam exec -- ocaml scripts/doc_artifacts.ml extract <sha> [dir]  # untar for browsing
opam exec -- ocaml scripts/doc_artifacts.ml diff <shaA> <shaB>  # diff -r two artifacts
opam exec -- ocaml scripts/doc_artifacts.ml diff-baseline       # diff HEAD artifact vs BASELINE
opam exec -- ocaml scripts/doc_artifacts.ml set-baseline <sha> ["note"]
```

`build` internally runs the regeneration the bindings pipeline already
provides (`scripts/generate-bindings.sh` semantics) then
`opam exec -- dune build @doc` from the workspace root.

## Verification for this leg

- `opam exec -- dune build @all`; `opam exec -- dune test gir_gen/` (and the
  ocgtk tests, per CONTRIBUTORS).
- Translator unit tests pass.
- `doc_artifacts.ml build` twice in a row: second run is a cache hit.
- `doc_artifacts.ml diff` between two commits with a known translator change
  shows the expected HTML delta; between tool-identical commits shows none.

## Explicitly out of scope (later legs)

- Cross-reference resolution (PRD §7) — the `[code]` fallback covers it.
- Tag emission (`@param`/`@return`/`@deprecated`/generalised `@since`).
- Page-model refinements: §11.2 grouping headings, shim/alias rules,
  Inherits/Implements blocks; synthetic synopses (§12); screenshots;
  upstream-URL link mapping (§6.3).
- Publishing rendered docs anywhere (Pages, PR preview) — design above keeps
  everything local until deliberately changed.
- Committing regenerated doc-carrying bindings.