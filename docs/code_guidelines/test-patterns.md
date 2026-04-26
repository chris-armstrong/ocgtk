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

### Bad: String-based validation of generated code

Any form of string matching to validate code structure is banned. This includes
direct string functions and convenience wrappers built on top of them:

```ocaml
(* WRONG: All of these are brittle — they fail on whitespace/formatting changes *)
if Helpers.string_contains ml_content "my_function" then ...
if String.contains ml_content "my_function" then ...
Helpers.assert_contains "msg" ml_content "my_function"
Helpers.assert_not_contains "msg" ml_content "my_function"
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

### Preferred: `Helpers.expect_some` / `Helpers.assert_some`

For option results that either feed into further assertions or are just
required to be `Some _`, use the helpers in
[`test_gir_gen/infrastructure/helpers.ml`][helpers]. They replace the noisy
`match … with Some x -> … | None -> Alcotest.fail …` boilerplate and work
for both unit-returning assertions and value-returning lookups (return type
is polymorphic).

```ocaml
(* existence-only check *)
Helpers.assert_some "expected get_text in signature"
  (Ml_ast_helpers.find_value_declaration_sig mli "get_text")

(* continue with the wrapped value *)
Helpers.expect_some "get_text not found"
  (Ml_ast_helpers.find_value_declaration_sig mli "get_text")
@@ fun vd ->
Ml_validation.assert_return_type vd "string"

(* value-returning lookup helper (Fun.id keeps the inner value) *)
let find_fn name =
  Helpers.expect_some
    (Printf.sprintf "C function '%s' not found" name)
    (List.find_opt (fun f -> f.C_ast.name = name) c_functions)
    Fun.id
```

Prefer `assert_some`/`expect_some` over inline `match` expressions: they fail
loudly with a clear message on `None`, keep the continuation flat, and
eliminate repetitive `Alcotest.fail` strings.

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

[helpers]: ../../../gir_gen/test/infrastructure/helpers.ml

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

  (* Assert: Verify the results using AST validation *)
  let output = Option.get_exn_or "Expected output" result in
  let ast = Ml_ast_helpers.parse_implementation output in
  Ml_validation.assert_value_exists ast "get_text"
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

- [ ] No string-based validation of generated code structure — this includes
  `Helpers.string_contains`, `Helpers.assert_contains`, `Helpers.assert_not_contains`,
  `String.contains`, `Str.search_forward`, or any other string matching approach
- [ ] All validation uses AST parsing first (`Ml_ast_helpers.parse_*`, `C_validation.*`)
- [ ] Reusing `Ml_validation` functions, not duplicating
- [ ] Reusing `Ml_ast_helpers` functions, not duplicating
- [ ] Tests use `Helpers.expect_some` / `Helpers.assert_some` for option results,
      not inline `match … with Some _ -> () | None -> Alcotest.fail …`
- [ ] Test names describe what is tested and expected outcome
- [ ] Tests follow Arrange-Act-Assert structure
