(* GENERATED CODE - DO NOT EDIT *)
(* ObjectExpression: ObjectExpression *)

type t = [`object_expression | `expression] Gobject.obj

(** Create a new ObjectExpression *)
external new_ : [`object_] Gobject.obj -> t = "ml_gtk_object_expression_new"

(* Methods *)
(** Gets the object that the expression evaluates to. *)
external get_object : t -> [`object_] Gobject.obj option = "ml_gtk_object_expression_get_object"

