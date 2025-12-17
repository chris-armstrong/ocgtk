(* GENERATED CODE - DO NOT EDIT *)
(* Expression: ObjectExpression *)

type t = [`object_expression | `expression] Gobject.obj

let as_expression (obj : t) : Expression.t = Obj.magic obj

(** Create a new ObjectExpression *)
external new_ : unit -> t = "ml_gtk_object_expression_new"

