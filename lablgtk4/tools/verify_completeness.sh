#!/bin/bash
# Verify Phase 1-2 completeness using GObject Introspection

set -e

echo "=== Phase 1-2 Completeness Verification ==="
echo "Using GObject Introspection to audit implementation"
echo ""

# GIR files location
GIR_DIR="/usr/share/gir-1.0"

# Check required GIR files exist
echo "Checking GIR files..."
for gir in GLib-2.0 GObject-2.0 Gdk-4.0 GdkPixbuf-2.0 Pango-1.0; do
  if [ -f "$GIR_DIR/${gir}.gir" ]; then
    echo "  ✓ ${gir}.gir found"
  else
    echo "  ✗ ${gir}.gir MISSING"
    exit 1
  fi
done
echo ""

# Function to extract class names from GIR
extract_classes() {
  local gir_file="$1"
  local namespace="$2"
  grep -o "class name=\"[^\"]*\"" "$GIR_FILE" | \
    sed 's/class name="\([^"]*\)"/\1/' | \
    sort | uniq
}

# Function to extract functions from GIR
extract_functions() {
  local gir_file="$1"
  local class_name="$2"
  # Extract methods from a specific class
  sed -n "/<class name=\"$class_name\"/,/<\/class>/p" "$gir_file" | \
    grep -o "method name=\"[^\"]*\"" | \
    sed 's/method name="\([^"]*\)"/\1/' | \
    sort
}

echo "=== GLib Module Check ==="
GIR_FILE="$GIR_DIR/GLib-2.0.gir"

# Check main loop functions
echo "Checking GLib.Main..."
grep -q "function name=\"main_loop_new\"" "$GIR_FILE" && echo "  ✓ main_loop_new" || echo "  ✗ main_loop_new"
grep -q "function name=\"main_loop_run\"" "$GIR_FILE" && echo "  ✓ main_loop_run" || echo "  ✗ main_loop_run"
grep -q "function name=\"main_loop_quit\"" "$GIR_FILE" && echo "  ✓ main_loop_quit" || echo "  ✗ main_loop_quit"

# Check timeout/idle
echo "Checking GLib.Timeout/Idle..."
grep -q "function name=\"timeout_add\"" "$GIR_FILE" && echo "  ✓ timeout_add" || echo "  ✗ timeout_add"
grep -q "function name=\"idle_add\"" "$GIR_FILE" && echo "  ✓ idle_add" || echo "  ✗ idle_add"

echo ""

echo "=== GObject Module Check ==="
GIR_FILE="$GIR_DIR/GObject-2.0.gir"

# Core GObject functions
echo "Checking GObject core..."
grep -q "method name=\"ref\"" "$GIR_FILE" && echo "  ✓ g_object_ref" || echo "  ✗ g_object_ref"
grep -q "method name=\"unref\"" "$GIR_FILE" && echo "  ✓ g_object_unref" || echo "  ✗ g_object_unref"
grep -q "method name=\"get_property\"" "$GIR_FILE" && echo "  ✓ get_property" || echo "  ✗ get_property"
grep -q "method name=\"set_property\"" "$GIR_FILE" && echo "  ✓ set_property" || echo "  ✗ set_property"

echo ""

echo "=== Gdk Module Check ==="
GIR_FILE="$GIR_DIR/Gdk-4.0.gir"

# Check Display functions
echo "Checking Gdk.Display..."
grep -q "function name=\"display_get_default\"" "$GIR_FILE" && echo "  ✓ display_get_default" || echo "  ✗ display_get_default"
grep -q "method name=\"get_name\"" "$GIR_FILE" && echo "  ✓ get_name" || echo "  ✗ get_name"

# Check Surface (was Window in GTK3)
echo "Checking Gdk.Surface..."
grep -q "class name=\"Surface\"" "$GIR_FILE" && echo "  ✓ Surface class exists" || echo "  ✗ Surface class MISSING"
grep -q "method name=\"get_width\"" "$GIR_FILE" && echo "  ✓ get_width" || echo "  ✗ get_width"
grep -q "method name=\"get_height\"" "$GIR_FILE" && echo "  ✓ get_height" || echo "  ✗ get_height"

# Check Clipboard (new in GTK4)
echo "Checking Gdk.Clipboard..."
grep -q "class name=\"Clipboard\"" "$GIR_FILE" && echo "  ✓ Clipboard class exists" || echo "  ✗ Clipboard class MISSING"
grep -q "method name=\"set_text\"" "$GIR_FILE" && echo "  ✓ set_text" || echo "  ✗ set_text"
grep -q "method name=\"read_text_async\"" "$GIR_FILE" && echo "  ✓ read_text_async" || echo "  ✗ read_text_async"

echo ""

echo "=== GdkPixbuf Module Check ==="
GIR_FILE="$GIR_DIR/GdkPixbuf-2.0.gir"

echo "Checking GdkPixbuf.Pixbuf..."
grep -q "constructor name=\"new\"" "$GIR_FILE" && echo "  ✓ new constructor" || echo "  ✗ new constructor"
grep -q "function name=\"new_from_file\"" "$GIR_FILE" && echo "  ✓ new_from_file" || echo "  ✗ new_from_file"
grep -q "method name=\"get_width\"" "$GIR_FILE" && echo "  ✓ get_width" || echo "  ✗ get_width"
grep -q "method name=\"get_height\"" "$GIR_FILE" && echo "  ✓ get_height" || echo "  ✗ get_height"

echo ""

echo "=== Pango Module Check ==="
GIR_FILE="$GIR_DIR/Pango-1.0.gir"

echo "Checking Pango.Layout..."
grep -q "class name=\"Layout\"" "$GIR_FILE" && echo "  ✓ Layout class exists" || echo "  ✗ Layout class MISSING"
grep -q "method name=\"set_text\"" "$GIR_FILE" && echo "  ✓ set_text" || echo "  ✗ set_text"
grep -q "method name=\"get_pixel_size\"" "$GIR_FILE" && echo "  ✓ get_pixel_size" || echo "  ✗ get_pixel_size"

echo "Checking Pango.FontDescription..."
grep -q "record name=\"FontDescription\"" "$GIR_FILE" && echo "  ✓ FontDescription exists" || echo "  ✗ FontDescription MISSING"

echo ""
echo "=== Verification Complete ==="
echo ""
echo "Next steps:"
echo "1. Review any MISSING items above"
echo "2. Check implemented modules against GIR specs"
echo "3. Use detailed verification script for method-level audit"
