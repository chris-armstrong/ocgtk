# Abstraction Guidelines

## 1. Reduce Parameter Passing with Context Records

When the same group of parameters is passed to multiple functions, bundle them.

### Bad: Parameter explosion
```ocaml
let generate_method ~namespace ~context ~entity ~method_info ~output_buffer ~indent =
  ...

let generate_property ~namespace ~context ~entity ~property_info ~output_buffer ~indent =
  ...

let generate_signal ~namespace ~context ~entity ~signal_info ~output_buffer ~indent =
  ...

(* Every call repeats the same 4 parameters *)
let generate_all entity =
  List.iter (generate_method ~namespace ~context ~entity ~output_buffer ~indent) entity.methods;
  List.iter (generate_property ~namespace ~context ~entity ~output_buffer ~indent) entity.properties;
  List.iter (generate_signal ~namespace ~context ~entity ~output_buffer ~indent) entity.signals
```

### Good: Context record bundles common parameters
```ocaml
type generation_env = {
  namespace: Namespace.t;
  context: generation_context;
  output: Buffer.t;
  indent: int;
}

let generate_method env entity method_info = ...
let generate_property env entity property_info = ...
let generate_signal env entity signal_info = ...

let generate_all env entity =
  List.iter (generate_method env entity) entity.methods;
  List.iter (generate_property env entity) entity.properties;
  List.iter (generate_signal env entity) entity.signals
```

### Rule of thumb:
- 3+ parameters passed together to 3+ functions → extract context record
- Context records should be immutable (use `with` for updates)

---

## 2. When to Extract a Module

### Extract when:
- Code is used from 2+ other modules
- Code has a clear, nameable responsibility
- Code has internal state or invariants to protect
- You want to hide implementation details

### Keep inline when:
- Code is only used in one place
- Extracting would require passing many parameters
- The abstraction boundary is unclear

### Bad: Premature extraction
```ocaml
(* string_utils.ml - only used once *)
let capitalize_first s =
  String.mapi (fun i c -> if i = 0 then Char.uppercase_ascii c else c) s

(* Now every caller needs to import String_utils *)
```

### Good: Extract when reused
```ocaml
(* utils.ml - shared utilities *)
let capitalize_first s = ...
let snake_to_camel s = ...
let camel_to_snake s = ...
(* All string conversion utilities in one place *)
```

---

## 3. Interface-First Design

Define the `.mli` before implementing the `.ml`, especially for shared modules.

### Process:
1. Write the `.mli` with types and function signatures
2. Document the invariants and contracts
3. Implement the `.ml` to satisfy the interface

### Benefits:
- Forces clear API thinking before implementation
- Documents the contract for users
- Allows parallel development (one person uses interface, another implements)

```ocaml
(* type_registry.mli - define first *)
type t
(** Type registry for GIR to OCaml mappings *)

val create : unit -> t
(** Create an empty registry *)

val register : t -> gir_type:Gir_type.t -> ocaml_type:string -> unit
(** Register a type mapping. Raises if already registered. *)

val lookup : t -> Gir_type.t -> string option
(** Look up the OCaml type for a GIR type *)

val lookup_exn : t -> Gir_type.t -> string
(** Like [lookup] but raises [Not_found] *)
```

---

## 4. Functors for Cross-Layer Code Sharing

When multiple layers need the same pattern with different types, use functors.

### Problem: Duplicated patterns
```ocaml
(* In c_stub_method.ml *)
let generate_c_method method_info =
  if should_skip method_info then None
  else Some (render_c_method method_info)

(* In class_gen_method.ml - same pattern! *)
let generate_ml_method method_info =
  if should_skip method_info then None
  else Some (render_ml_method method_info)
```

### Solution: Functor abstracts the pattern
```ocaml
(* method_generator.ml *)
module type METHOD_RENDERER = sig
  type output
  val should_skip : method_info -> bool
  val render : method_info -> output
end

module Make (R : METHOD_RENDERER) = struct
  let generate method_info =
    if R.should_skip method_info then None
    else Some (R.render method_info)

  let generate_all methods =
    List.filter_map generate methods
end

(* c_stub_method.ml *)
module C_method_gen = Method_generator.Make(struct
  type output = string
  let should_skip = C_skip_rules.should_skip
  let render = C_renderer.render_method
end)

(* class_gen_method.ml *)
module Ml_method_gen = Method_generator.Make(struct
  type output = Parsetree.structure_item
  let should_skip = Ml_skip_rules.should_skip
  let render = Ml_renderer.render_method
end)
```

### When to use functors:
- Same algorithm, different types (polymorphism not enough)
- Cross-layer patterns that should stay in sync
- Configurable behavior without runtime cost

---

## 5. Layered Module Dependencies

Maintain clear dependency direction between layers.

```
┌─────────────────────────────────────┐
│           Application               │
│         (gir_gen.ml)                │
└──────────────┬──────────────────────┘
               │ uses
               ▼
┌─────────────────────────────────────┐
│          Generation                 │
│  (class_gen, c_stubs, ml_interface) │
└──────────────┬──────────────────────┘
               │ uses
               ▼
┌─────────────────────────────────────┐
│         Infrastructure              │
│  (types, type_mappings, utils)      │
└──────────────┬──────────────────────┘
               │ uses
               ▼
┌─────────────────────────────────────┐
│           Parsing                   │
│        (gir_parser)                 │
└─────────────────────────────────────┘
```

### Rules:
- Lower layers never import from higher layers
- Shared code lives in infrastructure, not duplicated in generation
- Cross-cutting concerns (logging, errors) live in infrastructure

---

## 6. Extension Points for Future Features

Design modules to be extensible without modification.

### Bad: Hard-coded entity types
```ocaml
let generate_entity = function
  | Class c -> generate_class c
  | Interface i -> generate_interface i
  | Record r -> generate_record r
  (* Adding Enum requires modifying this function *)
```

### Good: Registry-based extension
```ocaml
module type ENTITY_GENERATOR = sig
  type t
  val name : string
  val generate : t -> output
end

let generators : (module ENTITY_GENERATOR) list ref = ref []

let register_generator gen =
  generators := gen :: !generators

let generate_entity entity =
  List.find_map (fun (module G : ENTITY_GENERATOR) ->
    if G.name = entity_type entity then Some (G.generate entity)
    else None
  ) !generators
```

### When to add extension points:
- You know more cases will be added (signals with different arities)
- External code needs to hook in (documentation generators)
- Testing benefits from substitution (mock generators)

---

## Checklist

Before submitting code, verify:

- [ ] Functions with 5+ parameters use a context record
- [ ] Shared code lives in infrastructure, not duplicated
- [ ] Public modules have `.mli` files
- [ ] No upward dependencies (generation → infrastructure only)
- [ ] Duplicated patterns across layers use functors or shared modules
- [ ] Extension points exist for known future features
