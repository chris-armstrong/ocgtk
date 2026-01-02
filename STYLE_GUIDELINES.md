# Style guidelines for OCaml code

This document identifies some common style guidelines for working with OCaml code in this repository.

## Run ocamlformat to format code after making changes

`ocamlformat` is our linter and reformatter. Use it after making changes to ensure code style is consistent.

## Do not use the builtin `=` operator

This operator is exceptionally bad for structural comparisons. We should always prefer a typed comparison function (e.g. String.equal, Int.equal) over this operator, even for simple types where it works stabily.

## Use local (let*) or (let+) bindings OR Option.map/Option.bind/Result.map/Result.bind instead of nested match statements

When working with `option` or `result` types, the match operator is messy when conditions are repeatedly nested. Better ways include:

* Defining a local `let*` or `let+` binding to Option.map or Result.map
* Using chained pipe operators with Option.map or Result.map

IF you are chaining multiple `None` condition checks, you may need to define a helper function such as `Option.or` e.g.

```ocaml
module Option = struct
   include Option
   let or x fn = match x with
    | Some x -> Some x
    | None -> fn ()
end
```

## Function Design

**Avoid partial application confusion**: When defining functions, order parameters from most to least general

**Use labeled arguments**: For functions with >2 parameters or similar types, use labeled arguments `~name:`

**Keep functions small**: Aim for functions that do one thing well; extract helpers when needed

## Type Annotations

**Annotate public interfaces**: Always annotate function signatures in `.mli` files

**Annotate complex expressions**: Add type annotations where type inference might be unclear

**Don't over-annotate**: Trust OCaml's inference for obvious local bindings
