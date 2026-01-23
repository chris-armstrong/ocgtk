(* GENERATED CODE - DO NOT EDIT *)
(* Expression: ClosureExpression *)

type t = [`closure_expression | `expression] Gobject.obj

val as_expression : t -> Expression.t

(** Create a new ClosureExpression *)
external new_ : unit -> unit -> int -> Expression.t array option -> t = "ml_gtk_closure_expression_new"

(* Methods *)
