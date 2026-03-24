# Calculator Application Design

Milestone 1 deliverable: a calculator demonstrating cross-namespace type usage across GTK/GDK/Pango.

## Goals (ordered by priority)

1. **Working, usable calculator** — full expression evaluation with operator precedence, parentheses, keyboard input
2. **Cross-namespace type demonstration** — at least 2 namespaces used meaningfully (GTK+Pango, GTK+GDK)
3. **Clean, idiomatic OCaml** — showcases API ergonomics for developers evaluating ocgtk

This is a **showcase**, not a reference example. Sophisticated tricks are acceptable.

## Widget Hierarchy

```
GtkApplication ("org.ocgtk.Calculator")
  |
  Window ("OCaml GTK4 Calculator")
    |
    Box (vertical, spacing=5)
      |
      +-- Label (expression display, right-aligned, monospace, dim/secondary)
      |
      +-- Label (result display, right-aligned, large bold monospace via Pango)
      |
      +-- Grid (4 columns x 5 rows, homogeneous)
            |
            Row 0: [C] [( ] [) ] [/]
            Row 1: [7] [8]  [9] [*]
            Row 2: [4] [5]  [6] [-]
            Row 3: [1] [2]  [3] [+]
            Row 4: [0 (span 2)] [.] [=]
```

Two-row display:
- **Expression row**: shows the expression being built (e.g., `2 + 3 *`)
- **Result row**: shows the evaluated result only when `=`/Enter is pressed

## Calculator Logic

### Expression Evaluation
- **Operator precedence**: `*` and `/` bind tighter than `+` and `-`
- **Parentheses**: full grouping support
- **Immediate evaluation on Enter/=**
- Implementation: recursive descent parser or shunting-yard algorithm on the expression string

### Parenthesis Auto-closing
On `=`/Enter, if there are unclosed parentheses:
- Auto-close **only if** `)` is valid at the current position (e.g., `2 * (3 + 4` → `2 * (3 + 4)`)
- Show **error** if `)` would be invalid (e.g., `2 * (3 +` — closing after operator makes no sense)

### Error Handling
- Division by zero → display "Error"
- Malformed expressions → display "Error"
- Error state requires Clear to reset

### Keyboard Input
Full keyboard mapping via `EventControllerKey`:
- `0-9`, `.` for digits
- `+`, `-`, `*`, `/` for operators
- `(`, `)` for grouping
- `Enter` / `=` to evaluate
- `Escape` to clear
- `Backspace` to delete last character

## Cross-Namespace Demonstrations

### GTK → Pango (font styling) — MUST HAVE
- Create `Pango.Wrappers.Font_description.new_()`
- Set family ("Monospace"), size (24 * `PANGO_SCALE`), weight (`BOLD`)
- Apply to result Label via `Label.set_markup` with Pango markup **OR** via CSS
- Demonstrates cross-namespace type flow: Pango types used in GTK widget methods

### GTK → GDK (display and color) — NICE TO HAVE
- Get style context via `widget#get_style_context`
- Call `Style_context.get_display` → returns `Gdk.Display.t` (cross-namespace return)
- Call `Style_context.get_color` → returns `Gdk.Rgb_a.t` (cross-namespace return)
- Print/log to demonstrate the cross-namespace values work

### GTK CSS Styling — MUST HAVE
- Create `CssProvider`, call `load_from_string` with flat modern styling
- Apply via `Style_context.add_provider` (requires CssProvider → StyleProvider cast)
- Use `widget#add_css_class` for class-based styling (buttons, display)

## Known Technical Issues

### 1. CssProvider → StyleProvider cast
`Style_context.add_provider` expects `Style_provider.t = [`style_provider] Gobject.obj`.
`Css_provider.t = [`css_provider | `object_] Gobject.obj`. Tags don't overlap.

**Fix approach**: Write a small C stub that performs the cast safely on the C side:
```c
CAMLprim value ml_gtk_css_provider_as_style_provider(value provider) {
  /* GtkCssProvider implements GtkStyleProvider — safe upcast */
  return provider; /* Same GObject pointer, just changing OCaml type tag */
}
```
```ocaml
external css_provider_as_style_provider : Css_provider.t -> Style_provider.t
  = "ml_gtk_css_provider_as_style_provider"
```

### 2. No `g_application_run()` binding
The `run` method is not generated for `Gio.Application`.

**Fix approach**: Use manual signal connection for `activate`:
```ocaml
let on_activate app callback =
  let closure = Gobject.Closure.create (fun _argv -> callback ()) in
  ignore (Gobject.Signal.connect app ~name:"activate" ~callback:closure ~after:false)
```
Then call `GMain.init()`, create app, connect activate, and use `GMain.main()`.

**Alternative**: Add a manual C stub for `g_application_run`.

### 3. No generated key-pressed/key-released signals
`EventControllerKey` signals only generate `on_im_update`. The `key-pressed` signal has a complex signature (`guint keyval, guint keycode, GdkModifierType → gboolean`).

**Fix approach**: Manual signal connection via `Gobject.Signal.connect`:
```ocaml
let on_key_pressed controller callback =
  let closure = Gobject.Closure.create (fun argv ->
    let keyval = Gobject.Closure.nth argv 1 |> Gobject.Value.get_uint in
    let _keycode = Gobject.Closure.nth argv 2 |> Gobject.Value.get_uint in
    let _modifiers = Gobject.Closure.nth argv 3 |> Gobject.Value.get_int in
    let handled = callback keyval in
    Gobject.Value.set_boolean (Gobject.Closure.result argv) handled
  ) in
  ignore (Gobject.Signal.connect controller ~name:"key-pressed" ~callback:closure ~after:false)
```
Need to verify `Gobject.Value.get_uint` exists or use appropriate accessor.

### 4. No `pango_attr_font_desc_new()` binding
AttrFontDesc has no constructor generated.

**Workaround**: Use `Label.set_markup` with Pango markup for font styling:
```ocaml
label#set_markup "<span font_desc=\"Monospace Bold 24\">0</span>"
```
Or use CSS classes instead.

### 5. `0` button spanning 2 columns — NICE TO HAVE
`Grid.attach` supports width/height span parameters. Should work but needs verification.

## Module Structure

```
examples/
  calculator/
    calc_expr.ml      — expression tokenizer, parser, evaluator (pure OCaml)
    calc_state.ml     — calculator state machine (current expression, display, error)
    calc_ui.ml        — widget tree, CSS styling, signal wiring, keyboard handler
    calculator.ml     — entry point, GtkApplication setup, activate handler
    dune              — executable definition
```

### calc_expr.ml
Pure expression evaluator — no GTK dependency. Handles:
- Tokenization of expression string into numbers, operators, parens
- Recursive descent or shunting-yard parser with precedence
- Evaluation returning `(float, string) result` (value or error message)
- Parenthesis auto-close logic (check if `)` is valid at end position)

### calc_state.ml
Calculator state machine:
- `type t = { expression: string; result: string; error: bool }`
- `append_char`, `backspace`, `clear`, `evaluate` operations
- Returns updated display strings for both rows

### calc_ui.ml
Widget construction and wiring:
- Build widget tree (window, box, labels, grid, buttons)
- CSS provider setup with flat modern theme
- Pango font description for result display
- EventControllerKey for keyboard input
- Button click handlers delegating to calc_state

### calculator.ml
Entry point:
- Create `Gtk.Application`
- Connect `activate` signal
- In activate: build UI via `calc_ui`, present window

## CSS Theme (flat modern)

```css
.calculator-display {
  background-color: #2d2d2d;
  color: #ffffff;
  padding: 16px;
  border-radius: 8px;
}

.calculator-expression {
  font-size: 14px;
  color: #aaaaaa;
}

.calculator-result {
  font-family: monospace;
  font-size: 32px;
  font-weight: bold;
}

.calculator-button {
  font-size: 18px;
  border-radius: 6px;
  min-height: 48px;
  min-width: 48px;
}

.calculator-button-operator {
  background-color: #ff9500;
  color: white;
}

.calculator-button-equals {
  background-color: #34c759;
  color: white;
}

.calculator-button-clear {
  background-color: #ff3b30;
  color: white;
}
```

## Available APIs (confirmed from source)

| Component | L1 API | L2 Class | Cross-NS |
|-----------|--------|----------|----------|
| Application | `Application_and__window_and__window_group.Application.new_` | `Application.application` | Gio.applicationflags |
| Window | `Wrappers.Window.new_()` | `Window.window` | Gdk.Display via set_display |
| Box | `Wrappers.Box.new_ orient spacing` | `Box.box` | — |
| Button | `Wrappers.Button.new_with_label s` | `Button.button` | — |
| Label | `Wrappers.Label.new_ (Some s)` | `Label.label` | Pango.Attr_list via set_attributes |
| Grid | `Wrappers.Grid.new_()` | `Grid.grid` | — |
| CssProvider | `Wrappers.Css_provider.new_()` | `Css_provider.css_provider` | — |
| EventControllerKey | `Event_controller_key.new_()` | `Event_controller_key.event_controller_key` | — |
| FontDescription | `Pango.Wrappers.Font_description.new_()` | n/a | cross-ns param to Label |
| StyleContext | via `widget#get_style_context` | `Style_context.style_context` | Gdk.Rgb_a, Gdk.Display |
| Widget | — | inherited by all | add_controller, add_css_class |

## Signals

| Signal | Widget | Method |
|--------|--------|--------|
| clicked | Button | `button#on_clicked` (generated) |
| activate | Gio.Application | Manual via `Gobject.Signal.connect` |
| key-pressed | EventControllerKey | Manual via `Gobject.Signal.connect` |
| close-request | Window | Manual via `Gobject.Signal.connect` (pattern from counter.ml) |

## Build Configuration

```
(executable
 (name calculator)
 (modules calc_expr calc_state calc_ui calculator)
 (libraries ocgtk))
```

## E2E Testing

Tests live alongside the calculator in `examples/calculator/`.

### Approach
- Run calculator under `xvfb-run`
- Use `xdotool` for input simulation (keyboard typing, mouse clicks)
  - If AT-SPI bindings are available, prefer those for semantic widget interaction
- Automated validation: capture widget state (label text) to verify functionality
- Screenshot capture for manual visual review

### Test Cases
1. **Digit entry**: type `123`, verify expression display shows `123`
2. **Basic arithmetic**: type `2+3=`, verify result shows `5`
3. **Operator precedence**: type `2+3*4=`, verify result shows `14`
4. **Parentheses**: type `(2+3)*4=`, verify result shows `20`
5. **Division by zero**: type `1/0=`, verify error state
6. **Clear**: type `123`, press C, verify cleared
7. **Backspace**: type `123`, backspace, verify `12`
8. **Paren auto-close**: type `2*(3+4=`, verify result shows `14`
9. **Invalid paren close**: type `2*(3+=`, verify error
10. **Keyboard input**: full keyboard-driven test
11. **Button clicks**: mouse-driven test via xdotool coordinates or AT-SPI

### Test Harness
OCaml test executable that:
1. Launches calculator as subprocess
2. Waits for window to appear
3. Sends input via xdotool
4. Captures screenshots via xdotool/import
5. Validates output (method TBD — possibly reading widget text via AT-SPI, or screenshot OCR as fallback)

## Implementation Sequence

1. **calc_expr.ml** — expression parser/evaluator (pure, testable standalone)
2. **calc_state.ml** — state machine wrapping calc_expr
3. **calc_ui.ml** — basic window + vbox + two labels + grid with buttons + click handlers
4. **calculator.ml** — GtkApplication entry point with activate signal
5. **CssProvider cast fix** — small C stub for StyleProvider interface
6. **CSS styling** — flat modern theme via CssProvider
7. **Keyboard input** — EventControllerKey with manual signal connection
8. **Pango font styling** — FontDescription or markup for result display
9. **E2E test harness** — xdotool-based test runner
10. **0-button column span** — if time permits
