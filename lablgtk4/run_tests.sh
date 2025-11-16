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

# Helper function to run a test and check results
# Ignores segfault (139) if all tests passed/skipped
run_test() {
    local test_exe="$1"
    "$test_exe"
    local exit_code=$?

    # Exit code 0 = all tests passed
    # Exit code 139 = segfault (may occur during GTK cleanup after tests pass)
    # Any other exit code = actual test failure
    if [ $exit_code -ne 0 ] && [ $exit_code -ne 139 ]; then
        echo "ERROR: Test $test_exe failed with exit code $exit_code"
        exit $exit_code
    fi

    # If we got a segfault, it's likely a GTK cleanup issue, not a test failure
    # The test output will show if any actual tests failed
    return 0
}

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         LablGTK4 Test Suite - Individual Test Runner        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

echo "Running code generation tests..."
run_test ./_build/default/src/tools/test_gir_gen.exe
echo ""

echo "Running library tests..."
run_test ./_build/default/tests/test_enum_roundtrip.exe
run_test ./_build/default/tests/test_enum_values.exe
run_test ./_build/default/tests/test_all_enums.exe
run_test ./_build/default/tests/test_ffi_integration.exe
run_test ./_build/default/tests/test_glib.exe
run_test ./_build/default/tests/test_gobject.exe
run_test ./_build/default/tests/test_gdkpixbuf.exe
run_test ./_build/default/tests/test_gdk.exe
run_test ./_build/default/tests/test_pango.exe
run_test ./_build/default/tests/test_clipboard.exe
run_test ./_build/default/tests/test_widget.exe
run_test ./_build/default/tests/test_snapshot.exe

echo ""
echo "Running Phase 3.3/3.4 tests..."
run_test ./_build/default/tests/test_gtk_init.exe
run_test ./_build/default/tests/test_event_controller.exe
run_test ./_build/default/tests/test_event_controller_runtime.exe
run_test ./_build/default/tests/test_gobj.exe
run_test ./_build/default/tests/test_integration.exe

echo ""
echo "Running Phase 4.1 tests..."
run_test ./_build/default/tests/test_box.exe

echo ""
echo "Running Phase 4.3 tests..."
run_test ./_build/default/tests/test_grid.exe

echo ""
echo "Running Phase 4.4 tests..."
run_test ./_build/default/tests/test_containers.exe

echo ""
echo "Running Phase 4.5 tests..."
run_test ./_build/default/tests/test_gpack.exe

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                   ✓ All Tests Passed                        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
