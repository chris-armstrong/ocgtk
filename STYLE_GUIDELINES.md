# Style guidelines for OCaml code

This document identifies some common style guidelines for working with OCaml code in this repository.

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