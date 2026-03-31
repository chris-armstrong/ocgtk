# Code Guidelines

This directory contains coding guidelines for the ocgtk project, organized by concern.

## MANDATORY GUIDELINES INDEX

| Document | Concerns Covered |
|----------|-----------------|
| [nesting-and-control-flow.md](./nesting-and-control-flow.md) | Reducing nesting, bind operators |
| [error-handling.md](./error-handling.md) | Result vs exceptions, error context |
| [naming-and-intermediates.md](./naming-and-intermediates.md) | Named values, pipeline clarity |
| [module-boundaries.md](./module-boundaries.md) | .mli files, type annotations, module structure |
| [pattern-matching.md](./pattern-matching.md) | Exhaustive matching, catch-all avoidance |
| [partial-functions.md](./partial-functions.md) | Total functions, banned partials |
| [type-safety.md](./type-safety.md) | Stringly-typed code, phantom types, encapsulation |
| [code-reuse.md](./code-reuse.md) | Record updates, deduplication, labelled args |
| [test-patterns.md](./test-patterns.md) | AST-based validation, test helpers |
| [abstractions.md](./abstractions.md) | Module design, parameter reduction, functors |
| [atspi-e2e-testing.md](./atspi-e2e-testing.md) | AT-SPI E2E test structure, best practices |

## Usage

MANDATORY: Load ALL the MANDATORY GUIDELINES from the index above.


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
