# OCaml Readability & Maintainability Guidelines

## 0. Available Libraries

Use the following libraries. Only `containers` should be opened at global scope (i.e. `open Containers`).

- containers
- re
- uutf
- uri
- uuseg
- yojson
- fmt
- xmlm
- fpath

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

## 2. Prefer Result over Exceptions

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

---

## 3. Named Intermediate Values over Long Pipelines

### Bad: Anonymous pipeline soup
```ocaml
let summarize data =
  data
  |> List.filter (fun x -> x.active && x.score > 0)
  |> List.map (fun x -> (x.category, x.score))
  |> List.fold_left (fun acc (cat, score) ->
       Map.update cat (function
         | None -> Some score
         | Some s -> Some (s + score)) acc) Map.empty
  |> Map.to_list
  |> List.sort (fun (_, a) (_, b) -> Int.compare b a)
  |> List.take 10
```

### Good: Named steps document intent
```ocaml
let summarize data =
  let active_with_scores = 
    List.filter (fun x -> x.active && x.score > 0) data 
  in
  let by_category = 
    List.map (fun x -> (x.category, x.score)) active_with_scores 
  in
  let category_totals = 
    List.fold_left accumulate_by_category Map.empty by_category 
  in
  let ranked = 
    Map.to_list category_totals 
    |> List.sort (fun (_, a) (_, b) -> Int.compare b a) 
  in
  List.take 10 ranked

let accumulate_by_category acc (cat, score) =
  Map.update cat (fun existing -> 
    Some (Option.value existing ~default:0 + score)
  ) acc
```

### Rule of thumb: 
- 3+ pipeline stages → consider naming intermediates
- Any anonymous function > 1 line → extract and name it

---

## 4. Explicit Type Annotations at Module Boundaries

### Bad: Inferred types leak implementation details
```ocaml
(* user.ml - no .mli file *)
let create name email = { name; email; created_at = Unix.time () }
let validate user = 
  if String.contains user.email '@' then Some user else None
```

### Good: .mli defines the contract
```ocaml
(* user.mli *)
type t
(** Abstract user type *)

val create : name:string -> email:string -> t
(** [create ~name ~email] creates a new user. *)

val validate : t -> t option
(** [validate user] returns [Some user] if valid, [None] otherwise. *)

(* user.ml *)
type t = { name : string; email : string; created_at : float }

let create ~name ~email = { name; email; created_at = Unix.time () }

let validate user =
  if String.contains user.email '@' then Some user else None
```

### Guidelines:
- Every module exposed outside its directory needs an `.mli`
- Use labeled arguments (`~name`) for functions with multiple same-type params
- Document invariants in mli comments

---

## 5. Pattern Matching Completeness

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

### When catch-all IS acceptable:
```ocaml
(* Explicitly documenting "all others treated same" *)
let is_active = function
  | Active -> true
  | Pending | Suspended | Deleted -> false

(* Or when matching on open types like strings *)
let parse_command = function
  | "start" -> `Start
  | "stop" -> `Stop
  | other -> `Unknown other
```

---

## 6. Avoid Partial Functions

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

### Banned functions (use alternatives):
| Partial | Total |
|---------|-------|
| `List.hd` | `List.hd_opt` |
| `List.tl` | `List.tl_opt` or pattern match |
| `List.nth` | `List.nth_opt` |
| `Map.find` | `Map.find_opt` |
| `int_of_string` | `int_of_string_opt` |
| `String.get` | `String.get_opt` or bounds check |
| `Stdlib.(=)` | Use type-specific equality function e.g. `String.equal` |

---

## 7. Module Structure: Group by Abstraction

### Bad: Flat structure, mixed concerns
```ocaml
(* everything in one big module *)
type user = { ... }
type session = { ... }
let create_user = ...
let create_session = ...
let validate_user = ...
let validate_session = ...
let db_insert_user = ...
let db_insert_session = ...
```

### Good: Nested modules with clear responsibilities
```ocaml
module User : sig
  type t
  val create : name:string -> email:string -> t
  val validate : t -> t option
  
  module Db : sig
    val insert : t -> (unit, db_error) result Lwt.t
    val find : id:int -> t option Lwt.t
  end
end

module Session : sig
  type t
  val create : User.t -> t
  val is_valid : t -> bool
  
  module Db : sig
    val insert : t -> (unit, db_error) result Lwt.t
  end
end
```

---

## 8. Record Update Syntax for Clarity

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

## 9. Avoid Stringly-Typed Code

### Bad: Strings for structured data
```ocaml
let check_status status =
  if status = "active" then do_active ()
  else if status = "pending" then do_pending ()
  else failwith "Unknown status"

let make_request ~method_ ~path =
  if method_ = "GET" then ...
  else if method_ = "POST" then ...
```

### Good: Variants enforce correctness
```ocaml
type status = Active | Pending | Suspended

let check_status = function
  | Active -> do_active ()
  | Pending -> do_pending ()
  | Suspended -> do_suspended ()

type http_method = Get | Post | Put | Delete

let make_request ~method_ ~path =
  match method_ with
  | Get -> ...
  | Post -> ...
  | Put -> ...
  | Delete -> ...
```

## 10. Code Reuse

Reuse existing functions and code blocks to reduce duplication. Code shared between modules should be located in a file in the same directory named after its purpose. Similar functions should be grouped together.


## 11. Prefer labelled variants of standard library functions

Use `StdLabels` module to use labelled variants of standard library functions.
