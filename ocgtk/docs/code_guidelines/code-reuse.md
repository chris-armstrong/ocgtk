# Code Reuse Guidelines

## 1. Record Update Syntax for Clarity

### Bad: Reconstructing records manually
```ocaml
let update_user_email user new_email =
  { name = user.name;
    email = new_email;
    created_at = user.created_at;
    role = user.role;
    settings = user.settings }
```

### Good: Functional update
```ocaml
let update_user_email user new_email =
  { user with email = new_email }
```

### For multiple updates, still clear:
```ocaml
let promote_to_admin user =
  { user with
    role = Admin;
    permissions = Permission.all;
    promoted_at = Some (Unix.time ()) }
```

---

## 2. Code Reuse Across Modules

Reuse existing functions and code blocks to reduce duplication.

### Principles:
- Code shared between modules should be in a file named after its purpose
- Similar functions should be grouped together
- Don't create a utility module until you have 2+ uses

### Bad: Duplicated logic
```ocaml
(* In class_gen_method.ml *)
let should_skip_method method_info =
  method_info.deprecated ||
  List.mem method_info.name excluded_methods ||
  has_unsupported_param method_info

(* In c_stub_method.ml - same logic duplicated! *)
let should_skip method_info =
  method_info.deprecated ||
  List.mem method_info.name excluded_methods ||
  has_unsupported_param method_info
```

### Good: Shared module
```ocaml
(* In filtering.ml *)
let should_skip_method method_info =
  method_info.deprecated ||
  List.mem method_info.name excluded_methods ||
  has_unsupported_param method_info

(* In class_gen_method.ml *)
let generate_methods methods =
  methods
  |> List.filter (fun m -> not (Filtering.should_skip_method m))
  |> List.map generate_method

(* In c_stub_method.ml *)
let generate_stubs methods =
  methods
  |> List.filter (fun m -> not (Filtering.should_skip_method m))
  |> List.map generate_stub
```

---

## 3. Prefer Labelled Variants of Standard Library Functions

Use `StdLabels` or Containers' labelled functions for clarity.

### Bad: Positional arguments are confusing
```ocaml
let result = List.fold_left (fun acc x -> acc + x) 0 numbers
let mapped = List.map (fun x -> x * 2) numbers
let filtered = List.filter (fun x -> x > 0) numbers
```

### Good: Labels document intent
```ocaml
open StdLabels

let result = List.fold_left ~f:(fun acc x -> acc + x) ~init:0 numbers
let mapped = List.map ~f:(fun x -> x * 2) numbers
let filtered = List.filter ~f:(fun x -> x > 0) numbers
```

### Or with Containers (project standard):
```ocaml
open Containers

let result = List.fold_left (fun acc x -> acc + x) 0 numbers
(* Containers provides good defaults; use labeled when clearer *)
```

---

## 4. Extract Common Patterns into Helpers

When you see the same pattern 3+ times, extract it.

### Bad: Repeated iteration pattern
```ocaml
let generate_methods entity output =
  List.fold_left (fun acc method_info ->
    if should_skip method_info then acc
    else acc ^ generate_method method_info ^ "\n"
  ) "" entity.methods

let generate_properties entity output =
  List.fold_left (fun acc prop_info ->
    if should_skip_prop prop_info then acc
    else acc ^ generate_property prop_info ^ "\n"
  ) "" entity.properties
```

### Good: Extracted helper
```ocaml
let generate_filtered ~skip ~generate items =
  items
  |> List.filter (fun item -> not (skip item))
  |> List.map generate
  |> String.concat "\n"

let generate_methods entity =
  generate_filtered
    ~skip:should_skip_method
    ~generate:generate_method
    entity.methods

let generate_properties entity =
  generate_filtered
    ~skip:should_skip_prop
    ~generate:generate_property
    entity.properties
```

---

## 5. Use Higher-Order Functions Over Copy-Paste

When behavior varies, parameterize with functions.

### Bad: Copy-paste with slight variations
```ocaml
let generate_ml_class entity =
  let header = format_ml_header entity in
  let methods = List.map generate_ml_method entity.methods in
  let footer = format_ml_footer entity in
  String.concat "\n" (header :: methods @ [footer])

let generate_mli_class entity =
  let header = format_mli_header entity in
  let methods = List.map generate_mli_method entity.methods in
  let footer = format_mli_footer entity in
  String.concat "\n" (header :: methods @ [footer])
```

### Good: Parameterized generator
```ocaml
type class_formatter = {
  format_header: entity -> string;
  format_method: method_info -> string;
  format_footer: entity -> string;
}

let generate_class formatter entity =
  let header = formatter.format_header entity in
  let methods = List.map formatter.format_method entity.methods in
  let footer = formatter.format_footer entity in
  String.concat "\n" (header :: methods @ [footer])

let ml_formatter = {
  format_header = format_ml_header;
  format_method = generate_ml_method;
  format_footer = format_ml_footer;
}

let mli_formatter = {
  format_header = format_mli_header;
  format_method = generate_mli_method;
  format_footer = format_mli_footer;
}

let generate_ml_class = generate_class ml_formatter
let generate_mli_class = generate_class mli_formatter
```

---

## 6. Don't Over-Abstract

### Signs of over-abstraction:
- Helper used only once
- More code in abstraction than saved
- Abstraction is harder to understand than original

### Bad: Unnecessary abstraction
```ocaml
(* Created helper for one-time use *)
let apply_if_some f opt =
  match opt with
  | None -> None
  | Some x -> Some (f x)

(* Only called once *)
let result = apply_if_some String.uppercase_ascii maybe_name
```

### Good: Just use Option.map
```ocaml
let result = Option.map String.uppercase_ascii maybe_name
```

---

## Checklist

Before submitting code, verify:

- [ ] No manual record reconstruction (use `with`)
- [ ] Duplicated code (3+ occurrences) extracted to shared module
- [ ] Helpers are used more than once
- [ ] Common patterns parameterized with functions
- [ ] Labels used where they clarify meaning
- [ ] Abstractions aren't more complex than the code they replace
