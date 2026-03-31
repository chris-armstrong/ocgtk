# Development Notes for ocgtk 
# Project Context

<!-- ctx:context -->
<!-- DO NOT REMOVE: This marker indicates ctx-managed content -->

## IMPORTANT: You Have Persistent Memory

This project uses Context (`ctx`) for context persistence across sessions.
**Your memory is NOT ephemeral** - it lives in `$CTX_DIR/*` files (where CTX_DIR is an environment variable containing the context directory).

## On Session Start

1. **Read `$CTX_DIR/AGENT_PLAYBOOK.md`** first - it explains how to use this system
2. **Run `ctx status`** to see current context summary

## When Asked "Do You Remember?"

When the user asks "Do you remember?", "What were we working on?", or any
memory-related question:

**Do this FIRST (silently):**
- Read `$CTX_DIR/TASKS.md`
- Read `$CTX_DIR/DECISIONS.md` and `$CTX_DIR/LEARNINGS.md`
- Run `ctx recall list --limit 5` for recent session history

**Then respond with a structured readback:**

1. **Last session**: cite the most recent session topic and date
2. **Active work**: list pending or in-progress tasks
3. **Recent context**: mention 1-2 recent decisions or learnings
4. **Next step**: offer to continue or ask what to focus on

**Never** lead with "I don't have memory", "Let me check if there are files",
or narrate your discovery process. The `$CTX_DIR/` files are your memory.
Read them silently, then present what you found as recall, not as a search.

## Quick Context Load

```bash
# Get AI-optimized context packet (what you should know)
ctx agent --budget 4000

# Or see full status
ctx status
```

## Context Files

| File | Purpose |
|------|---------|
| `$CTX_DIR/CONSTITUTION.md` | Hard rules - NEVER violate |
| `$CTX_DIR/TASKS.md` | Current work items |
| `$CTX_DIR/DECISIONS.md` | Architectural decisions with rationale |
| `$CTX_DIR/LEARNINGS.md` | Gotchas, tips, lessons learned |
| `$CTX_DIR/CONVENTIONS.md` | Code patterns and standards |

## Before Session Ends

**ALWAYS offer to persist context before the user quits.**

Learnings require `--context`, `--lesson`, `--application`:

```bash
ctx add learning "Title" \
  --context "What prompted this" \
  --lesson "The key insight" \
  --application "How to apply it going forward"
```

Decisions require `--context`, `--rationale`, `--consequences`:

```bash
ctx add decision "Title" \
  --context "What prompted this" \
  --rationale "Why this choice" \
  --consequences "What changes as a result"
```

<!-- ctx:end -->


## MANDATORY: Development Essentials

1. ALWAYS build the project after making changes with `cd ocgtk && dune build`. Always use its output in full - DO NOT FILTER its output with `head`/`grep`/`tail` because you will miss critical context.
2. ALWAYS run tests with `cd ocgtk && xvfb-run dune runtest`
3. ALWAYS write scripts and supporting code in OCaml
4. ALWAYS refer to [STYLE_GUIDELINES.md](./STYLE_GUIDELINES.md) for OCaml code style and structure guidelines
### ast-grep
You are operating in an environment where ast-grep is installed. For any code search that requires understanding of syntax or code structure, you should default to using `ast-grep --lang [language] -p '<pattern>'`. Adjust the --lang flag as needed for the specific programming language. Avoid using text-only search tools unless a plain-text search is explicitly requested.

If you are not familiar with ast-grep, load [ast-grep LLMs guide](https://ast-grep.github.io/llms-full.txt) for full its full reference.

### shellcheck

shellcheck is available to lint & check shell scripts.

## Setting up the project

If you are running in a clean container (e.g. Claude Code Web), you will need to follow the instructions in [SETUP.md](./SETUP.md) for instructions.

## Project Layout and Architecture

`ocgtk` lives in the `ocgtk` sub-directory i.e. ocgtk/ocgtk - remember to `cd ocgtk` before running tools like `dune` or `ocamlformat`.

[The architecture documentation](./ocgtk/architecture/README.md) describes the project layout and system architecture.


## Code Guidelines - how to write or refactor code 

**Always consult the [code guidelines](./ocgtk/docs/code_guidelines/index.md) for how to structure or restructure code.

**When moving code or documentation**: ALWAYS use tools to copy the code to a temporary file and write it to the destination file. DO NOT REGENERATE the code yourself - this will save your token usage. ALWAYS remove the old code files and update the `dune` file accordingly.

**When rewriting code or documentaiton**: THINK about what pattern exists in the changes you are making. Use a search and replace tool like `sed` or `awk` instead of rewriting the code yourself. Write a small utility in OCaml for more complex cases, validating it on a small sample before rewiring the whole codebase.

**When writing new code files or documentation files**: ALWAYS ensure the code file is added to the `dune` file and included (either directly or via code generation of a dune `(include ...)` or `(dynamic_include ...)`)

## Running Build Tools

This project uses `dune` to compile code and run tests. NEVER compile code directly with `ocamlc/ocamlc.opt`.

* Use `cd ocgtk && dune build` to compile the code. IMPORTANT: Always check the return code grep for "error|warning|undefined reference". 
    DO NOT filter its output with `grep`/`head`/`tail` etc. unless you know what you are looking for AND have already checked the return code.
* Use `cd ocgtk && xvfb-run dune runtest` to run all the unit and integration tests. ALWAYS check the return code to determine success - do not rely on the console output.

## OCaml / C FFI Guidelines

For instructions and best practices for writing and updating OCaml / C FFI, see [FFI Guidelines](./ocgtk/architecture/FFI_GUIDELINES.md).


## ocgtk Development Tools

### GIR Code Generator
For generating GTK bindings from GObject Introspection (GIR) files:
- See [ocgtk/src/tools/README_GIR_GEN.md](ocgtk/src/tools/README_GIR_GEN.md) for complete usage instructions
- Generates C FFI bindings and OCaml interfaces for 9 namespaces: Cairo, Gio, Gdk, Graphene, GdkPixbuf, Pango, PangoCairo, Gsk, Gtk
- Cross-namespace type resolution via reference files and `<ns>_decls.h` headers

**To regenerate all bindings (recommended):**
```bash
# From repository root (NOT ocgtk/):
bash scripts/generate-bindings.sh
```

This builds the generator, generates reference files for all 9 namespaces, then generates bindings with correct cross-namespace dependencies.

**To regenerate a single library manually:**
```bash
cd ocgtk
dune exec src/tools/gir_gen/gir_gen.exe -- generate /usr/share/gir-1.0/Gtk-4.0.gir src/gtk
```

NOTE: For other libraries, use `src/<short_name>`. For example, src/pango for Pango, src/gsk for GSK, src/gdk for GDK, etc.

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

