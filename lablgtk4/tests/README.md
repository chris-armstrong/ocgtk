# LablGTK4 Test Suite

This directory contains the comprehensive test suite for the LablGTK4 GTK 4 bindings.

## Test Organization

The test suite is organized into the following test files:

### Enum Conversion Tests

- **`test_enum_roundtrip.ml`**: Basic round-trip conversion tests for core GTK4 enums
  - Tests: `GtkAlign`, `GtkOrientation`, `GtkPackType`
  - Verifies OCaml → C → OCaml conversions preserve values

- **`test_enum_values.ml`**: Enum value coverage and distinctness tests
  - Tests: `GtkAlign`, `GtkOrientation`, `GtkPackType`
  - Verifies all enum values exist and map to distinct C integers

- **`test_all_enums.ml`**: Comprehensive enum tests across all subsystems
  - **GTK4**: 5 widget/UI enums (align, orientation, justification, message_type, selection_mode)
  - **GDK4**: 2 display/input enums (modifier_type, scroll_direction)
  - **GLib**: 2 core library enums (log_level, io_condition)
  - **Pango**: 3 text rendering enums (style, weight, wrap_mode)
  - **GObject**: 1 type system enum (signal_type)
  - **Total**: 26 tests (13 round-trip + 13 distinctness)

### Binding Tests

- **`test_glib.ml`**: GLib binding tests (minimal for now)
  - Tests enum module accessibility
  - Tests log level and I/O condition conversions
  - Will be expanded as more GLib bindings are added

- **`test_gobject.ml`**: GObject binding tests (minimal for now)
  - Tests enum module accessibility
  - Tests `Gobject.Data.enum` and `Gobject.Data.flags` converters
  - Tests fundamental type conversions
  - Will be expanded for object lifecycle, signals, properties

## Running Tests

### Run All Tests (Recommended)

```bash
xvfb-run dune runtest
```

## CI Integration

Tests are run automatically on every push and pull request via GitHub Actions. See `.github/workflows/ci.yml` for the full CI configuration.

The CI runs tests on:
- OCaml versions: 5.3.x,5.4.x
- OS: Ubuntu Latest
- GTK version: 4.10+

## Debugging Test Failures

If a test fails:

1. **Build the specific test**:
   ```bash
   dune build tests/test_name.exe
   ```

2. **Run with verbose output**:
   ```bash
   ./_build/default/tests/test_name.exe 
   ```


## Dependencies

Test dependencies (specified in `dune-project`):

- **alcotest**: OCaml testing framework
- **lablgtk4**: The library being tested

Install test dependencies:
```bash
opam install . --deps-only --with-test
```
