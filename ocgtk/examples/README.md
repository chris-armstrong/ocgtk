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

## Examples

### 1. Counter (`counter.ml`)
**Demonstrates:** Button, Label, basic event handling

A simple counter app with increment and reset buttons. Shows basic window creation, button callbacks, and updating labels.

**Features:**
- Click to increment counter
- Reset button to set counter back to 0
- Label updates on each click

---

### 2. Settings Panel (`settings_panel.ml`)
**Demonstrates:** CheckButton, Radio buttons (CheckButton grouping), ToggleButton, SpinButton

A settings panel showing various input widgets including checkboxes, radio buttons, toggle button, and numeric input.

**Features:**
- Simple checkboxes for preferences
- Radio button group for theme selection (using GTK4 CheckButton grouping)
- Toggle button for advanced mode
- SpinButton for numeric font size selection
- "Show Settings" button to print current configuration

**Note:** This example showcases the nullable parameter support for CheckButton constructors (labels are wrapped in `Some`).

---

### 3. Text Editor (`text_editor.ml`)
**Demonstrates:** TextView, TextBuffer, TextTag, Entry, ScrolledWindow

A simple text editor with basic formatting capabilities.

**Features:**
- Multi-line text editing with TextView
- Scrollable text area
- Entry field to insert new text
- Clear all button
- Character count status
- TextTags for formatting (bold, large font)

**Note:** Demonstrates the Phase 5.3 Text widget bindings.

---

### 4. Login Form (`login_form.ml`)
**Demonstrates:** Entry, PasswordEntry, Button, Label with markup

A login form with username/password fields.

**Features:**
- Username entry field with placeholder
- Password entry field with show/peek icon
- "Remember me" checkbox
- Form validation
- Status messages with colored markup
- Test credentials: username=`admin`, password=`password`

**Note:** Shows PasswordEntry widget and nullable parameter support for placeholders.

---

## Key Features Demonstrated

These examples showcase:
- ✅ **Nullable parameter support** - Constructors like `new_with_label` take `string option`
- ✅ **Text widgets** - TextView, TextBuffer, TextTag (Phase 5.3)
- ✅ **Entry widgets** - Entry, PasswordEntry, SearchEntry
- ✅ **Button widgets** - Button, CheckButton, ToggleButton
- ✅ **GTK4 radio buttons** - Using CheckButton grouping with `set_group`
- ✅ **Proper event handling** - Button callbacks and widget updates
- ✅ **Layout managers** - VBox, HBox, ScrolledWindow

## Notes

- All examples use `GMain.init()` for GTK initialization
- Windows are properly connected to quit the main loop on close
- Examples follow GTK4 conventions (e.g., CheckButton for radio buttons)
