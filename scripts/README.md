# Code Generation Scripts

## generate-bindings.sh

Generates OCaml bindings for all 9 GObject namespaces from GIR files.
See [gir_gen/README.md](../gir_gen/README.md) for generator concepts, commands, and the override system.

### Usage

```bash
# Use default GIR path (gir/ at repository root)
./scripts/generate-bindings.sh

# Override GIR path
./scripts/generate-bindings.sh /custom/path/to/gir-1.0

# Or use environment variable
GIR_PATH=/custom/path/to/gir-1.0 ./scripts/generate-bindings.sh
```

### What it does

**Step 0** — Builds the `gir_gen` code generator tool via `dune build`.

**Step 1** — Generates cross-namespace reference files for all 9 namespaces.

**Step 2** — Generates OCaml bindings for all 9 namespaces with cross-references and overrides.

After generation, run `dune build` to compile the updated bindings.

### Override files

Per-namespace override files live in `overrides/` and are committed to the
repository. See [gir_gen/README.md — Override System](../gir_gen/README.md#override-system)
for the file format and editing workflow.

### Requirements

- The `gir_gen` tool must be built (the script builds it automatically via `dune build`)
- GIR files must be present (usually installed via system packages like `libgtk-4-dev`)

### Notes

- Code generation is **not** part of the normal dune build flow
- Generated files are committed to the repository
- Only run this script when you need to regenerate bindings (e.g., after updating GIR files, gir_gen, or override files)

## doc-preview-landing.sh

Writes the landing `index.html` at the root of a rendered odoc HTML tree. It
links the conventions page and each package's odoc root, and records the ref, commit and odoc warning
count of the build. The doc preview workflow
(`.github/workflows/doc-preview.yml`) runs it before deploying to `gh-pages`.

```bash
opam exec -- dune build @doc
rm -rf /tmp/site && cp -r _build/default/_doc/_html /tmp/site && chmod -R u+w /tmp/site
DOC_PREVIEW_REF=main DOC_PREVIEW_SHA=$(git rev-parse HEAD) \
  ./scripts/doc-preview-landing.sh /tmp/site
```

Copy the tree out first: dune leaves `_build` read-only. All environment
variables are optional; see the script header for the list.

## doc_artifacts

Caches the rendered odoc HTML of each commit, so the docs of two commits can
be compared without rebuilding them. The cache is outside the worktree, in
`$OCGTK_DOC_ARTIFACTS`, else `$XDG_CACHE_HOME/ocgtk-doc-artifacts`, else
`~/.cache/ocgtk-doc-artifacts`.

```bash
DA="dune exec scripts/doc_artifacts/doc_artifacts.exe --"
$DA build [NOTE]                # ensure an artifact for the working tree
$DA build --force [NOTE]        # rebuild it even when it exists
$DA list                        # every build: key, date, branch, note
$DA extract ARTIFACT [DIR]      # untar for browsing (default view/<key>)
$DA diff [--brief] A B          # diff -r two artifacts' HTML
$DA diff-baseline [--brief]     # diff -r the baseline and the working tree's artifact
$DA set-baseline ARTIFACT [NOTE]
$DA warnings ARTIFACT           # the odoc warnings of that build
```

An `ARTIFACT` is a key, a prefix of one, or anything git resolves to a commit
(`HEAD`, a branch, a short sha), optionally followed by `-dirty`.

**Keys.** On a clean tree the key is the full commit sha, and the artifact is
built once and never overwritten: the committed bindings make the docs a pure
function of the commit. `build` then hits the cache until `--force` (needed
after an odoc or dune upgrade; the manifest records both versions). A tree
with uncommitted changes is keyed `<sha>-dirty`, rebuilt on every `build`,
and cannot be the baseline.

**Build.** `build` regenerates the bindings with `generate-bindings.sh`, and
stops if that changes a clean tree (commit the regenerated files first). It
then runs `dune build @doc --cache=disabled` in a build directory of its own
(`build/` in the cache, emptied first), so every odoc rule runs and the
warning count is complete: dune does not replay the warnings of rules that
are up to date or restored from its cache. Deleting `_build/default/_doc` by
hand instead leaves dune's database out of step with the files, and later
doc builds fail until `dune clean`.

**Cache layout.**

```
artifacts/<key>.tar.gz           gzipped tar of the HTML tree
artifacts/<key>.json             manifest: sha, branch, date, odoc and dune versions,
                                 size, HTML file count, note, odoc warning count
artifacts/<key>.warnings         odoc warnings, each with its location
artifacts/<key>.<step>.log       output of the regenerate and doc steps
benchmarks/BASELINE              the baseline's key and a note
view/<key>/                      extracted trees
build/                           the doc build's dune build directory
index.tsv                        one line per build
```
