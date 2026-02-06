# Error Handling Guidelines

## 1. Prefer Result over Exceptions

### Bad: Exceptions for control flow
```ocaml
let find_config key =
  try
    let value = Hashtbl.find config_table key in
    let parsed = parse_config_value value in
    if validate parsed then parsed
    else raise (Invalid_argument "validation failed")
  with
  | Not_found -> raise (Config_error ("Missing key: " ^ key))
  | Failure msg -> raise (Config_error ("Parse error: " ^ msg))
```

### Good: Result types make failure explicit
```ocaml
let find_config key =
  let open Result.Syntax in
  let* value =
    Hashtbl.find_opt config_table key
    |> Option.to_result ~none:(`Missing_key key)
  in
  let* parsed =
    parse_config_value value
    |> Result.map_error (fun msg -> `Parse_error msg)
  in
  if validate parsed then Ok parsed
  else Error (`Validation_failed key)
```

### When exceptions ARE appropriate:
- Programming errors (bugs) that should crash: `assert false`, `failwith "invariant violated"`
- Top-level boundaries where you catch and convert to Result
- Interfacing with libraries that use exceptions

---

## 2. Use Bind Operators to Flatten Chains

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

---

## 3. Provide Error Context

### Bad: Bare errors
```ocaml
let load_config path =
  match read_file path with
  | Error _ -> Error "failed"
  | Ok content ->
    match parse_json content with
    | Error _ -> Error "failed"
    | Ok json -> Ok json
```

### Good: Contextual errors
```ocaml
type config_error =
  | File_not_found of string
  | Read_error of { path: string; cause: string }
  | Parse_error of { path: string; line: int; message: string }

let load_config path =
  let open Result.Syntax in
  let* content =
    read_file path
    |> Result.map_error (fun e -> Read_error { path; cause = e })
  in
  let* json =
    parse_json content
    |> Result.map_error (fun (line, msg) -> Parse_error { path; line; message = msg })
  in
  Ok json
```

---

## 4. Option vs Result: When to Use Each

### Use Option when:
- Absence is normal and expected (lookup in a collection)
- There's only one failure mode ("not found")
- The caller doesn't need to know why it failed

### Use Result when:
- There are multiple failure modes
- Error context is needed for debugging
- The failure should propagate up the call stack

### Examples:
```ocaml
(* Option: simple lookup *)
val find_entity : name:string -> entity option

(* Result: operation that can fail multiple ways *)
val generate_binding : entity -> (string, generation_error) result

(* Option.to_result when converting *)
let entity =
  find_entity ~name
  |> Option.to_result ~none:(`Entity_not_found name)
```

---

## 5. In Tests: Assertion methods should call Alcotest.fail directly, not return an option

### Bad: Option-based test assertions
```ocaml
let test_method_generation () =
  let result = generate_method method_info in
  match result with
  | "" -> None (* obscures failure, forces caller to manage *)
  | output ->
    if not (String.contains output "expected") then ()
    else ()
```

### Good: Explicit assertions with Alcotest
```ocaml
let test_method_generation () =
  let result = generate_method method_info in
  match result with
  (* Expilicit fail, with extra context in message from available parameters and context to identify cause *)
  | "" -> Alcotest.fail (Fmt.str "Expected non empty string for generate_method %s" method_info.name)
  | output ->
    Alcotest.(check bool) "contains expected" true
      (String.contains output "expected")
```

### Even better: Use check combinators
```ocaml
let test_method_generation () =
  let output =
    generate_method method_info
    |> Option.get_exn_or "Expected method to be generated"
  in
  Alcotest.(check bool) "contains expected" true
    (String.contains output "expected")
```

---

## Checklist

Before submitting code, verify:

- [ ] No exceptions for expected failure modes
- [ ] Result types used when there are multiple failure modes
- [ ] Errors include context (what failed, why, where)
- [ ] Option used only for simple "found/not found"
- [ ] No silent failures (swallowed None cases)
- [ ] Tests use Alcotest.fail, not Option pattern matching
