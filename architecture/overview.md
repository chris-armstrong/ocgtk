# ocgtk Architecture Overview

This document introduces the structure of ocgtk for new contributors: what the
project is, how it is laid out, what code the generator produces, and why the
design is the way it is.

---

## What ocgtk Is

ocgtk generates OCaml bindings for GTK4 from **GObject Introspection (GIR)** XML
files. GIR is a standard machine-readable description of GLib-based C libraries —
GTK4, GDK, Pango, Cairo, GIO, and so on — that includes method signatures, property
names and types, signals, enums, records, and the class hierarchy.

The generator (`gir_gen`) reads a GIR file, applies per-namespace override rules,
performs dependency analysis, and writes:

- C FFI stub files (`ml_*_gen.c`)
- OCaml low-level binding modules (`widget.ml/mli`, etc.)
- OCaml high-level class wrapper modules (`gWidget.ml/mli`, etc.)
- Build rules (`dune-generated.inc`)

Nine namespaces are covered: Cairo, Gio, Gdk, Graphene, GdkPixbuf, Pango,
PangoCairo, Gsk, and Gtk. The generated files are committed to the repository;
the generator is re-run whenever it changes or when the GIR files are updated.

---

## Project Layout

```
<repo root>/
├── dune-workspace              # spans ocgtk/ and gir_gen/
├── gir/                        # bundled GIR data files (9 namespaces)
├── scripts/                    # build and generation scripts
│   └── generate-bindings.sh   # regenerate all 9 namespaces
├── gir_gen/                    # code generator (standalone dune project)
│   ├── bin/                    # gir_gen executable entry point
│   ├── lib/                    # generator library
│   │   ├── parse/              # GIR XML → AST
│   │   └── generate/           # AST → generated source files
│   ├── test/                   # generator test suite
│   └── docs/                   # generator-specific docs
└── ocgtk/                      # GTK bindings (main dune project)
    ├── overrides/               # per-namespace generation overrides (<ns>.sexp)
    └── src/
        ├── common/              # handwritten runtime (GObject, GLib, closures)
        └── <ns>/                # one directory per namespace (gtk, gdk, gio, …)
            ├── core/            # handwritten namespace extras
            └── generated/       # owned entirely by gir_gen
```

### Why core/ and generated/ are separate

`generated/` is overwritten every time `scripts/generate-bindings.sh` runs. Putting
handwritten code there would destroy it on the next regeneration. `core/` is the place
for things gir_gen cannot express: manual bindings for opaque types, wrappers around
GLib functions that aren't in GIR, or corrections for cases where the generator
produces something suboptimal.

`common/` holds the handwritten runtime that all namespaces depend on: the GObject
value system, GLib bindings, closure support, GError, GVariant, and the C helper
header `wrappers.h`. None of this is generated — these are the foundations that the
generated code builds on.

---

## The Binding Layers

For each GIR class (e.g. `GtkButton`), gir_gen produces code at two layers.

### Layer 0 — C Stubs (`ml_*_gen.c`)

Thin C functions bridging OCaml calling conventions to GTK's C API:

```c
/* Generated in ml_button_gen.c */
CAMLprim value ml_gtk_button_new(value unit_val)
{
    CAMLparam1(unit_val);
    GtkWidget *result = gtk_button_new();
    CAMLreturn(Val_GtkWidget(result));
}
```

The type macros (`GtkWidget_val`, `Val_GtkWidget`, `Val_bool`, `Int_val`, etc.) are
defined in `wrappers.h` and generated per-class headers. There is one generated C
file per class or cyclic group of classes.

### Layer 1 — OCaml Externals (`button.ml` / `button.mli`)

OCaml modules with `external` declarations binding to Layer 0:

```ocaml
(* button.mli — generated *)
type t = [`button | `widget | `initially_unowned | `object_] Gobject.obj

external new_ : unit -> t = "ml_gtk_button_new"
external get_label : t -> string option = "ml_gtk_button_get_label"
external set_label : t -> string -> unit = "ml_gtk_button_set_label"

val on_clicked :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
```

The `type t` is a **polymorphic variant phantom type**. The variant tag list encodes
the full parent chain — `button`, `widget`, `initially_unowned`, `object_`. This is
what allows a `Button.t` value to be used anywhere a `Widget.t` is expected via
OCaml's structural subtyping, without any runtime cast.

Signals appear at Layer 1 as plain functions. Parameterless void signals use
`Gobject.Signal.connect_simple`; signals with parameters wrap a
`Gobject.Closure.create` call — see
[closures_and_signals.md](./closures_and_signals.md) for details.

Layer 1 is rarely used directly by application code.

### Layer 2 — OO Classes (`gButton.ml` / `gButton.mli`)

OCaml classes that wrap Layer 1 and present a natural object-oriented API:

```ocaml
(* gButton.mli — generated (abbreviated) *)
class type button_t = object
  method get_label : unit -> string option
  method set_label : string -> unit
  method on_clicked :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  method as_button : Button.t
  inherit GWidget.widget_t
end

class button : Button.t -> button_t
```

Key design points:

- **Class type defined separately**: `class type button_t` is defined before the class
  itself. Class types are erased entirely by the compiler (they generate zero runtime
  code), which is important for dead code elimination (§7 below). Defining the class
  type separately also enables mutual recursion between class type definitions without
  requiring `module rec`.

- **Parent inheritance**: the class inherits parent methods via
  `inherit parent_class (Obj.magic obj)`. The `Obj.magic` cast is safe — GObject
  objects are a single C pointer regardless of their type in the hierarchy, so the
  representation is identical at every level.

- **Parameter types use class types**: methods that accept another GObject use
  `widget_t`, not `#widget_t`. The `#` prefix cannot appear in `class type`
  definitions (it introduces unbound type variables). Callers pass subtypes with
  explicit coercion: `(button :> widget_t)`.

- **Internal unwrapping**: inside a Layer 2 method body, class-typed parameters are
  unwrapped to Layer 1 via `v#as_widget` before passing to Layer 1 functions.

- **`as_<class>` accessor**: every Layer 2 class exposes `method as_button : Button.t`
  (and, via inheritance, `as_widget`, `as_object_`, etc.) for the cases where Layer 1
  types are needed directly.

Signals at Layer 2 forward to Layer 1 for simple cases, or wrap the callback to
convert between Layer 1 values and Layer 2 class instances when GObject parameters
are involved.

### Entry-Point Module (`ocgtk_gtk.ml`)

Each namespace has a generated entry-point module that flattens the Layer 2 namespace:

```ocaml
(* ocgtk_gtk.ml — generated (excerpt) *)
module Widget =
  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
module Button = GButton
module Box = GBox
(* ... ~650 more ... *)
module Wrappers = struct
  module Widget = Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  module Button = Button
  (* ... *)
end
```

These are **pure module aliases** — the compiler erases them completely. They serve
two purposes: giving users short names (`Gtk.Button` instead of the long cyclic
module name), and enabling dead code elimination (§7).

---

## gir_gen Pipeline

```
gir/<ns>.gir        ocgtk/overrides/<ns>.sexp
      │                         │
      ▼                         ▼
parse/gir_parser.ml       override_parser.ml
      │                         │
      └──────── raw AST ─────────┘
                     │
              override_apply.ml
          (remove ignored entities;
           apply version overrides)
                     │
              type_mappings.ml
          (build generation context:
           C→OCaml type mappings,
           cross-namespace references,
           entity lookup tables)
                     │
     ┌───────────────┼───────────────┐
     ▼               ▼               ▼
 c_stubs.ml     ml_interface.ml  class_gen.ml
 (Layer 0 C)    (Layer 1 ML)     (Layer 2 ML)
     │               │               │
     ▼               ▼               ▼
ml_*_gen.c      widget.ml/mli    gWidget.ml/mli
```

**Why overrides are applied before context build**: after `override_apply.ml` removes
an entity, it is absent from the generation context. When `filtering.ml` later calls
`find_type_mapping_for_gir_type` for a type that references the removed entity, it
gets `None` and silently skips the method. If overrides were applied after context
build, ignored types would still appear in the context and generate broken code.

**`type_mappings.ml`** is central: it builds a lookup table mapping C types
(`gint`, `gboolean`, `GtkWidget*`, `GdkRGBA*`, …) to their OCaml representations
and the C conversion macros to use. It also stores the generation context that all
downstream generators receive. Every generator calls
`find_type_mapping_for_gir_type` to resolve types; if a type is unknown, the
method is skipped.

---

## Calculating Dependencies, Cycles, and Module Naming

OCaml compilation units cannot have circular references. GTK's class hierarchy is
full of mutual dependencies — `Application` passes `Window` objects; `Window`
references `Application` for signals; both reference `Widget`. These cycles would
prevent separate compilation.

### Tarjan's SCC

`dependency_analysis.ml` models the namespace as a directed graph: each class,
interface, and record is a node; each reference to another entity within the same
namespace (in methods, properties, constructors, or signals) is an edge. Tarjan's
Strongly Connected Components (SCC) algorithm identifies which groups of entities
form mutual cycles.

Entities not in any cycle are **singletons** — they get their own file:
`button.ml`, `gButton.ml`.

Entities in a cycle are **combined** into a single file using `module rec`. The file
name is derived by sorting the members alphabetically and joining with `_and_`:

```
Application + Window + WindowGroup
  → application_and__window_and__window_group.ml
```

This produces the long module names visible in the generated code:

```
GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
```

### Why the long names exist

OCaml's module name is derived from the file name, so combining classes into one
file directly produces the compound name. The name reflects exactly which classes
share a compilation unit due to cyclic dependencies in the GIR.

### Flattening via module aliases

Application code should not have to spell out these compound names. The entry-point
module (`ocgtk_gtk.ml`) provides aliases:

```ocaml
module Widget =
  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
```

These aliases are **compiler-erased**: they generate no runtime code and create no
linker dependency. An application that opens `Ocgtk_gtk.Gtk` and uses `Widget`
creates exactly the same binary as one that spells out the full name — but if the
application never uses `Widget` at all, the compiler does not reference the combined
module, and the linker excludes it entirely.

---

## Special-Case Generation

GIR describes many parameter and return patterns that require generated code beyond
simple scalar conversion. See
[special_case_generation.md](./special_case_generation.md) for the full treatment.
Key cases:

- **Arrays**: zero-terminated (`NULL`-terminated pointer arrays), length-based
  (array + companion `gsize` parameter), GPtrArray, and out-param arrays.
  The companion length parameter is derived from `Array.length` in the C stub and
  hidden from the OCaml signature.

- **GList / GSList**: generated via `c_stub_list_conv.ml`; element type must be
  resolvable.

- **Nullable parameters**: GIR `nullable="1"` → `option` in OCaml. The C stub
  checks for `None` and passes `NULL`.

- **Out parameters**: GIR `direction="out"` parameters are collected and returned
  alongside (or instead of) the function's primary return value.

- **Enums and bitfields**: `enum_code.ml` generates a `<ns>_enums.mli` with
  polymorphic variant types and `_of_int` / `_to_int` converters.

- **Version guards**: entities added in later GTK versions get `#if GTK_CHECK_VERSION`
  guards in the C stubs, at entity or member level.

- **Suppressed generation**: methods referencing unknown types, varargs, callbacks,
  `void*` byte buffers, array-typed properties, and interface parameters in Layer 2
  are silently skipped. See `filtering.ml` and [ROADMAP.md](../ROADMAP.md).

---

## Dead Code Elimination

OCaml native builds eliminate dead code at compilation-unit granularity: a `.cmx`
not transitively referenced by the program is excluded from the final binary.

### The class-alias problem

If the entry-point module contained:

```ocaml
class button = GButton.button  (* WRONG *)
```

this would create a runtime dependency. OCaml class values hold method dispatch
tables; a class alias reads that table from the other module at startup, pulling it
— and everything it depends on — into the binary. An application using only
`Button` would still link all 660+ GTK class modules.

### How the generated code avoids this

1. **One class per file**: every class lives in its own `gWidget.ml`, `gButton.ml`,
   etc. The compilation-unit boundary is the elimination unit.

2. **Module aliases, not class aliases**: the entry-point uses
   `module Button = GButton`, which is a pure module alias — compiler-erased,
   creates zero linker references.

3. **Class types are type-level only**: `class type button_t = object ... end`
   generates no runtime code and creates no linker dependency. This is why the
   design separates the class type from the class definition.

4. **Cycle grouping is minimal**: Tarjan's SCC groups only the entities that
   *must* share a file due to genuine cycles. Entities that are not mutually
   dependent stay in separate files even if they are in the same GTK hierarchy.

The result: an application that uses only `Button`, `Box`, and `Window` links
those three class modules plus their transitive dependencies. All other GTK
class modules remain unlinked.

See [linking_and_dead_code_elimination.md](./linking_and_dead_code_elimination.md)
for verification commands and further details.

---

## Closures and Signals

GObject signals are a publish-subscribe mechanism: a widget can emit named signals
(e.g. `"clicked"`, `"selection-changed"`), and callbacks registered via
`g_signal_connect` are called when that happens. The callback is wrapped in a
`GClosure` — a heap-allocated structure that binds a C function pointer to its
associated data.

See [closures_and_signals.md](./closures_and_signals.md) for the full treatment.
Key points:

- The `Gobject.Closure` module wraps `g_closure_new_simple` with a custom
  marshaller (`ml_closure_marshal`) that converts GLib's `GValue` array into an
  OCaml `argv` record and calls back into OCaml.

- Signal connection is exposed at **both Layer 1 and Layer 2**. Layer 1 provides
  plain functions (`Button.on_clicked`); Layer 2 provides methods
  (`button#on_clicked`). Signals are not a separate layer — they are part of the
  class API at both levels.

- `signal_gen.ml` uses two strategies: `Connect_simple` for parameterless void
  signals, and `Closure` for signals with parameters or a return value.

- `signal_marshaller.ml` maps GIR types to `(Gobject.Value.get_*)` / `(set_*)`
  expressions and tracks whether a parameter wraps a Layer 2 class instance.

- The same dependency analysis that handles class cycles also handles signal
  dependencies: a signal parameter of type `Window.t` creates an edge in the
  dependency graph that Tarjan's SCC can absorb into a combined module.

---

## Cross-Namespace Types

GTK4 bindings span nine namespaces. Many methods return or accept types from
other namespaces: `Gtk.Widget` returns `Gdk.Display`; `Gtk.Label` accepts
`Pango.AttrList`. Without cross-namespace resolution, those methods would be
skipped entirely.

See [cross_namespace_types.md](./cross_namespace_types.md) for a detailed description.
Key points:

- **GLib and GObject are not generated**: they provide the runtime infrastructure
  (type system, memory management, data structures). The parts we need are bound
  manually in `ocgtk/src/common/`.

- **Reference files**: `gir_gen references` produces a `.sexp` file listing every
  exported entity from a namespace with its fully-qualified OCaml module path. When
  generating namespace B, the reference files for its dependencies are loaded so
  that `A.Widget` resolves to `Ocgtk_a.A.Wrappers.Widget.t`.

- **`<ns>_decls.h`**: each namespace generates a C header with the type macros for
  its classes and records. When generating C stubs that reference a cross-namespace
  type, the appropriate `<ns>_decls.h` is included.

- **`scripts/generate-bindings.sh`** orchestrates the two-phase process: first
  generate reference files for all namespaces, then generate bindings with those
  references available.

---

## Key Documentation

| Document | Contents |
|----------|----------|
| [CONTRIBUTORS.md](../CONTRIBUTORS.md) | Build, test, and development workflow |
| [gir_gen/overrides.md](./gir_gen/overrides.md) | Override sexp file format and design |
| [special_case_generation.md](./special_case_generation.md) | Arrays, GList, nullable, out-params, enums, version guards |
| [closures_and_signals.md](./closures_and_signals.md) | GObject closure mechanism and signal generation |
| [cross_namespace_types.md](./cross_namespace_types.md) | Cross-namespace type resolution |
| [linking_and_dead_code_elimination.md](./linking_and_dead_code_elimination.md) | DCE verification and linker behaviour |
| [integer_type_design.md](./integer_type_design.md) | Bounded integer types (UInt16, Int32, …) |
| [FFI_GUIDELINES.md](./FFI_GUIDELINES.md) | OCaml/C binding best practices |
| [adding_gir_library.md](./adding_gir_library.md) | Step-by-step guide to adding a new namespace |
| [ci_distro_testing.md](./ci_distro_testing.md) | Docker-based multi-distro CI |
| [ROADMAP.md](../ROADMAP.md) | Known limitations and deferred work |
