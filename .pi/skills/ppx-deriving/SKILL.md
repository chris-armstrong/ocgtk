---
name: ppx-deriving
description: Load when writing or debugging OCaml that uses [@@deriving ...] attributes, ppx_deriving, ppx_sexp_conv, or sexplib in this repo; when a deriving-generated name (equal, equal_*, show, show_*, sexp_of_*, *_of_sexp) fails to compile; or when wiring ppx preprocessors in a dune file. Covers the generated-name rules, how gir_gen wires its ppxes, and the one-command way to see what a ppx actually generates.
---

# ppx_deriving / ppx_sexp_conv in this repo

## Generated-name rules — the thing that bites

`ppx_deriving` derives the function name **from the type name**, but a type
named `t` gets the **unprefixed** canonical name:

| Attribute | type `t` | type `foo` |
|-----------|----------|------------|
| `[@@deriving eq]` | `equal` | `equal_foo` |
| `[@@deriving show]` | `show` | `show_foo` |
| `[@@deriving sexp]` (ppx_sexp_conv) | `sexp_of_t` / `t_of_sexp` | `sexp_of_foo` / `foo_of_sexp` |

So `[@@deriving eq]` on a type named `t` generates `equal`, **not**
`equal_t`. Conversely `[@@deriving eq]` on `override_action` generates
`equal_override_action`. `sexp` converters always carry the type name,
including `t`. Never guess — verify (below) in one command.

For inline record/variant fields and function arguments, the ppxes generate
suffixed helpers (e.g. `foo_of_sexp__fields__...`); you rarely need to name
these yourself, so don't.

## How gir_gen wires it

- `gir_gen/lib/dune`: `(preprocess (pps ppx_sexp_conv ppx_deriving.eq))` —
  the whole library gets both ppxes. Files using sexp types open
  `Sexplib.Std` (see `override_types.ml`, `os_filter.ml`).
- `gir_gen/test/dune` and `gir_gen/scripts/dune`: `ppx_sexp_conv` only —
  `eq` is **not** available there.
- Actual usage: `[@@deriving sexp, eq]` on the override and os-filter types
  (`override_types.ml`, `os_filter.ml`), `[@@deriving sexp]` on the
  cross-reference types at the bottom of `types.ml`. The generated
  `equal_*` functions are consumed by the override tests
  (`test/overrides/types_tests.ml`).
- A new file that uses deriving must live under a directory whose `dune`
  has the matching `preprocess` stanza — adding the attribute alone will
  fail with "Unbound constructor equal_foo" style errors.

## Verify what a ppx generates — one command, before bisecting anything

Two verified recipes for this repo (dune 3.24 has no `dune ocaml pp`):

**1. Read the generated names in the ppx-expanded source** (works even for
files with sibling-module deps). After `dune build`, dune leaves the ppx
driver in `_build/default/.ppx/<hash>/ppx.exe` — running it directly
pretty-prints the expanded source:

```bash
$(ls -d _build/default/.ppx/*/ppx.exe | head -1) gir_gen/lib/override_types.ml | grep -n 'let equal_'
# 51:    let rec equal_version_spec : ...
```

**2. Ask the compiler for the inferred signature** (fastest; requires the
file's only dependencies to be findlib packages — e.g. `os_filter.ml`):

```bash
cd gir_gen/lib && opam exec -- ocamlfind ocamlc -package sexplib,ppx_sexp_conv,ppx_deriving.eq -i os_filter.ml
# type t = Os_only of string list | Os_except of string list
# val t_of_sexp : Sexplib0.Sexp.t -> t
# val sexp_of_t : t -> Sexplib0.Sexp.t
# val equal : t -> t -> Ppx_deriving_runtime.bool
```

Note recipe 2's output on `os_filter.ml` is the pitfall in the flesh: the
type is named `t`, so `eq` generates `equal`, not `equal_t`.

Either answers "is it `equal` or `equal_foo`?" in a single call. Setting up
scratch workspaces, standalone experiments, or bisection against
third-party ppx behavior is never necessary for a naming question.