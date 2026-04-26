# Partial Functions Guidelines

## 1. Avoid Partial Functions

Partial functions can crash at runtime. Use total alternatives that return Option or Result.

### Bad: Partial functions that can crash
```ocaml
let first_element list = List.hd list
let unsafe_find key map = Map.find key map
let parse_int s = int_of_string s
```

### Good: Total functions return Option/Result
```ocaml
let first_element list = List.hd_opt list
let safe_find key map = Map.find_opt key map
let parse_int s = int_of_string_opt s

(* Or with Result for better errors *)
let parse_int s =
  match int_of_string_opt s with
  | Some n -> Ok n
  | None -> Error (`Invalid_int s)
```

---

## 2. Banned Functions and Their Alternatives

| Partial (Avoid) | Total (Use Instead) |
|-----------------|---------------------|
| `List.hd` | `List.hd_opt` |
| `List.tl` | `List.tl_opt` or pattern match |
| `List.nth` | `List.nth_opt` |
| `Map.find` | `Map.find_opt` |
| `Hashtbl.find` | `Hashtbl.find_opt` |
| `int_of_string` | `int_of_string_opt` |
| `float_of_string` | `float_of_string_opt` |
| `String.get` | `String.get_opt` or bounds check |
| `Array.get` | bounds check first |
| `Option.get` | `Option.value ~default:` or pattern match |
| `Stdlib.(=)` | Type-specific equality (e.g., `String.equal`) |

---

## 3. Pattern Match Instead of Head/Tail

### Bad: Using hd and tl
```ocaml
let process list =
  if List.length list > 0 then
    let first = List.hd list in
    let rest = List.tl list in
    Some (handle first rest)
  else
    None
```

### Good: Pattern match
```ocaml
let process = function
  | [] -> None
  | first :: rest -> Some (handle first rest)
```

---

## 4. Use Option.value for Defaults

### Bad: Option.get can crash
```ocaml
let name = Option.get maybe_name  (* Crashes if None! *)
```

### Good: Provide default or handle None
```ocaml
(* With default value *)
let name = Option.value maybe_name ~default:"anonymous"

(* With explicit handling *)
let name = match maybe_name with
  | Some n -> n
  | None -> generate_default_name ()

(* With Result conversion *)
let name =
  maybe_name
  |> Option.to_result ~none:`Name_required
```

---

## 5. Use Type-Specific Equality

`Stdlib.(=)` is polymorphic and can behave unexpectedly on functions, abstract types, or cyclic structures.

### Bad: Polymorphic equality
```ocaml
if status = "active" then ...
if list1 = list2 then ...
```

### Good: Type-specific equality
```ocaml
if String.equal status "active" then ...
if List.equal String.equal list1 list2 then ...
```

### Common type-specific equalities:
- `String.equal`
- `Int.equal`
- `Bool.equal`
- `Option.equal elem_equal`
- `List.equal elem_equal`

---

## 6. When Partial Functions ARE Acceptable

### After explicit validation
```ocaml
let process list =
  assert (List.length list > 0);  (* Invariant: list is non-empty *)
  let first = List.hd list in     (* Safe: we just checked *)
  ...
```

### In pattern match where case is impossible
```ocaml
let process = function
  | [] -> handle_empty ()
  | [x] -> handle_single x
  | first :: second :: rest ->
    (* We know rest is valid because we matched 2+ elements *)
    let last = List.hd (List.rev rest) in  (* Safe if rest non-empty *)
    ...
```

### With `_exn` suffix to signal intent
```ocaml
(* Name makes it clear this can raise *)
let find_exn key map =
  match Map.find_opt key map with
  | Some v -> v
  | None -> failwith (Printf.sprintf "Key not found: %s" key)
```

---

## 7. Containers Alternatives

The Containers library (project standard) provides safe alternatives:

```ocaml
open Containers

(* Safe list operations *)
List.head_opt [1;2;3]  (* Some 1 *)
List.tail_opt [1;2;3]  (* Some [2;3] *)
List.get_at_idx 5 [1;2;3]  (* None *)

(* Safe string operations *)
String.get_opt 10 "hello"  (* None *)

(* Safe conversions *)
Int.of_string_opt "42"  (* Some 42 *)
Int.of_string_opt "abc"  (* None *)
```

---

## Checklist

Before submitting code, verify:

- [ ] No `List.hd` or `List.tl` - use pattern matching
- [ ] No `Map.find` - use `Map.find_opt`
- [ ] No `int_of_string` - use `int_of_string_opt`
- [ ] No `Option.get` - use `Option.value ~default:` or pattern match
- [ ] No `Stdlib.(=)` - use type-specific equality
- [ ] Any intentional partial functions have `_exn` suffix
