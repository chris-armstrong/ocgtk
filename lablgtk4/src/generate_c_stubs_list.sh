#!/bin/bash
# Generate foreign_stubs stanza for generated C files
# This script should be run after gir_gen generates the C files

# Get all generated C files and extract base names (without .c suffix)
cd "$(dirname "$0")"

cat > dune-generated-stubs.sexp << 'HEADER'
; Auto-generated foreign_stubs for generated C bindings
; Regenerate with: ./src/generate_c_stubs_list.sh

(foreign_stubs
 (language c)
 (names
HEADER

# Find all ml_*_gen.c files and extract just the name part (without .c)
for file in ml_*_gen.c; do
    if [ -f "$file" ]; then
        # Remove the .c extension to get the stub name
        name="${file%.c}"
        echo "  $name" >> dune-generated-stubs.sexp
    fi
done

cat >> dune-generated-stubs.sexp << 'FOOTER'
 )
 (flags -fPIC (:include cflag-gtk4.sexp) -Wno-deprecated-declarations -Wno-incompatible-pointer-types -Wno-int-conversion))
FOOTER

echo "Generated dune-generated-stubs.sexp with $(grep -c ml_ dune-generated-stubs.sexp) C stub names"
