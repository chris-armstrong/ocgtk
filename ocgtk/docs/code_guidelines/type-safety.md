# Type Safety Guidelines

## 1. Avoid Stringly-Typed Code

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

---

## 2. Phantom Types for Distinct Identifiers

When the same underlying type (typically `string`) represents different concepts, use phantom types to prevent confusion.

### Bad: Confusable string parameters
```ocaml
(* All strings - easy to swap by mistake *)
let generate_binding ~namespace ~type_name ~c_identifier ~module_name =
  ...

(* Caller can easily get order wrong *)
let () = generate_binding
  ~namespace:"Button"      (* Wrong! This is type_name *)
  ~type_name:"Gtk"         (* Wrong! This is namespace *)
  ~c_identifier:"GtkButton"
  ~module_name:"Button"
```

### Good: Phantom types prevent mistakes
```ocaml
(* Define phantom type markers *)
type namespace_tag
type type_name_tag
type c_identifier_tag
type module_name_tag

(* Wrap strings with phantom types *)
type 'a tagged_string = private string

module Namespace : sig
  type t = namespace_tag tagged_string
  val of_string : string -> t
  val to_string : t -> string
end = struct
  type t = namespace_tag tagged_string
  let of_string s = Obj.magic s
  let to_string t = Obj.magic t
end

(* Similar for TypeName, CIdentifier, ModuleName *)

(* Now the compiler catches mistakes *)
let generate_binding ~namespace ~type_name ~c_identifier ~module_name =
  ...

(* Type error: Namespace.t vs TypeName.t *)
let () = generate_binding
  ~namespace:(TypeName.of_string "Button")  (* Compile error! *)
  ...
```

### When to use phantom types:
- String identifiers passed to 3+ functions
- Identifiers that are easy to confuse (namespace vs module_name)
- Identifiers with different validation rules

---

## 3. Type Witnesses for Runtime Discrimination

When you need to determine types at runtime but want compile-time safety, use GADTs as type witnesses.

### Bad: Stringly-typed dispatch
```ocaml
let convert_value type_name value =
  match type_name with
  | "int" -> convert_int value
  | "string" -> convert_string value
  | "float" -> convert_float value
  | _ -> failwith "Unknown type"
```

### Good: GADT witnesses
```ocaml
type _ type_witness =
  | Int_witness : int type_witness
  | String_witness : string type_witness
  | Float_witness : float type_witness

let convert_value : type a. a type_witness -> raw_value -> a = fun witness value ->
  match witness with
  | Int_witness -> convert_int value
  | String_witness -> convert_string value
  | Float_witness -> convert_float value
(* No catch-all needed - exhaustive! *)
```

### When to use type witnesses:
- Converting between representations at runtime
- Deserializing typed data
- Registry lookups that return typed values

---

## 4. Smart Constructors for Validation

When data has invariants, enforce them at construction time.

### Bad: Invalid states representable
```ocaml
type method_info = {
  name: string;  (* Must be non-empty, valid OCaml identifier *)
  params: param list;
  return_type: string;
}

(* Can create invalid data *)
let broken = { name = ""; params = []; return_type = "int" }
```

### Good: Smart constructors validate
```ocaml
module Method_info : sig
  type t
  val create : name:string -> params:param list -> return_type:string -> (t, string) result
  val name : t -> string
  val params : t -> param list
  val return_type : t -> string
end = struct
  type t = {
    name: string;
    params: param list;
    return_type: string;
  }

  let is_valid_identifier s =
    String.length s > 0 &&
    (* additional validation *)
    true

  let create ~name ~params ~return_type =
    if not (is_valid_identifier name) then
      Error "Invalid method name"
    else
      Ok { name; params; return_type }

  let name t = t.name
  let params t = t.params
  let return_type t = t.return_type
end
```

---

## 5. Encapsulation with Abstract Types

Hide implementation details behind abstract types in `.mli` files.

### Bad: Exposed implementation
```ocaml
(* types.mli *)
type generation_context = {
  namespace: string;
  entities: entity list;
  mutable generated_count: int;  (* Mutable field exposed! *)
}
```

### Good: Abstract with accessors
```ocaml
(* generation_context.mli *)
type t
val create : namespace:string -> entities:entity list -> t
val namespace : t -> Namespace.t
val entities : t -> entity list
val increment_generated : t -> t  (* Functional update *)

(* generation_context.ml *)
type t = {
  namespace: string;
  entities: entity list;
  generated_count: int;
}

let increment_generated ctx =
  { ctx with generated_count = ctx.generated_count + 1 }
```

---

## 6. Registry Patterns with Type-Safe Keys

When building string->value registries, add type safety.

### Bad: Stringly-typed registry
```ocaml
let type_registry : (string, type_info) Hashtbl.t = Hashtbl.create 100

let register name info = Hashtbl.add type_registry name info
let lookup name = Hashtbl.find_opt type_registry name

(* Easy to use wrong key *)
let info = lookup "gtk_button"  (* Should be "GtkButton"? Or "Button"? *)
```

### Good: Typed registry keys
```ocaml
module Type_registry : sig
  type key
  val key_of_gir_type : gir_type -> key
  val key_of_c_type : c_type -> key

  type t
  val create : unit -> t
  val register : t -> key -> type_info -> unit
  val lookup : t -> key -> type_info option
end = struct
  type key = string  (* Internal representation *)

  let key_of_gir_type gir =
    Printf.sprintf "gir:%s.%s" gir.namespace gir.name

  let key_of_c_type c =
    Printf.sprintf "c:%s" c.c_identifier

  (* ... rest of implementation *)
end
```

---

## Checklist

Before submitting code, verify:

- [ ] No string comparisons for structured data (use variants)
- [ ] Distinct identifier types not confused (namespace vs type_name)
- [ ] Runtime type dispatch uses witnesses or variants, not strings
- [ ] Data with invariants uses smart constructors
- [ ] Public module types are abstract in .mli
- [ ] Registry keys are typed, not raw strings
