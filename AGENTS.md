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

If you are running in a clean container (e.g. Claude Code Web), you will need to follow the instructions in [CONTRIBUTORS.md](./CONTRIBUTORS.md) for instructions.

## Project Layout and Architecture

This is a dune workspace with two projects: `ocgtk/` (GTK bindings) and `gir_gen/` (code generator). Run `dune build` and `dune test` from the repo root to cover both. For `ocamlformat`: the repo root formats `ocgtk/`; `gir_gen/` is a separate dune root with its own `.ocamlformat` — run `dune fmt` inside `gir_gen/` too (CI enforces `ocamlformat --check` on gir_gen sources).

[The architecture documentation](./architecture/README.md) describes the project layout and system architecture.

## CI / Distro Compatibility Testing

The `ci/` directory provides Docker-based build and test environments. Default set:
Ubuntu 22.04, Debian 12, CentOS Stream 9, OpenSUSE Leap 15.6, Fedora 40,
Fedora 43, and Ubuntu 25.04 (`ubuntu24` is opt-in only — the dev environment
already runs Ubuntu 24.04). Use `./ci/oci` to manage them:

```bash
./ci/oci build ubuntu22    # build image (once)
./ci/oci run ubuntu22 build
./ci/oci run ubuntu22 test
./ci/oci shell ubuntu22    # interactive shell
./ci/oci status            # disk/container state
./ci/oci clean --all       # full teardown
```

Version pins (opam, OCaml) live in `ci/versions.env`. See
[architecture/ci_distro_testing.md](./architecture/ci_distro_testing.md)
for full documentation.


## Code Guidelines - how to write or refactor code 

**Always consult the [code guidelines](./docs/code_guidelines/index.md) for how to structure or restructure code.

**When moving code or documentation**: ALWAYS use tools to copy the code to a temporary file and write it to the destination file. DO NOT REGENERATE the code yourself - this will save your token usage. ALWAYS remove the old code files and update the `dune` file accordingly.

**When rewriting code or documentation**: THINK about what pattern exists in the changes you are making. Use a search and replace tool like `sed` or `awk` instead of rewriting the code yourself. Write a small utility in OCaml for more complex cases, validating it on a small sample before rewiring the whole codebase.

**When writing new code files or documentation files**: ALWAYS ensure the code file is added to the `dune` file and included (either directly or via code generation of a dune `(include ...)` or `(dynamic_include ...)`)

## Running Build Tools

**Quick reference:** `dune build` (build), `dune test gir_gen/ && xvfb-run dune test ocgtk/` (test).
See [CONTRIBUTORS.md](./CONTRIBUTORS.md) for complete build, test, and CI instructions.

## OCaml / C FFI Guidelines

For instructions and best practices for writing and updating OCaml / C FFI, see [FFI Guidelines](./architecture/FFI_GUIDELINES.md).


## ocgtk Development Tools

### GIR Code Generator

See [gir_gen/README.md](gir_gen/README.md) for complete usage instructions, including regeneration commands, override system, and cross-namespace type resolution.

### Design Docs

Design docs (PRDs and implementation plans) for feature work live under `gir_gen/docs/` — find and read the relevant one there before working in that area.

**Ban on ephemeral references:** do not mention milestones, phases, stages, PR numbers, or branch names in code or documentation. Such references are allowed only in plans and PRDs (`gir_gen/docs/plans/`, `gir_gen/docs/research/`) — never in source files, generated code, architecture docs, READMEs, or this file.


## Security Guidelines

**IMPORTANT**: All C bindings must follow security best practices documented in:

📘 **[FFI Guidelines](./architecture/FFI_GUIDELINES.md)** — Comprehensive security and FFI guidelines for OCaml C bindings


