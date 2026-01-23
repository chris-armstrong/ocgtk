(* GENERATED CODE - DO NOT EDIT *)
(* Expression: ClosureExpression *)

type t = [`closure_expression | `expression] Gobject.obj

let as_expression (obj : t) : Expression.t = Obj.magic obj

(** Create a new ClosureExpression *)
external new_ : unit -> unit -> int -> Expression.t array option -> t = "ml_gtk_closure_expression_new"

(* Methods *)
