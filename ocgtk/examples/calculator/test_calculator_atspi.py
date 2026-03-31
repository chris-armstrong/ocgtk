#!/usr/bin/env python3
# /// script
# requires-python = ">=3.9"
# dependencies = [
#     "PyGObject",
# ]
# ///
"""
AT-SPI based E2E test for the OCaml GTK4 Calculator.

This script uses the Accessibility SPI (Service Provider Interface) to:
1. Find the calculator window
2. Simulate button clicks via accessibility actions
3. Verify the result display

Requirements:
    - System PyGObject: sudo apt-get install python3-gi gir1.2-atspi-2.0
    - AT-SPI bus running (usually started automatically with desktop session)
    - GTK application built with accessibility support

Usage:
    # Terminal 1: Start calculator
    cd ocgtk && ./_build/default/examples/calculator/calculator.exe

    # Terminal 2: Run tests
    cd ocgtk/examples/calculator
    python3 test_calculator_atspi.py
"""

import gi
import sys
import time
import subprocess
import os
import traceback

gi.require_version("Atspi", "2.0")
from gi.repository import Atspi

# Test configuration
APP_NAME = "OCaml GTK4 Calculator"
TIMEOUT_MS = 5000


class CalculatorTestError(Exception):
    """Raised when a calculator test fails."""

    pass


def debug_accessible(obj, indent=0):
    """Debug print an accessible object's properties."""
    prefix = "  " * indent
    try:
        # Try to get name
        name = "<error>"
        try:
            name = obj.get_name()
        except Exception as e:
            name = f"<error: {e}>"

        # Try to get role
        role = "<error>"
        try:
            role = obj.get_role()
            role = role.value_name if hasattr(role, "value_name") else str(role)
        except Exception as e:
            role = f"<error: {e}>"

        print(f"{prefix}[{role}] '{name}'")

        # List children
        try:
            child_count = obj.get_child_count()
            for i in range(min(child_count, 10)):  # Limit to 10 children
                try:
                    child = obj.get_child_at_index(i)
                    debug_accessible(child, indent + 1)
                except Exception as e:
                    print(f"{prefix}  [child {i} error: {e}]")
        except Exception as e:
            print(f"{prefix}  [children error: {e}]")

    except Exception as e:
        print(f"{prefix}[debug error: {e}]")


def find_button_by_label(root, label, max_depth=20):
    """Find a push button with the specified label."""
    if max_depth <= 0:
        return None

    try:
        # Check if this is the button we're looking for
        try:
            widget_name = root.get_name()
            widget_role = root.get_role()
            if widget_name == label and widget_role == Atspi.Role.PUSH_BUTTON:
                return root
        except Exception as e:
            print(f"  Debug: Error checking widget: {e}")

        # Recursively search children
        try:
            child_count = root.get_child_count()
            for i in range(child_count):
                try:
                    child = root.get_child_at_index(i)
                    result = find_button_by_label(child, label, max_depth - 1)
                    if result:
                        return result
                except Exception as e:
                    print(f"  Debug: Error getting child {i}: {e}")
        except Exception as e:
            print(f"  Debug: Error getting child count: {e}")

    except Exception as e:
        print(f"  Debug: Error in find_button_by_label: {e}")
        traceback.print_exc()

    return None


def click_button(button):
    """Simulate a click on a button using its accessibility action interface."""
    try:
        button_name = button.get_name()
        print(f"  Debug: Clicking button '{button_name}'")

        action_iface = button.get_action_iface()
        if not action_iface:
            raise CalculatorTestError(f"Button '{button_name}' has no action interface")

        n_actions = action_iface.get_n_actions()
        print(f"  Debug: Button has {n_actions} actions")

        if n_actions == 0:
            raise CalculatorTestError(f"Button '{button_name}' has no actions")

        # List all actions for debugging
        # for i in range(n_actions):
        #     try:
        #         action_name = action_iface.get_name(i)
        #         print(f"  Debug: Action {i}: '{action_name}'")
        #     except Exception as e:
        #         print(f"  Debug: Error getting action {i} name: {e}")

        # Try to click the first action
        success = action_iface.do_action(0)
        if not success:
            raise CalculatorTestError(f"Failed to click button '{button_name}'")

        print(f"  Debug: Successfully clicked button '{button_name}'")

    except Exception as e:
        print(f"  Debug: Exception in click_button: {e}")
        traceback.print_exc()
        raise CalculatorTestError(f"Error clicking button: {e}")


def get_display_text(window):
    """Get the current display value from the calculator window."""
    try:
        # Look for label widgets that contain numeric text
        child_count = window.get_child_count()
        for i in range(child_count):
            try:
                child = window.get_child_at_index(i)

                # Check if this is a label with text
                try:
                    text_iface = child.get_text_iface()
                    if text_iface:
                        text = text_iface.get_text(0, -1)
                        if text and (
                            text.isdigit()
                            or text.replace(".", "").isdigit()
                            or text == "Error"
                        ):
                            return text
                except:
                    pass

                # Try getting name as fallback
                try:
                    name = child.get_name()
                    if name and (
                        name.isdigit()
                        or name.replace(".", "").isdigit()
                        or name == "Error"
                    ):
                        return name
                except:
                    pass

                # Check nested children
                try:
                    nested_count = child.get_child_count()
                    for j in range(nested_count):
                        nested = child.get_child_at_index(j)
                        try:
                            text_iface = nested.get_text_iface()
                            if text_iface:
                                text = text_iface.get_text(0, -1)
                                if text and (
                                    text.isdigit()
                                    or text.replace(".", "").isdigit()
                                    or text == "Error"
                                ):
                                    return text
                        except:
                            pass
                        try:
                            name = nested.get_name()
                            if name and (
                                name.isdigit()
                                or name.replace(".", "").isdigit()
                                or name == "Error"
                            ):
                                return name
                        except:
                            pass
                except:
                    pass

            except Exception as e:
                print(f"  Debug: Error checking child {i}: {e}")
    except Exception as e:
        print(f"  Debug: Error in get_display_text: {e}")

    return None


class CalculatorTester:
    """Test harness for the calculator application."""

    def __init__(self):
        self.app_process = None
        self.window = None
        self.desktop = None

    def start_calculator(self, headless=False):
        """Start the calculator application."""
        calculator_path = os.path.join(
            os.path.dirname(__file__),
            "..",
            "..",
            "_build",
            "default",
            "examples",
            "calculator",
            "calculator.exe",
        )
        calculator_path = os.path.abspath(calculator_path)

        if not os.path.exists(calculator_path):
            calculator_path = calculator_path[:-4]

        if not os.path.exists(calculator_path):
            raise CalculatorTestError(
                f"Calculator executable not found at {calculator_path}"
            )

        env = os.environ.copy()
        env["GTK_MODULES"] = "gail:atk-bridge"

        if headless:
            env["GDK_BACKEND"] = "broadway"
            env["BROADWAY_DISPLAY"] = ":5"

        print(f"Starting calculator: {calculator_path}")
        self.app_process = subprocess.Popen(
            [calculator_path], env=env, stdout=subprocess.PIPE, stderr=subprocess.PIPE
        )

        time.sleep(2)
        self._connect_to_accessibility()

    def _connect_to_accessibility(self):
        """Connect to the AT-SPI accessibility bus."""
        try:
            Atspi.set_timeout(TIMEOUT_MS, TIMEOUT_MS)
            self.desktop = Atspi.get_desktop(0)

            for attempt in range(10):
                self.window = self._find_calculator_window()
                if self.window:
                    print("Connected to calculator window")
                    print("\nDebug: Window accessibility tree:")
                    debug_accessible(self.window)
                    return
                time.sleep(0.5)

            raise CalculatorTestError("Could not find calculator window")
        except Exception as e:
            raise CalculatorTestError(f"Failed to connect to accessibility bus: {e}")

    def _find_calculator_window(self):
        """Find the calculator window in the accessibility tree."""
        try:
            child_count = self.desktop.get_child_count()
            for i in range(child_count):
                try:
                    app = self.desktop.get_child_at_index(i)
                    app_name = app.get_name()
                    print(f"  Debug: Found app: '{app_name}'")
                    if "calculator" in app_name.lower():
                        app_child_count = app.get_child_count()
                        if app_child_count > 0:
                            return app.get_child_at_index(0)
                except Exception as e:
                    print(f"  Debug: Error checking app {i}: {e}")
        except Exception as e:
            print(f"  Debug: Error finding calculator window: {e}")
        return None

    def click_sequence(self, buttons):
        """Click a sequence of buttons."""
        for btn_label in buttons:
            print(f"Looking for button: {btn_label}")
            button = find_button_by_label(self.window, btn_label)
            if not button:
                raise CalculatorTestError(f"Button '{btn_label}' not found")

            print(f"Clicking button: {btn_label}")
            click_button(button)
            time.sleep(0.2)

    def get_display_value(self):
        """Get the current value from the calculator display."""
        return get_display_text(self.window)

    def stop(self):
        """Stop the calculator application."""
        if self.app_process:
            self.app_process.terminate()
            try:
                self.app_process.wait(timeout=5)
            except:
                self.app_process.kill()


def test_basic_addition():
    """Test: 2 + 3 = 5"""
    print("\n=== Test: Basic Addition (2 + 3 = 5) ===")
    tester = CalculatorTester()

    try:
        tester.start_calculator(headless=False)
        tester.click_sequence(["2", "+", "3", "="])
        time.sleep(0.5)

        result = tester.get_display_value()
        if result == "5":
            print("✓ PASS: 2 + 3 = 5")
            return True
        else:
            print(f"✗ FAIL: Expected 5, got {result}")
            return False
    except Exception as e:
        print(f"✗ FAIL: {e}")
        traceback.print_exc()
        return False
    finally:
        tester.stop()


def test_chained_operation():
    """Test: 2 + 3 = then * 4 = 20"""
    print("\n=== Test: Chained Operation (2 + 3 = * 4 = 20) ===")
    tester = CalculatorTester()

    try:
        tester.start_calculator(headless=False)
        tester.click_sequence(["2", "+", "3", "="])
        time.sleep(0.3)
        tester.click_sequence(["*", "4", "="])
        time.sleep(0.5)

        result = tester.get_display_value()
        if result == "20":
            print("✓ PASS: (2 + 3) * 4 = 20")
            return True
        else:
            print(f"✗ FAIL: Expected 20, got {result}")
            return False
    except Exception as e:
        print(f"✗ FAIL: {e}")
        traceback.print_exc()
        return False
    finally:
        tester.stop()


def test_clear():
    """Test: Clear button resets calculator"""
    print("\n=== Test: Clear Button ===")
    tester = CalculatorTester()

    try:
        tester.start_calculator(headless=False)
        tester.click_sequence(["2", "+", "3", "="])
        time.sleep(0.3)
        tester.click_sequence(["C"])
        time.sleep(0.3)

        result = tester.get_display_value()
        if result == "0":
            print("✓ PASS: Clear button resets to 0")
            return True
        else:
            print(f"✗ FAIL: Expected 0 after clear, got {result}")
            return False
    except Exception as e:
        print(f"✗ FAIL: {e}")
        traceback.print_exc()
        return False
    finally:
        tester.stop()


def main():
    """Run all calculator tests."""
    print("=" * 60)
    print("OCaml GTK4 Calculator - AT-SPI E2E Tests")
    print("=" * 60)

    try:
        desktop = Atspi.get_desktop(0)
        print("✓ AT-SPI accessibility bus connected")
    except Exception as e:
        print(f"✗ Cannot connect to AT-SPI: {e}")
        print("\nMake sure you have a desktop session running or:")
        print("  1. Install at-spi2-core")
        print("  2. Run: dbus-run-session -- your-test-command")
        sys.exit(1)

    results = [
        ("Basic Addition", test_basic_addition()),
        ("Chained Operation", test_chained_operation()),
        ("Clear Button", test_clear()),
    ]

    print("\n" + "=" * 60)
    print("Test Summary")
    print("=" * 60)

    passed = sum(1 for _, r in results if r)
    total = len(results)

    for name, result in results:
        status = "✓ PASS" if result else "✗ FAIL"
        print(f"  {status}: {name}")

    print(f"\nTotal: {passed}/{total} tests passed")
    sys.exit(0 if passed == total else 1)


if __name__ == "__main__":
    main()
