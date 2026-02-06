# Naming and Intermediate Values Guidelines

## 1. Named Intermediate Values over Long Pipelines

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

---

## 2. Rules of Thumb

- **3+ pipeline stages** → consider naming intermediates
- **Any anonymous function > 1 line** → extract and name it
- **Complex predicate** → name it

### Bad: Complex inline predicate
```ocaml
let valid_methods =
  List.filter (fun m ->
    not m.deprecated &&
    not (List.mem m.name excluded_methods) &&
    List.for_all is_supported_type m.params &&
    Option.map is_supported_type m.return_type |> Option.value ~default:true
  ) methods
```

### Good: Named predicate
```ocaml
let is_valid_method m =
  not m.deprecated &&
  not (List.mem m.name excluded_methods) &&
  List.for_all is_supported_type m.params &&
  Option.map is_supported_type m.return_type |> Option.value ~default:true

let valid_methods = List.filter is_valid_method methods
```

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
