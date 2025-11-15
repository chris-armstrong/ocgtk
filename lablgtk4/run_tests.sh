#!/bin/bash
# run_tests.sh - Run all lablgtk4 tests individually
#
# WHY: Dune's process spawning mechanism (vfork + worker threads) creates a
# race condition with OCaml 5.x runtime's global root cleanup during process
# exit. This causes segmentation faults AFTER tests complete successfully.
#
# SOLUTION: Run each test executable in simple sequential execution, avoiding
# dune's complex process management entirely.
#
# This script is the canonical way to run all tests for lablgtk4.
# See tests/dune for detailed technical explanation.

set -e  # Exit on first failure

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         LablGTK4 Test Suite - Individual Test Runner        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Run each test executable
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

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                   ✓ All Tests Passed                        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
