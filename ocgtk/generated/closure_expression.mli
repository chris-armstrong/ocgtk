(** An expression using a custom [GClosure] to compute the value from its
    parameters.

    Its methods, signals and properties are on
    {!class-type-closure_expression_t}. The functions it is built on are in
    {!Ocgtk.Raw.Closure_expression}. *)

(** The methods, signals and properties of a [ClosureExpression]. *)
class type closure_expression_t = object
  inherit Expression.expression_t
  method as_closure_expression : Raw.Closure_expression.t
end

class closure_expression : Raw.Closure_expression.t -> closure_expression_t
(** Wraps a raw handle of {!Ocgtk.Raw.Closure_expression.t}. *)
