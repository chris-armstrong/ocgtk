# Nesting and Control Flow Guidelines

## 1. Reduce Nesting (max 2 levels)

### Bad: Deep nesting
```ocaml
let process_user request =
  match parse_request request with
  | None -> Error "Invalid request"
  | Some req ->
    match validate_user req.user_id with
    | Error e -> Error e
    | Ok user ->
      match fetch_permissions user with
      | Error e -> Error e
      | Ok perms ->
        match check_access perms req.resource with
        | false -> Error "Access denied"
        | true -> Ok (execute req user)
```

### Good: Bind operators flatten the chain
```ocaml
let process_user request =
  let open Result.Syntax in
  let* req = parse_request request |> Option.to_result ~none:"Invalid request" in
  let* user = validate_user req.user_id in
  let* perms = fetch_permissions user in
  let* () = check_access perms req.resource |> Result.ok_if_true ~error:"Access denied" in
  Ok (execute req user)
```

### Good: Extract named steps for complex logic
```ocaml
let authorize user resource =
  let* perms = fetch_permissions user in
  check_access perms resource |> Result.ok_if_true ~error:"Access denied"

let process_user request =
  let open Result.Syntax in
  let* req = parse_request request |> Option.to_result ~none:"Invalid request" in
  let* user = validate_user req.user_id in
  let* () = authorize user req.resource in
  Ok (execute req user)
```

---

## 2. Use Bind Operators

The `let*` and `let+` operators from `Result.Syntax` or `Option.Syntax` flatten sequential operations.

### Operators:
- `let*` - bind (flatMap): unwrap, apply function that returns wrapped value
- `let+` - map: unwrap, apply function that returns plain value
- `and*` - combine multiple wrapped values

### Example:
```ocaml
let open Result.Syntax in
let* a = get_first () in      (* a is unwrapped *)
let* b = get_second a in      (* b is unwrapped *)
let+ c = get_third b in       (* c is unwrapped, result re-wrapped *)
process a b c                  (* returns plain value, wrapped by let+ *)
```

---

## 3. Early Return Pattern

Exit early on failure cases to keep the happy path at the top level.

### Bad: Happy path nested deep
```ocaml
let process x =
  if not (is_valid x) then
    Error "invalid"
  else
    if not (is_authorized x) then
      Error "unauthorized"
    else
      if not (has_quota x) then
        Error "quota exceeded"
      else
        Ok (do_work x)
```

### Good: Guard clauses first
```ocaml
let process x =
  let open Result.Syntax in
  let* () = if is_valid x then Ok () else Error "invalid" in
  let* () = if is_authorized x then Ok () else Error "unauthorized" in
  let* () = if has_quota x then Ok () else Error "quota exceeded" in
  Ok (do_work x)
```

---

## Checklist

Before submitting code, verify:

- [ ] No match expressions nested more than 2 levels deep
- [ ] Sequential Result/Option operations use bind operators
- [ ] Complex logic extracted into named helper functions
- [ ] Guard conditions checked early, not nested
