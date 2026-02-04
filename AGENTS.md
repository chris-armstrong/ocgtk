# Development Notes for ocgtk 

## MANDATORY: Development Essentials

1. ALWAYS build the project after making changes with `cd ocgtk && dune build`. Always use its output in full - DO NOT FILTER its output with `head`/`grep`/`tail` because you will miss critical context.
2. ALWAYS run tests with `cd ocgtk && xvfb-run dune runtest`
3. ALWAYS write scripts and supporting code in OCaml
4. ALWAYS refer to [STYLE_GUIDELINES.md](./STYLE_GUIDELINES.md) for OCaml code style and structure guidelines

## Setting up the project

If you are running in a clean container (e.g. Claude Code Web), you will need to follow the instructions in [SETUP.md](./SETUP.md) for instructions.

## Code Layout

`ocgtk` lives in the `ocgtk` sub-directory i.e. ocgtk/ocgtk - remember to `cd ocgtk` before running tools like `dune` or `ocamlformat`.


## Writing or refactoring Code or Rewriting Documentation

**Always consult [ocaml readability guidelines](./.opencode/guidelines/ocaml-readability.md) for how to structure or restructure code.

**When moving code or documentation**: ALWAYS use tools to copy the code to a temporary file and write it to the destination file. DO NOT REGENERATE the code yourself - this will save your token usage. ALWAYS remove the old code files and update the `dune` file accordingly.

**When rewriting code or documentaiton**: THINK about what pattern exists in the changes you are making. Use a search and replace tool like `sed` or `awk` instead of rewriting the code yourself. Write a small utility in OCaml for more complex cases, validating it on a small sample before rewiring the whole codebase.

**When writing new code files or documentation files**: ALWAYS ensure the code file is added to the `dune` file and included (either directly or via code generation of a dune `(include ...)` or `(dynamic_include ...)`)

## Running Build Tools

This project uses `dune` to compile code and run tests. NEVER compile code directly with `ocamlc/ocamlc.opt`.

* `cd ocgtk && dune build` is the basic build command
* Use `dune build` to compile the code. IMPORTANT: Always check the return code grep for "error|warning|undefined reference". DO NOT filter its output with `grep`/`head`/`tail` etc. otherwise you will miss critical error context.
* Use `xvfb-run dune runtest` to run all the unit and integration tests. ALWAYS check the return code to determine success - do not rely on the console output.

## OCaml / C FFI Guidelines

For instructions and best practices for writing and updating OCaml / C FFI, see [FFI Guidelines](./ocgtk/architecture/FFI_GUIDELINES.md).


## ocgtk Development Tools

### GIR Code Generator
For generating GTK bindings from GObject Introspection (GIR) files:
- See [ocgtk/src/tools/README_GIR_GEN.md](ocgtk/src/tools/README_GIR_GEN.md) for complete usage instructions
- Generates C FFI bindings and OCaml interfaces from Gtk-4.0.gir
- Supports error handling with result types for throwing functions

**To regenerate GTK bindings:**
```bash
cd ocgtk
dune exec gir_gen -- /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
```

**⚠️ IMPORTANT:** Use `src/gtk` NOT `src/gtk/generated` as the output directory. The generator automatically creates the `generated/` subdirectory. Using `src/gtk/generated` will create a nested `src/gtk/generated/generated/` directory.


## Security Guidelines

**IMPORTANT**: All C bindings must follow security best practices documented in:

📘 **[SECURITY_GUIDELINES.md](SECURITY_GUIDELINES.md)** - Comprehensive security guidelines for OCaml C bindings


## When You Get Stuck on Solving problems

1. **Check lablgtk3** - probably already solved
2. **Check security guidelines** - ensure code follows best practices
3. **Add debug output to file** - stderr may not work
4. **Check pointer values** - catch wrapping issues early
5. **Test first and incrementally** - write a test case first and/or isolate the failing case

