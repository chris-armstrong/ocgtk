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
