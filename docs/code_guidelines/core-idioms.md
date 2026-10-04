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

## Structural Equality is Banned (Except on `int`)

Structural equality (`=`, `<>`, `==`, `!=`, polymorphic `compare`) is banned on
every type except `int`. `=` and `<>` are permitted only when both operands are
statically `int`. Every other type uses its own equality function, including
`char`, `string`, `bool`, `float`, options, lists and records.

| Bad | Use Instead |
|-----|-------------|
| `s = "GObject"` | `String.equal s "GObject"` |
| `c <> '"'` | `not (Char.equal c '"')` |
| `b = true` | `Bool.equal b true` or `if b then …` |
| `opt = None` | `Option.is_none opt` |
| `opt <> None` | `Option.is_some opt` |
| `list1 = list2` | `List.equal String.equal list1 list2` |
| `compare a b` | `String.compare a b` (or the type's `compare`) |

Common type-specific equalities: `String.equal`, `Char.equal`, `Bool.equal`,
`Int.equal`, `Option.equal f`, `List.equal f`.

## Option Handling: Never Match `None` for Unit or Defaults

Do not write `match x with Some v -> … | None -> ()` or
`match x with Some v -> … | None -> <value>` when the only job is to run an
effect or supply a default. Use `Option` combinators. Pipe the option in with
`|>` and pass the callback with `@@`, so the option reads first, then the
operation on it.

| Bad | Use Instead |
|-----|-------------|
| `match x with Some v -> f v \| None -> ()` | `x \|> Option.iter @@ fun v -> f v` |
| `match x with Some v -> f v \| None -> ""` | `Option.map f x \|> Option.value ~default:""` |
| `match x with Some v -> f v \| None -> d` | `Option.fold ~none:d ~some:f x` |

```ocaml
(* Bad *)
begin match Doc_emit.item_doc ~indent:"" cst.constant_doc with
| Some comment -> bprintf buf "%s\n" comment
| None -> ()
end;

(* Good *)
Doc_emit.item_doc ~indent:"" cst.constant_doc
|> Option.iter (fun comment -> bprintf buf "%s\n" comment);
```

`fun` extends as far right as possible, so a bare `@@ fun …` swallows any
following `;`-sequenced statements into the lambda body. Parenthesise the
lambda (as above) unless it is the final expression of its block. When the
callback is already a named function, use `x |> Option.iter f` with no lambda.

A `match` on an option is acceptable only when both arms do distinct,
non-trivial work, or when the match destructures a tuple of options and the
combined case cannot be expressed by one combinator. Test code must use
`Helpers.expect_some` / `Helpers.assert_some`, not `None -> Alcotest.fail`.

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
