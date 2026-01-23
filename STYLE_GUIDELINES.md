# Style guidelines for OCaml code

This document identifies some common style guidelines for working with OCaml code in this repository.

## Comments

Use comments to:
* explain complex pieces of code
* explain the intention of a block of code
* provide a short description of a function, especially utility functions or matching functions

## Run ocamlformat to format code after making changes

`ocamlformat` is our linter and reformatter. Use it after making changes to ensure code style is consistent.

## Do not use the builtin `=` operator

This operator is exceptionally bad for structural comparisons. We should always prefer a typed comparison function (e.g. String.equal, Int.equal) over this operator, even for simple types where it works stabily.

## Avoid nested pattern matching statements (match ... with)

When working with `option` or `result` types, the match operator is messy when conditions are repeatedly nested. Better ways include:

* Using `Option` module operators such as `Option.map` or `Option.bind`
* Using `Result` module operators such as `Result.map` or `Result.bind`
* Defining a local `let*` or `let+` binding to Option.map or Result.map
* Using chained pipe operators for multiple levels of mapping
* Use `containers` library for more complex Option and Result types

IF you are chaining multiple `None` condition checks, you may need to define a helper function such as `Option.or` e.g.

```ocaml
module Option = struct
   include Option
   let or x fn = match x with
    | Some x -> Some x
    | None -> fn ()
end
```

## Binding Operators vs Pipeline Operators

When dealing with nested `Option` or `Result` operations, you have two main approaches:

### Binding Operators (`let*`, `let+`)

Use binding operators when:
- You have **2-3 nested operations** that build on each other
- Each operation **depends on the result** of the previous one
- You want to **avoid deeply nested parentheses**
- The operations are **closely related** and part of the same logical flow

**Good example:**
```ocaml
let get_user_email config =
  let* user = find_user config in
  let* profile = get_profile user in
  let* email = profile.email in
  Some email
```

### Pipeline Operators (`|>`)

Use pipeline operators when:
- You have **simple transformations** in a sequence
- Each step is **independent** or only needs the previous value directly
- You want to keep the **data flow** visible
- The operations are **well-suited** for linear transformation

**Good example:**
```ocaml
let process_user user ->
  user
  |> sanitize_input
  |> validate_length
  |> encode_special_chars
  |> Database.save
```

### When to Use Which

**Prefer binding operators when:**
- Operations are **conditionally dependent** (each step might fail or be skipped)
- You have **nested Option/Result** types
- The code becomes **hard to read** with pipelines due to nesting

**Prefer pipeline operators when:**
- You have a **clear data transformation pipeline**
- Operations are **deterministic** and always applied
- The flow is **primarily linear** without branching

**Example comparing both approaches:**

*Using binding operators (preferred for nested Options):*
```ocaml
let find_config_value config key =
  let* section = Hashtbl.find_opt config.sections key in
  let* value = Hashtbl.find_opt section.values "target" in
  Some value
```

*Using pipelines (acceptable for simple cases):*
```ocaml
let find_config_value config key =
  config
  |> Hashtbl.find_opt key
  |> Option.map (fun s -> s.values)
  |> Option.bind (Hashtbl.find_opt "target")
```

### Key Principle

**Readability matters most.** If binding operators make the code clearer, use them. If pipelines flow better for your specific case, use those. The goal is to make complex logic easy to understand at a glance.

## Function Design

**Avoid partial application confusion**: When defining functions, order parameters from most to least general

**Use labeled arguments**: For functions with >2 parameters or similar types, use labeled arguments `~name:`

**Keep functions small**: Aim for functions that do one thing well; extract helpers when needed

**Extract nested pattern matching**: When a function has a complex pattern match, extract the match into a separate function


## Type Annotations

**Annotate public interfaces**: Always annotate function signatures in `.mli` files

**Annotate complex expressions**: Add type annotations where type inference might be unclear

**Don't over-annotate**: Trust OCaml's inference for obvious local bindings
