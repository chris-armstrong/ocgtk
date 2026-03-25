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
- Apply via `Style_context.add_provider` (requires CssProvider → StyleProvider cast, priority=600 for `GTK_STYLE_PROVIDER_PRIORITY_APPLICATION`)
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

### 2. ~~No `g_application_run()` binding~~ RESOLVED
`Gio.Application.run` is now generated. The `on_activate` signal is also generated on `Application`.
Use the same pattern as `counter.ml`:
```ocaml
let app = Application.new_ (Some "org.ocgtk.Calculator") [`DEFAULT_FLAGS] in
ignore (app#on_activate ~callback:(fun () -> activate app));
let status = app#run 0 None in
exit status
```

### 3. No generated key-pressed/key-released signals
`EventControllerKey` signals only generate `on_im_update`. The `key-pressed` signal has a complex signature (`guint keyval, guint keycode, GdkModifierType → gboolean`).

**Fix approach**: Manual signal connection via `Gobject.Signal.connect`:
```ocaml
let on_key_pressed controller callback =
  let closure = Gobject.Closure.create (fun argv ->
    let keyval = Gobject.Closure.nth argv 1 |> Gobject.Value.get_int in
    let _keycode = Gobject.Closure.nth argv 2 |> Gobject.Value.get_int in
    let _modifiers = Gobject.Closure.nth argv 3 |> Gobject.Value.get_int in
    let handled = callback keyval in
    Gobject.Value.set_boolean (Gobject.Closure.result argv) handled
  ) in
  ignore (Gobject.Signal.connect controller ~name:"key-pressed" ~callback:closure ~after:false)
```
**Note**: `Gobject.Value.get_uint` does not exist. Use `get_int` instead — the values
(keyval, keycode) fit in OCaml int. Available Value accessors: `get_int`, `get_boolean`,
`get_string`, `get_float`, `get_double`, `get_object`.

### 4. No `pango_attr_font_desc_new()` binding
AttrFontDesc has no constructor generated.

**Workaround**: Use `Label.set_markup` with Pango markup for font styling:
```ocaml
label#set_markup "<span font_desc=\"Monospace Bold 24\">0</span>"
```
Or use CSS classes instead (preferred — the CSS theme already sets font styling).

### 5. `PANGO_SCALE` constant not exposed
GIR defines `<constant name="SCALE" value="1024">` but the generator does not yet
handle `<constant>` elements. Constants are first-class GIR artifacts (Pango has 13,
GTK has 97, GDK has 2287, Gio has 130).

**Workaround**: Hardcode `let pango_scale = 1024` if needed. The CSS/markup approach
for font styling avoids needing this constant entirely.

**Future**: Add `<constant>` generation to gir_gen — straightforward `let` bindings
for typed values.

### 6. `0` button spanning 2 columns — NICE TO HAVE
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
| activate | Gio.Application | `app#on_activate` (generated) |
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

## Implementation Stages

Each stage has a clear deliverable and verification step. Do not proceed to the next
stage until the current one passes its verification.

---

### Stage 1: App Shell
**Goal**: Minimal GtkApplication that opens a window and can be closed cleanly.

**Deliverable**: `calculator.ml` — single file, no other modules yet.
- `GtkApplication` with app ID `"org.ocgtk.Calculator"`
- `on_activate` creates a `Window` with title "OCaml GTK4 Calculator", default size 400x500
- Window is presented and can be closed normally

**Files**: `examples/calculator/calculator.ml`, `examples/calculator/dune`

**Verification**:
- `dune build` succeeds
- `xvfb-run dune exec examples/calculator/calculator.exe` starts without crash
- Interactive: window appears, closes with window manager close button
- Process exits with status 0 after window close

---

### Stage 2: Button Grid Layout
**Goal**: All calculator buttons displayed in correct grid layout with two display labels.

**Deliverable**: `calc_ui.ml` + updated `calculator.ml`
- Vertical `Box` containing:
  - Expression label (top, right-aligned, shows placeholder text e.g. "0")
  - Result label (below expression, right-aligned, shows "0")
  - `Grid` (4 columns x 5 rows, homogeneous) with all buttons:
    Row 0: C ( ) /  |  Row 1: 7 8 9 *  |  Row 2: 4 5 6 -  |  Row 3: 1 2 3 +  |  Row 4: 0 . =
- Buttons have correct labels, no click handlers yet (just layout)

**Files**: `examples/calculator/calc_ui.ml`, update `calculator.ml` and `dune`

**Verification**:
- `dune build` succeeds
- Interactive: launch app, visually confirm 5x4 grid of buttons plus two label rows
- Take screenshot under `xvfb-run` for review: `xvfb-run -- bash -c 'dune exec examples/calculator/calculator.exe & sleep 1 && import -window root /tmp/calc_stage2.png && kill %1'`

---

### Stage 3: Pango Cross-Namespace Styling ✅ COMPLETE
**Status**: Completed 2026-03-25

**Goal**: Validate GTK→Pango cross-namespace type flow early, while the UI is simple.

**Deliverable**: Update result label to use `Label.set_markup` with Pango font description.
- Result label rendered with `<span font_desc="Monospace Bold 24">0</span>`
- Expression label uses smaller dim styling via markup (e.g. `<span font_desc="Monospace 12" foreground="#aaaaaa">`)
- Demonstrates cross-namespace type flow: Pango markup interpreted by GTK Label

**Files**: Update `calc_ui.ml`

**Verification**:
- `dune build` succeeds
- Interactive/screenshot: result text is visibly larger and bolder than expression text
- Both labels use monospace font
- Screenshot: `xvfb-run -- bash -c 'dune exec examples/calculator/calculator.exe & sleep 1 && import -window root /tmp/calc_stage3.png && kill %1'`

---

### Stage 4: Expression Parser ✅ COMPLETE
**Status**: Completed 2026-03-25

**Goal**: Pure OCaml expression evaluator with operator precedence and parentheses.

**Deliverable**: `calc_expr.ml` + `test_calc_expr.ml` + `calc_expr.mli`
- Tokenizer: string → token list (numbers, operators `+-*/`, parens, decimal point)
- Recursive descent parser with correct precedence (`*`/`/` before `+`/`-`)
- Evaluator: token list → `(float, string) result`
- Parenthesis auto-close: if unclosed parens at end, auto-close when valid, error when not
- Error cases: division by zero, malformed expressions, unbalanced parens

**Files**: `examples/calculator/calc_expr.ml`, `examples/calculator/test_calc_expr.ml`, update `dune`

**Test cases** (20 unit tests in `test_calc_expr.ml`, run via `dune runtest`):
- Basic arithmetic: `"2+3"` → `Ok 5.0`
- Operator precedence: `"2+3*4"` → `Ok 14.0`
- Parentheses: `"(2+3)*4"` → `Ok 20.0`
- Division by zero: `"10/0"` → `Error`
- Empty expression: `""` → `Error`
- Auto-close parens: `"2*(3+4"` → `Ok 14.0`
- Invalid auto-close: `"2*(3+"` → `Error`
- Decimals: `"3.14*2"` → `Ok 6.28`
- Whitespace tolerance: `"  2 + 3  "` → `Ok 5.0`
- Nested parens: `"((2+3))"` → `Ok 5.0`
- Multiple unclosed: `"((2+3"` → `Ok 5.0`
- Deeply nested: `"(((1+2)+3)+4)"` → `Ok 10.0`
- Negative numbers: `"-5"` → `Ok -5.0`
- Safe evaluate exception handling
- Plus 6 more tests covering edge cases

**Verification**:
- ✅ `dune build` succeeds
- ✅ `dune runtest examples/calculator` passes all 20 tests

**Implementation Notes**:
- Uses `Result.Syntax` bind operators (`let*`) for clean evaluator code
- Array-based token access for O(1) lookup (avoids banned `List.nth`)
- Minimal public interface via `calc_expr.mli` (only 5 exposed functions)
- Type-safe token equality via `[@@deriving eq]`
- Left-associative chaining: `8/2*3 = 12`, not `8/(2*3)`

---

### Stage 5: Calculator State Machine
**Goal**: State module that mediates between raw input events and the expression evaluator.

**Deliverable**: `calc_state.ml` + `test_calc_state.ml`
- `type t = { expression: string; result: string; error: bool }`
- `create ()` → initial state
- `append_char t c` → appends digit/operator/paren to expression
- `backspace t` → removes last character
- `clear t` → resets to initial state
- `evaluate t` → runs `calc_expr.evaluate`, updates result/error fields
- Input validation: prevent consecutive operators, leading operators (except minus), etc.

**Files**: `examples/calculator/calc_state.ml`, `examples/calculator/test_calc_state.ml`, update `dune`

**Test cases**:
- `create() |> append '1' |> append '2' |> append '3'` → expression = `"123"`
- `... |> backspace` → expression = `"12"`
- `... |> clear` → expression = `""`, result = `"0"`, error = false
- `append '2' |> append '+' |> append '3' |> evaluate` → result = `"5"`
- After error, `append` is blocked; only `clear` works
- Consecutive operator replacement: `2+*` → `2*` (last operator wins)

**Verification**:
- `dune build` succeeds
- `xvfb-run dune runtest` passes all test cases

---

### Stage 6: Button Click Handling
**Goal**: Clicking buttons updates the display labels via the state machine.

**Deliverable**: Updated `calc_ui.ml` — wire button `on_clicked` signals to `calc_state`.
- Each button click calls appropriate `calc_state` function
- Expression label updates to show current expression
- Result label updates when `=` is pressed
- `C` button clears both displays
- Error state shows "Error" in result label

**Files**: Update `calc_ui.ml`, update `dune` (add `calc_state` and `calc_expr` modules)

**Verification**:
- `dune build` succeeds
- Interactive: launch app, click buttons, confirm expression label updates live
- Click `2`, `+`, `3`, `=` → result shows `5`
- Click `C` → both displays reset
- Click `1`, `/`, `0`, `=` → result shows "Error"

---

### Stage 7: Keyboard Input
**Goal**: Full keyboard control via `EventControllerKey`.

**Deliverable**: Keyboard handler in `calc_ui.ml`
- Manual `key-pressed` signal connection via `Gobject.Signal.connect` (see Known Issue #3)
- Key mappings: `0-9`, `.`, `+`, `-`, `*`, `/`, `(`, `)`, Enter/`=`, Escape, Backspace
- Same state machine flow as button clicks

**Files**: Update `calc_ui.ml`

**Verification**:
- `dune build` succeeds
- Interactive: launch app, type `2+3` then Enter → result shows `5`
- Escape clears, Backspace deletes last char

---

### Stage 8: E2E Test Harness
**Goal**: Automated xdotool-based test that validates keyboard-driven interaction.

Validate the automation pipeline now — before investing in visual polish — so that
all subsequent stages can be regression-tested automatically.

**Deliverable**: `test_calculator_e2e.ml`
- Launches calculator as subprocess under xvfb
- Uses `xdotool` for keyboard input simulation (type digits/operators, press Enter/Escape)
- Captures screenshots at each step for manual review
- Validates at least:
  - Digit entry: type `123`, screenshot shows expression
  - Basic arithmetic: type `2+3=`, screenshot after `=`
  - Operator precedence: type `2+3*4=`, screenshot after `=`
  - Clear: press Escape, screenshot shows reset
- Exit with non-zero status on failure

**Files**: `examples/calculator/test_calculator_e2e.ml`, update `dune`

**Verification**:
- `dune build` succeeds
- `xvfb-run dune runtest` includes E2E tests and they pass
- Screenshots saved to `/tmp/` for manual review

---

### Stage 9: CSS Styling
**Goal**: Flat modern theme applied via CssProvider.

**Deliverable**: CSS theme + C stub for CssProvider→StyleProvider cast
- C stub: `ml_gtk_css_provider_as_style_provider` (see Known Issue #1)
- CSS classes applied to buttons (operator, equals, clear) and display labels
- `CssProvider.load_from_string` with the theme CSS
- `Style_context.add_provider` via the cast stub

**Files**: `examples/calculator/calc_stubs.c`, update `calc_ui.ml`, update `dune` (add `(c_names calc_stubs)` or `(foreign_stubs ...)`)

**Verification**:
- `dune build` succeeds
- Interactive/screenshot: buttons have colored backgrounds (orange operators, green equals, red clear)
- Display has dark background with white text
- E2E harness screenshot confirms styled UI

---

### Stage 10: Polish and Edge Cases
**Goal**: Handle remaining edge cases, 0-button span, final visual polish.

**Deliverable**:
- 0 button spans 2 columns (if `Grid.attach` width param works)
- Decimal point validation (prevent `1.2.3`)
- Negative number handling (leading minus)
- Large number display formatting
- Window not resizable or has sensible min size

**Files**: Update `calc_ui.ml`, `calc_state.ml`, `test_calc_state.ml`

**Verification**:
- All existing tests still pass (unit + E2E)
- New edge case tests pass
- Interactive: 0 button is wider, app looks polished
- Final screenshot for review
