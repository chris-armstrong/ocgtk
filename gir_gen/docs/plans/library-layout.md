# Library layout — implementation plan

> **Status: planned, not started.** Implements
> [library-layout-proposal.md](../research/library-layout-proposal.md), with
> the changes recorded under Decisions below, some of which replace the
> proposal's. A prototype of `ocglib` and `ocgraphene` is on branch
> `proto/ocglib-ocgraphene` (see Prototype findings). Where this plan and the
> proposal disagree, this plan wins.

## Goal

One opam package per GIR namespace, each at the top of the repository, with
flat public modules:

```
Ocgraphene.Point.point_t        (* class type, layer 2 *)
Ocgraphene.Point.alloc          (* constructor *)
Ocgraphene.Raw.Point.t          (* layer 1: externals and abstract type *)
Ocgraphene.Enums.eulerorder     (* enums and bitfields *)
Ocgraphene.Constants            (* constants *)
Ocglib.Gobject                  (* hand-written GLib/GObject *)
```

## Decisions

These are in addition to the proposal's Decisions. Where they conflict, these
replace them.

- **Each package is a top-level directory.** `ocgtk/src/graphene` becomes
  `ocgraphene/`, `ocgtk/src/common` becomes `ocglib/`, `ocgtk/src/gtk`
  becomes `ocgtk/`, and so on for every namespace. `ocgtk/src/` goes away.
- **One `dune-project` at the repository root** declares every package and
  generates all the `.opam` files at one shared version. `gir_gen/` keeps its
  own `dune-project`. The current root `dune-workspace` can then be removed.
- **Tests live inside each package** (`ocgraphene/tests/`, `ocgtk/tests/`,
  ...). `overrides/` moves to the repository root.
- **Examples live inside the package they demonstrate**: Gtk examples in
  `ocgtk/examples/`, and an example that uses only, say, Gio in
  `ocgio/examples/`. An example that uses Gtk together with other namespaces
  (Gio, Pango, Gdk) is a Gtk example. Today every example is a Gtk program
  (checked 2026-10-24: `counter`, `counter_simple`, `demo_all`,
  `form_example`, `login_form`, `picture_test`, `settings_panel`,
  `text_editor` and `calculator/`), so all of them move to
  `ocgtk/examples/`.
- **Each namespace has three libraries.** This replaces the proposal's
  "generator emits `Raw` itself" and its use of the word "sub-libraries":
  there are still no umbrella packages, but each package has internal
  sub-libraries.

  | Library | Module | Contents | Depends on |
  |---|---|---|---|
  | `ocgraphene.enums` | `Ocgraphene_enums` | one module, `ocgraphene_enums.ml` (pure OCaml, no C), so it is the library's main module | nothing (Stdlib only, checked for every namespace) |
  | `ocgraphene.raw` | `Ocgraphene_raw` | layer 1, every C stub (generated and hand-written), `graphene_decls.h` | `ocgraphene.enums`, `ocglib`, other `*.raw` |
  | `ocgraphene` | `Ocgraphene` | layer 2 classes and shims, `Raw`, `Constants`, `Enums` (re-export) | the two above, other namespaces' main libraries |

  Users depend on `ocgraphene` only. `.raw` and `.enums` are public names
  because installation needs them, and a user may list them directly in
  dune, but the documented API goes through `Ocgraphene`.
- **Enums are one level deep: `Ocgraphene.Enums.x`, or `Ocgraphene_enums.x`
  from the enums library directly.** This replaces the proposal's decision to
  keep the `Graphene_enums` module name. The enums library has exactly one
  module, named after the library (`ocgraphene_enums.ml`), so dune uses it
  as the main module and there is no `Ocgraphene_enums.Graphene_enums`
  level. The main library's `enums.ml` is `include Ocgraphene_enums`
  (an `include`, not an alias, for the same reason `Raw` cannot be one).
  Constants follow suit: `Graphene_constants` becomes `Ocgraphene.Constants`
  (`constants.ml` in the main library; constants have no dependencies, so
  they need no library of their own).
- **`Raw` is a generated `raw.ml` with one alias per class**:
  `module Point = Ocgraphene_raw.Point`,
  `module Box = Ocgraphene_raw.Box_and__sphere.Box`. These are true module
  aliases, so odoc links `Raw.Point.t` to the `Ocgraphene_raw` page (verified
  in the prototype). Two alternatives were rejected:
  - `include Ocgraphene_raw` does not compile: it exposes only the raw
    library's top-level modules, so classes that live inside a cluster
    (`Raw.Vec3`, `Raw.Plane`, ...) are unbound (tried in the prototype).
  - `module Raw = Ocgraphene_raw` as a single alias can only be written in
    `Ocgraphene`'s main module, which dune generates. A source file cannot
    itself be an alias for another library's module.

  If phase 0 shows clusters can be hidden, the generator writes both main
  modules anyway; then `Ocgraphene_raw`'s main module lists each class at the
  top level and `Ocgraphene`'s main module can say `module Raw =
  Ocgraphene_raw` instead of `raw.ml`.
- **The raw and main libraries open `Ocglib`** (`-open Ocglib` in the
  library flags) instead of qualifying `Gobject.` paths. Both layers need
  it: layer 2 names `Gobject` in gio (37 of 175 modules), gdk (11), gtk
  (128), pango (2) and gdkpixbuf (1). Graphene happens not to, which is why
  the prototype's main library built without it. The enums library needs
  no open.
- **Cluster modules are hidden if odoc allows it.** The preference is a
  generated main `.mli` for `Ocgraphene` and `Ocgraphene_raw` that leaves the
  `*_and__*` cluster modules out. This must be tested first (phase 0): the
  proposal kept clusters public so odoc can resolve links into them, and a
  hand-written main module was the cause of the original unresolved
  `inherit` links. If hiding breaks links, even with `@canonical` tags on
  the cluster submodules, keep dune's generated main module and leave
  clusters visible.
- **ocglib uses its own pkg-config modules** (`glib-2.0`, `gobject-2.0`),
  not `gtk4`.
- **Conf packages: our own where none exists, opam-repository's where one
  does.** See Conf packages below. Opam package names cannot contain a dot
  (`opam lint` reads `conf-gobject-2.0` as package `conf-gobject-2`, version
  `0`), so names use a major-version suffix like opam-repository's
  `conf-glib-2`.

## Conf packages

| pkg-config modules | Conf package | Source |
|---|---|---|
| `glib-2.0`, `gobject-2.0`, `gio-2.0`, `gio-unix-2.0` | `conf-glib-2` | opam-repository (not ours) |
| `pango` | `conf-pango` | opam-repository (not ours) |
| `cairo-gobject` | `conf-cairo-gobject` | new, top-level `conf-cairo-gobject/` |
| `pangocairo` | `conf-pangocairo` | new |
| `gdk-pixbuf-2.0` | `conf-gdk-pixbuf-2` | new |
| `graphene-gobject-1.0` | `conf-graphene-1` | new |
| `gtk4` | `conf-gtk4` | ours, already in opam-repository (version 2) |

`conf-glib-2` only runs `pkg-config glib-2.0`, but its system dependency
provides all four GLib modules on every platform checked (container images,
2026-10-24; each owner is the package `conf-glib-2` names):

| Platform | Package | glib / gobject / gio / gio-unix |
|---|---|---|
| Debian stable | `libglib2.0-dev` | all four (in `libgio-2.0-dev`, which it pulls in) |
| Ubuntu 24.04 | `libglib2.0-dev` | all four |
| Fedora 44 | `glib2-devel` | all four |
| CentOS Stream 9, Oracle Linux 9 | `glib2-devel` | all four |
| openSUSE Leap 15.6, Tumbleweed | `glib2-devel` | all four |
| Alpine | `glib-dev` | all four |
| Arch | `glib2` | all four (Arch is not in `conf-glib-2`'s depexts) |
| FreeBSD | `glib` (port `devel/glib20`) | all four (from the port's `pkg-plist`, not a running system) |

macOS (Homebrew `glib`) was not checked.

Package names for the other modules, for the new conf packages' depexts:

| pkg-config module | Arch | FreeBSD (port) |
|---|---|---|
| `cairo-gobject` | `cairo` | `cairo` (`graphics/cairo`; the `GLIB` option, on by default) |
| `pango`, `pangocairo` | `pango` | `pango` (`x11-toolkits/pango`) |
| `gdk-pixbuf-2.0` | `gdk-pixbuf2` | `gdk-pixbuf2` (`graphics/gdk-pixbuf2`) |
| `graphene-gobject-1.0` | `graphene` | `graphene` (`graphics/graphene`) |
| `gtk4` | `gtk4` | `gtk4` (`x11-toolkits/gtk40`) |

`conf-cairo` (opam-repository) is not enough for `cairo-gobject`: on Fedora,
CentOS Stream 9 and Oracle Linux 9, `cairo-gobject.pc` is in a separate
`cairo-gobject-devel` package, which `cairo-devel` does not install.
Debian/Ubuntu (`libcairo2-dev`), openSUSE (`cairo-devel`), Alpine
(`cairo-dev`), Arch (`cairo`) and FreeBSD (`cairo`) ship it with cairo. Hence
`conf-cairo-gobject`, whose depexts must name `cairo-gobject-devel` on the
Fedora family.

## Target layout

Shown for one namespace. Every namespace follows it, `ocglib/` excepted (it
is a single hand-written library).

```
dune-project                  all packages
conf-gtk4/  conf-cairo-gobject/  ...  our conf packages (see Conf packages)
configurator/                 config_flags.exe (moved from ocgtk/src/)
overrides/
ocglib/
  dune  *.ml  *.mli  *.c  wrappers.h  value_kinds.h
  tests/
ocgraphene/
  generated/                  library ocgraphene (all generated)
    dune  point.ml  box.ml  box_and__sphere.ml  constants.ml
    raw.ml                    module Point = Ocgraphene_raw.Point, one per class
    enums.ml                  include Ocgraphene_enums
    ocgraphene.ml/.mli        only if clusters are hidden
  raw/
    dune                      hand-written: (include generated/dune.inc) + core stubs
    generated/                layer 1 .ml/.mli, ml_*_gen.c, graphene_decls.h, dune.inc
    core/                     hand-written C and ML (was src/<ns>/core)
  enums/
    generated/                dune, ocgraphene_enums.ml/.mli
  tests/
  examples/                   only if the package has examples of its own
ocgtk/                        Gtk, same shape as ocgraphene/, plus examples/
```

The split between generated and hand-written dune files in `raw/` keeps the
current pattern (`dune` includes `dune-generated.inc`); the main and enums
libraries have no hand-written parts, so the generator writes their whole
`dune` file.

## Name mapping

| Reference | Today | After |
|---|---|---|
| Layer 2 to layer 2, same namespace | `GPoint.point` | `Point.point` |
| Layer 2 to layer 1, same namespace | `Point.t`, `Box_and__sphere.Box.t` | `Raw.Point.t`, `Raw.Box.t` |
| Layer 1 to layer 1, same namespace | `Point3_d.t` | unchanged |
| Layer 2 to another namespace's layer 2 | `Ocgtk_graphene.Graphene.Rect.rect_t` | `Ocgraphene.Rect.rect_t` |
| Layer 1 to another namespace's layer 1 | `Ocgtk_graphene.Graphene.Wrappers.Rect.t` | `Ocgraphene_raw.Rect.t` |
| Layer 1 to enums (same or other namespace) | `Graphene_enums.x` | `Ocgraphene_enums.x` |
| Layer 2 to enums, same namespace | `Graphene_enums.x` | `Enums.x` |
| Layer 2 to another namespace's enums | `Ocgtk_graphene.Graphene_enums.x` | `Ocgraphene.Enums.x` |
| Constants | `Graphene_constants.x` | `Constants.x` (same namespace), `Ocgraphene.Constants.x` |
| User code | `Ocgtk_graphene.Graphene_enums.x` | `Ocgraphene.Enums.x` (or `Ocgraphene_enums.x` with a direct dependency) |
| GObject runtime | `Gobject.obj` (common unwrapped) | `Gobject.obj` under `-open Ocglib` |
| C decls header, other namespace | `#include "generated/graphene_decls.h"` | `#include "graphene_decls.h"`, installed by `ocgraphene.raw` |

A raw library depends only on other raw and enums libraries, never on a main
library, so layer 1 must use `OcgX_raw` paths, not `OcgX.Raw`.

## Phases

### Phase 0 — finish the prototype

On `proto/ocglib-ocgraphene`, still with the hand-run script
(`scripts/proto-relayout.py` on that branch), not the generator.

1. Move the prototype to the target layout: `ocglib/` and `ocgraphene/` at
   the root, a root `dune-project`, and `ocgraphene.enums` split out as the
   single module `ocgraphene_enums.ml`, re-exported as `Ocgraphene.Enums`.
2. Runtime test in `ocgraphene/tests/`: alcotest cases that create objects
   through the classes and through `Raw`, return values from one class into
   another (`Box` from `Point3_d`s), and call `Gc.full_major` while they are
   alive and after they are dropped. The prototype's `consumer.exe` only
   checked that a handful of calls link and run.
3. Convert gio with the script. Gio depends only on ocglib, so the script
   needs no cross-namespace rewriting, and it is the first namespace that
   exercises what graphene cannot:
   - `inherit` (176 lines) and odoc links in the new layout, which is the
     motivation for the whole change and is unverified in it;
   - cluster hiding (20 clusters): build the docs with a generated main
     `.mli` for `Ocgio` and `Ocgio_raw`, with and without `@canonical` tags,
     and record whether every link resolves. This decides the cluster
     decision; graphene has no `inherit` lines, so it cannot;
   - layer 2 that names `Gobject`, signals and properties;
   - stub batches (gio has them, for the Windows command-line limit) as
     dependencies of `ocgio.raw`;
   - hand-written OCaml (`gio_volume_monitor_core.ml`, which uses layer 1
     only, so it goes to `raw/core/`) and the optional `gio-unix-2.0`;
   - scale: build and doc build time for about 850 files, a data point for
     gtk and for the doc-preview workflow;
   - the 81 unresolved references from the proposal: count them for gio
     before and after, to see whether any are layout-related.
4. Convert gdkpixbuf (depends only on gio), extending the script for
   references between namespaces. This checks the cross-namespace rows of
   the name mapping, raw-to-raw dependencies, the installed `gio_decls.h`,
   `inherit` across packages (8 lines) and odoc links across packages, none
   of which is tested yet. Then build `ocgdkpixbuf` alone with `dune build
   -p` against an installed `ocgio`, as was done for ocgraphene.

   The original choice, gsk, is not feasible: it needs gdk, which needs
   cairo, gdkpixbuf, gio, pango and pangocairo.
5. Decide, from steps 3 and 4, whether to start phase 2 directly or extend
   the script further. The script is throwaway work, and every extension is
   logic the generator needs anyway.

### Phase 1 — conf packages and ocglib

1. Add the four new conf packages (`conf-cairo-gobject`, `conf-pangocairo`,
   `conf-gdk-pixbuf-2`, `conf-graphene-1`) as top-level directories like
   `conf-gtk4/`, and depend on opam-repository's `conf-glib-2` and
   `conf-pango`. Write depexts per platform from the distros' file lists, as
   was done for GLib (see Conf packages), not by guessing package names.
   Re-check opam-repository for the four names just before publishing.
2. Move `ocgtk/src/common` to `ocglib/` as the wrapped library `ocglib`,
   delete `ocgtk_common.ml/.mli`, switch its pkg-config rule to
   `glib-2.0`/`gobject-2.0`, and replace `#include <gtk/gtk.h>` in
   `ml_glib.c` with the GLib headers it actually uses.
3. Move the GLib/GObject tests (`test_gobj`, `test_gvariant*`,
   `test_glib_bytes`, `test_bounded_int`, `test_closure*`, the gobject test
   helpers) to `ocglib/tests/`.

### Phase 2 — generator

1. Output paths: layer 1, C stubs and the decls header to
   `<pkg>/raw/generated/`; enums to `<pkg>/enums/generated/`; layer 2 to
   `<pkg>/generated/` without the `G` prefix.
2. Stop emitting `<Ns>.ml/.mli` and `ocgtk_<ns>.ml`. Emit `raw.ml` (one
   alias per class, clusters flattened), the enums re-export, and both main
   modules if phase 0 keeps hidden clusters.
3. Emit module paths per the name mapping, directly. Post-processing the
   text is fragile: ocamlformat splits long paths across lines.
4. Dune emission: three libraries per namespace. The gtk stubs are
   currently split into four batch stub libraries plus an aggregate; keep
   the batches as dependencies of `ocgtk.raw`.
5. The references/cross-namespace sexp files and `dune_file.ml`'s
   `dep_libraries`: new library names, and the raw/main distinction.
6. `install_c_headers` for each `*_decls.h`, and cross-namespace includes
   without the `generated/` prefix.
7. `scripts/generate-bindings.sh`: new output paths, and deletion of stale
   files (the generator does not remove them).

### Phase 3 — move and regenerate everything

Commit the directory moves (`git mv`, no content changes) separately from the
regeneration. Today `frustum.ml` is layer 1 and `gFrustum.ml` is layer 2;
afterwards `frustum.ml` is layer 2, and git reads the combined change as an
edit, which ruins history and blame.

The moves can be one commit per namespace, but the regeneration cannot: the
generator writes every namespace in one run and their references change
together, so it is one commit, and the tree does not build between the
first move and that commit. Keep it all in one PR so `main` stays buildable,
and accept that `git bisect` must skip those commits.

Hand-written `core/` code moves to `raw/core/` when it uses layer 1 only
(`gio_volume_monitor_core.ml` does). Gtk's `core/gMain.ml` and
`core/gVersion.ml` are hand-written modules with the `G` prefix, used in
182 places; see Open items.

Generated C files move one directory deeper (`<pkg>/raw/generated/`), so
check the stub-batch size in `dune_file.ml`, which allows for about 55
characters per path, against the new paths.

### Phase 4 — tests, examples, packaging

1. Tests to `<pkg>/tests/`, with the gtk test helpers in `ocgtk/tests/`.
2. Examples to `<pkg>/examples/` (all current ones to `ocgtk/examples/`,
   including the calculator's own tests); update library names, since
   most examples depend on the umbrella `ocgtk` library and must list the
   packages they use instead.
3. Remove `ocgtk/src/ocgtk.ml`, the umbrella library and its `dune`.
4. Documentation: one `index.mld` per package; the root `(documentation)`
   stanza per package.

### Phase 5 — CI, docs and migration

1. CI workflows, Dockerfiles and `release-verification.yml`: package names,
   paths, `dune build -p` per package.
2. `doc-preview.yml`: all packages instead of two. Measure doc build time
   (proposal open question 4).
3. `AGENTS.md`, `README.md`, the m3 odoc plan (reconcile, per the proposal),
   CHANGELOG and a migration note mapping old paths to new. The README must
   say that the `ocgtk` opam package changes meaning: in `0.1~preview2` it
   is the umbrella for every library, afterwards it is Gtk only.
4. opam-repository: when publishing, mark the `0.1~preview*` releases as no
   longer maintained (the `x-maintenance-intent` field, or `flags:
   deprecated`; confirm which at the time).

## Prototype findings

From `proto/ocglib-ocgraphene` (graphene and common only; everything
downstream intentionally broken):

- ocglib compiled unchanged as a wrapped library with a dune-generated main
  module. `Int32` no longer shadows `Stdlib.Int32` for consumers.
- Generated stubs find `wrappers.h` through the `ocglib` library dependency
  with no `-I../common`, both in the workspace and when installed (headers
  go to `lib/ocglib/`). `-I../gtk/generated` in common's dune was unused.
- Keeping layer 1 in the main library as `raw_*.ml` files puts every one of
  them in the main module. `private_modules` cannot hide them: an installed
  consumer fails with "Ocgraphene.Raw.Point is an alias for module
  Ocgraphene__Raw_point, which is missing". Hence the separate raw library.
- Layer 1 refers to the enums module, so enums cannot live in the main
  library (now their own library).
- odoc: no unresolved references in either package. `Raw.Point.t` links into
  the `Ocgraphene_raw` page and displays as `Ocgraphene.Raw.Point.t`. Links
  between separate packages were not tested.
- A consumer outside the repository, built against the installed packages,
  ran real calls (`Point`, `Box` from a cluster, `Raw.Point`) without
  crashing. No GC or finaliser testing yet (phase 0 step 2).
- Each package builds on its own the way opam builds it: `dune build -p
  ocgraphene` with `ocglib` installed in a separate prefix succeeds, and
  fails with `Library "ocglib" not found` without that prefix, so the
  in-tree copy is not used.
- No class in any namespace is named `Raw`, `Enums` or `Constants`, or
  shares a name with an `Ocglib` or Stdlib module, so dropping the `G`
  prefix and adding those modules causes no clashes (checked over every
  layer 2 module).
- `overrides/*.sexp` refer to GIR names (`(class ...)`, `(record ...)`),
  not module or file names, so they need no change.
- ocglib's C includes `caml/threads.h` but calls nothing from the threads
  library, so ocglib needs no `threads` dependency.
- The build root is the repository root (because of `dune-workspace`), so
  output is in `_build/default/ocgtk/...`.

## Open items

1. Depexts for the four new conf packages on the Debian, Fedora, SUSE and
   Alpine families (Arch and FreeBSD names are above), and macOS for
   `conf-glib-2`'s coverage of gobject and gio.
2. The cluster-hiding result (phase 0 step 3).
3. Whether a raw library ever needs another namespace's main library (it
   should not; phase 0 step 4 checks).
4. Proposal open questions 3 and 4 (the 81 other `xref-unresolved` spans;
   doc build time); phase 0 step 3 gives gio's numbers for both.
5. What gtk's hand-written `GMain` and `GVersion` become. Dropping the
   prefix gives `Ocgtk.Main` and `Ocgtk.Version`, which matches the rest of
   the layout. `GMain` holds both externals and wrapper functions, so it
   cannot simply move to `raw/core/`.
6. Gtk itself cannot be prototyped before phase 3, because it depends on
   every other namespace. Its risks are the same as gio's at a larger scale
   (320 layer 2 modules against gio's 175, 8 stub batches against 6), so
   gio stands in for it.
