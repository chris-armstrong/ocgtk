# OCaml Idioms

Core OCaml idioms and formatting requirements for this project.

## Run ocamlformat After Every Change

`ocamlformat` is the project formatter. Run it after any edit to keep style consistent.
`cd ocgtk && ocamlformat --inplace <file>` or just rely on `dune fmt`.

## Structural Equality is Banned

`Stdlib.(=)` is polymorphic and breaks on functions, abstract types, and cyclic structures. Always use type-specific equality.

| Bad | Use Instead |
|-----|-------------|
| `x = y` | `String.equal x y` |
| `list1 = list2` | `List.equal String.equal list1 list2` |
| `opt = None` | `Option.is_none opt` |

Common type-specific equalities: `String.equal`, `Int.equal`, `Bool.equal`,
`Option.equal f`, `List.equal f`.

This is also documented in [partial-functions.md](./partial-functions.md) under "Banned Functions".

## Nested Pattern Matching

Avoid deeply nested `match … with` inside another `match`. Flatten using:

- `Option.map` / `Option.bind`
- `Result.map` / `Result.bind`
- `let*` / `let+` binding operators from `Option.Syntax` or `Result.Syntax`
- Chained pipe operators for linear transformations

See [nesting-and-control-flow.md](./nesting-and-control-flow.md) for full guidance.

## Binding Operators vs Pipelines

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

## Function Design

- **Parameter order**: most-general to least-general (enables partial application)
- **Labeled arguments**: use `~name:` when a function has 2+ parameters of the
  same type, or when parameter meaning is not obvious from position
- **Size**: one responsibility per function; extract helpers when logic grows

## Type Annotations

- Annotate all function signatures in `.mli` files
- Add annotations where type inference is non-obvious
- Trust OCaml's inference for simple local bindings; don't over-annotate

## Comments

- Add a comment only when the WHY is non-obvious: a hidden constraint, a subtle
  invariant, or a workaround for a specific external bug
- Never describe WHAT the code does (well-named identifiers already do that)
- Keep comments short — one line max for inline notes
- No multi-paragraph docstrings; `.mli` comments should be one short sentence per value

See [comments-and-documentation.md](./comments-and-documentation.md) for full policy.
