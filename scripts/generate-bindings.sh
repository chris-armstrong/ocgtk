#!/bin/bash
# Generate OCaml bindings from GIR files using gir_gen
# Usage: ./scripts/generate-bindings.sh [GIR_PATH]
#
# Set GIR_PATH to override the default location of GIR files
# Default: bundled gir/ directory at the repository root
#
# Each namespace is one package at the repository root (ocgio/, ocgtk/, ...).
# gir_gen writes its three libraries into the package directory:
#   <pkg>/raw/generated/    layer 1, C stubs, <ns>_decls.h, dune.inc
#   <pkg>/enums/generated/  enumerations and bitfields
#   <pkg>/generated/        layer 2, raw.ml, enums.ml, constants
# and deletes any file in those directories that the run did not write, so
# renamed or newly ignored types leave nothing behind.
#
# Override files (overrides/<ns>.sexp) are committed to the repository
# and passed via -o to both 'references' and 'generate' commands:
#   - In 'references': ignored entities are excluded from the reference output
#     so downstream namespaces don't try to map to types that won't be generated
#   - In 'generate': ignored entities are skipped; version guards emit
#     #if NS_CHECK_VERSION(...) guards in the generated C stubs
# See gir_gen/README.md#override-system for file format details.

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
# GIR data files live at the repository root
GIR_PATH="${1:-${GIR_PATH:-$REPO_ROOT/gir}}"
BUILD_DIR="$REPO_ROOT/_build/references"
GIR_GEN="$REPO_ROOT/_build/default/gir_gen/bin/gir_gen.exe"
OVERRIDES_DIR="$REPO_ROOT/overrides"

# Namespaces in dependency order: name, GIR file, package directory
NAMESPACES=(
    "cairo cairo-1.0 occairo"
    "gio Gio-2.0 ocgio"
    "graphene Graphene-1.0 ocgraphene"
    "gdkpixbuf GdkPixbuf-2.0 ocgdkpixbuf"
    "pango Pango-1.0 ocpango"
    "pangocairo PangoCairo-1.0 ocpangocairo"
    "gdk Gdk-4.0 ocgdk"
    "gsk Gsk-4.0 ocgsk"
    "gtk Gtk-4.0 ocgtk"
)

# Reference files each namespace's generation reads
declare -A DEPS=(
    [cairo]=""
    [gio]=""
    [graphene]=""
    [gdkpixbuf]="gio"
    [pango]="cairo gio"
    [pangocairo]="cairo pango gio"
    [gdk]="cairo pango pangocairo gdkpixbuf gio"
    [gsk]="cairo gio gdk pangocairo pango gdkpixbuf graphene"
    [gtk]="cairo gio gdk graphene gdkpixbuf pango pangocairo gsk"
)

echo "==================================="
echo "OCaml GTK Bindings Generator"
echo "==================================="
echo "GIR files: $GIR_PATH"
echo "Repository root: $REPO_ROOT"
echo ""

# Change to repository root (where dune-workspace is)
cd "$REPO_ROOT"

# Step 0: Build gir_gen tool
echo "Step 0: Building gir_gen tool..."
echo "-----------------------------------"
dune build --root . gir_gen/bin/gir_gen.exe

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

for entry in "${NAMESPACES[@]}"; do
    read -r ns gir _pkg <<< "$entry"
    echo "  Generating $ns references..."
    "$GIR_GEN" references -o "$OVERRIDES_DIR/$ns.sexp" "$GIR_PATH/$gir.gir" \
        "$BUILD_DIR/$ns-references.sexp"
done

echo ""
echo "Step 2: Generating OCaml bindings..."
echo "-----------------------------------"

for entry in "${NAMESPACES[@]}"; do
    read -r ns gir pkg <<< "$entry"
    refs=()
    for dep in ${DEPS[$ns]}; do
        refs+=(-r "$BUILD_DIR/$dep-references.sexp")
    done
    echo ""
    echo "  Generating $ns bindings into $pkg/..."
    mkdir -p "$REPO_ROOT/$pkg"
    "$GIR_GEN" generate -o "$OVERRIDES_DIR/$ns.sexp" "${refs[@]}" \
        "$GIR_PATH/$gir.gir" "$REPO_ROOT/$pkg"
done

echo ""
echo "Step 3: Formatting generated OCaml..."
echo "-----------------------------------"
# Generated .ml/.mli output is unformatted; ocamlformat normalises long
# signatures and wrapping so the diff against committed bindings stays
# bounded to genuine semantic changes.
if command -v ocamlformat >/dev/null 2>&1; then
    for entry in "${NAMESPACES[@]}"; do
        read -r _ns _gir pkg <<< "$entry"
        for sub in raw/generated enums/generated generated; do
            gen_dir="$REPO_ROOT/$pkg/$sub"
            if [ -d "$gen_dir" ]; then
                (cd "$gen_dir" && ocamlformat -i ./*.ml ./*.mli 2>/dev/null) || true
            fi
        done
    done
    echo "  ocamlformat applied to all generated .ml/.mli files."
else
    echo "  ocamlformat not on PATH; skipping format step."
    echo "  Run 'ocamlformat -i' on each package's generated .ml/.mli manually."
fi

# The generated dune files are committed as 'dune fmt' leaves them, so a
# regeneration must format them too or the tree is never clean.
for entry in "${NAMESPACES[@]}"; do
    read -r _ns _gir pkg <<< "$entry"
    for sub in enums/generated generated; do
        dune_file="$REPO_ROOT/$pkg/$sub/dune"
        if [ -f "$dune_file" ]; then
            dune format-dune-file "$dune_file" > "$dune_file.fmt"
            mv "$dune_file.fmt" "$dune_file"
        fi
    done
done
echo "  dune format-dune-file applied to the generated dune files."

echo ""
echo "==================================="
echo "✓ Code generation complete!"
echo "==================================="
echo ""
echo "Generated files are in each package's generated/, raw/generated/ and"
echo "enums/generated/ directories:"
for entry in "${NAMESPACES[@]}"; do
    read -r _ns _gir pkg <<< "$entry"
    echo "  - $pkg/"
done
echo ""
echo "You can now run: dune build"
