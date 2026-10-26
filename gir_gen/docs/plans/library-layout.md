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

  Hand-written layer 1 modules (`raw/core/*.ml`) are listed in `raw.ml` the
  same way: `Ocgio.Raw.Gio_volume_monitor_core`.
- **The raw and main libraries open `Ocglib`** (`-open Ocglib` in the
  library flags) instead of qualifying `Gobject.` paths. Both layers need
  it: layer 2 names `Gobject` in gio (37 of 175 modules), gdk (11), gtk
  (128), pango (2) and gdkpixbuf (1). Graphene happens not to, which is why
  the prototype's main library built without it. The enums library needs
  no open.
- **Cluster modules stay visible; dune generates every main module.**
  Decided by phase 0 step 3 on gio (6 clusters: five `a_and__b` and one
  `app_info_cycle_<hash>`, the generator's name for long cycles). Dune
  cannot take an interface for the main module it generates, so hiding
  means writing the main module (`ocgio.ml`, needing `-no-alias-deps` and
  warning 49 off, as dune's own has). gio's docs in each configuration:

  | Main module | `inherit` linked | Unresolved spans | Not `Stdlib.result` |
  |---|---|---|---|
  | dune's (clusters visible) | 176 of 176 | 979 | 14 |
  | written, clusters left out | 0 of 176 | 2302 | 1513 |
  | written, clusters left out, `@canonical` on each alias | 0 of 176 | 2302 | 1513 |

  A written main module brings back the original fault, `@canonical` or
  not.
- **Gtk's hand-written `GMain` and `GVersion` become `Ocgtk.Main` and
  `Ocgtk.Version`**, dropping the prefix like the generated modules.
  `GMain` holds both externals and wrapper functions, so it cannot simply
  move to `raw/core/`. If the dependency graph needs it (say, the main
  library cannot hold them because of what they depend on), they go in a
  separate sub-library of the `ocgtk` package, re-exported under the same
  names.
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

## Supported platforms

The conf packages' depexts and `release-verification.yml` cover the same
list of platforms. Today they do not match (checked 2026-10-25):

| Platform | `release-verification.yml` | `conf-gtk4` depexts |
|---|---|---|
| Ubuntu 22.04, 24.04 | yes | yes (`os-family = "debian"`) |
| Ubuntu 25.04 | yes (end of life since January 2026) | yes |
| Debian 12 | yes | yes |
| Fedora 40, 43 | yes (40 is end of life) | yes |
| CentOS Stream 9 | yes | yes, plus `rhel` |
| openSUSE Leap 15.6 | yes | yes, plus Tumbleweed |
| Alpine, Arch | no | yes |
| macOS, Homebrew (arm64) | yes (also in `ci.yml`) | yes |
| macOS, MacPorts | no | yes |
| FreeBSD 14 | yes | yes |
| Windows, MSYS2 MinGW64 | yes | yes |

The list, fixed in phase 1 step 1 (2026-10-25):

| Platform | Versions | opam `os-distribution` (`os-family`) |
|---|---|---|
| Ubuntu | 22.04, 24.04 and 26.04 LTS, and the latest interim release (26.10) | `ubuntu` (`debian`) |
| Debian | 12, 13 | `debian` (`debian`) |
| Fedora | the two current releases (43, 44; 45 replaces 43 once released) | `fedora` (`fedora`) |
| CentOS Stream | 9, 10 (stands in for RHEL and its rebuilds) | `centos` (`rhel`) |
| openSUSE | Leap 16.0, Tumbleweed | `opensuse-leap` (`suse`), `opensuse-tumbleweed` (`opensuse`) |
| Alpine | latest stable (3.24) | `alpine` (`alpine`) |
| Arch | rolling | `arch` (`arch`) |
| macOS | Homebrew, latest macOS on arm64 | `homebrew` |
| FreeBSD | 14, 15 (CI job disabled: too slow under QEMU) | — (`os = "freebsd"`) |
| Windows | unsupported for now, see below | — |

The opam variables are what opam 2.5.0 reports in each container image
(Linux only). MacPorts and `rhel` are dropped from the depexts; Leap 15.6
(end of life 2026-04-30), Fedora 40 and Ubuntu 25.04 are dropped from CI.
Fedora 45 is not released yet (due 2026-11-03). Rolling and "latest"
entries are tested against whatever is current at release time.

CentOS Stream 10 has no Xvfb (RHEL 10 dropped the Xorg server). Its tests
run under `xwfb-run -c mutter` (`xwayland-run` and `mutter`, both in
AppStream); a GTK 4 program got a display there with mutter and with
weston (EPEL).

**Windows** is unsupported until opam can build OCaml in an MSYS2
environment that has GTK 4 (checked 2026-10-25):

- MSYS2 deprecated MINGW64 on 2026-03-15. Its live package database
  still has GLib, cairo, pango, gdk-pixbuf, graphene and gcc, but not
  `mingw-w64-x86_64-gtk4`. GTK 4 (4.24.1) is in UCRT64, CLANG64 and
  CLANGARM64.
- opam-repository's mingw compiler chain (`conf-mingw-w64-gcc-x86_64`)
  requires `msys2-mingw64`, and the `msys2` package rejects UCRT64
  (opam-repository issue #29447, open). UCRT64 support was merged and
  partly reverted (#29579, #29751); #29795 starts a new series towards it.
  opam does not expand `%{msys2:package-prefix}%` in depext names.
- setup-ocaml's `msys2` mode installs only `mingw-w64-x86_64-gcc`.

Building OCaml in MINGW64 against UCRT64's GTK would mix two C runtimes
(msvcrt and UCRT), so it is not an option. The Windows job stays in
`release-verification.yml` with `if: false` and UCRT64 package names;
`conf-gtk4` has `available: os != "win32"` and no MSYS2 depext. Revisit
when opam-repository ships UCRT64 support for the compiler.

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
| Layer 2 to another namespace's layer 1 | `Ocgtk_gio.Gio.Wrappers.Icon.from_gobject` | `Ocgio.Raw.Icon.from_gobject` (the main library depends only on `ocgio`) |
| Layer 1 to enums (same or other namespace) | `Graphene_enums.x` | `Ocgraphene_enums.x` |
| Layer 2 to enums, same namespace | `Graphene_enums.x` | `Enums.x` |
| Layer 2 to another namespace's enums | `Ocgtk_graphene.Graphene_enums.x` | `Ocgraphene.Enums.x` |
| Constants | `Graphene_constants.x` | `Constants.x` (same namespace), `Ocgraphene.Constants.x` |
| User code | `Ocgtk_graphene.Graphene_enums.x` | `Ocgraphene.Enums.x` (or `Ocgraphene_enums.x` with a direct dependency) |
| GObject runtime | `Gobject.obj` (common unwrapped) | `Gobject.obj` under `-open Ocglib` |
| C decls header, other namespace | `#include "generated/graphene_decls.h"` | `#include "graphene_decls.h"`, installed by `ocgraphene.raw` |
| C core header, from the decls header | `#include "../core/graphene_core.h"` | `#include "graphene_core.h"`, also installed (the installed decls header includes it) |

A raw library depends only on other raw and enums libraries, never on a main
library, so layer 1 must use `OcgX_raw` paths, not `OcgX.Raw`.

## Phases

Each phase ends with a "Done when" list. A phase is not finished until every
item on it has been checked, and the result is recorded here (numbers, not
"works").

### Baselines

Several criteria compare against today's tree. Record these from `m3`
once phase 0 step 0 has synced it with `main`, and again at the commit
phase 3 starts from (the tree moves on in between):

- `dune test ocgtk/`: the number of test cases run and passed, per test
  executable.
- `dune build @doc`: the number of `Warning:` lines (what `doc-preview.yml`
  counts), the number of `xref-unresolved` spans in the HTML, and how many
  of those are on `inherit` lines.
- Wall-clock time for a clean `dune build` and a clean `dune build @doc`, on
  the same machine as the later measurements.
- The public module paths of every library (`dune describe` or the odoc
  index), for checking the migration note in phase 5.

Recorded 2026-10-25 at `m3` `d9c00187` (20 cores, `--cache=disabled`,
after `dune clean`); the data files are in
[library-layout-baseline/](library-layout-baseline/):

| Measure | Value |
|---|---|
| Test cases (`xvfb-run dune test ocgtk/`) | 391 in 31 suites, all passing (`tests-m3-d9c00187.tsv`) |
| odoc `Warning:` lines | 0 |
| HTML pages | 2862 |
| `xref-unresolved` spans | 8962 (1614 pages under `ocgtk`, 41 under `gir_gen`) |
| ... on `inherit` lines | 874 of 874 (gtk 594, gio 176, gsk 64, gdk 34, gdkpixbuf 4, pango 2); every one names the library's own `Ocgtk_<ns>__` alias module |
| Clean `dune build` | 67 s |
| Clean `dune build @doc` (after the build) | 7.6 s |
| Public module paths | 2778 (`modules-m3-d9c00187.txt`, from the odoc page tree) |

### Phase 0 — finish the prototype

Based on `m3`, still with the hand-run script
(`scripts/proto-relayout.py` on the prototype branch), not the generator.
The prototype branch stays local.

0. Bring `m3` up to date with `main`. On 2026-10-25 `m3` was 79 commits
   ahead of `main` and 46 behind (stub batching, per-class GType stubs, the
   merlint lint gate). A trial merge conflicts in about 135 files: most are
   generated and are resolved by regenerating, and 14 are hand-written
   (`gir_gen` generator and tests, `gobject.mli`, `uInt32.ml`, CI,
   `merlint.toml`, one gtk test). Then rebase this plan's branch onto `m3`
   and redo the prototype on a fresh branch from it by re-running the
   script, rather than rebasing `proto/ocglib-ocgraphene`, whose generated
   files all conflict. Keep the old branch for reference until the new one
   reaches the same point.

   **Done 2026-10-25**: `main` merged into `m3` as `d9c00187` (pushed),
   this branch rebased onto it. merlint was removed rather than merged
   (unmaintained); semgrep is the lint gate. The merge also fixed an `m3`
   generator bug (eager `Option.fold ~none:` writing guarded enum cases and
   OS-guarded stubs twice).

   Steps 1 to 4 were done on 2026-10-25 on a new `proto/ocglib-ocgraphene`
   (the first attempt is kept as `proto/ocglib-ocgraphene-v1`); results are
   under Prototype findings.
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
   - cluster hiding (6 clusters): build the docs with a generated main
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

   **Proposed (awaiting confirmation): start phase 2; do not extend the
   script.** Steps 3 and 4 answered every question the prototype was for
   (links within and across packages, clusters, raw-to-raw dependencies,
   installed headers, `-p` builds). The remaining namespaces add no new
   kind of reference, only more of them: cairo, pango and pangocairo have
   no new shape, and gdk, gsk and gtk depend on everything, so the script
   would have to convert all of them at once, which is phase 3's job. The
   script also already needed three fixes for things the generator knows
   directly (the `_cycle_<hash>` cluster names, the `gdk_pixbuf` stub
   library name, layer 2 paths into another namespace's layer 1), and its
   regexes over formatted text are what phase 2 step 3 exists to avoid.

**Done when:**

- Step 0: `main` is an ancestor of `m3`, and `dune build`, `dune test` and
  the lint job pass on `m3`. The baselines are taken from this commit.
- Step 1: `dune build` from the root, with the root `dune-project`, builds
  `ocglib`, `ocgraphene.enums`, `ocgraphene.raw` and `ocgraphene`. A
  consumer compiles against both `Ocgraphene.Enums.x` and
  `Ocgraphene_enums.x`, and no `Graphene_enums` module exists in the
  installed tree.
- Step 2: the GC test passes in 20 consecutive runs of `dune test
  ocgraphene/ --force`, and its cases include one value created in each
  way listed (class, `Raw`, returned from another class).
- Step 3:
  - `ocgio`, `ocgio.raw` and `ocgio.enums` build, and gio's existing test
    (`test_gio_volume_monitor`) passes, moved to `ocgio/tests/`.
  - Every `inherit` line in gio whose parent is in gio links (0 unresolved
    of 176). This is the result the whole change is for; if it fails, stop
    and revisit the design before going further.
  - The cluster decision is recorded under Decisions, with the unresolved
    count for each configuration tried (dune's main module, generated
    `.mli`, generated `.mli` with `@canonical`).
  - Build time, doc build time and the unresolved-reference count for gio
    are recorded under Prototype findings, beside the baseline numbers.
- Step 4:
  - `dune build -p ocgdkpixbuf` succeeds against an `ocgio` installed in a
    separate prefix, and fails without it.
  - `test_gdkpixbuf` passes from `ocgdkpixbuf/tests/`. (It turned out to
    be disabled in the baseline, "Pixbuf load/scale methods not yet
    generated", so a new cross-package test stands in for it.)
  - No raw library's `libraries` field names a main library.
  - How the 8 cross-package `inherit` lines render is recorded, and the
    doc-comment "Inherits from" links to `Ocgio` pages resolve (the
    proposal accepts plain text on the `inherit` line itself).
- Step 5: the decision and its reason are written into this plan.

### Phase 1 — conf packages and ocglib

1. Fix the list of supported platforms (see Supported platforms below),
   and bring `release-verification.yml` and `conf-gtk4`'s depexts into line
   with it.
2. Add the four new conf packages (`conf-cairo-gobject`, `conf-pangocairo`,
   `conf-gdk-pixbuf-2`, `conf-graphene-1`) as top-level directories like
   `conf-gtk4/`, and depend on opam-repository's `conf-glib-2` and
   `conf-pango`. Write depexts for every supported platform from the
   distros' file lists, as was done for GLib (see Conf packages), not by
   guessing package names. Re-check opam-repository for the four names just
   before publishing.
3. Move `ocgtk/src/common` to `ocglib/` as the wrapped library `ocglib`,
   delete `ocgtk_common.ml/.mli`, switch its pkg-config rule to
   `glib-2.0`/`gobject-2.0`, and replace `#include <gtk/gtk.h>` in
   `ml_glib.c` with the GLib headers it actually uses.
4. Move the GLib/GObject tests (`test_gobj`, `test_gvariant*`,
   `test_glib_bytes`, `test_bounded_int`) to `ocglib/tests/`.
   `test_closure*` and the gobject test helpers stay in `ocgtk/tests/`
   until phase 3: `ocgtk/tests/gtk/test_signal_marshalling` uses the
   helpers too, and dune does not let one project use another's private
   library. Once there is one `dune-project`, they move.

Phase 1 lands on `m3` on its own, so the rest of the tree must keep
building: the generated dune files switch from `ocgtk.common` to `ocglib`
and add `-open Ocglib`, a small generator change ahead of phase 2. If that
turns out not to be small, phase 1 joins phase 3's PR instead.

**Steps 3 and 4 done** (2026-10-25, branch `layout-phase1`):

- `ocglib/` is the wrapped library `ocglib` in a root `dune-project` that
  declares only that package; `ocgtk/` keeps its own project until phase
  3. `configurator/` moved to the root with it.
- The generator change was small: the stub stanzas depend on `ocglib`,
  drop `-I../common`, and run `../../../configurator`. Three new tests in
  `dune_file_tests.ml`. `-open Ocglib` goes in the hand-written dune files
  (`ocgtk/src/*/dune`, tests, examples), not the generated ones, because
  the generated stub libraries have no OCaml modules. Regenerating after
  the change left no diff.
- `dune build -p ocglib @install` and its tests (`@ocglib/runtest`, 165
  cases) pass in `ubuntu:24.04` with `libglib2.0-dev` and no GTK
  (`gtk4.pc` absent).
- Tests: 165 cases in 5 suites under `ocglib/`, 226 in 26 under `ocgtk/`.
  Per suite, the same as the baseline (391 in 31).
- `dune build @doc`: 0 warnings; `ocglib/index.mld` links all 16 modules.
- `opam lint` passes for `ocglib.opam` and `ocgtk/ocgtk.opam`.
- Every test command now runs `dune test ocglib/ ocgtk/`, and every
  `opam install` adds `.` for `ocglib.opam`.
- Not done yet: the release tarball (see phase 3), and CI on GitHub,
  which runs when `layout-phase1` is pushed.

**Step 1 done** (2026-10-25), apart from CI on GitHub:

- The list is fixed (Supported platforms). `release-verification.yml` has
  a job per entry: native Ubuntu 22.04 and 24.04; container matrices for
  APT (Ubuntu 26.04, 26.10, Debian 12, 13), Fedora (43, 44), CentOS
  Stream (9, 10) and openSUSE (Leap 16.0, Tumbleweed); Alpine 3.24; Arch;
  macOS; FreeBSD 14 and 15 (disabled); Windows (disabled). The
  `windows_only` input is gone.
- Each new container job's system-package install was run in its image:
  all succeed, and gtk4, the build tools and the X server runner
  (`xvfb-run`, or `xwfb-run` on Stream 10) are present. The opam build
  and tests in the new jobs have not run yet.
- `conf-gtk4` depexts: MacPorts, `rhel` and MSYS2 removed; `available:
  os != "win32"`. `opam lint` passes. Its version stays at 2; it is
  bumped when it is next published.
- actionlint: no errors (only the `eval $(opam env)` quoting warnings that
  were already there, and the two `if: false`).
- Not changed: the local `ci/` Docker images still use the old set.
- CI on GitHub (PR #195): container jobs needed `git config --global
  --add safe.directory`, because opam pins the repository root with git.
  Ubuntu 22.04, Debian 12 and CentOS Stream 9 fail at Build on old cairo,
  which is also broken on `main` (Open items 4).

**Step 2 done** (2026-10-26), apart from macOS, which only CI can check:

- `conf-cairo-gobject/`, `conf-pangocairo/`, `conf-gdk-pixbuf-2/` and
  `conf-graphene-1/` are top-level packages like `conf-gtk4/`, version 1.
  None of the names is in opam-repository (checked 2026-10-26).
  `conf-pangocairo` depends on `conf-pango`, the others on `conf-glib-2`.
  `opam lint` passes for all four.
- Depexts, one system package per platform:

  | Package | Debian/Ubuntu | Fedora, CentOS Stream | openSUSE | Alpine | Arch | Homebrew | FreeBSD |
  |---|---|---|---|---|---|---|---|
  | `conf-cairo-gobject` | `libcairo2-dev` | `cairo-gobject-devel` | `cairo-devel` | `cairo-dev` | `cairo` | `cairo` | `cairo` |
  | `conf-pangocairo` | `libpango1.0-dev` | `pango-devel` | `pango-devel` | `pango-dev` | `pango` | `pango` | `pango` |
  | `conf-gdk-pixbuf-2` | `libgdk-pixbuf-2.0-dev` | `gdk-pixbuf2-devel` | `gdk-pixbuf-devel` | `gdk-pixbuf-dev` | `gdk-pixbuf2` | `gdk-pixbuf` | `gdk-pixbuf2` |
  | `conf-graphene-1` | `libgraphene-1.0-dev` | `graphene-devel` | `libgraphene-devel` | `graphene-dev` | `graphene` | `graphene` | `graphene` |

- Each package was installed with opam 2.5.0 (`opam install ./conf-<name>`
  into an empty switch, depexts on) in a fresh container on all 14 Linux
  images: Ubuntu 22.04, 24.04, 26.04, 26.10, Debian 12, 13, Fedora 43, 44,
  CentOS Stream 9, 10, openSUSE Leap 16.0, Tumbleweed, Alpine 3.24, Arch.
  56 of 56 succeed. Before each install the module's `.pc` file was
  absent; afterwards it is owned by the package in the table, so Fedora
  and CentOS Stream pull in `cairo-gobject-devel`. The base images had none
  of the libraries, except Arch, whose base system already has `glib2`
  (Arch ships headers in the same package; `conf-glib-2` has no Arch
  depext, so this is also what makes it installable there).
- Homebrew: the formulas build the GObject parts (`cairo` with
  `-Dglib=enabled`; `graphene` depends on `glib`). The new
  `macos-conf` job in `release-verification.yml` installs each package
  through Homebrew depexts and checks `glib-2.0`, `gobject-2.0`,
  `gio-2.0` and `gio-unix-2.0` (Open items 1).
- FreeBSD names come from the ports (Conf packages); not run, as the
  FreeBSD job is disabled.
- Nothing depends on the four packages yet; the namespace packages do from
  phase 3.

**Done when:**

- `opam lint` reports nothing for each new conf package.
- Every platform in Supported platforms is a job in
  `release-verification.yml`, and every platform named in a depext is in
  Supported platforms (no untested depexts, no tested platform without
  one).
- On each supported platform, starting with none of the libraries
  installed, `opam install ./conf-<name>` installs the system package
  through depexts and then succeeds. On the Fedora family this must pull
  in `cairo-gobject-devel`.
- `dune build -p ocglib` succeeds in a container that has GLib's
  development files but not GTK's, which shows ocglib no longer needs
  `gtk4`. No source under `ocglib/` includes a GTK header, calls a
  `gtk_` function, or asks pkg-config for `gtk4`. Mentions in comments,
  licence headers and `docs.gtk.org` links are fine.
- The moved tests pass from `ocglib/tests/`, with the same number of cases
  as the baseline for those executables.
- `dune build` and `dune test` pass for the whole tree, and CI (Linux and
  macOS) is green. macOS passing is also the missing check that Homebrew's
  `glib` provides `gobject-2.0` (Open items 1).

### Phase 2 — generator

1. Output paths: layer 1, C stubs and the decls header to
   `<pkg>/raw/generated/`; enums to `<pkg>/enums/generated/`; layer 2 to
   `<pkg>/generated/` without the `G` prefix.
2. Stop emitting `<Ns>.ml/.mli` and `ocgtk_<ns>.ml`. Emit `raw.ml` (one
   alias per class, clusters flattened, including `*_cycle_<hash>`
   clusters, plus one per hand-written `raw/core` module) and the enums
   re-export. No main modules: dune generates them (see Decisions). The
   library synopsis that `ocgtk_<ns>.ml` carried moves to the package's
   `index.mld` (phase 4).
3. Emit module paths per the name mapping, directly. Post-processing the
   text is fragile: ocamlformat splits long paths across lines.
4. Dune emission: three libraries per namespace. The gtk stubs are
   currently split into four batch stub libraries plus an aggregate; keep
   the batches as dependencies of `ocgtk.raw`.
5. The references/cross-namespace sexp files and `dune_file.ml`'s
   `dep_libraries`: new library names, and the raw/main distinction.
6. `install_c_headers` for each `*_decls.h` and the namespace's core
   header, which the decls header includes. `install_c_headers` takes
   headers from the library directory, so the prototype copies them up
   from `generated/` and `core/` with `copy` rules in `raw/dune`. Includes
   drop the `generated/` and `../core/` prefixes.
7. `scripts/generate-bindings.sh`: new output paths, and deletion of stale
   files (the generator does not remove them).

The generator change is not merged on its own: its output lands with it in
phase 3's PR.

**Done when:**

- `dune test gir_gen/` passes, with tests for the new output paths, module
  paths (one per row of the name mapping) and dune stanzas.
- For graphene, gio and gdkpixbuf, the generator's output matches what the
  phase 0 script produced, after ocamlformat on both. Any difference is
  explained here or fixed.
- Running `scripts/generate-bindings.sh` twice in a row leaves no diff, and
  after a run no file remains in a `generated/` directory that the run did
  not write.
- No step rewrites generated text after emitting it.

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

So the order is: commit the moves, then regenerate and reformat
(`generate-bindings.sh`, then `dune fmt`) and commit that. The second
commit's diff is the review point for the whole generator change: it must
contain nothing but the rewiring of module paths (the name mapping) and the
files the new layout adds or drops (`raw.ml`, `enums.ml`, the dune files,
the deleted `<Ns>.ml` and `ocgtk_<ns>.ml`). Any other change to a moved
file (a different external, a missing method, reordered code, a changed
doc comment) is a generator bug and is fixed before merging.

`test_closure_stress`, `test_closure_with_gc` and the gobject test helpers
move from `ocgtk/tests/` to `ocglib/tests/` (left behind in phase 1, step 4).

Hand-written `core/` code moves to `raw/core/` when it uses layer 1 only
(`gio_volume_monitor_core.ml` does). Gtk's hand-written `core/gMain.ml` and
`core/gVersion.ml` become `Ocgtk.Main` and `Ocgtk.Version` (see
Decisions); their 182 uses are renamed in the same PR.

Generated C files move one directory deeper (`<pkg>/raw/generated/`), so
check the stub-batch size in `dune_file.ml`, which allows for about 55
characters per path, against the new paths.

The release tarball (the `package` job in `release-verification.yml`) is
built from the `ocgtk/` subtree, so since phase 1 it leaves out `ocglib/`
and `configurator/`. It cannot simply become the repository root while
`ocgtk/` has its own `dune-project`, because dune then writes
`ocgtk.install` into `ocgtk/`, one directory too deep for opam. Once the
packages share the root `dune-project`, the tarball is the repository root
without `gir_gen/` and the other development-only directories.

**Done when:**

- Every move commit is renames only: `git show -M --stat` lists no file
  as modified, and `git log --follow` on a layer 2 file (say
  `ocgtk/generated/window.ml`) reaches its history as `gWindow.ml`.
- A spot check of the regenerate-and-reformat commit finds no material
  change: a sample of moved files from each namespace (a plain class, a
  cluster, one with cross-namespace parents, a C stub file) differs only in
  module paths, and the files it adds or deletes are the ones listed above.
- After `dune clean`, `dune build` passes at the regeneration commit.
- No generated module has a `G` prefix, no `ocgtk_<ns>.ml` or `<Ns>.ml`
  remains, and `ocgtk/src/` no longer exists.
- The longest compiler command line for a stub batch is measured, and is
  under 8191 characters (the Windows limit) with the margin the current
  batching assumes.
- Every package builds with `dune build -p <pkg>`, one at a time in
  dependency order, each against its predecessors installed in a separate
  prefix.
- The release tarball, unpacked, builds and installs every package with
  `opam install` from that directory, and has no `gir_gen/` in it.

### Phase 4 — tests, examples, packaging

1. Tests to `<pkg>/tests/`, with the gtk test helpers in `ocgtk/tests/`.
   Each test stanza gets `(package <pkg>)`. Without it a test belongs to
   no package, so `dune build -p ocglib @runtest` (what opam runs for
   `--with-test`) builds every test in the tree, the gtk ones included.
   Phase 1 found this: from the repository root it compiled the ocgtk
   tests against whichever `ocgtk` was installed.
2. Examples to `<pkg>/examples/` (all current ones to `ocgtk/examples/`,
   including the calculator's own tests); update library names, since
   most examples depend on the umbrella `ocgtk` library and must list the
   packages they use instead.
3. Remove `ocgtk/src/ocgtk.ml`, the umbrella library and its `dune`.
4. Documentation: one `index.mld` per package; the root `(documentation)`
   stanza per package.

**Done when:**

- `dune test` passes, and the test cases run, summed over every package,
  equal the baseline taken at the start of phase 3. A lower count means a
  test was lost in the move.
- Every example builds, and the calculator's tests pass.
- No dune or opam file names an old library (`ocgtk.common`, `ocgtk.gtk`,
  `ocgtk.gio`, ...) or the umbrella `ocgtk` library.
- `opam lint` reports nothing for every generated `.opam` file.
- `dune build @doc` produces an index page for every package.
- For each package, `dune build -p <pkg> @runtest` runs only that
  package's tests.

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

**Done when:**

- Every workflow passes on the PR: `ci.yml` (Linux, macOS, lint),
  `doc-preview.yml` and `release-verification.yml`.
- The doc preview contains every package. Its warning count is no higher
  than the baseline, same-package `inherit` links are 0 unresolved, and the
  doc build time is recorded.
- In a fresh opam switch, each package installs from a local
  opam-repository checkout (or pins) in dependency order, and a small
  program depending only on `ocgtk` builds against the installed set.
- The migration note has a row for every public path in the baseline list
  that changed.
- Searching `README.md`, `AGENTS.md` and the docs for old paths
  (`Ocgtk_`, `ocgtk.common`, `src/gtk`, `GWindow`-style names) finds only
  the migration note and CHANGELOG.

## Prototype findings

From `proto/ocglib-ocgraphene` (2026-10-25, on `m3` `d9c00187`): ocglib,
ocgraphene, ocgio and ocgdkpixbuf in the target layout at the repository
root, converted by `scripts/proto-relayout.py`. A root `dune` file leaves
the old `ocgtk/` tree out of the build; `configurator/` and `overrides/`
are at the root.

Layout and build:

- ocglib compiles as a wrapped library with dune's main module, using only
  `glib-2.0` and `gobject-2.0`: nothing in it used GTK, so `gtk/gtk.h`
  became `glib-object.h` (phase 1 step 3, done early). `Int32` no longer
  shadows `Stdlib.Int32` for consumers.
- Generated stubs find `wrappers.h` through the `ocglib` dependency, with no
  `-I../common`, in the workspace and installed.
- Layer 1 must be its own library: as `raw_*.ml` files in the main library
  every one of them is in the main module, and `private_modules` breaks
  installed consumers ("Ocgraphene.Raw.Point is an alias for module
  Ocgraphene__Raw_point, which is missing").
- Each package builds alone the way opam builds it: `dune build -p
  ocgraphene` against an installed `ocglib`, and `dune build -p
  ocgdkpixbuf` against installed `ocglib` and `ocgio` (including the
  installed `gio_decls.h` and `gio_core.h`). Each fails with `Library ...
  not found` when its dependency is not installed.
- No raw library depends on a main library; layer 1 only ever needs
  another namespace's raw and enums libraries.
- The generator names long clusters `<first>_cycle_<hash>`
  (`app_info_cycle_64c425a0` in gio), not only `a_and__b`.
- The gdkpixbuf stub library is `ocgtk_gdk_pixbuf_generated_stubs`, not
  `ocgtk_gdkpixbuf_...`.
- The name mapping lacked layer 2 referring to another namespace's layer 1
  (`Ocgio.Raw.Icon`); added.
- No class in any namespace is named `Raw`, `Enums` or `Constants`, or
  shares a name with an `Ocglib` or Stdlib module.
- `overrides/*.sexp` refer to GIR names, so they need no change.
- ocglib's C includes `caml/threads.h` but calls nothing from it: no
  `threads` dependency.
- The build root is the repository root (because of `dune-workspace`).

Runtime:

- `ocgraphene/tests`: classes, `Raw`, both enum paths, a `Box` copy
  returned by `init` and wrapped again, and 2000 live boxes across
  `Gc.full_major` and `Gc.compact`: 20 consecutive passes.
- `ocgio/tests`: the moved `test_gio_volume_monitor`, 4 cases as before.
- `ocgdkpixbuf/tests`: a `Pixbuf` used as an `Ocgio.Icon.icon_t`, and a PNG
  round trip through `Ocgio` memory streams.
- Graphene normalises the deprecated `` `XYZ `` Euler order to `` `SXYZ ``.
- **Not layout-related, found by the GC test**: caller-allocated record
  out-parameters hand OCaml a pointer to the C stack. The stub declares
  the record on the stack and passes `&outN` to `Val_<record>`, which
  stores the pointer without copying (`ml_gir_record_val_ptr_with_type`);
  the finaliser later frees it (`free(): invalid pointer`). 158 sites on
  both `main` and `m3` (graphene 17 files, gsk 4, gtk 2, gdk 1), e.g.
  `Box.get_center`. See Open items.

Docs (odoc, `--cache=disabled`):

| Package | Pages | Unresolved spans | Not `Stdlib.result` | `inherit` linked |
|---|---|---|---|---|
| ocglib | 27 | 0 | 0 | none |
| ocgraphene | 73 | 0 | 0 | none |
| ocgio | 690 | 979 | 14 | 176 of 176 |
| ocgdkpixbuf | 35 | 40 | 0 | 8 of 8 (4 into `Ocgio` pages) |

- Baseline gio (old layout, same commit): 682 pages, 2816 unresolved spans:
  1983 `Ocgtk_gio__` paths (layout-related, including all 176 `inherit`
  lines) and 833 `Stdlib.result`. So every layout-related unresolved span
  in gio is fixed. The `Stdlib.result` count rose because more signatures
  render with full paths.
- The 14 remaining are sibling class types inside the one recursive
  `class type ... and ...` group of `App_info_cycle_64c425a0` (`file_t`,
  `volume_t`, ...): odoc does not resolve them; not layout-related.
- `inherit` lines into another package link, contrary to the proposal's
  expectation of plain text.
- The 5 odoc warnings are dune's generated package index pages with empty
  `{!modules}` lists; the per-package `index.mld` (phase 4) replaces them.
- Time (20 cores, clean, the four prototype packages plus gir_gen): build
  14 s, docs 1.8 s, against the baseline's 67 s and 7.6 s for the whole
  tree.

## Open items

1. macOS: the four new conf packages through Homebrew depexts, and
   `conf-glib-2`'s coverage of gobject and gio (the `macos-conf` job checks
   both). Windows support, once opam-repository supports MSYS2 UCRT64
   (Supported platforms).
2. Gtk itself cannot be prototyped before phase 3, because it depends on
   every other namespace. Its risks are the same as gio's at a larger scale
   (320 layer 2 modules against gio's 175, 4 stub batches against 3), so
   gio stands in for it.
3. The caller-allocated out-parameter bug (Prototype findings, Runtime) is
   independent of the layout and exists on `main`; fix it in the generator
   on its own branch (copy the record with `g_boxed_copy` or
   `g_memdup2` before `Val_<record>`), not as part of this work.
4. Cairo older than 1.18 does not build, on `main` too, so Ubuntu 22.04
   (cairo 1.16), Debian 12 (1.16) and CentOS Stream 9 (1.17.4) fail
   `release-verification.yml` at Build. Left failing on `layout-phase1`
   (checked 2026-10-25). Since 9dd45ebc (2026-09-11) the generated cairo
   stubs declare and call `cairo_gobject_glyph_get_type` and
   `cairo_gobject_text_cluster_get_type`, which `cairo-gobject.h` gains
   only in 1.18.0 (checked at the 1.17.4, 1.17.6, 1.17.8 and 1.18.0 tags).
   Release Verification had not run since July, so nothing caught it. A
   `(record Glyph (version "1.18"))` override in `ocgtk/overrides/cairo.sexp`
   is not enough: regenerating with it changed no output, and guarding the
   converters away would leave `Val_cairo_glyph_t` and the
   `ml_cairo_glyph_get_type` external undefined on old cairo. The fix needs
   the guarded record to keep its symbols (an `#else` that fails at run
   time, as for guarded enum members), or the minimum cairo raised to 1.18
   and those three platforms dropped. Fix it on its own branch off `main`,
   not as part of this work.
5. `Stdlib.result` is unresolved wherever it appears (965 spans in gio), as
   in the baseline: odoc has no Stdlib docs to link to. A docs question for
   the m3 work, not the layout.
