# Code Generation Scripts

## generate-bindings.sh

Generates OCaml bindings for GIO, GDK, and GTK from their GIR (GObject Introspection) files.

### Usage

```bash
# Use default GIR path (/usr/share/gir-1.0)
./scripts/generate-bindings.sh

# Override GIR path
./scripts/generate-bindings.sh /custom/path/to/gir-1.0

# Or use environment variable
GIR_PATH=/custom/path/to/gir-1.0 ./scripts/generate-bindings.sh
```

### What it does

1. **Generates reference files** for cross-namespace type validation:
   - `_build/references/gio-references.sexp`
   - `_build/references/gdk-references.sexp`
   - `_build/references/gtk-references.sexp`

2. **Generates OCaml bindings** in the source tree:
   - `src/gio/generated/` - GIO bindings
   - `src/gdk/generated/` - GDK bindings (using GIO references)
   - `src/gtk/generated/` - GTK bindings (using GIO and GDK references)

3. After generation, run `dune build` to compile the updated bindings.

### Requirements

- The `gir_gen` tool must be built and available in your PATH
- GIR files must be present (usually installed via system packages like `libgtk-4-dev`)

### Notes

- Code generation is **not** part of the normal dune build flow
- Generated files are committed to the repository
- Only run this script when you need to regenerate bindings (e.g., after updating GIR files or gir_gen)
