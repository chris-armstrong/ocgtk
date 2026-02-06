# Test Patterns Guidelines

## 1. AST-Based Validation (REQUIRED)

**ALWAYS** use AST parsing for validation in test code.

### Good: Parse then validate
```ocaml
let ml_ast = Ml_ast_helpers.parse_implementation ml_content in
Ml_validation.assert_value_exists ml_ast "my_function"

let mli_ast = Ml_ast_helpers.parse_interface mli_content in
Ml_validation.assert_type_exists_sig mli_ast "my_type"
```

### Bad: String search for code validation
```ocaml
(* WRONG: Brittle, fails on whitespace/formatting changes *)
if Helpers.string_contains ml_content "my_function" then ...
if String.contains ml_content "my_function" then ...
```

### Why AST-Based Validation?
- **Robust**: Handles formatting variations, comments, whitespace
- **Precise**: Validates actual structure, not text patterns
- **Maintainable**: Survives code reformatting with ocamlformat
- **Type-safe**: Catches errors at compile time

---

## 2. Available Validation Functions

### From `ml_validation.ml`:
- `assert_value_exists ast name` - Check function/value exists
- `assert_type_exists ast name` - Check type exists in .ml
- `assert_type_exists_sig mli_ast name` - Check type exists in .mli
- `find_value_declaration_sig mli_ast name` - Get value signature
- `find_external_sig mli_ast name` - Get external declaration

### From `ml_ast_helpers.ml`:
- `parse_implementation content` - Parse .ml file to AST
- `parse_interface content` - Parse .mli file to AST
- `find_let_binding ast name` - Find let binding
- `find_external ast name` - Find external binding

---

## 3. Use Alcotest Assertions, Not Option

### Bad: Silent failures with Option
```ocaml
let test_method_generation () =
  let result = generate_method method_info in
  match result with
  | None -> ()  (* Silent pass when it should fail! *)
  | Some output ->
    if not (validate output) then ()
```

### Good: Explicit Alcotest assertions
```ocaml
let test_method_generation () =
  let output =
    generate_method method_info
    |> Option.get_exn_or "Expected method to be generated"
  in
  Alcotest.(check bool) "output is valid" true (validate output)
```

### Even better: Custom testables
```ocaml
let generation_result =
  Alcotest.testable
    (fun fmt -> function
      | None -> Format.fprintf fmt "None"
      | Some s -> Format.fprintf fmt "Some(%s)" s)
    (Option.equal String.equal)

let test_method_generation () =
  let result = generate_method method_info in
  Alcotest.(check generation_result) "method generated"
    (Some expected_output) result
```

---

## 4. Test Naming Conventions

### Test names should describe:
1. What is being tested
2. The scenario/condition
3. Expected outcome

### Bad: Vague names
```ocaml
let test_method () = ...
let test_class () = ...
let test_property () = ...
```

### Good: Descriptive names
```ocaml
let test_method_with_out_param_generates_tuple_return () = ...
let test_class_with_interface_includes_parent_methods () = ...
let test_property_nullable_uses_option_type () = ...
```

---

## 5. Test Structure: Arrange-Act-Assert

```ocaml
let test_method_generation () =
  (* Arrange: Set up test data *)
  let method_info = {
    name = "get_text";
    return_type = Some "utf8";
    params = [];
  } in

  (* Act: Execute the code under test *)
  let result = generate_method method_info in

  (* Assert: Verify the results *)
  let output = Option.get_exn_or "Expected output" result in
  Alcotest.(check bool) "contains method name" true
    (String.contains output "get_text")
```

---

## 6. Creating New Test Helpers

### Mandatory Study Phase (before writing ANY code):

1. **Read these files COMPLETELY**:
   - `test_gir_gen/infrastructure/ml_validation.ml`
   - `test_gir_gen/infrastructure/ml_ast_helpers.ml`
   - `test_gir_gen/infrastructure/helpers.ml`

2. **Document the patterns** you found:
   ```ocaml
   (* Pattern Analysis:
    * - All validation uses: parse -> assert_value_exists
    * - Never uses: string_contains for code validation
    * - Helper modules: Ml_validation, Ml_ast_helpers
    * - Template function: ml_validation.ml:45-60
    *)
   ```

3. **Use established patterns** - Don't reinvent:
   - If `assert_value_exists` exists, use it
   - If `Ml_ast_helpers.parse_implementation` exists, use it
   - Don't create duplicate validation functions

4. **Template function approach**:
   ```ocaml
   (* Find ONE similar function as template *)
   let validate_method_exists ~ml_content ~method_name =
     (* Template: ml_validation.ml:assert_value_exists *)
     let ml_ast = Ml_ast_helpers.parse_implementation ml_content in
     Ml_validation.assert_value_exists ml_ast method_name
   ```

---

## 7. Reference Guide

See [OCaml AST Reference Guide](../ocaml_ast/AST_REFERENCE_GUIDE.md) for common OCaml syntax to AST translations.

---

## Anti-Pattern Checklist

Before submitting test code, verify:

- [ ] No `Helpers.string_contains` for code validation
- [ ] No `String.contains` for checking if code exists
- [ ] All validation uses AST parsing first
- [ ] Reusing `Ml_validation` functions, not duplicating
- [ ] Reusing `Ml_ast_helpers` functions, not duplicating
- [ ] Tests use Alcotest assertions, not Option matching
- [ ] Test names describe what is tested and expected outcome
- [ ] Tests follow Arrange-Act-Assert structure
