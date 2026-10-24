# Library layout proposal — one library per namespace, flat public modules

> **Status: proposal, not scheduled; naming and the main layout decisions are
> recorded below.** This records the direction discussed while investigating
> the unresolved `inherit` links (see
> [unresolved-inherit-links.md](./unresolved-inherit-links.md)). The remaining
> open items are listed at the end. Nothing here has been prototyped beyond the
> small dune/odoc experiments cited.

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

The naming rule is `oc` + the lowercased GIR namespace name, for the opam
package, the dune library and the public module (capitalised). Each library
contains classes at the top level; enums, bitfields and constants in
`*_enums` and `*_constants` modules as now.

| GIR namespace | Today (opam / dune public name) | New package and library | New public module |
|---|---|---|---|
| GLib, GObject (hand-written) | `ocgtk.common` | `ocglib` | `Ocglib` |
| Cairo | `ocgtk.cairo` | `occairo` | `Occairo` |
| Graphene | `ocgtk.graphene` | `ocgraphene` | `Ocgraphene` |
| Pango | `ocgtk.pango` | `ocpango` | `Ocpango` |
| PangoCairo | `ocgtk.pangocairo` | `ocpangocairo` | `Ocpangocairo` |
| GdkPixbuf | `ocgtk.gdkpixbuf` | `ocgdkpixbuf` | `Ocgdkpixbuf` |
| Gio | `ocgtk.gio` | `ocgio` | `Ocgio` |
| Gdk | `ocgtk.gdk` | `ocgdk` | `Ocgdk` |
| Gsk | `ocgtk.gsk` | `ocgsk` | `Ocgsk` |
| Gtk | `ocgtk.gtk` | `ocgtk` | `Ocgtk` |

Two consequences of the table:

- `ocgtk` stops meaning the whole project. After the change it is the Gtk
  package only, and the old umbrella `ocgtk` library and its `Ocgtk` re-export
  module go away. Anyone who wrote `(libraries ocgtk)` must list the packages
  they use.
- The Cairo wrapper module is currently `Cairo_gtk` to avoid clashing with
  the `cairo2` opam package. `Occairo` removes the need for that name.

Inside a library:

```
Ocgtk.Window.window_t       (* class type *)
Ocgtk.Window.window         (* class *)
Ocgtk.Window.new_           (* constructor, returns window_t *)
Ocgtk.Raw.Window            (* layer 1: externals, Window.t *)
```

- Layer 2 modules lose the `G` prefix and become the public top-level
  modules. Layer 1 moves under a `Raw` namespace. The generator emits `Raw`
  itself (see Decisions); `(include_subdirs qualified)` is not used.
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

- The full layout. In particular the cluster shims and the generator-emitted
  `Raw` layer 1 modules across several hundred modules.
  (`(include_subdirs qualified)` was dropped from the design, so it no longer
  needs verifying.)
- How cross-library parents render. Today they render as plain text, not
  links, and the reason was not found. After the split every cross-namespace
  parent is a cross-library reference. Decided to accept plain text for the
  raw `inherit` lines (see Decisions); this is no longer a blocker.
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
- **Naming keeps the `oc` prefix**: `ocgtk`, `ocgdk`, `ocgio`, `ocgsk`, and so
  on, with modules `Ocgtk`, `Ocgdk`, `Ocgio`, ... Considered `sc` to avoid
  any resemblance to "OCaml" and rejected it: `oc` is already the project's
  identity, and a search of discuss.ocaml.org, the opam-repository
  guidelines and the ocaml.org lists found no policy reserving or restricting
  `oc*` names. Other `oc*` packages (`ocurl`, `ocamlnet`, `ocplib`) use `oc`
  as part of their own names, not as a family prefix, so they are not
  precedent either way. Trademark status of "OCaml" was not established.
  The exact names for base namespaces (cairo, graphene, pangocairo) still
  follow the same pattern and are listed under Open questions.
- **The generator emits `Raw` itself; `(include_subdirs qualified)` is not
  used.** This avoids relying on that dune feature at several-hundred-module
  scale. The cost is more naming logic in the generator.
- **Cross-library `inherit` parents stay as plain text** in the raw
  `inherit` lines. Links come from the doc-comment "Inherits from" block
  (option 2 in the research note). The cause of the plain-text rendering is
  not investigated.
- **The hand-written `common` library becomes `ocglib`** (module `Ocglib`),
  one package covering GLib and GObject (`Ocglib.Glib`, `Ocglib.Gobject`,
  `Ocglib.Gvariant`, ...). It also keeps the fixed-width integer modules
  (`Int8`..`UInt64`, `Bounded_int`) and the C runtime headers (`wrappers.h`,
  `value_kinds.h`), documented as cross-cutting support rather than GLib
  bindings. There is no separate `ocgobject` package: GObject depends on
  GLib, so it could never be used alone, and a split would add a package
  that nothing depends on separately. `ocglib` is wrapped, unlike `common`
  today (`wrapped false`), which fixes two clashes: top-level `Int32`
  shadowing `Stdlib.Int32`, and `Glib` clashing with lablgtk's `Glib`. Every
  other namespace library depends on it.
- **Straight to the full layout, as one breaking change**, with no separate
  intermediate step and no compatibility shims (the version is
  `0.1~preview2`). A migration note is still needed. Note this reverses the
  earlier position that deleting `ocgtk_gtk.ml` first was an accepted
  intermediate. The m3 odoc plan still describes it that way; reconcile the
  two when the layout work is scheduled.

## Open questions

1. Separate packages mean separate opam files, versioning and dependency
   declarations between them, and the doc build has to cover several packages
   instead of one. (The package and module names are decided; see the
   mapping table under Proposed layout.)
2. Whether to ask on discuss.ocaml.org (Ecosystem) about the `oc` prefix
   before the rename lands. Not required; renaming later is mechanical.
3. The 81 `xref-unresolved` spans left in the real-tree experiment: classify
   them (layout-related or not) before the breaking change, so the docs are
   not still broken afterwards.
4. Doc build time and size with every module public, against the per-PR
   preview workflow added in m3 phase 4.
5. The cluster shims and the generator-emitted `Raw` layer, unverified at
   gtk scale.
6. That nothing in `examples/`, `tests/` or other packages depends on the
   current module names beyond mechanical renames.
