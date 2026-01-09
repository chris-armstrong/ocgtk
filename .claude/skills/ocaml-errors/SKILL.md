---
name: OCaml Errors
description: List all type errors and compilation errors in OCaml files using ocamlmerlin. Use when the user asks to check OCaml errors, diagnose type issues, or validate OCaml code.
dependencies: ocamlmerlin, jq
---

# OCaml Error Checker

This skill uses `ocamlmerlin` to analyze OCaml source files and report all compilation and type errors.

## Usage

When invoked, this skill will:
1. Take the file path provided by the user (or infer it from context)
2. Run `ocamlmerlin` to get all errors in the file
3. Parse and present the errors in a readable format

## How to Use

Use the `check-ocaml-errors.sh` script to analyze a file:

```bash
./check-ocaml-errors.sh <filepath>
```

The script will:
- Read the file contents
- Pass it to ocamlmerlin for analysis
- Parse the JSON response
- Display errors with line numbers, columns, and messages

## When to Invoke This Skill

- User asks to "check errors in <file>.ml"
- User wants to "see what's wrong with my OCaml code"
- User requests to "validate OCaml file"
- User mentions type errors or compilation issues in OCaml

## Example Commands

- "Check errors in src/main.ml"
- "What errors are in this OCaml file?"
- "Validate my OCaml code"
- "Show me all type errors"

## Notes

- Requires ocamlmerlin to be installed and in PATH
- Works best with proper .merlin or dune configuration in the project
- Provides line and column numbers for precise error location
