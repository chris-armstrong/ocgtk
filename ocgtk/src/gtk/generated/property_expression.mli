(* GENERATED CODE - DO NOT EDIT *)
(* PropertyExpression: PropertyExpression *)

type t = [`property_expression | `expression] Gobject.obj

(** Create a new PropertyExpression *)
external new_ : int -> Expression.t option -> string -> t = "ml_gtk_property_expression_new"

(* Methods *)
(** Gets the expression specifying the object of
a property expression. *)
external get_expression : t -> Expression.t option = "ml_gtk_property_expression_get_expression"

