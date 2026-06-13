# Contributing to ocgtk

## Prerequisites

Install OCaml tooling and system libraries. On Ubuntu/Debian:

```bash
# OCaml and dune
opam install dune ocamlformat merlin

# GTK4 dev libraries and GIR files
sudo apt-get install libgtk-4-dev libglib2.0-dev \
  gir1.2-gtk-4.0 gobject-introspection \
  pkg-config xvfb
```

The full dependency list for CI-tested distros is in `ci/versions.env`. See
[architecture/ci_distro_testing.md](architecture/ci_distro_testing.md) for
Docker-based distro testing.

## Building

From the repository root:

```bash
dune build
```

This compiles both `gir_gen` (the code generator) and `ocgtk` (the GTK bindings).
Generated files are already committed; you do not need to run the generator just to build.

## Running Tests

```bash
# Generator tests only (fast)
dune test gir_gen/

# All tests including ocgtk (requires a display)
xvfb-run dune test ocgtk/

# Both
dune test gir_gen/ && xvfb-run dune test ocgtk/
```

Always check the return code — some test output looks like success even on failure.

## Regenerating Bindings

When you change `gir_gen`, you will need to regenerate the OCaml/C source files:

```bash
bash scripts/generate-bindings.sh
```

This runs in two phases:
1. Generates cross-namespace reference files for all 9 namespaces into `_build/references/`
2. Regenerates bindings for each namespace, passing reference files so cross-namespace types resolve

After regeneration, rebuild and test:

```bash
dune build && dune test gir_gen/ && xvfb-run dune test ocgtk/
```

### Regenerating a single namespace

```bash
dune exec gir_gen -- generate gir/Gtk-4.0.gir ocgtk/src/gtk
```

Cross-namespace references won't be available unless you pass `--reference` flags, so
single-namespace regeneration is best for rapid iteration on generator logic where you
don't need cross-namespace types to resolve.

## Development Workflow

### Modifying the generator

1. Edit files under `gir_gen/lib/`
2. `dune build` to compile
3. `bash scripts/generate-bindings.sh` to regenerate all bindings
4. `dune build` again to compile the regenerated code
5. `dune test gir_gen/ && xvfb-run dune test ocgtk/`

Tip: if a generated C file fails to compile, add the failing entity to
`ocgtk/overrides/<ns>.sexp` with `(ignore)` while you fix the generator.

### Suppressing a problematic type or method

Edit `ocgtk/overrides/<ns>.sexp`. The format is s-expressions; add an `(ignore)`
directive for the entity or method:

```sexp
(class "ClassName"
  (methods
    (method "problematic_method" (ignore))))
```

See [architecture/gir_gen/overrides.md](architecture/gir_gen/overrides.md) for the
full format reference.

### Adding handwritten bindings for a type

Put them in `ocgtk/src/<ns>/core/`. The `core/` directory is for handwritten code;
`generated/` is entirely owned by the generator and is overwritten on each regeneration.

### Adding a new GIR library

See [architecture/adding_gir_library.md](architecture/adding_gir_library.md).

## Architecture

Start with [architecture/overview.md](architecture/overview.md) for a guided
introduction to how the codebase is structured.
