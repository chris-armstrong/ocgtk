---
name: ocamler
description: "MANDATORY before any OCaml, dune, or opam work in this repository — building, testing, formatting, locating executables and installed libraries, ppx expansion, .mli generation, or diagnosing dune hangs. If the task touches .ml/.mli files, dune files, or opam in any way, load this skill first."
---
# OCaml / Dune Skill

> **CRITICAL — check the opam environment first.** Before running *any* `dune`, `ocamlfind`, `ocamlformat`, or `opam` command, you MUST verify the opam environment is active. Non-interactive shells almost never have it sourced.

---

## 1. Check and initialise the opam environment

```bash
test -n "$OPAM_SWITCH_PREFIX" && echo "opam env active" || echo "opam env NOT active"
```

If not active, use **one** of:

- **`opam exec --` (preferred)** — wraps a single command, works in any shell context:
  ```bash
  opam exec -- dune build
  ```
- **`eval $(opam env)`** — sources the environment for the rest of the shell session:
  ```bash
  eval $(opam env) && dune build
  ```

**All examples below use `opam exec --`.** Omit it if the environment is already active.

---

## 2. Detect workspace root

The directory containing `dune-project` is the workspace root. All `dune` commands should run from there.

```bash
find . -maxdepth 1 -name 'dune-project' -o -name 'dune-workspace' | head -1
```

---

## 3. Build

```bash
opam exec -- dune build                              # full build
opam exec -- dune build bin/main.exe                  # specific executable
opam exec -- dune build lib/mylib/.mylib.objs/byte    # specific library
```

---

## 4. Run executables

`dune exec` builds and runs in one step.

```bash
opam exec -- dune exec bin/main.exe
opam exec -- dune exec bin/main.exe -- --flag value   # args after -- go to the program
```

Dune places all build artefacts under `_build/<context>/`, where `<context>` is normally `default` (or a named context from `dune-workspace`). The binary path mirrors the source tree: an executable defined in `bin/dune` with `(name main)` compiles to `_build/default/bin/main.exe`. The `.exe` suffix is dune convention on **all** platforms, not just Windows.

```bash
./_build/default/bin/main.exe --flag value   # run the binary directly
ls _build/default/bin/                       # see what was built
```

---

## 5. Run tests

```bash
opam exec -- dune runtest                 # all tests
opam exec -- dune runtest test/           # specific directory
opam exec -- dune exec test/test_foo.exe  # single test executable
opam exec -- dune promote                 # accept new expect-test baselines
```

---

## 6. Format code

Requires an `.ocamlformat` file at the project root.

```bash
opam exec -- ocamlformat -i src/foo.ml src/bar.mli   # format files in-place
opam exec -- dune fmt                                 # format in place (dune >= 3.x)
opam exec -- ocamlformat --check src/foo.ml           # check formatting only
```

---

## 7. Locate installed library files

```bash
opam exec -- ocamlfind query <lib>                                    # library directory
ls "$(opam exec -- ocamlfind query <lib>)"/*.cmi                      # compiled interfaces
ls "$(opam exec -- ocamlfind query <lib>)"/*.mli 2>/dev/null          # source interfaces
```

The installed `.mli` files are the authoritative interface. (`ocamlobjinfo` used
to print exported values but no longer does on OCaml ≥ 5.x — it only lists unit
imports, so it can no longer serve as an interface dump.)

---

## 8. Install and query opam packages

```bash
opam exec -- opam install <pkg>                     # install a package
opam exec -- opam install . --deps-only --with-test # install project dependencies
opam exec -- opam list --installed <pkg>            # check if installed
opam exec -- opam show <pkg>                        # package details
```

---

## 9. Read findlib META files

Each opam package can install multiple findlib libraries. The `META` file declares them.

```bash
cat "$(opam exec -- ocamlfind query <lib>)/META"                     # read META directly
opam exec -- opam show --list-files <pkg> | grep META                # find META files from a package
opam exec -- ocamlfind printconf path                                # findlib search paths
```

---

## 10. Generate .mli interface files

The reliable way to get a module's inferred signature is to ask the compiler
(`ocamlobjinfo` no longer lists exported values on OCaml ≥ 5.x):

```bash
# From the file's directory, with its findlib package deps
cd src && opam exec -- ocamlfind ocamlc -package <pkgs> -i foo.ml > foo.mli

# Then edit foo.mli to hide internals and add docs
```

For files with sibling-module dependencies, build first and locate the compiled
interface to confirm the module is wrapped (`find _build/default -name 'foo.cmi'`);
wrapped libraries compile modules as `<lib>__Foo`.

---

## 11. View ppx-expanded code

`dune ocaml pp` no longer exists in current dune releases (`dune ocaml` offers
`top`/`merlin`/`doc` only). Two verified alternatives:

```bash
# 1. Run dune's own ppx driver on the file (pretty-prints the expanded
#    source; the driver in _build/default/.ppx/<hash>/ matches the
#    library's ppx set):
$(ls -d _build/default/.ppx/*/ppx.exe | head -1) src/foo.ml

# 2. Ask the compiler for the inferred signature (requires the file's
#    only dependencies to be findlib packages):
cd src && opam exec -- ocamlfind ocamlc -package <pkgs> -i foo.ml
```

Useful for debugging type errors in ppx-derived code or understanding
expect-test expansions. See this repo's `ppx-deriving` skill for generated-name
rules and concrete examples.

---

## 12. Module dependency analysis

```bash
# Module-level dependencies (compiler tool)
opam exec -- ocamldep -modules src/foo.ml

# Workspace structure and library dependencies
opam exec -- dune describe workspace
opam exec -- dune describe external-lib-deps

# Quick scan of dune-level dependencies
grep -r '(libraries' --include='dune' .
```

---

## 13. Quick expression evaluation

`dune utop <dir>` loads your project's libraries into a toplevel:

```bash
# Interactive (loads libraries from src/dune)
opam exec -- dune utop src/

# One-liner evaluation
echo 'List.map (fun x -> x * 2) [1;2;3];;' | opam exec -- dune utop src/

# Without project context
echo '#use "topfind";; #require "yojson";; Yojson.Safe.from_string {|{"a":1}|};;' | opam exec -- ocaml
```

---

## 14. Clean builds

```bash
opam exec -- dune clean && opam exec -- dune build
```

Use `dune clean` when build errors don't match source, after switching opam switches or compiler versions, or after major dune file changes. Most "weird" errors are real — check code before cleaning.

---

## 15. Dune locks and caching

Dune uses `_build/` with content-based caching (file digests, not timestamps), so it is generally accurate about what needs rebuilding.

Dune acquires `_build/.lock` to prevent concurrent builds. If you see `A running dune instance has locked the build directory`:

```bash
# 1. Check if a dune process is actually running
pgrep -fa 'dune' || echo "no dune process"

# 2. If a dune build --watch process is running:
#    - You do NOT need to build manually — it rebuilds automatically on file save
#    - Check its terminal output for build errors instead of running dune build
#    - If you need to run a one-off build command (e.g. dune exec, dune runtest),
#      you must stop the watch process first:
pkill -f 'dune.*watch'

# 3. If no dune process is running, the lock is stale — remove it:
rm _build/.lock
```
