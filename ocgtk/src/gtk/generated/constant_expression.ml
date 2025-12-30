(* GENERATED CODE - DO NOT EDIT *)
(* Expression: ConstantExpression *)

type t = [`constant_expression | `expression] Gobject.obj

let as_expression (obj : t) : Expression.t = Obj.magic obj

(** Create a new ConstantExpression *)
external new_ : unit -> unit -> t = "ml_gtk_constant_expression_new"

(** Create a new ConstantExpression *)
external new_for_value : unit -> t = "ml_gtk_constant_expression_new_for_value"

(* Methods *)
