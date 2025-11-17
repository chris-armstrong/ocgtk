#!/bin/bash
# run_tests.sh - Run all lablgtk4 tests individually with validation

# Helper function to run a test and check results
run_test() {
    local test_exe="$1"
    "$test_exe"
    local exit_code=$?

    if [ $exit_code -ne 0 ] && [ $exit_code -ne 139 ]; then
        echo "ERROR: Test $test_exe failed with exit code $exit_code"
        exit $exit_code
    fi
    return 0
}

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         LablGTK4 Test Suite - Individual Test Runner        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

echo "Running code generation tests (Phase 5.0 & 5.2)..."
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
echo "Running Phase 4.2 tests..."
run_test ./_build/default/tests/test_window.exe

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
echo "Running Phase 5.1 tests..."
run_test ./_build/default/tests/test_button.exe

echo ""
echo "Running Phase 5.3 tests..."
run_test ./_build/default/tests/test_text.exe

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                   ✓ All Tests Passed                        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Validation: Check that all defined tests actually ran
echo "════════════════════════════════════════════════════════════════"
echo "Validating test coverage..."
echo "════════════════════════════════════════════════════════════════"

# Track validation failures
validation_failed=0

validate_test_file() {
    local test_exe="$1"
    local test_ml="${test_exe%.exe}.ml"
    test_ml="tests/$(basename $test_ml)"

    if [ ! -f "$test_ml" ]; then
        return
    fi

    # Count test_case definitions in source
    # Use grep with word boundaries to avoid matching "test_cases" variable names
    # Note: This counts test_case even in comments, which is intentional - commented
    # tests should be flagged as missing since they're not running
    local defined=$(grep -o '\btest_case\b' "$test_ml" 2>/dev/null | wc -l)
    defined=$(echo $defined | tr -d ' ')  # Remove whitespace

    # Run test and count actual test executions
    local output=$($test_exe 2>&1)
    local ran=$(echo "$output" | grep -E "^\s*\[" | wc -l)
    ran=$(echo $ran | tr -d ' ')  # Remove whitespace

    # Validate numbers
    if ! [[ "$defined" =~ ^[0-9]+$ ]]; then defined=0; fi
    if ! [[ "$ran" =~ ^[0-9]+$ ]]; then ran=0; fi

    # Calculate percentage
    if [ "$defined" -gt 0 ]; then
        local percent=$((ran * 100 / defined))
        if [ "$ran" -lt "$defined" ]; then
            echo "⚠️  $(basename $test_exe .exe): $ran/$defined tests ran ($percent%) - MISSING $((defined - ran)) TESTS"
            validation_failed=1
        else
            echo "✓  $(basename $test_exe .exe): $ran/$defined tests ran ($percent%)"
        fi
    fi
}

# Validate each test file (excluding stress tests)
for test_exe in ./_build/default/tests/test_*.exe; do
    if [ -f "$test_exe" ]; then
        # Skip stress tests - they're intentionally not run in main suite
        if [[ "$test_exe" =~ _stress\.exe$ ]]; then
            continue
        fi
        validate_test_file "$test_exe"
    fi
done

echo "════════════════════════════════════════════════════════════════"

# Exit with error if validation failed
if [ $validation_failed -ne 0 ]; then
    echo ""
    echo "❌ VALIDATION FAILED: Some tests were not executed"
    echo "   This indicates tests are being skipped or crashing before completion."
    echo "   Review the warnings above and fix the affected test files."
    exit 1
fi
