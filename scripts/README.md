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

Per-namespace override files live in `ocgtk/overrides/` and are committed to the
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
links each package's odoc root and records the ref, commit and odoc warning
count of the build. The doc preview workflow
(`.github/workflows/doc-preview.yml`) runs it before deploying to `gh-pages`.

```bash
dune build @doc
cp -r _build/default/_doc/_html /tmp/site && chmod -R u+w /tmp/site
DOC_PREVIEW_REF=main DOC_PREVIEW_SHA=$(git rev-parse HEAD) \
  ./scripts/doc-preview-landing.sh /tmp/site
```

Copy the tree out first: dune leaves `_build` read-only. All environment
variables are optional; see the script header for the list.
