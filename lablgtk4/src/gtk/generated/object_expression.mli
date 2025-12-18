(* GENERATED CODE - DO NOT EDIT *)
(* Expression: ObjectExpression *)

type t = [`object_expression | `expression] Gobject.obj

val as_expression : t -> Expression.t

(** Create a new ObjectExpression *)
external new_ : unit -> t = "ml_gtk_object_expression_new"

