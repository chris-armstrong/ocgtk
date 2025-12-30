# ML File Generation Tests (Layer 1)

**Status: ❌ TODO**

Unit tests for ML file (.ml/.mli) generation.

## Planned Test Files

- **module_structure_tests.ml** - Test ML module organization (TODO)
- **type_definition_tests.ml** - Test OCaml type definitions (TODO)
- **external_decl_tests.ml** - Test external C function declarations (TODO)
- **signature_tests.ml** - Test .mli signature generation (TODO)
- **edge_cases.ml** - ML-specific edge cases (TODO)

## Testing Approach (Planned)

ML file generation tests should use **library-based testing** similar to C stub tests:

1. Create test context and GIR data structures
2. Call ML generator functions directly
3. Parse generated .ml and .mli files
4. Validate module structure, type definitions, and signatures

## Infrastructure Needed

- **ml_parser.ml** - Parser for OCaml code (TODO)
- **ml_ast.ml** - AST types for OCaml constructs (TODO)
- **ml_validation.ml** - High-level validation helpers (TODO)

## Coverage Areas (Planned)

- [ ] Module naming and hierarchy
- [ ] Type definitions (records, variants, objects)
- [ ] External declarations matching C stubs
- [ ] .mli signature generation
- [ ] Documentation comments
- [ ] Edge cases (name collisions, empty modules, etc.)

See [GIR_GEN_TESTING.md](../GIR_GEN_TESTING.md) for detailed specifications.
