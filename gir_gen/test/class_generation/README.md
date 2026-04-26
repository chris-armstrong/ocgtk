# Class Generation Tests (Layer 2)

**Status: ❌ TODO**

Unit tests for class definition and object-oriented wrapper generation.

## Planned Test Files

- **class_structure_tests.ml** - Test class definition structure (TODO)
- **inheritance_tests.ml** - Test class inheritance hierarchy (TODO)
- **method_dispatch_tests.ml** - Test method dispatch mechanism (TODO)
- **property_accessor_tests.ml** - Test property accessor generation (TODO)
- **edge_cases.ml** - Class-specific edge cases (TODO)

## Testing Approach (Planned)

Class generation tests should use **library-based testing**:

1. Create test context with class hierarchies
2. Call class generator functions directly
3. Parse generated class definitions
4. Validate inheritance, methods, and properties

## Infrastructure Needed

- Extend **ml_parser.ml** to handle class syntax (TODO)
- Extend **ml_ast.ml** with class-specific AST nodes (TODO)
- Add class validation helpers to **ml_validation.ml** (TODO)

## Coverage Areas (Planned)

- [ ] Class naming and structure
- [ ] Constructor generation
- [ ] Instance and class methods
- [ ] Single inheritance and interface implementation
- [ ] Method overriding and super calls
- [ ] Property getters and setters
- [ ] Method chaining
- [ ] Edge cases (empty classes, deep hierarchies, etc.)

See [GIR_GEN_TESTING.md](../GIR_GEN_TESTING.md) for detailed specifications.
