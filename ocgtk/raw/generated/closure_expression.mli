(* GENERATED CODE - DO NOT EDIT *)
(* ClosureExpression: ClosureExpression *)

(** An expression using a custom [GClosure] to compute the value from its
    parameters. *)

type t = [ `closure_expression | `expression ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_closure_expression_get_type"

(* Methods *)
