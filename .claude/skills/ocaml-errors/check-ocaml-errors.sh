#!/usr/bin/env bash
# OCaml Error Checker using ocamlmerlin
# Analyzes OCaml files and reports all compilation and type errors

set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage: check-ocaml-errors.sh <filepath>" >&2
    exit 1
fi

filepath="$1"

if [ ! -f "$filepath" ]; then
    echo "Error: File not found: $filepath" >&2
    exit 1
fi

if ! command -v ocamlmerlin &> /dev/null; then
    echo "Error: ocamlmerlin not found in PATH" >&2
    echo "Please install ocamlmerlin: opam install ocaml-lsp-server" >&2
    exit 1
fi

if ! command -v jq &> /dev/null; then
    echo "Error: jq not found in PATH" >&2
    echo "Please install jq for JSON parsing" >&2
    exit 1
fi

# Run ocamlmerlin and capture output
output=$(ocamlmerlin single errors -filename "$filepath" < "$filepath" 2>&1)

# Parse the JSON response
errors=$(echo "$output" | jq -r '.value // []')
error_count=$(echo "$errors" | jq 'length')

if [ "$error_count" -eq 0 ]; then
    echo "No errors found in $filepath"
    exit 0
fi

echo "Found $error_count error(s) in $filepath:"
echo

# Format and display each error
echo "$errors" | jq -r --arg filepath "$filepath" 'to_entries[] |
    "\(.key + 1). \($filepath):\(.value.start.line):\(.value.start.col): [\(.value.type)] \(.value.message)"'
