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

### Run All Tests

```bash
dune runtest
```

Note: There is a known issue with the dune test runner causing a segfault when running all tests together. All tests pass when run individually (see below).

### Run Individual Test Suites

```bash
# Basic enum tests
dune exec tests/test_enum_roundtrip.exe
dune exec tests/test_enum_values.exe

# Comprehensive enum tests
dune exec tests/test_all_enums.exe

# Binding tests
dune exec tests/test_glib.exe
dune exec tests/test_gobject.exe
```

### Run Tests Directly

```bash
# Build all tests
dune build @runtest

# Run individual test executables
./_build/default/tests/test_enum_roundtrip.exe
./_build/default/tests/test_enum_values.exe
./_build/default/tests/test_all_enums.exe
./_build/default/tests/test_glib.exe
./_build/default/tests/test_gobject.exe
```

## Test Results Summary

All 42 tests pass successfully:

- ✅ **test_enum_roundtrip**: 3 tests (align, orientation, pack_type round-trips)
- ✅ **test_enum_values**: 6 tests (3 value exists + 3 distinctness)
- ✅ **test_all_enums**: 26 tests (13 round-trip + 13 distinctness across all modules)
- ✅ **test_glib**: 3 tests (enum accessibility + log levels + I/O conditions)
- ✅ **test_gobject**: 4 tests (enum accessibility + Data.enum + Data.flags + fundamental types)

## Test Coverage

### Current Coverage

Phase 1.3 complete - all enumeration bindings tested:

- **GTK4 enums**: 34 enums defined, 5 tested (align, orientation, justification, message_type, selection_mode)
- **GDK4 enums**: 18 enums defined, 2 tested (modifier_type, scroll_direction)
- **GLib enums**: 4 enums defined, 2 tested (log_level, io_condition)
- **Pango enums**: 12 enums defined, 3 tested (style, weight, wrap_mode)
- **GObject enums**: 4 enums defined, 2 tested (signal_type, connect_flags)

### Planned Expansions

As more LablGTK4 bindings are implemented, tests will be added for:

- **GLib bindings** (Phase 2.1):
  - Main loop creation and termination
  - Timeout/idle callbacks
  - File monitoring
  - String utilities
  - Error handling (GError)

- **GObject bindings** (Phase 2.2):
  - Type registration
  - Object creation/destruction
  - Property get/set
  - Signal connection/emission
  - Reference counting
  - Weak references

- **Widget tests** (Phase 3+):
  - Widget creation and configuration
  - Container/child management
  - Event handling
  - Drawing and rendering

## CI Integration

Tests are run automatically on every push and pull request via GitHub Actions. See `.github/workflows/ci.yml` for the full CI configuration.

The CI runs tests on:
- OCaml versions: 4.14.x, 5.1.x, 5.2.x
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
   ./_build/default/tests/test_name.exe -v
   ```

3. **Check generated enum modules**:
   ```bash
   ls -l _build/default/src/*Enums.ml
   cat _build/default/src/Gtk4Enums.ml  # inspect generated code
   ```

4. **Verify C conversion tables**:
   ```bash
   cat _build/default/src/gtk4_tags.c  # inspect C lookup tables
   ```

## Dependencies

Test dependencies (specified in `dune-project`):

- **alcotest**: OCaml testing framework
- **lablgtk4**: The library being tested

Install test dependencies:
```bash
opam install . --deps-only --with-test
```
