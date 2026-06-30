# ocgtk Test Suite

This directory contains the comprehensive test suite for the ocgtk GTK 4 bindings.

## Running Tests

See [CONTRIBUTORS.md](../../CONTRIBUTORS.md) for build and test commands.

## CI Integration

Tests are run automatically on every push and pull request via GitHub Actions. See `.github/workflows/ci.yml` for the full CI configuration.

The CI runs tests on:
- OCaml versions: 5.3.x,5.4.x
- OS: Ubuntu Latest
- GTK version: 4.10+

## Dependencies

Test dependencies (specified in `dune-project`):

- **alcotest**: OCaml testing framework
- **ocgtk4**: The library being tested

Install test dependencies:
```bash
opam install . --deps-only --with-test
```
