(* GENERATED CODE - DO NOT EDIT *)
(* Expression: ConstantExpression *)

type t = [`constant_expression | `expression] Gobject.obj

val as_expression : t -> Expression.t

(** Create a new ConstantExpression *)
external new_ : unit -> unit -> t = "ml_gtk_constant_expression_new"

(** Create a new ConstantExpression *)
external new_for_value : unit -> t = "ml_gtk_constant_expression_new_for_value"

