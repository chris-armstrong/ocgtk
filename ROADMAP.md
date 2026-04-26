# ocgtk Roadmap

This roadmap tracks the path from current state to a usable OCaml GTK 4 binding library. Milestone 1 (cross-namespace type resolution) is complete. The remaining milestones cover signals, documentation, and callback APIs.

## Current State (post-Milestone 1)

- 9 GIR namespaces generated as separate libraries (Cairo, Gio, Gdk, Graphene, GdkPixbuf, Pango, PangoCairo, Gsk, Gtk)
- Cross-namespace type resolution via reference files and `<ns>_decls.h` headers
- ~4,952 generated methods across all namespaces
- Layer 1 (module-based) and Layer 2 (class-based) APIs
- Contravariant `Gobject.obj` enabling safe `:>` upcasting
- GList/GSList support for class element types
- Throwing constructors (Result-returning)
- Only parameterless void signals (141 of 346 GTK signals)
- No callback parameter marshalling
- No generated documentation
- Calculator example app demonstrating cross-namespace usage

## Prerequisite Work

These items cut across multiple milestones and should be addressed first or in parallel with Milestone 2.

### P1. GObject/GLib Type Mappings (Phase 1 remainder)

**Status**: Task 1.1 done (GObject.Object + InitiallyUnowned). Remaining phases not started.

Add type mappings for GObject.Value, GObject.Closure, and simple GLib types (Quark, String, IOCondition, SeekType). These unblock methods across all namespaces and are required for signal parameter marshalling (Milestone 2) and callback parameters (Milestone 4).

**Plan**: `gir_gen/docs/plans/gobject_glib_type_mappings.md`

### P2. Elide Length-Linked Array Parameters

When GIR marks an array with `length=N`, the OCaml binding should hide the length parameter and compute it from `Array.length` at the C level. Affects the signature of many generated methods.

### P3. GIR `<constant>` Bindings

2,536 constants across all namespaces (2,287 are GDK key syms). Simple `let` bindings for typed values. Required for `PANGO_SCALE`, `GTK_STYLE_PROVIDER_PRIORITY_*`, and GDK key constants (the latter needed for Milestone 2's keyboard demo).

### P4. GIR `<function>` Bindings

2,001 standalone/namespace-level functions not attached to any class or record (e.g. `gtk_show_uri`, `pango_parse_markup`, `g_file_new_for_path`). Some are required for the Milestone 2 and 4 demo applications.

### P5. Parse `<callback>` Type Definitions

101 callback types appear in function/method signatures. Required for fully typed callback parameters in Milestone 4.

### P6. Interface Support

Interfaces currently generate only a `type t` with no class or class type definition. Adding proper class type generation and wiring interface implementation into the class hierarchy (e.g. CssProvider implementing StyleProvider, Entry implementing Editable) would eliminate Obj.magic casts. This is tracked separately:

- Model GObject interface implementation in L1 types
- Generate L2 `inherit` for implemented interfaces
- Eliminate Obj.magic casts for interface access

### P7. GList/GSList Interface Element Types

GList/GSList containing interface types (e.g. `GSList<Gio.File>`) generate broken C stubs. The generator needs to detect interface types and use pointer-based list handling instead of value-type copying.

---

## Milestone 2: Signal Handling with Parameters

**Why**: Only parameterless void signals are generated (141 of 346 total GTK signals). Without parameterised signals, applications cannot respond to key presses, handle close confirmations, or react to most user interactions.

**Goal**: GTK signals with typed parameters are generated as usable OCaml callbacks, covering keyboard, mouse, window lifecycle, and widget state events.

**Prerequisites**: P1 (GObject.Closure type mapping needed for marshalling), P3 (GDK key constants for demo app)

### Deliverables

1. **Parameterised signal generation** — Signals with typed parameters generate correct OCaml callback signatures via the `Gobject.Closure` infrastructure (e.g. `key-pressed` produces a callback receiving keyval, keycode, and modifier state).

2. **Boolean return value signals** — Signals returning bool are supported (e.g. `close-request` returning `true` to prevent window close).

3. **Common signal coverage**:
   - Keyboard input (`key-pressed`)
   - Mouse clicks (`pressed`)
   - Window lifecycle (`close-request`)
   - Widget state changes (`state-set`)
   - Dialog responses (`response`)

4. **Interactive form application** — Keyboard shortcut handling, close confirmation dialog, text input validation, and clickable links.

5. **Unit tests** for signal parameter marshalling.

### Key implementation areas

- `signal_gen.ml` — extend beyond `List.length signal.parameters = 0` check; generate typed `Gobject.Closure.create_*` calls
- `signal_filtering.ml` — relax filtering to allow parameterised signals
- Signal parameter type mapping — map GIR signal parameter types to OCaml types and C marshalling code
- Return value handling — `Gobject.Signal.connect` instead of `connect_simple` for non-void returns

### Verification

- Test suite passes
- Form application launches
- Keyboard shortcuts are handled
- Closing the window shows a confirmation dialog
- Text input validates as the user types

---

## Milestone 3: API Documentation Generation

**Why**: Generated bindings have no inline documentation. Developers must cross-reference the upstream GTK C docs to understand method semantics, making the library hard to use without prior GTK C experience.

**Goal**: Generated bindings include API documentation extracted from GIR `<doc>` elements, viewable via odoc.

**Prerequisites**: None (can proceed in parallel with Milestone 2)

### Deliverables

1. **ocamldoc comments from GIR** — `(** ... *)` comments generated from `<doc>` elements for all classes, methods, properties, and enum values.

2. **odoc build integration** — `dune build @doc` produces browsable HTML.

3. **Getting-started guide** — Installation, dune project setup, and building a first application (a window with a button).

### Key implementation areas

- GIR parser — extract `<doc>` element content (already partially parsed but not emitted)
- Code generator — emit `(** ... *)` ocamldoc comments in `.mli` files
- `dune` files — add `(documentation)` stanzas
- Markdown escaping — GIR docs contain C code snippets, HTML entities, and cross-references that need translation to ocamldoc format

### Verification

- `dune build @doc` succeeds
- Generated HTML shows human-readable descriptions on classes, methods, and properties
- Getting-started guide produces a running application on a clean Ubuntu system

---

## Milestone 4: Callback Parameters and API Ergonomics

**Why**: Methods that accept function arguments (sorting, filtering, iteration, custom rendering) are skipped during code generation. This means ListBox and TreeView lack sorting, filtering, and custom rendering. Widget type coercion is also verbose.

**Goal**: Methods with function parameters are generated with correct C marshalling, and widget type coercion is simplified.

**Prerequisites**: P5 (callback type definitions must be parsed first), P1 (GObject.Closure for lifecycle management)

### Deliverables

1. **Callback parameter marshalling** — Methods with callback parameters generate C stubs that convert OCaml functions to `GCallback` closures with correct lifecycle management (ref counting, destroy notify).

2. **Common callback coverage**:
   - List sorting (`ListBox.set_sort_func`)
   - List filtering (`ListBox.set_filter_func`)
   - Iteration (`ListBox.selected_foreach`)

3. **Sortable, filterable list application** — ListBox populated with items, search entry that filters in real time, sort controls that re-order the list.

4. **Unit tests** for callback marshalling.

### Key implementation areas

- `filtering.ml` — remove callback parameter skip logic
- New `c_stub_callback.ml` — generate C marshalling for OCaml function -> GCallback conversion
- `GDestroyNotify` handling — ensure OCaml closures are freed when GTK is done with them
- `scope` attribute handling — `call`, `notified`, and `async` scopes have different lifecycle requirements

### Verification

- Test suite passes
- List application launches
- Typing in the search entry filters visible items
- Clicking sort controls re-orders the list

---

## Backlog (not scheduled)

These items are tracked but not assigned to a milestone:

- **`foreign="1"` attribute on GIR records** — needed to distinguish opaque cairo types from value records
- **`dune-modules.sexp` cleanup** — currently unused (all dune files use `(modules :standard)`)
- **`<alias>` GIR elements** — only 4 instances, low priority
- **`<virtual-method>` generation** — needed for full interface support
- **Open variant types for Layer 1** — would eliminate remaining `Obj.magic` in `as_<class>` accessors
