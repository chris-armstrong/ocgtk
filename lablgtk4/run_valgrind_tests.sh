#!/bin/bash
# Run LablGTK4 tests with Valgrind memory leak detection
#
# Usage:
#   ./run_valgrind_tests.sh              # Run all tests
#   ./run_valgrind_tests.sh test_widget  # Run specific test
#   VALGRIND_OPTS="..." ./run_valgrind_tests.sh  # Custom valgrind options

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
BUILD_DIR="_build/default/tests"
SUPP_FILE="valgrind.supp"
LOG_DIR="valgrind_logs"

# Default valgrind options (can be overridden via VALGRIND_OPTS env var)
VALGRIND_DEFAULT_OPTS="--leak-check=full \
    --show-leak-kinds=all \
    --track-origins=yes \
    --suppressions=$SUPP_FILE \
    --error-exitcode=1 \
    --gen-suppressions=all"

VALGRIND_OPTS="${VALGRIND_OPTS:-$VALGRIND_DEFAULT_OPTS}"

# Test executables to run
if [ $# -gt 0 ]; then
    # Run specific tests passed as arguments
    TESTS="$@"
else
    # Default: run Phase 3 tests only (skip Phase 1/2 enum tests)
    TESTS="test_widget test_snapshot test_event_controller test_gobj"
fi

# Create log directory
mkdir -p "$LOG_DIR"

echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  LablGTK4 Valgrind Memory Leak Tests                    ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if valgrind is installed
if ! command -v valgrind &> /dev/null; then
    echo -e "${RED}ERROR: valgrind is not installed${NC}"
    echo ""
    echo "Install with:"
    echo "  Ubuntu/Debian: sudo apt-get install valgrind"
    echo "  Fedora: sudo dnf install valgrind"
    echo "  macOS: brew install valgrind"
    exit 1
fi

# Check if suppressions file exists
if [ ! -f "$SUPP_FILE" ]; then
    echo -e "${YELLOW}WARNING: Suppressions file not found: $SUPP_FILE${NC}"
    echo "Tests will show many false positives from GTK/GLib."
    echo ""
fi

# Build tests first
echo -e "${BLUE}Building tests...${NC}"
if command -v dune &> /dev/null; then
    dune build @tests || { echo -e "${RED}Build failed${NC}"; exit 1; }
elif command -v opam &> /dev/null; then
    opam exec -- dune build @tests || { echo -e "${RED}Build failed${NC}"; exit 1; }
else
    echo -e "${RED}ERROR: Neither dune nor opam found${NC}"
    exit 1
fi
echo ""

# Run each test with valgrind
PASSED=0
FAILED=0
FAILED_TESTS=()

for test in $TESTS; do
    TEST_EXE="$BUILD_DIR/${test}.exe"
    LOG_FILE="$LOG_DIR/${test}.log"

    if [ ! -f "$TEST_EXE" ]; then
        echo -e "${YELLOW}SKIP${NC} $test (executable not found)"
        continue
    fi

    echo -e "${BLUE}Testing:${NC} $test"
    echo "  Log: $LOG_FILE"

    # Run with valgrind
    if valgrind $VALGRIND_OPTS --log-file="$LOG_FILE" "$TEST_EXE" > /dev/null 2>&1; then
        # Check for leaks in log
        if grep -q "definitely lost: 0 bytes" "$LOG_FILE" && \
           grep -q "indirectly lost: 0 bytes" "$LOG_FILE"; then
            echo -e "  ${GREEN}✓ PASS${NC} - No memory leaks detected"
            PASSED=$((PASSED + 1))
        else
            echo -e "  ${RED}✗ FAIL${NC} - Memory leaks detected"
            FAILED=$((FAILED + 1))
            FAILED_TESTS+=("$test")

            # Show leak summary
            echo ""
            echo "  Leak summary:"
            grep "definitely lost:" "$LOG_FILE" | sed 's/^/    /'
            grep "indirectly lost:" "$LOG_FILE" | sed 's/^/    /'
            echo ""
        fi
    else
        echo -e "  ${RED}✗ FAIL${NC} - Valgrind reported errors"
        FAILED=$((FAILED + 1))
        FAILED_TESTS+=("$test")

        # Show error summary
        echo ""
        echo "  See $LOG_FILE for details"
        echo ""
    fi
done

echo ""
echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Results                                                 ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${GREEN}Passed:${NC} $PASSED"
echo -e "  ${RED}Failed:${NC} $FAILED"
echo ""

if [ $FAILED -gt 0 ]; then
    echo -e "${RED}Failed tests:${NC}"
    for test in "${FAILED_TESTS[@]}"; do
        echo "  - $test"
        echo "    Log: $LOG_DIR/${test}.log"
    done
    echo ""
    echo -e "${YELLOW}Tip:${NC} Review logs in $LOG_DIR/ for details"
    echo ""
    exit 1
else
    echo -e "${GREEN}All tests passed! No memory leaks detected.${NC}"
    echo ""
    exit 0
fi
