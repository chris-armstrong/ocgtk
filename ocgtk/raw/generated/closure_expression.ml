(* GENERATED CODE - DO NOT EDIT *)
(* ClosureExpression: ClosureExpression *)

(** An expression using a custom [GClosure] to compute the value from its
    parameters.

    The class built on this module is in {!Ocgtk.Closure_expression}. *)

type t = [ `closure_expression | `expression ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_closure_expression_get_type"

(* Methods *)
