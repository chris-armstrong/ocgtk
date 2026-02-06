# Pattern Matching Guidelines

## 1. Pattern Matching Completeness

### Bad: Catch-all hides bugs
```ocaml
type status = Pending | Active | Suspended | Deleted

let status_message = function
  | Pending -> "Waiting for approval"
  | Active -> "Account is active"
  | _ -> "Account unavailable"  (* Suspended and Deleted conflated *)
```

### Good: Explicit cases, compiler catches additions
```ocaml
let status_message = function
  | Pending -> "Waiting for approval"
  | Active -> "Account is active"
  | Suspended -> "Account temporarily suspended"
  | Deleted -> "Account has been deleted"
```

When you add a new variant, the compiler will show all places that need updating.

---

## 2. When Catch-All IS Acceptable

### Explicitly grouping "all others"
```ocaml
let is_active = function
  | Active -> true
  | Pending | Suspended | Deleted -> false
```

### Matching on open types like strings
```ocaml
let parse_command = function
  | "start" -> `Start
  | "stop" -> `Stop
  | other -> `Unknown other
```

### Default case with exhaustive alternatives listed
```ocaml
(* Comment documents what's caught *)
let priority = function
  | Critical -> 0
  | High -> 1
  | Medium -> 2
  | Low | Info | Debug -> 3  (* All low-priority cases *)
```

---

## 3. Prefer Pattern Matching over If-Else

### Bad: Nested if-else
```ocaml
let classify x =
  if x < 0 then "negative"
  else if x = 0 then "zero"
  else "positive"
```

### Good: Pattern matching with guards
```ocaml
let classify = function
  | x when x < 0 -> "negative"
  | 0 -> "zero"
  | _ -> "positive"
```

### Even better for discrete values:
```ocaml
let day_type = function
  | Saturday | Sunday -> "weekend"
  | Monday | Tuesday | Wednesday | Thursday | Friday -> "weekday"
```

---

## 4. Destructure in Pattern Matches

### Bad: Accessing fields after matching
```ocaml
let process entity =
  match entity with
  | Class c ->
    let name = c.name in
    let methods = c.methods in
    generate_class name methods
  | Interface i ->
    let name = i.name in
    let methods = i.methods in
    generate_interface name methods
```

### Good: Destructure in the pattern
```ocaml
let process = function
  | Class { name; methods; _ } -> generate_class name methods
  | Interface { name; methods; _ } -> generate_interface name methods
```

---

## 5. Use Or-Patterns for Shared Handling

### Bad: Duplicated code for similar cases
```ocaml
let handle = function
  | Add x -> log "operation"; compute x
  | Sub x -> log "operation"; compute x
  | Mul x -> log "operation"; compute x
  | Div x -> handle_div x
```

### Good: Or-pattern groups similar cases
```ocaml
let handle = function
  | Add x | Sub x | Mul x -> log "operation"; compute x
  | Div x -> handle_div x
```

---

## 6. Avoid Deep Nesting in Patterns

### Bad: Deeply nested match
```ocaml
let process opt =
  match opt with
  | Some result ->
    match result with
    | Ok value ->
      match value with
      | Some data -> use data
      | None -> default ()
    | Error e -> handle_error e
  | None -> default ()
```

### Good: Flatten with nested patterns or bind
```ocaml
(* Option 1: Nested pattern *)
let process = function
  | Some (Ok (Some data)) -> use data
  | Some (Error e) -> handle_error e
  | Some (Ok None) | None -> default ()

(* Option 2: Bind operators *)
let process opt =
  let open Option.Syntax in
  let* result = opt in
  match result with
  | Ok (Some data) -> Some (use data)
  | Ok None -> Some (default ())
  | Error e -> Some (handle_error e)
```

---

## 7. Name Complex Patterns

### Bad: Inline complex pattern
```ocaml
let process = function
  | { name; deprecated = false; params = []; return_type = Some "void" } ->
    generate_simple name
  | m -> generate_complex m
```

### Good: Use `as` to name and explain
```ocaml
let process = function
  | { name; deprecated = false; params = []; return_type = Some "void" }
    as simple_void_method ->
    generate_simple simple_void_method.name
  | method_info ->
    generate_complex method_info
```

---

## Checklist

Before submitting code, verify:

- [ ] No catch-all `_` that hides unhandled cases
- [ ] Catch-all only used for intentionally grouped cases
- [ ] Pattern matching preferred over if-else chains
- [ ] Fields destructured in pattern, not accessed after
- [ ] Or-patterns used for shared handling
- [ ] No deeply nested match expressions
