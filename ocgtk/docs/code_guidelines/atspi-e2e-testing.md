# AT-SPI E2E Testing Guidelines

Guidelines for writing end-to-end tests using the AT-SPI (Accessibility Service Provider Interface) framework.

## Overview

AT-SPI provides a standardized way to test GTK applications by:
- Discovering widgets through accessibility names/roles
- Simulating user actions (clicks, keyboard input)
- Reading widget state and properties
- Testing without modifying application code

## File Structure

E2E tests should live alongside the application they test:

```
examples/my_app/
  my_app.ml              # Application entry point
  my_app_ui.ml           # UI module
  test_my_app_atspi.py   # E2E test harness
  README_ATSPI.md        # Test documentation
```

## Test Script Requirements

### Dependencies

The test script requires system-level PyGObject (not pip-installable):

```bash
# Ubuntu/Debian
sudo apt-get install python3-gi gir1.2-atspi-2.0

# Fedora
sudo dnf install python3-gobject at-spi2-core

# Arch
sudo pacman -S python-gobject at-spi2-core
```

### Script Structure

```python
#!/usr/bin/env python3
import gi
gi.require_version('Atspi', '2.0')
from gi.repository import Atspi
import subprocess
import time

def find_widget_by_name(root, name, role=None):
    """Recursively find a widget by accessibility name."""
    # Implementation...

def click_button(button):
    """Click a button via its action interface."""
    action_iface = button.get_action_iface()
    if action_iface:
        action_iface.do_action(0)  # First action is usually "click"

class TestRunner:
    def start_app(self):
        """Launch the application under test."""
        self.process = subprocess.Popen(['./my_app.exe'])
        time.sleep(2)  # Wait for startup
    
    def run_tests(self):
        """Execute test cases."""
        # Test implementation...
    
    def stop(self):
        """Clean up application process."""
        if self.process:
            self.process.terminate()

if __name__ == '__main__':
    runner = TestRunner()
    try:
        runner.start_app()
        runner.run_tests()
    finally:
        runner.stop()
```

## Key AT-SPI Methods

### Widget Discovery

```python
# Get accessible name (button label, window title, etc.)
name = widget.get_name()

# Get accessible role (PUSH_BUTTON, LABEL, WINDOW, etc.)
role = widget.get_role()

# Navigate widget hierarchy
child_count = widget.get_child_count()
child = widget.get_child_at_index(i)
```

### Action Simulation

```python
# Get action interface
action_iface = widget.get_action_iface()

# Query available actions
n_actions = action_iface.get_n_actions()
action_name = action_iface.get_name(index)

# Perform action
success = action_iface.do_action(index)
```

### Text Access

```python
# Get text interface for labels/entries
text_iface = widget.get_text_iface()
text = text_iface.get_text(0, -1)  # Get all text
```

## Best Practices

### 1. Widget Identification

**DO:** Use accessible names (labels) for identification
```python
# Good: Find by label text
button = find_widget_by_name(window, "Calculate", Atspi.Role.PUSH_BUTTON)
```

**DON'T:** Use coordinates or indices that break with layout changes
```python
# Bad: Will break if layout changes
button = window.get_child_at_index(5).get_child_at_index(2)
```

### 2. Error Handling

Wrap AT-SPI calls in try/except and provide clear error messages:

```python
def safe_click_button(widget):
    try:
        action_iface = widget.get_action_iface()
        if not action_iface:
            raise TestError(f"Widget '{widget.get_name()}' has no actions")
        return action_iface.do_action(0)
    except Exception as e:
        raise TestError(f"Failed to click: {e}")
```

### 3. Timing and Delays

Add small delays between actions to allow UI updates:

```python
click_button(button)
time.sleep(0.2)  # Allow UI to update
click_button(next_button)
time.sleep(0.5)  # Longer for operations that trigger calculations
result = get_result()
```

### 4. Process Management

Always clean up the application process, even on test failures:

```python
try:
    runner.start_app()
    runner.run_tests()
finally:
    runner.stop()  # Ensure cleanup
```

### 5. Debugging

Add a debug function to print the accessibility tree:

```python
def debug_tree(widget, indent=0):
    prefix = "  " * indent
    try:
        name = widget.get_name()
        role = widget.get_role()
        print(f"{prefix}[{role}] '{name}'")
        for i in range(widget.get_child_count()):
            child = widget.get_child_at_index(i)
            debug_tree(child, indent + 1)
    except Exception as e:
        print(f"{prefix}[error: {e}]")
```

## Running Tests

### Interactive Mode

```bash
# Terminal 1: Start application
cd ocgtk && ./_build/default/examples/calculator/calculator.exe

# Terminal 2: Run tests
cd ocgtk/examples/calculator
python3 test_calculator_atspi.py
```

### Headless Mode (CI/CD)

```bash
# Start virtual display
Xvfb :99 -screen 0 1024x768x24 &
export DISPLAY=:99

# Run tests with dbus session
dbus-run-session -- python3 test_calculator_atspi.py
```

## Common Pitfalls

1. **AT-SPI API variations**: Different PyGObject versions have slightly different method signatures. Always wrap calls in try/except.

2. **Timing issues**: Widgets may not be immediately available after app startup. Add delays or poll for widgets.

3. **Accessibility bus not running**: The AT-SPI bus must be running. Use `dbus-run-session` if not in a desktop environment.

4. **Widget name changes**: If UI text changes, tests break. Consider adding accessible IDs in the OCaml code.

## References

- [AT-SPI Documentation](https://docs.gtk.org/atspi2/)
- [PyGObject Reference](https://pygobject.readthedocs.io/)
- [GTK Accessibility](https://docs.gtk.org/gtk4/accessibility.html)
- Example: `examples/calculator/test_calculator_atspi.py`
