(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for ATContext from cyclic group At_context_and__accessible *)

class type at_context_t = At_context_and__accessible.at_context_t

class at_context : Raw.At_context.t -> at_context_t

val create :
  Enums.accessiblerole ->
  At_context_and__accessible.accessible_t ->
  Ocgdk.Display.display_t ->
  at_context_t
