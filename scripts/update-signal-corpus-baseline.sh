#!/bin/bash
# Regenerate gir_gen/test/corpus/signal_corpus_baseline.sexp from live GIR
# files and the same cross-namespace reference data the production generator
# uses.
#
# Usage: ./scripts/update-signal-corpus-baseline.sh
#
# Run this after an intentional classification change in
# signal_marshaller.ml / signal_gen.ml whose effect on the corpus you have
# verified is desirable. Commit the updated baseline alongside the code
# change.
#
# Workflow:
#   1. Build gir_gen.exe and the integration test executable (the latter
#      transitively materialises all *-references.sexp files via the rules
#      in gir_gen/test/corpus/dune).
#   2. Run the "Signal Corpus Regression" suite directly with
#      SIGNAL_CORPUS_BLESS=<absolute baseline path>, which makes the test
#      overwrite the baseline with freshly computed coverage instead of
#      comparing.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
BASELINE="$REPO_ROOT/gir_gen/test/corpus/signal_corpus_baseline.sexp"
TEST_EXE_TARGET="gir_gen/test/test_gir_gen_integration.exe"
TEST_EXE="$REPO_ROOT/_build/default/$TEST_EXE_TARGET"

cd "$REPO_ROOT"

echo "==================================="
echo "Signal corpus baseline refresh"
echo "==================================="
echo "Repository root: $REPO_ROOT"
echo "Baseline file:   $BASELINE"
echo ""

if [ ! -f "$BASELINE" ]; then
    echo "Error: baseline not found at $BASELINE" >&2
    exit 1
fi

echo "Step 1: Building gir_gen and integration test executable..."
echo "-----------------------------------"
# Building the test exe pulls in the corpus/*-references.sexp rules, which
# transitively depend on gir_gen.exe and the GIR overrides. Single dune
# invocation produces everything we need.
dune build --root . "$TEST_EXE_TARGET"

if [ ! -x "$TEST_EXE" ]; then
    echo "Error: built test executable not found at $TEST_EXE" >&2
    exit 1
fi

echo "✓ Built $TEST_EXE_TARGET"
echo ""

echo "Step 2: Rewriting baseline via SIGNAL_CORPUS_BLESS..."
echo "-----------------------------------"
# Run only the regression suite; bless mode writes the new baseline directly
# to the source tree at $BASELINE and skips the comparison check.
SIGNAL_CORPUS_BLESS="$BASELINE" \
  GIR_DATA_DIR="$REPO_ROOT/gir" \
  "$TEST_EXE" test "Signal Corpus Regression"

echo ""
echo "==================================="
echo "Done."
echo "==================================="
echo ""
echo "Updated: $BASELINE"
echo ""
echo "Review the diff with: git diff -- $BASELINE"
echo "If the new counts reflect the intended classification change, commit"
echo "the baseline alongside the code change."
