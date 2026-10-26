(* Constant Code Generation *)

open Types

val generate_constants_interface :
  namespace:string -> gir_constant list -> string
(** Generate the .mli file content for the constants of a namespace. Returns
    just the file header when [constants] is empty. *)

val generate_constants_implementation :
  namespace:string -> gir_constant list -> string
(** Generate the .ml file content for the constants of a namespace. Returns just
    the file header when [constants] is empty. *)
