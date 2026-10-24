# Unresolved `inherit` links in the odoc output — root cause and options

> **Status: known problem, fix deferred.** The `inherit` lines on L2 class
> type pages render as plain, unlinked text for every class in the gtk library.
> The full fix belongs with the library layout change described in
> [library-layout-proposal.md](./library-layout-proposal.md), which is not
> scheduled. Deleting the hand-written main module (option 1 below) is an
> accepted intermediate step while the documentation generation is being
> developed. This note records the investigation so it does not have to be
> repeated.

## Symptom

In the odoc HTML for `ocgtk` (odoc 3.2.1), every `inherit` line on an L2
class type page inside the gtk library is `<span class="xref-unresolved">`,
with the internal name:

- `Gtk.Button`: `inherit Ocgtk_gtk__.GEvent_controller_and__..._widget.widget_t`
- `Gtk.Application_window`: `inherit Ocgtk_gtk__.GApplication_and__window_and__window_group.window_t`
- `Gtk.Window`: the alias line `class type window_t = Ocgtk_gtk__.GApplication_and__...window_t`

Counted over the built tree: 297 intra-gtk `inherit` lines, all unresolved.
Parents in other libraries (`Ocgtk_gio.Gio.Action_group.action_group_t`)
render as plain text with a public name, neither linked nor flagged. Why they
are not links was not investigated.

Cluster classes (Widget, Window, Application and friends) look worse because
their parents live in a combined module with a long internal name, but
non-cluster parents fail the same way, for example `Ocgtk_gtk__.GActionable.actionable_t`
on `Gtk.Button`.

## Root cause

`ocgtk_gtk` has a hand-written main module, `src/gtk/generated/ocgtk_gtk.ml`
(`module Gtk = Gtk`, `module Gtk_enums = Gtk_enums`, ...), and dune builds the
library wrapped (`Ocgtk_gtk__GWindow` and so on).

- odoc treats any module name containing `__` as hidden, so it never links to
  `Ocgtk_gtk__.GWindow` directly. A hidden module can only be reached through
  its canonical public path.
- When dune generates the wrapper itself, the generated alias module carries
  `@canonical` annotations, so hidden paths are rewritten to the public ones.
- When the library has a hand-written main module, dune still generates an
  alias module (`Ocgtk_gtk__`) but without those annotations. Every reference
  that goes through it is left as an unresolved hidden path.

The `inherit` lines are the visible part of this: the generated `.mli` writes
`inherit GFoo.foo_t`, which dune resolves to `Ocgtk_gtk__.GFoo.foo_t`.

## Evidence

All with odoc 3.2.1. Evidence 2 was also run on odoc master
(3.2.1-191-g424a599), with the same result.

1. Plain wrapped library, no hand-written main module. `inherit Win.t` links
   (`Lib.Win.t`). Setup: `win.ml`/`win.mli` defining `class type t`;
   `other.ml`/`other.mli` with `class type u = object inherit Win.t end`;
   `dune`: `(library (name lib) (public_name lib))`.
2. Same library plus a hand-written `lib.ml` (`module Win = Win`,
   `module Other = Other`). `inherit Win.t` is unresolved (`Lib__.Win.t`).
   A `lib.ml` that re-exports every module does not help.
3. Same library with `(include_subdirs qualified)` and a directory per
   module, still no hand-written main module. `inherit Win.t` links.
4. The real tree with `ocgtk_gtk.ml` moved aside so dune generates the
   wrapper: 297 of 297 `inherit` lines link (0 unresolved), including the
   cluster modules. `GFoo` and the cluster modules become public, documented
   modules as a side effect. Other `xref-unresolved` spans remain in those
   pages (81 counted); they were not examined.
5. Adding `(** @canonical Ocgtk_gtk.Gtk.Window *)` to `gWindow.mli` (and to
   `Gtk.mli`), with the hand-written main module kept, did not change the
   output. In a hand-written-main repro, paths to *types* appeared to resolve
   only because `@canonical` had been added by hand, and class-type paths did
   not. This looked like an odoc limitation at the time, and was wrong:
   evidence 1 and 3 show class-type paths link when dune generates the
   wrapper. Treat evidence 5 as a dead end, not a bug in odoc.

odoc master did not change evidence 2, so waiting for a release will not fix
this. Nothing needs filing upstream.

## Options

1. **Let dune generate the wrapper** (delete `ocgtk_gtk.ml`). Verified to fix
   the links (evidence 4). The cost: `GFoo`, `Application_and__window_and__...`
   and every layer 1 module become public API of `ocgtk_gtk`, and each gets a
   page in the docs. It is the first step of the layout change, and an accepted intermediate
   while the documentation generation is developed.
2. **A doc-comment "Inherits" line with public paths**, for example
   `{!Ocgtk_gtk.Gtk.Widget.widget_t}`. Doc-comment references resolve against
   the whole doc set. Verified in a hand-written-main repro that such a
   reference renders as a working link. Not tried on the real tree. The
   canned "Inherits from:" block planned for the L2 class type doc
   (decision 10, Phase 7 of the odoc plan) is the natural place, so this
   is likely free once that phase lands, and it leaves the raw `inherit` lines
   as plain text.
3. **Post-process the HTML**, mapping each unresolved span to a link. Brittle;
   not recommended.
4. **Define the class types inline in a single public main module.** Gives
   non-hidden definitions, but makes the whole L2 layer one compilation unit.
   Not tried; build cost unknown.

Rejected, with the reason:

- **`@canonical` on the `GFoo` shims** (evidence 5): no effect while the main
  module is hand-written.
- **An alias module (`Layer2`) that `GFoo` modules `inherit` through:** dune
  reports a dependency cycle, because the alias module refers to the modules
  that refer to it. The same cycle prevents `GFoo` from naming `Gtk.Foo`.
- **`(wrapped false)`:** the unwrapped case links, but module names such as
  `Application` and `Window` would then collide between `ocgtk_gtk`,
  `ocgtk_gio` and the others.

## Related generator note

Phase 7 of the odoc plan proposes emitting `inherit GWidget.widget_t` (the
public shim) instead of the combined module's path. With the hand-written main
module that still renders as an unresolved `Ocgtk_gtk__.GWidget.widget_t`, so
it removes the long cluster name but not the unresolved link. It becomes
fully effective when the main module is generated by dune.
