# Library layout proposal — one library per namespace, flat public modules

> **Status: proposal, not scheduled; the main decisions are recorded below.** This records the direction
> discussed while investigating the unresolved `inherit` links (see
> [unresolved-inherit-links.md](./unresolved-inherit-links.md)). Names and
> several details are open; they are listed at the end. Nothing here has been
> prototyped beyond the small dune/odoc experiments cited.

## Motivation

- The public path to a class constructor is `Ocgtk_gtk.Gtk.Window.new_`:
  three levels, with a `Gtk` layer that exists only to alias the `GFoo`
  modules.
- Three kinds of module share one flat namespace: layer 1 (`Window`, the
  externals and `Window.t`), layer 2 (`GWindow`, class types and classes) and
  the combined cluster modules (`GApplication_and__window_and__window_group`).
  The `G` prefix exists only to keep layer 1 and layer 2 names apart.
- The hand-written main module (`ocgtk_gtk.ml`) is the cause of the unresolved
  `inherit` links in the docs.

## Proposed layout

One library per GIR namespace, each with a dune-generated main module:

| Library (name open) | Public module | Contains |
|---|---|---|
| `ocgtk` (gtk) | `Ocgtk` | classes at the top level; enums, bitfields and constants in `Ocgtk_enums`, `Ocgtk_constants` style modules as now |
| `ocgdk`, `ocgio`, `ocgsk`, ... (names to confirm) | likewise | likewise |

Inside a library:

```
Ocgtk.Window.window_t       (* class type *)
Ocgtk.Window.window         (* class *)
Ocgtk.Window.new_           (* constructor, returns window_t *)
Ocgtk.Raw.Window            (* layer 1: externals, Window.t *)
```

- Layer 2 modules lose the `G` prefix and become the public top-level
  modules. Layer 1 moves under a subdirectory/namespace (`Raw`;
  `(include_subdirs qualified)` would give it for free).
- There is no hand-written main module. Dune generates it, so its alias
  module carries the `@canonical` annotations odoc needs.
- A cluster remains one module, because mutually recursive classes must be
  defined together, with `Ocgtk.Window` etc. as shims aliasing into it. The
  cluster module is also public and documented under dune's generated main
  module. Its long name stays visible, but links into it work.
- Cross-library parents (a gtk class inheriting a gio interface) become
  references between libraries by construction.

## What has been verified

With odoc 3.2.1 (small repros plus one real-tree experiment, details in the
research note):

- A wrapped library with a dune-generated main module links `inherit` lines
  across modules.
- The same holds with `(include_subdirs qualified)` and one directory per
  module.
- The real gtk library with `ocgtk_gtk.ml` removed links all 297 `inherit`
  lines.

## What has not been verified

- The full layout. In particular `(include_subdirs qualified)` across several
  hundred modules, the cluster shims, and layer 1 under a subdirectory.
- How cross-library parents render. Today they render as plain text, not
  links, and the reason was not found. After the split every cross-namespace
  parent is a cross-library reference, so test this on one small namespace
  (gio) first.
- The 81 other `xref-unresolved` spans seen in the real-tree experiment.
- Build time and the doc build's behaviour with every module public.
- That nothing in `examples/`, `tests/` or other packages depends on the
  current module names beyond mechanical renames.

## Costs

- Breaking change to the public API: library names, the module path of every
  class, enum and constant, and the opam packages. A migration note is
  needed.
- The generator emits file and module names in several places (shims,
  `library_module.ml`, `dune-generated.inc`, the references/cross-namespace
  mechanism). They all change together.
- Layer 1 externals are referenced by layer 2 as `Application_and__window_and__window_group.Window.t` today;
  that path changes too.

## Decisions

- **No umbrella package and no sub-libraries.** Each namespace (`ocgtk`,
  `ocgdk`, `ocgio`, ...) is its own opam package with its own library,
  distributed separately. Users depend on the ones they need, and nothing
  re-exports them. This replaces the current single `ocgtk` package with
  `ocgtk.gtk`, `ocgtk.gio` and so on.
- **Layer 1 is `Raw`** (`Ocgtk.Raw.Window`).
- **Enums, bitfields and constants stay as they are today**, in the
  `*_enums` and `*_constants` modules (`Gtk_enums`, `Gtk_constants`), not
  beside the classes.
- **A dune-generated main module is an acceptable intermediate step** while
  the documentation generation is being developed: delete `ocgtk_gtk.ml`,
  accept that `GFoo` and the cluster modules become public and documented,
  and get working `inherit` links without the full layout change. It was
  verified on the real tree (see the research note) and is reversible. The
  internal module names become public API only for the duration; the layout
  change then removes them. The extra pages this creates in the doc previews
  (`Gtk`, `GFoo`, layer 1, the cluster modules) are acceptable.

## Open questions

1. Package and library names for the other namespaces. The gtk package is
   `ocgtk` (module `Ocgtk`). The others presumably follow the same pattern
   (`ocgdk`, `ocgio`, ...); confirm. Separate packages also mean separate opam
   files, versioning and dependency declarations between them, and the doc
   build has to cover several packages instead of one.
2. Everything listed under "What has not been verified".
