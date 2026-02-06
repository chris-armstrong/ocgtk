# Module Boundaries Guidelines

## 1. Explicit Type Annotations at Module Boundaries

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

---

## 2. When to Create .mli Files

### Always create .mli when:
- Module is exposed outside its directory
- Module defines abstract types
- Module has a public API used by other modules
- You want to hide implementation details

### Can skip .mli when:
- Module is purely internal to a single file
- Module is a simple collection of utilities with obvious types
- You're prototyping (but add before merging)

---

## 3. Use Labeled Arguments for Clarity

### Bad: Positional arguments of same type
```ocaml
val generate : string -> string -> string -> string
(* Which string is which? *)

let result = generate "Gtk" "Button" "gtk_button"
```

### Good: Labels document purpose
```ocaml
val generate : namespace:string -> type_name:string -> c_identifier:string -> string

let result = generate ~namespace:"Gtk" ~type_name:"Button" ~c_identifier:"gtk_button"
```

### When to use labels:
- Function has 2+ parameters of the same type
- Parameter meaning is not obvious from position
- Function is part of public API

---

## 4. Module Structure: Group by Abstraction

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

## 5. One Responsibility per Module

Each module should have a single, clear purpose.

### Bad: Mixed responsibilities
```ocaml
(* generator.ml *)
let parse_input = ...           (* parsing *)
let validate_input = ...        (* validation *)
let generate_code = ...         (* generation *)
let write_output = ...          (* I/O *)
let format_error = ...          (* error handling *)
```

### Good: Focused modules
```ocaml
(* parser.ml *)
let parse = ...

(* validator.ml *)
let validate = ...

(* generator.ml *)
let generate = ...

(* output.ml *)
let write = ...
```

---

## 6. Document Invariants in .mli Comments

```ocaml
(* method_info.mli *)

type t
(** Method information.

    Invariants:
    - [name] is a valid OCaml identifier
    - [params] does not contain self parameter
    - [return_type] is [None] for void methods
*)

val create : name:string -> params:param list -> return_type:string option -> t
(** [create ~name ~params ~return_type] creates method info.

    @raise Invalid_argument if [name] is not a valid identifier. *)
```

---

## 7. Expose Minimal Interface

Only expose what's needed by callers.

### Bad: Exposing everything
```ocaml
(* generator.mli *)
val internal_helper : string -> string  (* Implementation detail! *)
val format_temp : buffer -> unit        (* Implementation detail! *)
val generate : entity -> string         (* Actual public API *)
```

### Good: Hide implementation
```ocaml
(* generator.mli *)
val generate : entity -> string
(** Generate code for the given entity. *)

(* generator.ml *)
let internal_helper s = ...  (* Not exposed *)
let format_temp buf = ...    (* Not exposed *)
let generate entity = ...    (* Public *)
```

---

## Checklist

Before submitting code, verify:

- [ ] Public modules have .mli files
- [ ] Abstract types hide implementation details
- [ ] Functions with 2+ same-type params use labels
- [ ] Each module has a single responsibility
- [ ] Only public API is exposed in .mli
- [ ] Invariants documented in .mli comments
