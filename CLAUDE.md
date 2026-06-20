# Development Notes for ocgtk 


## MANDATORY: Development Essentials

1. ALWAYS build the project after making changes with `dune build` from the repo root. Always use its output in full - DO NOT FILTER its output with `head`/`grep`/`tail` because you will miss critical context.
2. ALWAYS run tests with `dune test gir_gen/ && xvfb-run dune test ocgtk/` from the repo root
3. ALWAYS write scripts and supporting code in OCaml
4. ALWAYS follow the mandatory code guidelines. Read [docs/code_guidelines/agent-summary.md](./docs/code_guidelines/agent-summary.md) — it covers all style, idiom, safety, and test requirements. The full guidelines are indexed at [docs/code_guidelines/index.md](./docs/code_guidelines/index.md).
### ast-grep
You are operating in an environment where ast-grep is installed. For any code search that requires understanding of syntax or code structure, you should default to using `ast-grep --lang [language] -p '<pattern>'`. Adjust the --lang flag as needed for the specific programming language. Avoid using text-only search tools unless a plain-text search is explicitly requested.

If you are not familiar with ast-grep, load [ast-grep LLMs guide](https://ast-grep.github.io/llms-full.txt) for full its full reference.

### shellcheck

shellcheck is available to lint & check shell scripts.

## Setting up the project

If you are running in a clean container (e.g. Claude Code Web), you will need to follow the instructions in [SETUP.md](./SETUP.md) for instructions.

## Code Layout

This is a dune workspace with two projects: `ocgtk/` (GTK bindings) and `gir_gen/` (code generator). Run `dune build` and `dune test` from the repo root to cover both. For `ocamlformat`, `cd ocgtk` first (it has its own `.ocamlformat` config).


## Writing or refactoring Code or Rewriting Documentation

**Always consult the [code guidelines](./docs/code_guidelines/index.md) for how to structure or restructure code.

**When moving code or documentation**: ALWAYS use tools to copy the code to a temporary file and write it to the destination file. DO NOT REGENERATE the code yourself - this will save your token usage. ALWAYS remove the old code files and update the `dune` file accordingly.

**When rewriting code or documentaiton**: THINK about what pattern exists in the changes you are making. Use a search and replace tool like `sed` or `awk` instead of rewriting the code yourself. Write a small utility in OCaml for more complex cases, validating it on a small sample before rewiring the whole codebase.

**When writing new code files or documentation files**: ALWAYS ensure the code file is added to the `dune` file and included (either directly or via code generation of a dune `(include ...)` or `(dynamic_include ...)`)

## Running Build Tools

This project uses `dune` to compile code and run tests. NEVER compile code directly with `ocamlc/ocamlc.opt`.

* Use `dune build` from the repo root to compile both projects. IMPORTANT: Always check the return code and grep for "error|warning|undefined reference".
    DO NOT filter its output with `grep`/`head`/`tail` etc. unless you know what you are looking for AND have already checked the return code.
* Use `dune test gir_gen/ && xvfb-run dune test ocgtk/` from the repo root to run all tests. ALWAYS check the return code to determine success - do not rely on the console output.

## OCaml / C FFI Guidelines

For instructions and best practices for writing and updating OCaml / C FFI, see [FFI Guidelines](./architecture/FFI_GUIDELINES.md).


## ocgtk Development Tools

### CI / Distro Compatibility Testing

Use `./ci/oci` to build and test against Ubuntu 22.04, Debian 12, CentOS Stream 9,
and OpenSUSE Leap 15.6 via Docker. Source is bind-mounted so changes are immediately
reflected without rebuilding images.

```bash
./ci/oci build ubuntu22    # build image (once — compiles OCaml, takes ~20 min)
./ci/oci up                # start all containers
./ci/oci run ubuntu22 build
./ci/oci run ubuntu22 test
./ci/oci shell debian12    # interactive shell for debugging
./ci/oci status            # show running containers, volumes, disk usage
./ci/oci clean --all       # full teardown to recover disk space
```

Version pins live in `ci/versions.env`. See
[architecture/ci_distro_testing.md](architecture/ci_distro_testing.md)
for full documentation.

### GIR Code Generator
For generating GTK bindings from GObject Introspection (GIR) files:
- See [gir_gen/README.md](gir_gen/README.md) for complete usage instructions
- Generates C FFI bindings and OCaml interfaces for 9 namespaces: Cairo, Gio, Gdk, Graphene, GdkPixbuf, Pango, PangoCairo, Gsk, Gtk
- Cross-namespace type resolution via reference files and `<ns>_decls.h` headers

**To regenerate all bindings (recommended):**
```bash
# From repository root (NOT ocgtk/):
bash scripts/generate-bindings.sh
```

This builds the generator, generates reference files for all 9 namespaces, then generates bindings with correct cross-namespace dependencies. Override files in `ocgtk/overrides/` are applied automatically (one per namespace).

**To regenerate a single library manually:**
```bash
# From repository root:
dune exec gir_gen -- generate \
  -o ocgtk/overrides/gtk.sexp \
  gir/Gtk-4.0.gir ocgtk/src/gtk
```

NOTE: For other libraries, use `ocgtk/src/<short_name>`. For example, ocgtk/src/pango for Pango, ocgtk/src/gsk for GSK, ocgtk/src/gdk for GDK, etc.

**Override files** (`ocgtk/overrides/<ns>.sexp`) control which entities are ignored during generation and set version guards on enum/bitfield members. Pass `-o ocgtk/overrides/<ns>.sexp` to `generate` or `references`. See [gir_gen/README.md — Override System](gir_gen/README.md#override-system).

**⚠️ IMPORTANT:** Use `ocgtk/src/gtk` NOT `ocgtk/src/gtk/generated` as the output directory. The generator automatically creates the `generated/` subdirectory. Using `ocgtk/src/gtk/generated` will create a nested `src/gtk/generated/generated/` directory.


## Security Guidelines

**IMPORTANT**: All C bindings must follow security best practices documented in:

📘 **[SECURITY_GUIDELINES.md](SECURITY_GUIDELINES.md)** - Comprehensive security guidelines for OCaml C bindings


## When You Get Stuck on Solving problems

1. **Check lablgtk3** - probably already solved
2. **Check security guidelines** - ensure code follows best practices
3. **Add debug output to file** - stderr may not work
4. **Check pointer values** - catch wrapping issues early
5. **Test first and incrementally** - write a test case first and/or isolate the failing case

