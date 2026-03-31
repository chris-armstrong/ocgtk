# AT-SPI E2E Testing for Calculator

This directory contains end-to-end (E2E) tests for the calculator using the AT-SPI (Accessibility Service Provider Interface) framework.

## What is AT-SPI?

AT-SPI is a standard interface for accessibility tools to interact with applications. It allows:
- Finding UI elements by their accessibility names/roles
- Simulating user actions (clicks, keyboard input)
- Reading widget properties and state
- Testing without modifying the application's internal code

## Prerequisites

### System GTK/PyGObject Libraries

PyGObject requires system GTK libraries. Install via your package manager:

```bash
# Ubuntu/Debian
sudo apt-get install python3-gi python3-gi-cairo gir1.2-atspi-2.0

# Fedora
sudo dnf install python3-gobject gtk3 at-spi2-core

# Arch
sudo pacman -S python-gobject gtk3 at-spi2-core
```

**Note:** The script requires PyGObject to be installed via your system package manager (not pip), as it needs system GTK/AT-SPI libraries.

### AT-SPI Bus
The accessibility bus is usually started automatically with your desktop session. If running headless:

```bash
# Option 1: Use dbus-run-session
dbus-run-session -- python3 test_calculator_atspi.py

# Option 2: Start at-spi-bus manually
/usr/lib/at-spi-bus-launcher --launch-immediately
```

## Running the Tests

### Basic Usage
```bash
# Terminal 1: Start calculator
cd ocgtk && ./_build/default/examples/calculator/calculator.exe

# Terminal 2: Run tests
cd ocgtk/examples/calculator
python3 test_calculator_atspi.py
```

### Headless Mode (for CI/CD)
```bash
# With manual display setup
Xvfb :99 -screen 0 1024x768x24 &
export DISPLAY=:99
dbus-run-session -- python3 test_calculator_atspi.py
```

## How It Works

1. **Widget Discovery**: AT-SPI exposes the widget hierarchy from the GTK application
2. **Button Identification**: Buttons are found by their accessible name (the label text)
3. **Action Simulation**: `Atspi.Action.do_action(0)` simulates clicking a button
4. **State Verification**: Label text is read to verify calculations

### Example Flow
```
Test: 2 + 3 = 5

1. Find button "2" → Atspi.Role.PUSH_BUTTON with name="2"
2. Call action_iface.do_action(0) on it
3. Find button "+" → click it
4. Find button "3" → click it
5. Find button "=" → click it
6. Read result label → verify it shows "5"
```

## Test Coverage

Current tests verify:
- **Basic arithmetic**: `2 + 3 = 5`
- **Chained operations**: `(2 + 3) * 4 = 20` (tests the `=` behavior we fixed)
- **Clear functionality**: Reset calculator to initial state

## Limitations

1. **Timing**: Tests include delays between actions to allow UI updates
2. **Display Server**: Requires either:
   - Running X11/Wayland session (for interactive)
   - Xvfb + D-Bus session (for headless)
3. **Accessibility Bus**: Must have `at-spi2-core` installed and running
4. **Widget Names**: Relies on button labels being accessible (GTK default)

## Debugging

### Enable AT-SPI debugging
```bash
export AT_SPI_DEBUG=1
python3 test_calculator_atspi.py
```

### Inspect accessibility tree
```bash
# Install accerciser (GUI accessibility inspector)
sudo apt-get install accerciser  # or equivalent

# Run it while calculator is running
accerciser
```

### List accessible applications
```python
import gi
gi.require_version('Atspi', '2.0')
from gi.repository import Atspi

desktop = Atspi.get_desktop(0)
for i in range(desktop.get_child_count()):
    app = desktop.get_child_at_index(i)
    print(f"App {i}: {app.get_name()} ({app.get_role_name()})")
```

## Architecture Comparison

| Approach | Speed | Isolation | Realism | Complexity |
|----------|-------|-----------|---------|------------|
| **Unit Tests** | Fast | High | Low | Low |
| **State Tests** | Fast | High | Medium | Low |
| **AT-SPI E2E** | Medium | Medium | High | Medium |
| **Screenshot E2E** | Slow | Medium | Highest | High |

AT-SPI offers a good balance - it tests the real application behavior without requiring visual comparison or complex infrastructure.

## Future Enhancements

- [ ] Add keyboard input simulation via Atspi.KeySynth
- [ ] Screenshot comparison for visual regression testing
- [ ] Property-based testing (generate random expressions)
- [ ] CI integration with Xvfb
- [ ] Test error handling (division by zero, malformed input)

## References

- [AT-SPI Documentation](https://docs.gtk.org/atspi2/)
- [PyGObject Tutorial](https://pygobject.readthedocs.io/)
- [GTK Accessibility](https://docs.gtk.org/gtk4/accessibility.html)
