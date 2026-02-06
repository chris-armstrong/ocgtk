# Code Guidelines

This directory contains coding guidelines for the ocgtk project, organized by concern.

## Guidelines Index

| Document | Concerns Covered | Original Sections |
|----------|-----------------|-------------------|
| [nesting-and-control-flow.md](./nesting-and-control-flow.md) | Reducing nesting, bind operators | 1 |
| [error-handling.md](./error-handling.md) | Result vs exceptions, error context | 2 |
| [naming-and-intermediates.md](./naming-and-intermediates.md) | Named values, pipeline clarity | 3 |
| [module-boundaries.md](./module-boundaries.md) | .mli files, type annotations, module structure | 4, 7 |
| [pattern-matching.md](./pattern-matching.md) | Exhaustive matching, catch-all avoidance | 5 |
| [partial-functions.md](./partial-functions.md) | Total functions, banned partials | 6 |
| [type-safety.md](./type-safety.md) | Stringly-typed code, phantom types, encapsulation | 9, NEW |
| [code-reuse.md](./code-reuse.md) | Record updates, deduplication, labelled args | 8, 10, 11 |
| [test-patterns.md](./test-patterns.md) | AST-based validation, test helpers | 12 |
| [abstractions.md](./abstractions.md) | Module design, parameter reduction, functors | NEW |

## Usage

### For Manual Development

Reference the relevant guideline when writing new code or reviewing changes.

### For Review Agents

Agents should:
1. Read the specific guideline file for the concern being reviewed
2. Check code against each rule in that guideline
3. Reference the specific rule when logging issues

### For Execution Agents

Agents should:
1. Read the guideline relevant to the issue being fixed
2. Ensure the fix follows all rules in that guideline
3. Not introduce new violations while fixing

## Available Libraries

Use these libraries. Only `containers` should be opened at global scope.

- containers
- re
- uutf
- uri
- uuseg
- yojson
- fmt
- xmlm
- fpath

## Priority Order

When guidelines conflict, prefer in this order:
1. Correctness (no bugs)
2. Type safety (catch errors at compile time)
3. Clarity (readable code)
4. Consistency (match surrounding code)
5. Brevity (less code when equally clear)
