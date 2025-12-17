(* GENERATED CODE - DO NOT EDIT *)
(* Expression: PropertyExpression *)

type t = [`property_expression | `expression] Gobject.obj

val as_expression : t -> Expression.t

(** Create a new PropertyExpression *)
external new_ : unit -> Expression.t option -> string -> t = "ml_gtk_property_expression_new"

(** Create a new PropertyExpression *)
external new_for_pspec : Expression.t option -> unit -> t = "ml_gtk_property_expression_new_for_pspec"

(** Gets the expression specifying the object of
a property expression. *)
external get_expression : t -> Expression.t option = "ml_gtk_property_expression_get_expression"

