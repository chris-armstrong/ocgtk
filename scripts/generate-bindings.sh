#!/bin/bash
# Generate OCaml bindings from GIR files using gir_gen
# Usage: ./scripts/generate-bindings.sh [GIR_PATH]
#
# Set GIR_PATH to override the default location of GIR files
# Default: bundled ocgtk/gir/ directory in this repository
#
# Override files (ocgtk/overrides/<ns>.sexp) are committed to the repository
# and passed via -o to both 'references' and 'generate' commands:
#   - In 'references': ignored entities are excluded from the reference output
#     so downstream namespaces don't try to map to types that won't be generated
#   - In 'generate': ignored entities are skipped; version guards emit
#     #if NS_CHECK_VERSION(...) guards in the generated C stubs
# See ocgtk/src/tools/README_GIR_GEN.md#override-system for file format details.

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
# The dune workspace is in the ocgtk subdirectory, NOT the repository root
WORKSPACE_ROOT="$REPO_ROOT/ocgtk"
GIR_PATH="${1:-${GIR_PATH:-$WORKSPACE_ROOT/ocgtk/gir}}"
BUILD_DIR="$WORKSPACE_ROOT/_build/references"
GIR_GEN="$WORKSPACE_ROOT/_build/default/src/tools/gir_gen/gir_gen.exe"
OVERRIDES_DIR="$WORKSPACE_ROOT/overrides"

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

echo "  [1/9] Generating Cairo references..."
"$GIR_GEN" references -o "$OVERRIDES_DIR/cairo.sexp" "$GIR_PATH/cairo-1.0.gir" "$BUILD_DIR/cairo-references.sexp"

echo "  [2/9] Generating GIO references..."
"$GIR_GEN" references -o "$OVERRIDES_DIR/gio.sexp" "$GIR_PATH/Gio-2.0.gir" "$BUILD_DIR/gio-references.sexp"

echo "  [3/9] Generating GDK references..."
"$GIR_GEN" references -o "$OVERRIDES_DIR/gdk.sexp" "$GIR_PATH/Gdk-4.0.gir" "$BUILD_DIR/gdk-references.sexp"

echo "  [4/9] Generating Graphene references..."
"$GIR_GEN" references -o "$OVERRIDES_DIR/graphene.sexp" "$GIR_PATH/Graphene-1.0.gir" "$BUILD_DIR/graphene-references.sexp"

echo "  [5/9] Generating GdkPixbuf references..."
"$GIR_GEN" references -o "$OVERRIDES_DIR/gdkpixbuf.sexp" "$GIR_PATH/GdkPixbuf-2.0.gir" "$BUILD_DIR/gdkpixbuf-references.sexp"

echo "  [6/9] Generating Pango references..."
"$GIR_GEN" references -o "$OVERRIDES_DIR/pango.sexp" "$GIR_PATH/Pango-1.0.gir" "$BUILD_DIR/pango-references.sexp"

echo "  [7/9] Generating GSK references..."
"$GIR_GEN" references -o "$OVERRIDES_DIR/gsk.sexp" "$GIR_PATH/Gsk-4.0.gir" "$BUILD_DIR/gsk-references.sexp"

echo "  [8/9] Generating PangoCairo references..."
"$GIR_GEN" references -o "$OVERRIDES_DIR/pangocairo.sexp" "$GIR_PATH/PangoCairo-1.0.gir" "$BUILD_DIR/pangocairo-references.sexp"

echo "  [9/9] Generating GTK references..."
"$GIR_GEN" references -o "$OVERRIDES_DIR/gtk.sexp" "$GIR_PATH/Gtk-4.0.gir" "$BUILD_DIR/gtk-references.sexp"

echo ""
echo "Step 2: Generating OCaml bindings..."
echo "-----------------------------------"

echo "  [1/9] Generating Cairo bindings..."
"$GIR_GEN" generate -o "$OVERRIDES_DIR/cairo.sexp" "$GIR_PATH/cairo-1.0.gir" src/cairo

echo ""
echo "  [2/9] Generating GIO bindings..."
"$GIR_GEN" generate -o "$OVERRIDES_DIR/gio.sexp" "$GIR_PATH/Gio-2.0.gir" src/gio

echo ""
echo "  [3/9] Generating GDK bindings (with Cairo, GIO references)..."
"$GIR_GEN" generate \
    -o "$OVERRIDES_DIR/gdk.sexp" \
    -r "$BUILD_DIR/cairo-references.sexp" \
    -r "$BUILD_DIR/pango-references.sexp" \
    -r "$BUILD_DIR/pangocairo-references.sexp" \
    -r "$BUILD_DIR/gdkpixbuf-references.sexp" \
    -r "$BUILD_DIR/gio-references.sexp" \
    "$GIR_PATH/Gdk-4.0.gir" \
    src/gdk

echo ""
echo "  [4/9] Generating Graphene bindings..."
"$GIR_GEN" generate \
    -o "$OVERRIDES_DIR/graphene.sexp" \
    "$GIR_PATH/Graphene-1.0.gir" \
    src/graphene

echo ""
echo "  [5/9] Generating GdkPixbuf bindings (with GIO references)..."
"$GIR_GEN" generate \
    -o "$OVERRIDES_DIR/gdkpixbuf.sexp" \
    -r "$BUILD_DIR/gio-references.sexp" \
    "$GIR_PATH/GdkPixbuf-2.0.gir" \
    src/gdkpixbuf

echo ""
echo "  [6/9] Generating Pango bindings (with Cairo, GIO references)..."
"$GIR_GEN" generate \
    -o "$OVERRIDES_DIR/pango.sexp" \
    -r "$BUILD_DIR/cairo-references.sexp" \
    -r "$BUILD_DIR/gio-references.sexp" \
    "$GIR_PATH/Pango-1.0.gir" \
    src/pango

echo ""
echo "  [7/9] Generating PangoCairo bindings (with Cairo, Pango, GIO references)..."
"$GIR_GEN" generate \
    -o "$OVERRIDES_DIR/pangocairo.sexp" \
    -r "$BUILD_DIR/cairo-references.sexp" \
    -r "$BUILD_DIR/pango-references.sexp" \
    -r "$BUILD_DIR/gio-references.sexp" \
    "$GIR_PATH/PangoCairo-1.0.gir" \
    src/pangocairo

echo ""
echo "  [8/9] Generating GSK bindings (with Cairo, GIO, GDK, Graphene references)..."
"$GIR_GEN" generate \
    -o "$OVERRIDES_DIR/gsk.sexp" \
    -r "$BUILD_DIR/cairo-references.sexp" \
    -r "$BUILD_DIR/gio-references.sexp" \
    -r "$BUILD_DIR/gdk-references.sexp" \
    -r "$BUILD_DIR/pangocairo-references.sexp" \
    -r "$BUILD_DIR/pango-references.sexp" \
    -r "$BUILD_DIR/gdkpixbuf-references.sexp" \
    -r "$BUILD_DIR/graphene-references.sexp" \
    "$GIR_PATH/Gsk-4.0.gir" \
    src/gsk

echo ""
echo "  [9/9] Generating GTK bindings (with all references)..."
"$GIR_GEN" generate \
    -o "$OVERRIDES_DIR/gtk.sexp" \
    -r "$BUILD_DIR/cairo-references.sexp" \
    -r "$BUILD_DIR/gio-references.sexp" \
    -r "$BUILD_DIR/gdk-references.sexp" \
    -r "$BUILD_DIR/graphene-references.sexp" \
    -r "$BUILD_DIR/gdkpixbuf-references.sexp" \
    -r "$BUILD_DIR/pango-references.sexp" \
    -r "$BUILD_DIR/pangocairo-references.sexp" \
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
echo "  - src/pangocairo/generated/"
echo "  - src/gsk/generated/"
echo "  - src/gtk/generated/"
echo ""
echo "You can now run: dune build"
