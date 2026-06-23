# Cross-Namespace Types

GTK4's API spans nine namespaces: Cairo, Gio, Gdk, Graphene, GdkPixbuf, Pango,
PangoCairo, Gsk, and Gtk. Methods in one namespace routinely reference types from
another — `Gtk.Widget` returns `Gdk.Display`; `Gtk.Label` accepts `Pango.AttrList`;
`Gtk.SnapshotClass` uses `Graphene.Matrix`. Without cross-namespace resolution,
the generator would skip any method referencing an unknown type, leaving most of
the useful API unreachable.

---

## What Is Not Generated: GLib and GObject

The underlying GLib and GObject namespaces are **not generated**. They form the
runtime infrastructure on which everything else is built: the GObject type system,
reference counting, signals, `GValue`, `GClosure`, `GError`, `GVariant`, and the
fundamental GLib data structures and utilities.

Generating bindings for GLib and GObject would produce a large amount of code for
infrastructure that is mostly internal plumbing. Instead, the parts we need are
bound manually in `ocgtk/src/common/`:

| Module | Covers |
|--------|--------|
| `gobject.ml` | `GObject` type system, `GValue`, `GClosure`, `Signal` connection |
| `glib.ml` | Core GLib utilities |
| `gError.ml` | `GError` — used by methods that can fail |
| `gvariant.ml` / `gvariant_type.ml` | `GVariant` and its type system |
| `glib_bytes.ml` | `GBytes` for binary data |
| `gpointer.ml` | Opaque pointer helpers |
| `bounded_int.ml` | Bounded integer types (`UInt16`, `Int32`, etc.) |

These modules provide the types and functions that all generated code depends on.
Cross-namespace type resolution also never tries to resolve `GLib.*` or `GObject.*`
types — methods that reference them use the manually-written common modules directly.

---

## Reference Files

The generator's cross-namespace mechanism is built on **reference sexp files**. For
each namespace, running `gir_gen references` produces a `.sexp` file that lists
every exported entity with its fully-qualified OCaml module path:

```sexp
; _build/references/gdk-references.sexp (excerpt)
((class "Display"
  (module "Ocgtk_gdk.Gdk.Wrappers.Display")
  (type "Ocgtk_gdk.Gdk.Wrappers.Display.t"))
 (class "Rgba"
  (module "Ocgtk_gdk.Gdk.Wrappers.Rgba")
  (type "Ocgtk_gdk.Gdk.Wrappers.Rgba.t"))
 (enum "EventType"
  (module "Ocgtk_gdk.Gdk_enums")
  (type "Ocgtk_gdk.Gdk_enums.event_type")))
```

When generating Gtk bindings, `gir_gen generate` loads the reference files for its
dependencies (`--reference _build/references/gdk-references.sexp`, etc.). The
`type_mappings` context is populated with these external entries, so
`find_type_mapping_for_gir_type` can resolve `Gdk.Display` to
`Ocgtk_gdk.Gdk.Wrappers.Display.t`.

The same `--reference` flag that is passed to `generate` is also passed to
`references` — ignored entities (from the override file) are excluded from the
reference output, so downstream namespaces do not try to use types that don't exist.

---

## `<ns>_decls.h`: Cross-Namespace C Headers

Every namespace's generated output includes a C header file,
`src/<ns>/generated/<ns>_decls.h`, containing:

- Type conversion macros for all classes in that namespace
  (`Val_GtkWidget`, `GtkWidget_val`, …)
- Forward declarations for opaque pointer types

When generating C stubs for namespace B that reference types from namespace A,
the C stub file includes `<a>_decls.h`:

```c
/* ml_gtk_gen.c — generated header includes */
#include <gtk/gtk.h>
#include "../../gdk/generated/gdk_decls.h"
#include "../../pango/generated/pango_decls.h"
```

This means all the type macros for cross-namespace types are available in the
C stubs without duplicating macro definitions.

---

## `scripts/generate-bindings.sh`: Two-Phase Generation

Cross-namespace resolution requires that each namespace's reference file exist
before that namespace's dependencies are generated. This creates an ordering
constraint that `scripts/generate-bindings.sh` handles in two phases:

**Phase 1 — Generate reference files for all namespaces:**

```bash
for ns in Cairo Gio Gdk Graphene GdkPixbuf Pango PangoCairo Gsk Gtk; do
    dune exec gir_gen -- references \
        gir/$ns.gir \
        _build/references/$lower_ns-references.sexp \
        -o ocgtk/overrides/$lower_ns.sexp
done
```

**Phase 2 — Generate bindings with cross-references:**

Each namespace is generated with `--reference` flags for its dependencies:

```bash
dune exec gir_gen -- generate \
    gir/Gtk-4.0.gir \
    ocgtk/src/gtk \
    --reference _build/references/cairo-references.sexp \
    --reference _build/references/gdk-references.sexp \
    --reference _build/references/gio-references.sexp \
    --reference _build/references/graphene-references.sexp \
    --reference _build/references/gdkpixbuf-references.sexp \
    --reference _build/references/pango-references.sexp \
    --reference _build/references/pangocairo-references.sexp \
    --reference _build/references/gsk-references.sexp \
    -o ocgtk/overrides/gtk.sexp
```

Lower-level namespaces (Cairo, Graphene) have few or no dependencies and are
generated first. Higher-level ones (Gtk) are generated last with all dependencies
available.

---

## How Cross-Namespace Types Appear in Generated Code

### OCaml Layer 1

A method parameter typed `Gdk.Display` in GIR resolves to
`Ocgtk_gdk.Gdk.Wrappers.Display.t` in the generated OCaml:

```ocaml
(* widget.mli — generated *)
external get_display : t -> Ocgtk_gdk.Gdk.Wrappers.Display.t
  = "ml_gtk_widget_get_display"
```

### OCaml Layer 2

Layer 2 uses the L2 class type from the referenced namespace:

```ocaml
(* gWidget.mli — generated excerpt *)
method get_display :
  unit -> Ocgtk_gdk.Gdk.GDisplay.display_t
```

### Enums and bitfields from other namespaces

Cross-namespace enums use the enums module from the referenced namespace:

```ocaml
(* gtk_enums.mli — excerpt where a Gdk enum appears in a Gtk signal *)
(* signal parameter typed Gdk.EventType: *)
callback:(event_type:Ocgtk_gdk.Gdk_enums.event_type -> unit)
```

---

## Excluded Types and Fallback Behaviour

If a type cannot be resolved — because the reference file wasn't loaded, or the
type is intentionally absent via `(ignore)` in the override file — `filtering.ml`
skips any method that references it. This is the same mechanism used for unknown
types within a namespace: `find_type_mapping_for_gir_type` returns `None` and the
method is silently omitted.

This means that an incomplete set of `--reference` flags does not crash the
generator — it simply produces bindings with fewer methods.
