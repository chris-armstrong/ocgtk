# C Stubs Tests (Layer 0)

**Status: ✅ IMPLEMENTED**

Unit tests for C stub generation using library-based testing.

## Files

- **c_stubs_tests.ml** - Basic constructor/method generation, record types (16 tests)
- **nullable_tests.ml** - Nullable parameter and return value handling (5 tests)
- **error_handling_tests.ml** - GError handling with throws=true (6 tests)
- **out_params_tests.ml** - Out and InOut parameter handling (6 tests)
- **type_conversion_tests.ml** - Type conversions between OCaml and C (9 tests)

## Testing Approach

These tests use **library-based testing** for fast, focused unit tests:

1. Call generator functions directly (e.g., `Generate.C_stubs.generate_c_method`)
2. Parse generated C code with lightweight C parser
3. Validate AST structure using inspection functions
4. No file I/O - all in-memory

## Coverage

**Total: 85 tests, 100% passing ✓**

See [GIR_GEN_TESTING.md](../GIR_GEN_TESTING.md) for detailed coverage information.
