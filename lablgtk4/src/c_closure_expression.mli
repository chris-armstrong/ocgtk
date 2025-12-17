(* GENERATED CODE - DO NOT EDIT *)
(* Expression: CClosureExpression *)

type t = [`c_closure_expression | `expression] Gobject.obj

val as_expression : t -> Expression.t

(** Create a new CClosureExpression *)
external gtk_cclosure_expression_new : unit -> unit -> int -> unit -> unit -> unit -> unit -> t = "ml_gtk_cclosure_expression_new_bytecode" "ml_gtk_cclosure_expression_new_native"

