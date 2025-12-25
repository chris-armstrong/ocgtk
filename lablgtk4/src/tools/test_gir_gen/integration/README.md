# Integration Tests

**Status: ✅ PARTIALLY IMPLEMENTED**

End-to-end tests that validate the full pipeline from GIR XML to complete generated code.

## Files

- **core.ml** - Core integration tests
- **parser.ml** - GIR XML parser tests
- **properties.ml** - Property getter/setter generation (3 tests)
- **signals.ml** - Signal handling generation (1 test)
- **enums.ml** - Enum and bitfield generation (5 tests)
- **records.ml** - Record type integration (1 test)
- **edge_cases.ml** - Edge cases (empty classes, etc.) (2 tests)

## Testing Approach

Integration tests validate the **full pipeline**:

1. Generate complete GIR XML files
2. Run main.exe to produce complete output
3. Validate all generated files (.ml, .mli, .c)
4. Slower but tests full integration across all layers

## Coverage Gaps

- [ ] Full class hierarchy integration tests
- [ ] Complex type dependency resolution
- [ ] Real GTK GIR file validation
- [ ] Cross-module dependencies

See [GIR_GEN_TESTING.md](../GIR_GEN_TESTING.md) for more details.
