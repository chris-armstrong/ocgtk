#!/bin/bash
# regenerate_bindings.sh - Regenerate GTK4 widget bindings using gir_gen
#
# This script automates the code generation workflow for lablgtk4.
# Generated files are committed to the repository so CI/CD builds don't
# need to run the generator.
#
# Usage:
#   ./regenerate_bindings.sh [--all]
#
# Options:
#   --all    Regenerate all bindings (controllers + widgets)
#            Default: Only regenerate widgets (Phase 5 bindings)

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║       LablGTK4 Binding Regeneration Script                  ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Check prerequisites
if ! command -v dune &> /dev/null; then
    echo -e "${RED}ERROR: dune not found${NC}"
    echo ""
    echo "Please set up your development environment first."
    echo "See: ../SETUP.md for instructions"
    exit 1
fi

# Check for GIR file
GIR_FILE="${GTK_GIR_FILE:-/usr/share/gir-1.0/Gtk-4.0.gir}"
if [ ! -f "$GIR_FILE" ]; then
    echo -e "${RED}ERROR: GTK GIR file not found: $GIR_FILE${NC}"
    echo ""
    echo "Please install GTK4 development packages or set GTK_GIR_FILE:"
    echo "  export GTK_GIR_FILE=/path/to/Gtk-4.0.gir"
    exit 1
fi

echo -e "${GREEN}✓${NC} Found GIR file: $GIR_FILE"

# Build the generator
echo ""
echo "Building gir_gen..."
dune build src/tools/gir_gen.exe

if [ $? -ne 0 ]; then
    echo -e "${RED}ERROR: Failed to build gir_gen${NC}"
    exit 1
fi

echo -e "${GREEN}✓${NC} gir_gen built successfully"

# Determine what to regenerate
REGENERATE_ALL=false
if [ "$1" = "--all" ]; then
    REGENERATE_ALL=true
fi

# Regenerate event controllers (Phase 3)
if [ "$REGENERATE_ALL" = true ]; then
    echo ""
    echo "════════════════════════════════════════════════════════════════"
    echo "Regenerating Event Controllers (Phase 3)..."
    echo "════════════════════════════════════════════════════════════════"

    ./_build/default/src/tools/gir_gen.exe \
        -mode controllers \
        "$GIR_FILE" \
        src/

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓${NC} Event controllers regenerated"
        echo "  Generated: src/ml_event_controllers_gen.c"
        echo "  Generated: src/event_controller*.mli"
    else
        echo -e "${RED}ERROR: Failed to regenerate event controllers${NC}"
        exit 1
    fi
fi

# Regenerate widgets (Phase 5)
echo ""
echo "════════════════════════════════════════════════════════════════"
echo "Regenerating Widgets (Phase 5)..."
echo "════════════════════════════════════════════════════════════════"

if [ ! -f "src/tools/widget_filter.conf" ]; then
    echo -e "${RED}ERROR: Widget filter not found: src/tools/widget_filter.conf${NC}"
    exit 1
fi

./_build/default/src/tools/gir_gen.exe \
    -mode widgets \
    -filter src/tools/widget_filter.conf \
    "$GIR_FILE" \
    src/

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓${NC} Widget bindings regenerated"
    echo ""
    echo "Generated files:"
    echo "  - src/ml_event_controllers_gen.c (C bindings)"
    echo ""
    echo "  Text Widgets (Phase 5.3):"
    echo "    - src/gtkTextView.mli"
    echo "    - src/gtkTextBuffer.mli"
    echo "    - src/gtkTextTag.mli"
    echo "    - src/gtkTextTagTable.mli"
    echo "    - src/gtkTextMark.mli"
    echo ""
    echo "  Button Widgets (Phase 5.1):"
    echo "    - src/gtkButton.mli"
    echo "    - src/gtkCheckButton.mli"
    echo "    - src/gtkToggleButton.mli"
    echo ""
    echo "  Entry Widgets (Phase 5.2):"
    echo "    - src/entry.mli"
    echo "    - src/search_entry.mli"
    echo "    - src/password_entry.mli"
    echo "    - src/spin_button.mli"
else
    echo -e "${RED}ERROR: Failed to regenerate widget bindings${NC}"
    exit 1
fi

# Check for differences
echo ""
echo "════════════════════════════════════════════════════════════════"
echo "Checking for changes..."
echo "════════════════════════════════════════════════════════════════"

if git diff --quiet src/*.mli src/*.c; then
    echo -e "${GREEN}✓${NC} No changes - generated files are up to date"
else
    echo -e "${YELLOW}!${NC} Generated files have changed"
    echo ""
    echo "Modified files:"
    git diff --name-only src/*.mli src/*.c 2>/dev/null || true
    echo ""
    echo "Next steps:"
    echo "  1. Review the changes: git diff src/"
    echo "  2. Rebuild to verify: dune build"
    echo "  3. Test the changes: ./run_tests.sh"
    echo "  4. Commit if correct: git add src/*.mli src/*.c && git commit -m 'Regenerate bindings'"
fi

echo ""
echo "════════════════════════════════════════════════════════════════"
echo -e "${GREEN}✓ Regeneration complete${NC}"
echo "════════════════════════════════════════════════════════════════"
