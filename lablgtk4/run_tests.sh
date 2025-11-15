#!/bin/bash
# run_tests.sh - Run all lablgtk4 tests individually
#
# WHY: GTK/GDK creates process-wide state that doesn't clean up properly
# when multiple test executables run via dune's test harness. This causes
# segmentation faults during process cleanup (AFTER tests pass).
#
# SOLUTION: Run each test executable separately to isolate GTK/GDK state.
#
# This script is the canonical way to run all tests for lablgtk4.

set -e  # Exit on first failure

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         LablGTK4 Test Suite - Individual Test Runner        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

echo "Running code generation tests..."
./_build/default/src/tools/test_gir_gen.exe
echo ""

echo "Running library tests..."
./_build/default/tests/test_enum_roundtrip.exe
./_build/default/tests/test_enum_values.exe
./_build/default/tests/test_all_enums.exe
./_build/default/tests/test_ffi_integration.exe
./_build/default/tests/test_glib.exe
./_build/default/tests/test_gobject.exe
./_build/default/tests/test_gdkpixbuf.exe
./_build/default/tests/test_gdk.exe
./_build/default/tests/test_pango.exe
./_build/default/tests/test_clipboard.exe
./_build/default/tests/test_widget.exe
./_build/default/tests/test_snapshot.exe

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                   ✓ All Tests Passed                        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
