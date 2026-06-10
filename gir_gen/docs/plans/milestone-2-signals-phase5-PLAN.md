# Implementation Plan: Form Example Application (Phase 5)

> Source: `gir_gen/docs/plans/milestone-2-signals.md`
> Parent: Milestone 2: Signal Handling with Parameters
> Branch: `m4-phase5` (from `signals-ii`)

## Overview

Phase 5 creates `ocgtk/examples/form_example.ml` — a GTK4 desktop application that exercises the full breadth of generated signal connectors. It is a **contact form** demonstrating:

- **Simple signals** (`on_clicked`, `on_activate`, `on_toggled`) on basic widgets
- **Signals with return values** (`on_close_request` returning `true` to block close)
- **Signals with parameters** (`on_window_added` / `on_window_removed` receiving `Window.t`)
- **Cross-namespace signals** (`EventControllerKey.on_key_pressed` with `GdkModifierType`)
- **Keyboard shortcuts** (`Ctrl+Q` bound to Cancel/Quit)
- **Clickable links** (`LinkButton.on_activate_link` opening a ToS view)
- **Input validation** (`Entry.on_activate` and `SpinButton.on_value_changed`)

The example uses `Gtk.Application` (generated L2) for proper desktop-app lifecycle, and a secondary window for the Terms of Service to exercise `on_window_added` / `on_window_removed`.

As part of this work we also **update `login_form.ml`** to replace its hand-written `Gobject.Closure.create` for `close-request` with the generated `Window.on_close_request` method.

### Goal

Every major signal archetype used in a real desktop application is exercised end-to-end through generated L1/L2 code, not hand-written closures.

### Non-goals

- AT-SPI E2E tests (Phase 5b; out of scope here)
- Every possible GTK widget signal (corpus regression is Phase 6)
- GSettings / portal integration
- CSS customisation beyond built-in GTK classes

---

## Architecture

### Application structure

```
Gtk.Application (L2)
  └── on_activate → creates MainWindow
  └── on_window_added → updates status count
  └── on_window_removed → updates status count

MainWindow (Gtk.ApplicationWindow or Gtk.Window)
  ├── on_close_request → returns true, shows "Please submit or cancel"
  ├── EventControllerKey (CAPTURE phase)
  │   └── on_key_pressed → Ctrl+Q → cancel/quit
  │
  └── Content Box (VERTICAL)
      ├── Header / Title
      ├── Form Grid (2 columns: label + widget)
      │   ├── Name     → Entry (on_activate → validate non-empty)
      │   ├── Email    → Entry (on_activate → validate non-empty)
      │   ├── Age      → SpinButton (on_value_changed → clamp 0-120)
      │   ├── Reason to join → TextView (on_insert_at_cursor / on_backspace → set dirty)
      │   └── Terms    → CheckButton (on_toggled)
      ├── LinkButton   → "Terms of Service" (on_activate_link → open ToS)
      ├── Button Row   → Submit + Cancel
      │   ├── Submit → on_clicked → validate all fields, show success
      │   └── Cancel → on_clicked → reset fields
      ├── Status Label → "Press Ctrl+Q to cancel and quit"
      └── Status Bar → "Windows: 1"

ToSWindow (Gtk.Window, spawned on LinkButton click)
  └── on_close_request → allow close (return false)
  └── WebView or Label with ToS text
```

### Signal inventory

| Signal | Archetype | Generated? | Usage |
|--------|-----------|------------|-------|
| `Application.on_activate` | void, 0 params | ✅ | Bootstrap UI |
| `Application.on_window_added` | void, GObject param | ✅ | Track window count |
| `Application.on_window_removed` | void, GObject param | ✅ | Track window count |
| `Window.on_close_request` | bool, 0 params | ✅ | Block close if dirty |
| `Entry.on_activate` | void, 0 params | ✅ | Validate on Enter key |
| `SpinButton.on_value_changed` | void, 0 params | ✅ | Age range validation |
| `CheckButton.on_toggled` | void, 0 params | ✅ | Terms acceptance |
| `Button.on_clicked` | void, 0 params | ✅ | Submit / Cancel |
| `LinkButton.on_activate_link` | void, 0 params | ✅ | Open ToS window |
| `EventControllerKey.on_key_pressed` | bool, 3 params (cross-namespace flags) | ✅ | `Ctrl+Q` shortcut |

### `login_form.ml` migration

Replace the hand-written `on_close_request` function (lines 7-15) with a direct call to `window#on_close_request` and remove the `Gobject.Closure.create` / `Gobject.Signal.connect` block. This demonstrates that generated signals cover the use case that previously required manual closure wiring.

---

## Execution Order

1. **Epoch 1** — Migrate `login_form.ml` + scaffold `form_example.ml` + dune entries
2. **Epoch 2** — Core form widgets and simple signals (Entry, SpinButton, CheckButton)
3. **Epoch 3** — Application lifecycle + advanced signals (close-confirm, keyboard shortcuts)
4. **Epoch 4** — Integration: Submit/Cancel logic, status bar, ToS window spawning
5. **Epoch 5** — Review, fix violations, final build + test verification

---

## Epoch 1: Scaffolding and `login_form.ml` Migration

### Goal

`login_form.ml` uses generated `on_close_request`. `form_example.ml` skeleton exists and compiles.

### Stage 1.1 — Migrate `login_form.ml` to generated `on_close_request`

**Files:**
- `ocgtk/examples/login_form.ml`

**Steps:**
1. Remove the `on_close_request` helper function (lines 7-15) that manually calls `Gobject.Closure.create` / `Gobject.Signal.connect`
2. Replace `on_close_request window_obj (fun () -> GMain.quit ())` (line 24) with:
   ```ocaml
   ignore (window#on_close_request ~callback:(fun () -> GMain.quit (); false) ());
   ```
3. Verify the file compiles and the semantics are preserved: close-request handler quits the main loop and returns `false` (allowing the window to close)

**Acceptance criteria:**
- [ ] `login_form.ml` no longer contains `Gobject.Closure.create`
- [ ] `dune build ocgtk/examples/login_form.exe` compiles
- [ ] Close-request behaviour is functionally equivalent (click X → app quits)

---

### Stage 1.2 — Create `form_example.ml` skeleton and dune entry

**Files:**
- `ocgtk/examples/form_example.ml` — create
- `ocgtk/examples/dune` — add executable entry

**Steps:**
1. Create `form_example.ml` with skeleton:
   ```ocaml
   open Ocgtk_gtk.Gtk
   open Ocgtk_gio.Gio
   module GMain = Ocgtk_gtk.GMain
   ```
2. Add minimal `let () = ...` that creates an `Application`, wires `on_activate`, and calls `GMain.init ()` / `Application.run`
3. Add dune entry:
   ```dune
   (executable
    (name form_example)
    (modules form_example)
    (libraries ocgtk))
   ```

**Acceptance criteria:**
- [ ] `dune build ocgtk/examples/form_example.exe` compiles
- [ ] Running the executable prints nothing and exits (skeleton is safe)

---

## Epoch 2: Core Form Widgets and Simple Signals

### Goal

`form_example.ml` has all form widgets created and wired to callback stubs.

### Stage 2.1 — Entry fields (Name, Email) with `on_activate`

**Files:**
- `ocgtk/examples/form_example.ml`

**Steps:**
1. Inside the `on_activate` callback of the application, create a vertical `Box` as the main content
2. Create a `Grid` for the form (2 columns: label + widget)
3. Add "Name:" label and `Entry`
4. Add "Email:" label and `Entry`
5. Wire each `Entry`'s `on_activate` to a function that checks if text is empty and updates a shared status ref

**Acceptance criteria:**
- [ ] Both Entry widgets fire their `on_activate` callback when Enter is pressed
- [ ] Callbacks update a shared validation state ref

---

### Stage 2.2 — SpinButton (Age) with `on_value_changed`

**Files:**
- `ocgtk/examples/form_example.ml`

**Steps:**
1. Add "Age:" label and a `SpinButton` with range 0–120, initial value 25, step 1
2. Wire `SpinButton#on_value_changed` to clamp the value or update a ref

**Acceptance criteria:**
- [ ] SpinButton displays integers only (no decimals)
- [ ] `on_value_changed` callback updates age ref on each change

---

### Stage 2.3 — TextView ("Reason to join") with live-edit signals

**Files:**
- `ocgtk/examples/form_example.ml`

**Steps:**
1. Add "Reason to join:" label and a `TextView` (multi-line text area)
2. Wire `TextView#on_insert_at_cursor` to set `dirty = true`
3. Wire `TextView#on_backspace` to set `dirty = true`
4. Add a `TextBuffer` backing store (via `Text_view.new_with_buffer` or the default buffer)
5. *(Optional)* Wire `Text_buffer.on_changed` to set `dirty = true` if the text-buffer signals are preferred over widget-level signals

**Acceptance criteria:**
- [ ] Typing or deleting text in the TextView sets the `dirty` ref
- [ ] The "Reason to join" field is visually distinguishable as multi-line (taller, word-wrap enabled)
- [ ] `Gobject.Closure.create` does not appear in this stage (all signals are generated)

---

### Stage 2.4 — CheckButton (Terms) and LinkButton (ToS)

**Files:**
- `ocgtk/examples/form_example.ml`

**Steps:**
1. Add a `CheckButton` with label "I agree to the Terms of Service"
2. Wire `on_toggled` to update a `terms_accepted` ref
3. Add a `LinkButton` with label "Terms of Service" and URL `https://example.com/tos`
4. Wire `on_activate_link` to open a secondary ToS window (stub — actual implementation in Epoch 4)

**Acceptance criteria:**
- [ ] CheckButton toggles the `terms_accepted` ref
- [ ] LinkButton `on_activate_link` fires (stub prints to stdout for now)

---

## Epoch 3: Application Lifecycle and Advanced Signals

### Goal

`form_example.ml` uses `Gtk.Application` with window tracking, close-confirm, and keyboard shortcuts.

### Stage 3.1 — Add `Gtk.Application` with `on_activate`, `on_window_added`, `on_window_removed`

**Files:**
- `ocgtk/examples/form_example.ml`

**Steps:**
1. Create `Application` with app-id `"com.example.FormApp"` and default flags
2. Wire `on_activate` to create the main window and show it
3. Wire `on_window_added` to increment a `window_count` ref
4. Wire `on_window_removed` to decrement the `window_count` ref and update a status label
5. Call `Application.run` (or `GMain.main ()` after `present ()`) depending on the generated API

**Acceptance criteria:**
- [ ] Application starts and shows a window
- [ ] Status label shows "Windows: 1" on startup
- [ ] When ToS window opens (later), status label increments to "Windows: 2"
- [ ] When ToS window closes, status label decrements to "Windows: 1"

---

### Stage 3.2 — Add `Window.on_close_request` (close-confirm)

**Files:**
- `ocgtk/examples/form_example.ml`

**Steps:**
1. Add a `dirty` ref that tracks whether the form has unsaved changes
2. Wire `Window#on_close_request` to:
   - Check `dirty` ref
   - If dirty: update status label to "Please submit or cancel before closing." and return `true`
   - If clean: return `false` (allow close)
3. Set `dirty` to `true` on any field change (Entry activate, SpinButton value change, CheckButton toggle)

**Acceptance criteria:**
- [ ] Closing the window while `dirty = true` prevents close and shows the message
- [ ] Closing the window while `dirty = false` allows close

---

### Stage 3.3 — Add `EventControllerKey` for `Ctrl+Q` shortcut

**Files:**
- `ocgtk/examples/form_example.ml`

**Steps:**
1. Create an `EventControllerKey`
2. Set propagation phase to `CAPTURE`
3. Wire `on_key_pressed` to check for `Ctrl+Q` (`keyval = 0x71` / `'q'`, state contains `CONTROL_MASK`)
4. On match: reset the form (same as Cancel) and return `true` (handled)
5. Add a visible label: "Press Ctrl+Q to cancel and quit"

**Acceptance criteria:**
- [ ] Pressing `Ctrl+Q` resets the form fields
- [ ] The key event is consumed (returns `true`) so it doesn't propagate further

---

## Epoch 4: Integration and Polish

### Goal

Submit/Cancel logic works. ToS window spawns and closes correctly via `LinkButton.on_activate_link`.

### Stage 4.1 — Wire Submit and Cancel buttons

**Files:**
- `ocgtk/examples/form_example.ml`

**Steps:**
1. Add a horizontal button box with "Submit" and "Cancel" buttons
2. **Submit**: validate all fields (name non-empty, email contains '@', age > 0, reason-to-join non-empty, terms accepted). On success: show green markup status "Submitted!", set `dirty = false`. On failure: show red markup status with specific error message (e.g. "Please fill in the Reason to join field").
3. **Cancel**: reset all fields to defaults, set `dirty = false`, clear status label

**Acceptance criteria:**
- [ ] Submit shows success when all fields valid
- [ ] Submit shows specific error when a field is invalid
- [ ] Cancel resets all widgets to initial state

---

### Stage 4.2 — Add status bar and window tracking display

**Files:**
- `ocgtk/examples/form_example.ml`

**Steps:**
1. Add a bottom status bar label showing "Windows: N"
2. Update it from `on_window_added` / `on_window_removed` callbacks

**Acceptance criteria:**
- [ ] Status bar updates correctly when ToS window opens and closes

---

### Stage 4.3 — `LinkButton` callback opens ToS window

**Files:**
- `ocgtk/examples/form_example.ml`

**Steps:**
1. In `LinkButton.on_activate_link` callback:
   a. Create a new `Gtk.Window` (not an ApplicationWindow)
   b. Set title "Terms of Service"
   c. Set a `Label` child with ToS text (paragraph of lorem ipsum)
   d. Wire `Window#on_close_request` to return `false` (allow close)
   e. Call `present ()`
2. The `Application.on_window_added` callback (already wired in Stage 3.1) will pick it up automatically because the window is added to the application

**Acceptance criteria:**
- [ ] Clicking the ToS link opens a new window
- [ ] The new window increments the window count
- [ ] Closing the ToS window decrements the window count

---

## Epoch 5: Review and Final Verification

### Goal

Code passes all reviews, build is green, and `form_example.ml` is ready for merge.

### Stage 5.1 — Code review

**Steps:**
1. Run `@review` on changed files in `ocgtk/examples/`
2. Check for Must Fix / Should Fix violations

**Acceptance criteria:**
- [ ] Review completes with zero Must Fix violations

---

### Stage 5.2 — Fix violations

**Steps:**
1. Address any Must Fix / Should Fix from review
2. Re-run `@review` if needed
3. Run `dune build` to verify compilation

**Acceptance criteria:**
- [ ] All Must Fix violations resolved
- [ ] `dune build` passes

---

### Stage 5.3 — Final build + test verification

**Steps:**
1. Run `dune build` from repo root
2. Run `dune test gir_gen/`
3. Run `xvfb-run dune test ocgtk/`
4. Verify `form_example.exe` and `login_form.exe` compile successfully

**Acceptance criteria:**
- [ ] `dune build` passes with no errors
- [ ] `dune test gir_gen/` passes
- [ ] `xvfb-run dune test ocgtk/` passes
- [ ] Both examples compile: `dune build ocgtk/examples/form_example.exe ocgtk/examples/login_form.exe`

---

## Files

| Action | File | Description |
|--------|------|-------------|
| Modify | `ocgtk/examples/login_form.ml` | Replace hand-written `close-request` with generated `on_close_request` |
| Modify | `ocgtk/examples/dune` | Add `form_example` executable entry |
| Create | `ocgtk/examples/form_example.ml` | New contact form example (~180–220 lines) |

---

## Verification (Phase 5 Definition of Done)

- [ ] `login_form.ml` no longer contains hand-written `Gobject.Closure.create` / `Gobject.Signal.connect`
- [ ] `form_example.ml` uses `Gtk.Application` with generated signals
- [ ] `form_example.ml` exercises ≥10 distinct generated signal types
- [ ] `Window.on_close_request` blocks close when `dirty = true`
- [ ] `EventControllerKey.on_key_pressed` handles `Ctrl+Q`
- [ ] `Application.on_window_added` / `on_window_removed` track window count
- [ ] `LinkButton.on_activate_link` opens a secondary window
- [ ] `dune build` clean (no warnings)
- [ ] `dune test gir_gen/ && xvfb-run dune test ocgtk/` green
- [ ] Code review passes with no Must Fix violations

---

## Appendix: Signal Archetype Coverage Matrix

This is the checklist the form example validates:

| Archetype | Signal | Testable in Example? |
|-----------|--------|---------------------|
| void, 0 params | `on_clicked`, `on_activate`, `on_toggled` | ✅ Yes |
| void, GObject param | `on_window_added`, `on_window_removed` | ✅ Yes |
| bool return, 0 params | `on_close_request` | ✅ Yes |
| bool return, primitive params | `EventControllerKey.on_key_pressed` | ✅ Yes |
| bool return, cross-namespace flags | `EventControllerKey.on_key_pressed` (`GdkModifierType`) | ✅ Yes |
| void, 0 params (link) | `LinkButton.on_activate_link` | ✅ Yes |
| void, 0 params (value changed) | `SpinButton.on_value_changed` | ✅ Yes |
| void, string param (text edit) | `TextView.on_insert_at_cursor` | ✅ Yes |
| void, 0 params (text edit) | `TextView.on_backspace` | ✅ Yes |
| `Gobject.Closure.create` fallback | None (all generated) | ✅ Goal |
