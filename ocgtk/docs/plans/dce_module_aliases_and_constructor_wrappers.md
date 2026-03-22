# Plan: Replace class re-exports with module aliases + add constructor wrappers

## Context

Two related changes that together produce a clean, DCE-friendly API:

1. **DCE fix**: Generated library modules (Gtk.ml, Gdk.ml, Gsk.ml) contain `class button = GButton.button` re-exports that create runtime references to every G* module, defeating dead code elimination. Replace with `module Button = GButton` aliases (compiler-erased).

2. **Constructor wrappers**: G* modules (Layer 2) currently only contain the class. Add constructor wrapper functions that call the Layer 1 constructor and wrap in `new <class>`, so users get a one-step API instead of the current two-step `Wrappers.Button.new_() |> new button`.

3. **Cyclic group shim modules**: For entities in cyclic groups (e.g., `Window` in `gApplication_and__window_and__window_group.ml`), generate individual shim modules (`gWindow.ml`) that re-export the class type and provide constructor wrappers. This gives each entity its own top-level module alias in Gtk.ml.

See: `ocgtk/architecture/linking_and_dead_code_elimination.md`

## API Change

```ocaml
(* Before: two-step, Wrappers for L1, bare class names from Gtk.ml *)
open Ocgtk_gtk.Gtk
let btn_obj = Wrappers.Button.new_with_label "Click"
let btn = new button btn_obj

(* After: one-step via module aliases to G* modules with constructor wrappers *)
open Ocgtk_gtk.Gtk
let btn = Button.new_with_label "Click"  (* returns button_t directly *)
```

## Generated Output Examples

### Standalone class: gButton.ml (after changes)

```ocaml
(* Signal class defined in gbutton_signals.ml *)

class type button_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gbutton_signals.button_signals
    method get_can_shrink : unit -> bool
    (* ... existing methods ... *)
    method as_button : Button.t
end

class button (obj : Button.t) : button_t = object (self)
  (* ... existing class body ... *)
end

(* Constructor wrappers *)
let new_ () : button_t =
  new button (Button.new_ ())

let new_from_icon_name (icon_name : string) : button_t =
  new button (Button.new_from_icon_name icon_name)

let new_with_label (label : string) : button_t =
  new button (Button.new_with_label label)

let new_with_mnemonic (label : string) : button_t =
  new button (Button.new_with_mnemonic label)
```

### gButton.mli (after changes)

```ocaml
class type button_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gbutton_signals.button_signals
    method get_can_shrink : unit -> bool
    (* ... existing methods ... *)
    method as_button : Button.t
end

class button : Button.t -> button_t

val new_ : unit -> button_t
val new_from_icon_name : string -> button_t
val new_with_label : string -> button_t
val new_with_mnemonic : string -> button_t
```

### Cyclic group shim: gWindow.ml (new file)

For entities in cyclic groups, generate an individual shim module that re-exports from the combined G* module and adds constructor wrappers:

```ocaml
(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Window from cyclic group Application_and__window_and__window_group *)

class type window_t = GApplication_and__window_and__window_group.window_t

class window = GApplication_and__window_and__window_group.window

let new_ () : window_t =
  new GApplication_and__window_and__window_group.window
    (Application_and__window_and__window_group.Window.new_ ())
```

### gWindow.mli (new file)

```ocaml
class type window_t = GApplication_and__window_and__window_group.window_t

class window : Application_and__window_and__window_group.Window.t -> window_t

val new_ : unit -> window_t
```

### Gtk.ml (after changes)

```ocaml
(* GENERATED CODE - DO NOT EDIT *)

(** Classes and Interfaces *)

module About_dialog = GAbout_dialog
module Application = GApplication        (* shim module *)
module Button = GButton                   (* standalone module *)
module Window = GWindow                   (* shim module *)
module Window_group = GWindow_group       (* shim module *)
(* ... one module alias per entity ... *)

(** Layer 1 Module Wrappers *)
module Wrappers = struct
  module About_dialog = About_dialog
  module Application = Application_and__window_and__window_group.Application
  module Button = Button
  module Window = Application_and__window_and__window_group.Window
  (* ... unchanged ... *)
end

(** Enumerations and Bitfields *)
type alignment = Gtk_enums.alignment
(* ... unchanged ... *)
```

## Steps

### Step 1: Add constructor wrapper generation to `class_gen.ml`

**File:** `ocgtk/src/tools/gir_gen/generate/class_gen.ml`

Add constructor wrapper functions after the class definition in `generate_class_module`. For each constructor that passes `should_generate_constructor`:

**Implementation details:**
- Add `~constructors` param to `generate_class_module` and `generate_class_signature`
- Update call sites in `gir_gen.ml` (lines 269-274 and ~413) to pass `~constructors:entity.constructors`
- Reuse existing helpers:
  - `Utils.ocaml_constructor_name` (utils.ml:321) — GIR name → OCaml name (e.g., "new" → "new_")
  - `Layer1_helpers.map_constructor_param` (layer1_helpers.ml:129) — param → OCaml type string
  - `Utils.ocaml_parameter_name` (utils.ml:301) — sanitizes param names
  - `Layer1_constructor.should_generate_constructor` (layer1_constructor.ml:32) — filter check
- For `.ml`: emit `let new_ () : button_t = new button (Button.new_ ())`
- For `.mli`: emit `val new_ : unit -> button_t`
- For zero-param constructors, use `()` as the argument
- The class name for `new <class>` is `sanitize_name class_name`
- The Layer 1 module reference is `module_names.layer1`

**For combined/cyclic class modules** (`generate_combined_class_module`):
- Constructor wrappers go AFTER the mutually-recursive class block (after the last `end`)
- Each entity's constructors reference its own class: `new window (...)`, `new application (...)`

### Step 2: Generate shim modules for cyclic group entities

**File:** `ocgtk/src/tools/gir_gen/gir_gen.ml`

The Layer 2 generation loop (line 773-791) dispatches on `Single` vs `Cycle`:

```ocaml
| Cycle cycle_entities ->
    generate_combined_class_files ...  (* existing: creates gApplication_and__window_and__window_group.ml *)
```

**Add a new function** `generate_cyclic_shim_files` and call it immediately after `generate_combined_class_files` in the `Cycle` branch. It iterates over each entity in `cycle_entities` and generates an individual shim file pair:

```ocaml
(* New code in the Cycle branch: *)
generate_combined_class_files ~ctx ~output_dir ~generated_modules
  ~module_group:group ~parent_chain_for_class;
(* NEW: generate per-entity shim modules *)
List.iter cycle_entities ~f:(fun entity ->
  generate_cyclic_shim ~ctx ~output_dir ~generated_modules
    ~combined_name ~entity ~parent_chain_for_class)
```

**`generate_cyclic_shim`** generates two files per entity. For `Window` in cycle `Application_and__window_and__window_group`:

`gWindow.ml`:
```ocaml
(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Window from cyclic group Application_and__window_and__window_group *)

class type window_t = GApplication_and__window_and__window_group.window_t

class window = GApplication_and__window_and__window_group.window

let new_ () : window_t =
  new GApplication_and__window_and__window_group.window
    (Application_and__window_and__window_group.Window.new_ ())
```

`gWindow.mli`:
```ocaml
class type window_t = GApplication_and__window_and__window_group.window_t

class window : Application_and__window_and__window_group.Window.t -> window_t

val new_ : unit -> window_t
```

The shim re-exports the class type (erased, no cost) and the class (runtime ref, but only pulled when the shim is linked). Constructor wrappers call the Layer 1 constructor and wrap with the class from the combined module.

Each shim file name is added to `generated_modules` so it appears in `dune-modules.sexp`.

**New shim files generated** (GTK namespace example):
- `gApplication.ml/mli`, `gWindow.ml/mli`, `gWindow_group.ml/mli` (from `gApplication_and__window_and__window_group`)
- `gAt_context.ml/mli`, `gAccessible.ml/mli` (from `gAt_context_and__accessible`)
- Similar pattern for cyclic groups in GDK, GSK

### Step 3: Modify `library_module.ml` — replace class re-exports with module aliases

**File:** `ocgtk/src/tools/gir_gen/generate/library_module.ml`

In both `generate_library_implementation` and `generate_library_interface`:
1. **Remove** class type re-exports and class re-exports
2. **Replace** with one `module <Entity> = G<Entity>` per entity (NO deduplication needed — every entity now has its own G* module, either standalone or shim)
3. Keep the `Wrappers` submodule and enum/bitfield sections unchanged

### Step 4: Regenerate all bindings

```bash
bash scripts/generate-bindings.sh
```

### Step 5: Update examples

```ocaml
(* Before *)
let window_obj = Wrappers.Window.new_ () in
let window = new window window_obj in

(* After *)
let window = Window.new_ () in
```

**Files to update:**
- `ocgtk/examples/counter.ml`
- `ocgtk/examples/demo_all.ml`
- `ocgtk/examples/settings_panel.ml`
- `ocgtk/examples/login_form.ml`
- `ocgtk/examples/text_editor.ml`
- `ocgtk/examples/README.md`
- `ocgtk/examples/counter_simple.ml` — Layer 1 only, may not need changes

### Step 6: Build and test

```bash
cd ocgtk && dune build
cd ocgtk && xvfb-run dune runtest
```

### Step 7: Update architecture documentation

**`ocgtk/architecture/linking_and_dead_code_elimination.md`:**
- Change "Planned fix" to "Implementation" — document module aliases + constructor wrappers + cyclic shims
- Update code examples to show one-step API

**`ocgtk/src/tools/README_GIR_GEN.md`:**
- Document G* module constructor wrappers and cyclic group shim modules

## Tests

### Existing tests that need changes

**Runtime tests** (use `new button`, `Wrappers.Button`, etc.):
- `tests/gtk/test_button.ml` — lines 111, 121: `new button obj` → `new Button.button obj` or use constructor wrapper. Also `module Button = Wrappers.Button` may become unnecessary since `Button` from Gtk module now has constructors
- `tests/gtk/test_box.ml` — lines 120, 132: `new box obj` → similar. Also `module Widget = Wrappers.Widget`, `include Wrappers.Box`
- `tests/gtk/test_widget.ml` — `module Widget = Wrappers.Widget`
- `tests/gtk/test_range.ml` — `module Scale = Wrappers.Scale`, etc.
- `tests/gtk/test_string_list.ml` — `module String_list = Wrappers.String_list`

**Generator tests** (`src/tools/test_gir_gen/`):
- `method_wrapper_tests.ml` — creates test classes with `constructors = []`. Tests verify class type and class generation via AST parsing. May need updates if constructor wrappers change the AST output
- No tests directly exercise `library_module.ml` — currently untested

### New tests needed

1. **Constructor wrapper generation** (in `test_gir_gen/`):
   - Test standalone class: given a class with constructors, verify generated output contains `val new_ : unit -> button_t` in mli and `let new_ () : button_t = new button (Button.new_ ())` in ml
   - Test zero-param constructor vs multi-param constructor
   - Test constructor filtering (skips constructors that throw)

2. **Cyclic group shim module generation**:
   - Test that shim module contains `class type window_t = GCombined.window_t`
   - Test that shim module contains constructor wrappers
   - Test that shim mli has `val new_ : unit -> window_t`

3. **Library module generation**:
   - Test that output contains `module Button = GButton` (not `class button = GButton.button`)
   - Test that cyclic group entities get individual module aliases
   - Test that Wrappers submodule is unchanged
   - Test that enum/bitfield type aliases are unchanged

## Key files to modify

| File | Change |
|------|--------|
| `ocgtk/src/tools/gir_gen/generate/class_gen.ml` | Add constructor wrapper generation after class definition |
| `ocgtk/src/tools/gir_gen/gir_gen.ml` | Pass `~constructors`, generate cyclic group shim modules |
| `ocgtk/src/tools/gir_gen/generate/library_module.ml` | Replace class re-exports with module aliases |
| `ocgtk/examples/*.ml` | Simplify to use `Button.new_with_label` instead of two-step |
| `ocgtk/tests/gtk/test_button.ml` | Update `new button` usage |
| `ocgtk/tests/gtk/test_box.ml` | Update `new box` usage |
| `ocgtk/architecture/linking_and_dead_code_elimination.md` | Update to reflect implementation |
| `ocgtk/src/tools/README_GIR_GEN.md` | Document constructor wrappers and shims |

## Key functions to reuse

- `Utils.ocaml_constructor_name` (utils.ml:321) — GIR ctor name → OCaml name
- `Utils.ocaml_parameter_name` (utils.ml:301) — sanitize param names
- `Layer1_helpers.map_constructor_param` (layer1_helpers.ml:129) — param → OCaml type
- `Layer1_constructor.should_generate_constructor` (layer1_constructor.ml:32) — filter check
- `get_layer2_class_module_reference` (library_module.ml:29) — entity → G* module name
- `Class_gen_helpers.get_module_names` — gets layer1/layer2 module name pair

## Verification

1. `dune build` compiles cleanly
2. `xvfb-run dune runtest` passes
3. Spot-check `gButton.ml`: has `let new_ () : button_t = new button (Button.new_ ())`
4. Spot-check `gButton.mli`: has `val new_ : unit -> button_t`
5. Spot-check `gWindow.ml`: shim module re-exporting from combined module with constructor wrappers
6. Spot-check `Gtk.ml`: no `class ... = G*.` lines, only `module ... = G*` aliases, one per entity
7. Examples compile and use one-step constructor API
