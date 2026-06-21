# Naming and Intermediate Values Guidelines

## 1. Named Intermediate Values over Long Pipelines

See [core-idioms.md](./core-idioms.md) for the project-wide guidance on naming intermediates and extracting predicates.

---

## 3. Naming Conventions

### Variables and functions: `snake_case`
```ocaml
let method_name = ...
let generate_class_body = ...
```

### Types: `snake_case`
```ocaml
type method_info = ...
type generation_context = ...
```

### Modules: `PascalCase`
```ocaml
module TypeMappings = ...
module ClassGen = ...
```

### Constants: `SCREAMING_SNAKE_CASE` (rare in OCaml)
```ocaml
let max_nesting_depth = 2  (* or just use snake_case *)
```

---

## 4. Descriptive Names

### Bad: Abbreviations and single letters
```ocaml
let gm ctx m = ...
let proc xs = List.map (fun x -> x.n) xs
```

### Good: Full words that describe purpose
```ocaml
let generate_method context method_info = ...
let extract_names entities = List.map (fun entity -> entity.name) entities
```

### Exception: Well-known short names
```ocaml
(* These are acceptable *)
let f x = ...       (* in higher-order function signatures *)
let acc = ...       (* accumulator in fold *)
let i, j = ...      (* loop indices *)
let s = ...         (* single string being processed *)
```

---

## 5. Boolean Names

Use positive names that read naturally in conditions.

### Bad: Negative or unclear names
```ocaml
let not_empty = ...
let flag = ...
let check = ...
```

### Good: Positive, descriptive names
```ocaml
let has_methods = ...
let is_deprecated = ...
let should_skip = ...
let can_generate = ...
```

---

## Checklist

Before submitting code, verify:

- [ ] Pipelines with 3+ stages use named intermediates
- [ ] Anonymous functions > 1 line are extracted and named
- [ ] Complex predicates are named
- [ ] Variable names describe purpose, not type
- [ ] Boolean names read naturally in `if` statements
