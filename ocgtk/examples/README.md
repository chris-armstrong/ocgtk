# ocgtk4 Examples

This directory contains simple example applications demonstrating various ocgtk4 components.

## Building Examples

```bash
# Build all examples
dune build examples/

# Build specific example
dune build examples/counter.exe
```

## Running Examples

```bash
# Run with dune exec
dune exec examples/counter.exe
dune exec examples/settings_panel.exe
dune exec examples/text_editor.exe
dune exec examples/login_form.exe

# Or run the built executable directly
./_build/default/examples/counter.exe
```

## API Pattern

All examples follow the same pattern:

```ocaml
open Ocgtk_gtk.Gtk           (* Short class names: widget, button, box, etc. *)
module GMain = Ocgtk_gtk.GMain

(* Layer 1: create underlying GTK objects *)
let window_obj = Wrappers.Window.new_ () in
let btn_obj = Wrappers.Button.new_with_label "Click" in

(* Layer 2: wrap in OO classes for methods and signals *)
let window = new window window_obj in
let btn = new button btn_obj in

(* Type coercion: pass child widgets to parent-typed parameters *)
window#set_child (Some (btn :> widget));

(* Use Layer 2 methods for properties and signals *)
btn#set_label "New Label";
ignore (btn#on_clicked ~callback:(fun () -> print_endline "clicked"));
```

## Examples

### 1. Counter (`counter.ml`)
**Demonstrates:** Button, Label, basic event handling

A simple counter app with increment and reset buttons. Shows basic window creation, button callbacks, and updating labels.

---

### 2. Settings Panel (`settings_panel.ml`)
**Demonstrates:** CheckButton, Radio buttons (CheckButton grouping), ToggleButton, SpinButton

A settings panel showing various input widgets including checkboxes, radio buttons, toggle button, and numeric input.

**Note:** Radio button grouping uses Layer 1 `set_group` since CheckButton grouping requires passing L1 types.

---

### 3. Text Editor (`text_editor.ml`)
**Demonstrates:** TextView, TextBuffer, Entry, ScrolledWindow, Button

A simple text editor with insert and clear functionality. Shows how to use ScrolledWindow for scrollable content, TextBuffer for text manipulation, and Entry with EntryBuffer for text input.

---

### 4. Login Form (`login_form.ml`)
**Demonstrates:** Entry, PasswordEntry, Button, Label with markup

A login form with username/password fields. Shows PasswordEntry with peek icon, Label markup, and form validation. Entry and PasswordEntry expose the `GtkEditable` interface methods (`get_text`, `set_text`) directly via L2 inheritance.

Test credentials: username=`admin`, password=`password`

---

### 5. Counter Simple (`counter_simple.ml`)
**Demonstrates:** Layer 1 API directly (Button, CheckButton, ToggleButton)

A non-GUI binding demo using only Layer 1 functions. Useful for verifying bindings work without a display server.

---

### 6. Demo All (`demo_all.ml`)
**Demonstrates:** Comprehensive feature showcase

Tests nullable parameters, radio button grouping, and both Layer 1 and Layer 2 APIs. Non-GUI demo.

---

## Key Features Demonstrated

- **Type coercion** — `(:> widget)` passes any widget subclass to parent-typed methods
- **Nullable parameters** — Constructors like `new_with_label` take `string option`
- **Text widgets** — TextView, TextBuffer, Entry, PasswordEntry
- **Button widgets** — Button, CheckButton, ToggleButton
- **GTK4 radio buttons** — Using CheckButton grouping with `set_group`
- **Event handling** — Button callbacks via `#on_clicked`
- **Layout** — Box (vertical/horizontal), ScrolledWindow

## Notes

- All examples use `GMain.init()` for GTK initialization
- `open Ocgtk_gtk.Gtk` provides short class names and the `Wrappers` module
- Examples follow GTK4 conventions (e.g., CheckButton for radio buttons)
