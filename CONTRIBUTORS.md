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

Then the OCaml dependencies. Our conf packages are not in opam-repository yet,
so pin them first:

```bash
for p in conf-*/; do opam pin add -n -y "${p%/}" "./$p"; done
opam install . ./gir_gen --deps-only --with-test
```

The full dependency list for CI-tested distros is in `ci/versions.env`. See
[architecture/ci_distro_testing.md](architecture/ci_distro_testing.md) for
Docker-based distro testing.

## Building

From the repository root:

```bash
dune build
```

This compiles `gir_gen` (the code generator) and every binding package (`ocglib`,
`ocgio`, ..., `ocgtk`), all declared in the root `dune-project`.
Generated files are already committed; you do not need to run the generator just to build.

## Running Tests

```bash
# Generator tests only (fast)
dune test gir_gen/

# Every package's tests (the gtk ones need a display)
xvfb-run dune test

# One package's tests
xvfb-run dune test ocgio/

# Generator first, then the rest
dune test gir_gen/ && xvfb-run dune test
```

`xvfb-run` provides a headless X display server so that the ocgtk tests which need a
display can run. Tests that require a display are automatically skipped when none is
available, but note that `dune` caches this skip decision — if you later want to run
the full suite with a display, pass `--force` to dune:

```bash
dune test gir_gen/ && xvfb-run dune test --force
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
dune build && dune test gir_gen/ && xvfb-run dune test
```

## Development Workflow

### Modifying the generator

1. Edit files under `gir_gen/lib/`
2. `dune build` to compile
3. `bash scripts/generate-bindings.sh` to regenerate all bindings
4. `dune build` again to compile the regenerated code
5. `dune test gir_gen/ && xvfb-run dune test`

Tip: if a generated C file fails to compile, add the failing entity to
`overrides/<ns>.sexp` with `(ignore)` while you fix the generator.

### Suppressing a problematic type or method

Edit `overrides/<ns>.sexp`. The format is s-expressions; add an `(ignore)`
directive for the entity or method:

```sexp
(class "ClassName"
  (methods
    (method "problematic_method" (ignore))))
```

See [architecture/gir_gen/overrides.md](architecture/gir_gen/overrides.md) for the
full format reference.

### Adding handwritten bindings for a type

Put them in `<pkg>/raw/core/` (for example `ocgio/raw/core/`), where they join the
layer 1 library and are aliased in the package's `Raw` module. Hand-written modules
that need layer 2 go in `<pkg>/core/` and join the main library, like
`ocgtk/core/main.ml` (`Ocgtk.Main`). The `core/` directories are for handwritten
code; every `generated/` directory is entirely owned by the generator, and the
generator deletes any file in one that it did not write.

### Adding a new GIR library

See [architecture/adding_gir_library.md](architecture/adding_gir_library.md).

## Architecture

Start with [architecture/overview.md](architecture/overview.md) for a guided
introduction to how the codebase is structured.
