(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for ATContext from cyclic group At_context_and__accessible *)

class type at_context_t = At_context_and__accessible.at_context_t

class at_context = At_context_and__accessible.at_context

let create (accessible_role : Enums.accessiblerole)
    (accessible : At_context_and__accessible.accessible_t)
    (display : Ocgdk.Display.display_t) : at_context_t =
  let accessible = accessible#as_accessible in
  let display = display#as_display in
  let obj_ = Raw.At_context.create accessible_role accessible display in
  new at_context obj_
