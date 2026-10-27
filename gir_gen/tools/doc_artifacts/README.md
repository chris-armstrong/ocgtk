# doc_artifacts

Caches the rendered odoc HTML of each commit, so the docs of two commits can
be compared without rebuilding them. Run it from the repository root. The cache is outside the worktree, in
`$OCGTK_DOC_ARTIFACTS`, else `$XDG_CACHE_HOME/ocgtk-doc-artifacts`, else
`~/.cache/ocgtk-doc-artifacts`.

```bash
DA="dune exec gir_gen/tools/doc_artifacts/doc_artifacts.exe --"
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

**Build.** `build` regenerates the bindings with `scripts/generate-bindings.sh`, and
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
