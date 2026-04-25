# gir_gen Separation Plan

## Overview

Move `gir_gen` (the GIR-to-OCaml code generator) and its tests out of the `ocgtk` dune
project into a standalone dune project at `/gir_gen/` in the same repository. The goal is to
reduce `ocgtk`'s dependency footprint so that it only requires what is needed to compile and
test the GTK bindings themselves.

### Motivation

Currently `ocgtk/dune-project` carries build-time dependencies that belong exclusively to the
generator: `containers`, `xmlm`, `re`, `fmt`, `logs`, `cmdliner`, `sexplib`, `ppx_sexp_conv`,
`ppx_deriving`, and `ppxlib` (test). After the split, ocgtk's required deps shrink to just
`conf-gtk4`, `integers`, `dune-configurator`, and `alcotest` (test).

### Key Decisions

- `/gir_gen/` is a sibling of `ocgtk/` at the repository root — same git repo, separate dune-project.
- A `dune-workspace` at the repo root spans both projects, so `dune build` from root builds
  everything without needing an opam pin.
- The opam package is named `gir_gen` (may be published to opam.ocaml.org later).
- All `test_gir_gen` tests (unit and integration) move into `/gir_gen/test/` — they have no
  dependency on ocgtk's C bindings.
- GIR data files move from `ocgtk/ocgtk/gir/` to `/gir/` at the repo root, shared between both
  projects. All references to `/usr/share/gir-1.0/` are removed.
- `ppx_deriving.eq` usage in `ocgtk/examples/calculator/` is eliminated (replaced with
  structural equality), removing the last `ppx_deriving` use from ocgtk.
- `gir_gen` stays at `ocaml >= 5.3`. `ocgtk` is relaxed to `>= 5.0`. A CI step is added to
  test with OCaml 4.14 opportunistically.
- No version-coupling enforcement between gir_gen and the committed generated files —
  regeneration is a manual step when gir_gen changes.
- `ocgtk/overrides/*.sexp` stay in `ocgtk/` — they are ocgtk-specific generator configuration.

---

## Current Layout (relevant paths)

```
ocgtk/
  dune-project                        # single dune project today
  ocgtk.opam                          # includes all gir_gen deps
  ocgtk/gir/                          # bundled GIR data files (9 namespaces)
  overrides/                          # namespace override .sexp files
  src/
    tools/
      gir_gen/                        # generator source (lib + entry point)
        dune
        gir_gen.ml                    # entry point / main
        generate/                     # code generation modules
        parse/                        # GIR parsing modules
        *.ml                          # top-level lib modules
      test_gir_gen/                   # all generator tests
        dune
        test_gir_gen.ml               # unit test runner
        test_gir_gen_integration.ml   # integration test runner
        c_stubs/
        ml_generation/
        class_generation/
        overrides/
        cross_namespace/
        integration/
      README_GIR_GEN.md
  examples/
    calculator/
      dune                            # uses ppx_deriving.eq
      calc_expr.ml                    # [@@deriving eq] on token type
```

---

## Target Layout

```
gir_gen/                              # NEW: separate dune-project
  dune-project
  gir_gen.opam
  bin/
    gir_gen.ml                        # entry point
    dune
  lib/                                # (moved from ocgtk/src/tools/gir_gen/)
    dune
    generate/
    parse/
    *.ml
  test/                               # (moved from ocgtk/src/tools/test_gir_gen/)
    dune
    ...
  docs/
    README_GIR_GEN.md                 # (moved from ocgtk/src/tools/)

gir/                                  # NEW: shared GIR data (moved from ocgtk/ocgtk/gir/)
  cairo-1.0.gir
  Gio-2.0.gir
  Gdk-4.0.gir
  Graphene-1.0.gir
  GdkPixbuf-2.0.gir
  Pango-1.0.gir
  PangoCairo-1.0.gir
  Gsk-4.0.gir
  Gtk-4.0.gir

dune-workspace                        # NEW: workspace spanning both projects

ocgtk/
  dune-project                        # cleaned of gir_gen deps
  ocgtk.opam                          # regenerated
  overrides/                          # unchanged
  src/
    (tools/ deleted entirely)
  examples/
    calculator/
      dune                            # ppx_deriving.eq removed
      calc_expr.ml                    # [@@deriving eq] replaced with let equal_token = (=)
```

---

## Phases

### Phase 1 — Create `/gir_gen/` project

**Goal**: Establish the new dune-project with all generator source and tests moved in.

#### 1.1 Create project scaffold

Create `/gir_gen/dune-project`:

```
(lang dune 3.13)

(name gir_gen)

(version 0.1.0)

(generate_opam_files true)

(source
 (github chris-armstrong/ocgtk))

(license "LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception")

(authors "Chris Armstrong")

(maintainers "hello@chrisarmstrong.dev")

(package
 (name gir_gen)
 (synopsis "GIR-to-OCaml binding generator for ocgtk")
 (description
  "Generates OCaml GTK 4 bindings from GObject Introspection (GIR) files.")
 (depends
  (ocaml (>= 5.3))
  (dune (>= 3.13))
  (containers (>= 3.0))
  (xmlm (>= 1.4))
  (re (>= 1.11))
  (fmt (>= 0.9))
  (logs (>= 0.7))
  (cmdliner (>= 1.3))
  (sexplib (>= 0.16))
  (ppx_sexp_conv (>= 0.16))
  (ppx_deriving (>= 5.0))
  (alcotest :with-test)
  (ppxlib :with-test)))
```

#### 1.2 Move library source

```
git mv ocgtk/src/tools/gir_gen/generate   gir_gen/lib/generate
git mv ocgtk/src/tools/gir_gen/parse      gir_gen/lib/parse
git mv ocgtk/src/tools/gir_gen/*.ml       gir_gen/lib/   # all non-entry-point .ml/.mli
git mv ocgtk/src/tools/gir_gen/*.mli      gir_gen/lib/
```

Move `gir_gen.ml` (the entry point/main) to `gir_gen/bin/gir_gen.ml`.

Create `gir_gen/lib/dune`:
```
(include_subdirs qualified)

(library
 (name gir_gen_lib)
 (modules :standard)
 (libraries str unix xmlm logs logs.fmt containers re sexplib)
 (preprocess (pps ppx_sexp_conv ppx_deriving.eq))
 (flags (:standard -w -32 -w -39)))
```

Create `gir_gen/bin/dune`:
```
(executable
 (name gir_gen)
 (public_name gir_gen)
 (modules gir_gen)
 (libraries gir_gen_lib cmdliner)
 (flags (:standard -w -27)))
```

Note the addition of `(public_name gir_gen)` so that `dune install` puts it on PATH.

#### 1.3 Move tests

```
git mv ocgtk/src/tools/test_gir_gen   gir_gen/test
```

Update `gir_gen/test/dune`:
- Change `(deps %{exe:../gir_gen/gir_gen.exe} ...)` →
  `(deps %{exe:../bin/gir_gen.exe} ...)`
- Change `(source_tree %{project_root}/ocgtk/gir)` →
  `(source_tree %{workspace_root}/gir)`
- Change `"GIR_DATA_DIR" "%{project_root}/ocgtk/gir"` →
  `"GIR_DATA_DIR" "%{workspace_root}/gir"`

#### 1.4 Move documentation

```
git mv ocgtk/src/tools/README_GIR_GEN.md   gir_gen/docs/README_GIR_GEN.md
```

Update any internal links within the document.

**Test gate**: `cd` to repo root, run `dune build gir_gen/` and
`dune test gir_gen/` — all gir_gen tests must pass.

---

### Phase 2 — Move GIR files

**Goal**: Centralise GIR data at the repo root, remove all `/usr/share/gir-1.0/` references.

#### 2.1 Move the directory

```
git mv ocgtk/ocgtk/gir   gir
```

#### 2.2 Update generate-bindings.sh

- Change `GIR_PATH` default from `$WORKSPACE_ROOT/ocgtk/gir` to `$REPO_ROOT/gir`.
- Change `GIR_GEN` invocation from `dune build src/tools/gir_gen/gir_gen.exe` +
  `_build/default/src/tools/gir_gen/gir_gen.exe` to
  `dune exec --root "$REPO_ROOT" gir_gen -- ` (workspace-aware).
- Remove any fallback to `/usr/share/gir-1.0/`.

#### 2.3 Search and erase remaining references

```
grep -r "usr/share/gir" . --include="*.sh" --include="*.md" --include="*.ml" --include="dune*"
```

Fix or remove every match.

**Test gate**: `bash scripts/generate-bindings.sh` completes successfully from repo root with
regenerated output matching the committed files.

---

### Phase 3 — Dune workspace

**Goal**: Single `dune build` from the repo root builds both projects.

Create `/dune-workspace`:

```
(lang dune 3.13)
(context default)
```

Dune automatically discovers `dune-project` files in subdirectories; both `ocgtk/` and
`gir_gen/` will be included.

**Test gate**:
- `dune build` from repo root succeeds.
- `dune test` from repo root runs both ocgtk and gir_gen test suites.
- `dune exec gir_gen -- --help` works from repo root.

---

### Phase 4 — Clean up ocgtk

**Goal**: Remove gir_gen source, strip deps from opam, remove ppx_deriving from examples.

#### 4.1 Delete `ocgtk/src/tools/`

Verify it is empty (all content moved in Phase 1), then:
```
git rm -r ocgtk/src/tools
```

#### 4.2 Remove ppx_deriving from the calculator example

In `ocgtk/examples/calculator/calc_expr.ml`:
- Remove `[@@deriving eq]` from the `token` type.
- Add `let equal_token a b = (a = b)` after the type definition.

In `ocgtk/examples/calculator/dune`:
- Remove the `(preprocess (pps ppx_deriving.eq))` clause from the `calc_core` library stanza.

#### 4.3 Strip gir_gen deps from ocgtk/dune-project

Remove from the `ocgtk` package's `depends`:
- `containers` (build)
- `xmlm` (build)
- `re` (build)
- `fmt` (build)
- `logs` (build)
- `cmdliner` (build)
- `sexplib` (build)
- `ppx_sexp_conv` (build)
- `ppx_deriving` (build)
- `ppxlib` (with-test)

Keep:
- `ocaml >= 5.0` (relaxed from 5.3 — see §4.4)
- `dune >= 3.13`
- `conf-gtk4`
- `integers >= 0.7.0`
- `dune-configurator` (build)
- `alcotest` (with-test) — still used by `ocgtk/tests/`

#### 4.4 Relax OCaml version

Change `(ocaml (>= 5.3))` to `(ocaml (>= 5.0))` in `ocgtk/dune-project`.

#### 4.5 Regenerate ocgtk.opam

```
cd ocgtk && dune build ocgtk.opam
```

**Test gate**: `cd ocgtk && dune build && xvfb-run dune runtest` — full build and test suite
must pass with the stripped deps.

---

### Phase 5 — Scripts and CI

**Goal**: CI builds from the workspace root; generate-bindings.sh uses the workspace.

#### 5.1 Update generate-bindings.sh

- The script no longer needs a separate `dune build` step for gir_gen — it runs
  `dune exec gir_gen --` from the repo root, which the workspace resolves.
- `WORKSPACE_ROOT` variable becomes `REPO_ROOT` throughout.

#### 5.2 Update CI scripts

In `ci/` and any GitHub Actions workflows:
- Change working directory from `ocgtk/` to repo root for the `dune build` / `dune test` steps.
- Ensure `dune test` covers both packages.

#### 5.3 Add OCaml version CI steps

- Add a CI job for OCaml **5.0** against the full workspace.
- Add an exploratory job for OCaml **4.14** — record what (if anything) breaks without
  committing to supporting it. If it passes cleanly, lower the version floor; otherwise
  document the blockers.

**Test gate**: CI green on the new workflow configuration.

---

### Phase 6 — Documentation and context

**Goal**: No documentation references old paths; CLAUDE.md reflects new structure.

#### 6.1 Update CLAUDE.md

- GIR code generator section: update paths to `/gir_gen/`, `gir_gen/docs/README_GIR_GEN.md`.
- "To regenerate all bindings" code block: update `generate-bindings.sh` invocation.
- "To regenerate a single library manually" block: update `dune exec` path.
- Remove any reference to `ocgtk/src/tools/`.

#### 6.2 Update scripts/README.md and README.md

- Update any paths or instructions that reference `src/tools/gir_gen/` or `ocgtk/gir/`.

#### 6.3 Update ctx context files

- Search `$CTX_DIR/` for stale references to `src/tools/`, `ocgtk/gir/`, or
  `/usr/share/gir-1.0/` and update them.

---

## Dependency Summary (before / after)

| Package | ocgtk before | ocgtk after | gir_gen |
|---|---|---|---|
| `conf-gtk4` | required | required | — |
| `integers` | required | required | — |
| `dune-configurator` | build | build | — |
| `alcotest` | with-test | with-test | with-test |
| `ppxlib` | with-test | **removed** | with-test |
| `containers` | build | **removed** | build |
| `xmlm` | build | **removed** | build |
| `re` | build | **removed** | build |
| `fmt` | build | **removed** | build |
| `logs` | build | **removed** | build |
| `cmdliner` | build | **removed** | build |
| `sexplib` | build | **removed** | build |
| `ppx_sexp_conv` | build | **removed** | build |
| `ppx_deriving` | build | **removed** | build |

---

## Risks and Mitigations

| Risk | Mitigation |
|---|---|
| dune workspace cross-project `%{exe:...}` references break | All test references are within `/gir_gen/` — no cross-project exe references needed |
| Integration tests can't find GIR files | `%{workspace_root}/gir` resolves correctly in a workspace; `GIR_DATA_DIR` env var is set explicitly in the test action |
| generate-bindings.sh breaks mid-refactor | Phase 2 updates the script atomically; test gate requires a successful regeneration run |
| OCaml 4.14 uses syntax/stdlib features not available | Exploratory CI step identifies blockers without gating the work |
| Old path references left in docs/CI | Explicit grep pass in Phase 6 with fix-or-remove for every hit |
