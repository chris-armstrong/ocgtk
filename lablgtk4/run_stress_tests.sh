#!/bin/bash
# run_stress_tests.sh - Run stress tests that are known to cause issues
#
# WARNING: These tests trigger segfaults due to interactions between OCaml's GC
# and GLib's type system. They are kept for investigation purposes but should
# NOT be run in CI or normal test execution.
#
# Usage:
#   ./run_stress_tests.sh              # Run with no display (will skip GTK tests)
#   xvfb-run -a ./run_stress_tests.sh  # Run with virtual display (tests will run and segfault)

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         LablGTK4 Stress Tests - KNOWN TO SEGFAULT           ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "⚠️  WARNING: These tests are known to cause segmentation faults"
echo "   due to interactions between OCaml GC and GLib's type system."
echo ""
echo "   They are preserved for investigation but should NOT be run"
echo "   in CI or normal development workflows."
echo ""
echo "════════════════════════════════════════════════════════════════"
echo ""

# Build the stress test executable
echo "Building stress tests..."
dune build tests/test_gobject_stress.exe
echo ""

# Run with error handling
echo "Running GObject GC stress tests..."
echo ""

./_build/default/tests/test_gobject_stress.exe
exit_code=$?

echo ""
echo "════════════════════════════════════════════════════════════════"

if [ $exit_code -eq 0 ]; then
    echo "✓ Stress tests completed successfully (unexpected!)"
    echo "  The GC interaction issue may have been resolved."
elif [ $exit_code -eq 139 ]; then
    echo "⚠️  Stress tests segfaulted (expected behavior)"
    echo "  Exit code 139 = SIGSEGV (segmentation fault)"
    echo "  This is the known issue with GValue GC interaction."
elif [ $exit_code -eq 1 ]; then
    echo "ℹ️  Tests were skipped (no display server available)"
    echo "  Use 'xvfb-run -a ./run_stress_tests.sh' to run with virtual display"
else
    echo "❌ Unexpected exit code: $exit_code"
fi

echo "════════════════════════════════════════════════════════════════"

exit $exit_code
