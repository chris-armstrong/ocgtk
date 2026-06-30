# Core OCaml Idioms

Canonical reference for the project-wide idioms that appear across multiple
guideline documents. When a topic is covered here, other guideline files link
to this document rather than repeating the advice.

## Bind Operators vs Pipelines

**Use `let*` / `let+`** when operations are conditionally dependent (each step
might fail or be skipped), or when nesting makes pipelines unreadable.

```ocaml
let open Result.Syntax in
let* user = find_user config in
let* profile = get_profile user in
let+ email = profile.email in
email
```

**Use `|>`** when steps are independent transformations that always apply:

```ocaml
user
|> sanitize_input
|> validate_length
|> encode_special_chars
|> Database.save
```

Readability decides. If bind operators make the code clearer, use them.

### Operators

- `let*` — bind (flatMap): unwrap, apply function that returns wrapped value
- `let+` — map: unwrap, apply function that returns plain value
- `and*` — combine multiple wrapped values

## Polymorphic Equality is Banned

`Stdlib.(=)` is polymorphic and breaks on functions, abstract types, and cyclic
structures. Always use type-specific equality.

| Bad | Use Instead |
|-----|-------------|
| `x = y` | `String.equal x y` |
| `list1 = list2` | `List.equal String.equal list1 list2` |
| `opt = None` | `Option.is_none opt` |

Common type-specific equalities: `String.equal`, `Int.equal`, `Bool.equal`,
`Option.equal f`, `List.equal f`.

## Naming Intermediates

### 3+ pipeline stages → name intermediates

```ocaml
(* Bad: anonymous pipeline soup *)
let summarize data =
  data
  |> List.filter (fun x -> x.active && x.score > 0)
  |> List.map (fun x -> (x.category, x.score))
  |> List.fold_left accumulate Map.empty
  |> Map.to_list
  |> List.sort (fun (_, a) (_, b) -> Int.compare b a)
  |> List.take 10

(* Good: named steps document intent *)
let summarize data =
  let active_with_scores =
    List.filter (fun x -> x.active && x.score > 0) data
  in
  let by_category =
    List.map (fun x -> (x.category, x.score)) active_with_scores
  in
  let category_totals =
    List.fold_left accumulate Map.empty by_category
  in
  let ranked =
    Map.to_list category_totals
    |> List.sort (fun (_, a) (_, b) -> Int.compare b a)
  in
  List.take 10 ranked
```

### Any anonymous function > 1 line → extract and name it

### Complex predicate → name it

```ocaml
(* Bad: complex inline predicate *)
let valid = List.filter (fun m ->
  not m.deprecated &&
  not (List.mem m.name excluded) &&
  List.for_all is_supported m.params
) methods

(* Good: named predicate *)
let is_valid_method m =
  not m.deprecated &&
  not (List.mem m.name excluded) &&
  List.for_all is_supported m.params

let valid = List.filter is_valid_method methods
```

## Module Extraction Heuristics

### Extract a module when:
- Code is used from 2+ other modules
- Code has a clear, nameable responsibility
- Code has internal state or invariants to protect
- You want to hide implementation details

### Keep inline when:
- Code is only used in one place
- Extracting would require passing many parameters
- The abstraction boundary is unclear

### Don't over-abstract:
- Helper used only once → don't extract
- More code in abstraction than saved → don't extract
- Abstraction harder to understand than original → don't extract

### When you see the same pattern 3+ times, extract it into a shared helper.
