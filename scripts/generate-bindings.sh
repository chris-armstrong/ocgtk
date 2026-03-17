#!/bin/bash
# Generate OCaml bindings from GIR files using gir_gen
# Usage: ./scripts/generate-bindings.sh [GIR_PATH]
#
# Set GIR_PATH to override the default location of GIR files
# Default: /usr/share/gir-1.0

set -e

# Configuration
GIR_PATH="${1:-${GIR_PATH:-/usr/share/gir-1.0}}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
# The dune workspace is in the ocgtk subdirectory, NOT the repository root
WORKSPACE_ROOT="$REPO_ROOT/ocgtk"
BUILD_DIR="$WORKSPACE_ROOT/_build/references"
GIR_GEN="$WORKSPACE_ROOT/_build/default/src/tools/gir_gen/gir_gen.exe"

echo "==================================="
echo "OCaml GTK Bindings Generator"
echo "==================================="
echo "GIR files: $GIR_PATH"
echo "Repository root: $REPO_ROOT"
echo "Workspace root: $WORKSPACE_ROOT"
echo ""

# Change to workspace root (where dune-project is)
cd "$WORKSPACE_ROOT"

# Step 0: Build gir_gen tool
echo "Step 0: Building gir_gen tool..."
echo "-----------------------------------"
dune build src/tools/gir_gen/gir_gen.exe

if [ ! -f "$GIR_GEN" ]; then
    echo "Error: gir_gen not found at $GIR_GEN"
    exit 1
fi

echo "✓ gir_gen built successfully"
echo ""

# Ensure build directory exists for reference files
mkdir -p "$BUILD_DIR"

# Step 1: Generate reference files
echo "Step 1: Generating cross-namespace reference files..."
echo "-----------------------------------"

echo "  [1/8] Generating Cairo references..."
"$GIR_GEN" references "$GIR_PATH/cairo-1.0.gir" "$BUILD_DIR/cairo-references.sexp"

echo "  [2/8] Generating GIO references..."
"$GIR_GEN" references "$GIR_PATH/Gio-2.0.gir" "$BUILD_DIR/gio-references.sexp"

echo "  [3/8] Generating GDK references..."
"$GIR_GEN" references "$GIR_PATH/Gdk-4.0.gir" "$BUILD_DIR/gdk-references.sexp"

echo "  [4/8] Generating Graphene references..."
"$GIR_GEN" references "$GIR_PATH/Graphene-1.0.gir" "$BUILD_DIR/graphene-references.sexp"

echo "  [5/8] Generating GdkPixbuf references..."
"$GIR_GEN" references "$GIR_PATH/GdkPixbuf-2.0.gir" "$BUILD_DIR/gdkpixbuf-references.sexp"

echo "  [6/8] Generating Pango references..."
"$GIR_GEN" references "$GIR_PATH/Pango-1.0.gir" "$BUILD_DIR/pango-references.sexp"

echo "  [7/8] Generating GSK references..."
"$GIR_GEN" references "$GIR_PATH/Gsk-4.0.gir" "$BUILD_DIR/gsk-references.sexp"

echo "  [8/8] Generating GTK references..."
"$GIR_GEN" references "$GIR_PATH/Gtk-4.0.gir" "$BUILD_DIR/gtk-references.sexp"

echo ""
echo "Step 2: Generating OCaml bindings..."
echo "-----------------------------------"

echo "  [1/8] Generating Cairo bindings..."
"$GIR_GEN" generate "$GIR_PATH/cairo-1.0.gir" src/cairo

echo ""
echo "  [2/8] Generating GIO bindings..."
"$GIR_GEN" generate "$GIR_PATH/Gio-2.0.gir" src/gio

echo ""
echo "  [3/8] Generating GDK bindings (with Cairo, GIO references)..."
"$GIR_GEN" generate \
    -r "$BUILD_DIR/cairo-references.sexp" \
    -r "$BUILD_DIR/gio-references.sexp" \
    "$GIR_PATH/Gdk-4.0.gir" \
    src/gdk

echo ""
echo "  [4/8] Generating Graphene bindings..."
"$GIR_GEN" generate \
    "$GIR_PATH/Graphene-1.0.gir" \
    src/graphene

echo ""
echo "  [5/8] Generating GdkPixbuf bindings (with GIO references)..."
"$GIR_GEN" generate \
    -r "$BUILD_DIR/gio-references.sexp" \
    "$GIR_PATH/GdkPixbuf-2.0.gir" \
    src/gdkpixbuf

echo ""
echo "  [6/8] Generating Pango bindings (with Cairo, GIO references)..."
"$GIR_GEN" generate \
    -r "$BUILD_DIR/cairo-references.sexp" \
    -r "$BUILD_DIR/gio-references.sexp" \
    "$GIR_PATH/Pango-1.0.gir" \
    src/pango

echo ""
echo "  [7/8] Generating GSK bindings (with Cairo, GIO, GDK, Graphene references)..."
"$GIR_GEN" generate \
    -r "$BUILD_DIR/cairo-references.sexp" \
    -r "$BUILD_DIR/gio-references.sexp" \
    -r "$BUILD_DIR/gdk-references.sexp" \
    -r "$BUILD_DIR/graphene-references.sexp" \
    "$GIR_PATH/Gsk-4.0.gir" \
    src/gsk

echo ""
echo "  [8/8] Generating GTK bindings (with all references)..."
"$GIR_GEN" generate \
    -r "$BUILD_DIR/cairo-references.sexp" \
    -r "$BUILD_DIR/gio-references.sexp" \
    -r "$BUILD_DIR/gdk-references.sexp" \
    -r "$BUILD_DIR/graphene-references.sexp" \
    -r "$BUILD_DIR/gdkpixbuf-references.sexp" \
    -r "$BUILD_DIR/pango-references.sexp" \
    -r "$BUILD_DIR/gsk-references.sexp" \
    "$GIR_PATH/Gtk-4.0.gir" \
    src/gtk

echo ""
echo "==================================="
echo "✓ Code generation complete!"
echo "==================================="
echo ""
echo "Generated files are in:"
echo "  - src/cairo/generated/"
echo "  - src/gio/generated/"
echo "  - src/gdk/generated/"
echo "  - src/graphene/generated/"
echo "  - src/gdkpixbuf/generated/"
echo "  - src/pango/generated/"
echo "  - src/gsk/generated/"
echo "  - src/gtk/generated/"
echo ""
echo "You can now run: dune build"
