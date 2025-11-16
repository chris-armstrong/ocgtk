#!/bin/bash
# Wrapper script to handle different camlp5 versions
# Older camlp5: uses o_keywords.cmo
# Newer camlp5 (8.x+): uses pa_o.cmo

set -e

SOURCE="$1"
TARGET="$2"

# Get camlp5 library directory
CAMLP5_LIB=$(camlp5o -where)

# Try old-style with o_keywords.cmo first (for compatibility with older versions)
if [ -f "$CAMLP5_LIB/o_keywords.cmo" ]; then
    echo "Using old camlp5 approach with o_keywords.cmo" >&2
    camlp5o o_keywords.cmo pr_o.cmo -impl "$SOURCE" -o "$TARGET"
else
    echo "Using modern camlp5 approach with pa_o.cmo" >&2
    camlp5o -I "$CAMLP5_LIB" pa_o.cmo pr_o.cmo -impl "$SOURCE" -o "$TARGET"
fi
