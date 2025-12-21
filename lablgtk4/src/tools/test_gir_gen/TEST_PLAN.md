# C Stub Generation Test Plan

This document tracks the comprehensive test coverage for gir_gen C stub generation.

## Test Results Summary

**Total: 80 tests**
- **73 passing ✓** (91% pass rate)
- **7 failing ✗**
  - 4 failures due to parser limitations (single-line if/else)
  - 3 failures due to generator bugs

See [FAILING_TESTS_ANALYSIS.md](FAILING_TESTS_ANALYSIS.md) for detailed analysis.

## Test Files Organization

- `c_stubs_tests.ml` - Basic constructor and method generation (10/10 passing)
- `nullable_tests.ml` - Nullable parameter and return value handling (2/6 passing)
- `error_handling_tests.ml` - Error handling (throws=true) (3/6 passing)
- `out_params_tests.ml` - Out and InOut parameter handling (2/6 passing)
- `type_conversion_tests.ml` - Various type conversions (8/9 passing)
- Other test suites - All passing

## Test Coverage Checklist

### c_stubs_tests.ml - Basic Generation ✓ (10/10)
- [x] Simple constructor (0 params) ✓
- [x] Constructor with parameters ✓
- [x] Constructor with 6+ params (bytecode/native split) ✓
- [x] Simple method (void return) ✓
- [x] Method with return value ✓
- [x] Constructor uses correct type conversion ✓
- [x] Method calls underlying C function ✓
- [x] Variable declarations are parsed ✓
- [x] Parameter flow to return value ✓
- [x] Bytecode calls native function ✓

### nullable_tests.ml - Nullable Handling (5/6)
- [x] Nullable string parameter (String_option_val) ✓
- [ ] Nullable object parameter (Option_val) ✗ **GENERATOR BUG**
- [x] Non-nullable parameter validation ✓
- [x] Nullable return value ✓
- [x] Multiple nullable parameters ✓
- [x] Nullable parameter count ✓

### error_handling_tests.ml - Error Handling (2/6)
- [x] Method with throws=true declares GError ✓
- [ ] Error handling uses Res_Ok/Res_Error ✗ **PARSER LIMITATION** (single-line if/else)
- [ ] Error is passed by reference (&error) ✗ **PARSER LIMITATION** (single-line if/else)
- [x] Error is properly initialized to NULL ✓
- [ ] Complete error handling infrastructure ✗ **PARSER LIMITATION** (single-line if/else)
- [ ] Constructor with throws ✗ **PARSER LIMITATION** (single-line if/else)

### out_params_tests.ml - Out/InOut Parameters (5/6)
- [x] Simple out parameter declaration ✓
- [x] Out parameter passed by reference ✓
- [x] Out parameter with return value ✓
- [ ] InOut parameter ✗ **GENERATOR BUG**
- [x] Multiple out parameters ✓
- [x] Out param not in OCaml input ✓

### type_conversion_tests.ml - Type Conversions (8/9)
- [x] gboolean to bool conversion ✓
- [x] gint to int conversion ✓
- [x] gdouble to float conversion ✓
- [x] utf8 string conversion (String_val/caml_copy_string) ✓
- [x] utf8 string parameter conversion ✓
- [ ] Object type conversion (Val_GtkWidget) ✗ **GENERATOR BUG**
- [x] Enum type conversion ✓
- [x] gboolean parameter conversion ✓
- [x] Multiple type conversions ✓

### Additional Coverage Needed
- [ ] Property getters (GValue handling)
- [ ] Property setters (GValue handling)
- [ ] Static methods (no self parameter)
- [ ] Varargs handling
- [ ] Default parameter values
- [ ] Transfer ownership annotations
- [ ] Callback parameters
- [ ] Array length parameters

## Future Extensions
- [ ] ml_interface.ml validation
- [ ] class_gen.ml validation
- [ ] Full integration tests with real GIR files
