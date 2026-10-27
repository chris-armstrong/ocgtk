(** An expression using a custom [GClosure] to compute the value from its
    parameters.

    Its methods, signals and properties are on
    {!class-type-closure_expression_t}. The functions it is built on are in
    {!Ocgtk.Raw.Closure_expression}. *)

(** The methods, signals and properties of a [GtkClosureExpression]. *)
class type closure_expression_t = object
  inherit Expression.expression_t
  method as_closure_expression : Raw.Closure_expression.t
end

class closure_expression : Raw.Closure_expression.t -> closure_expression_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Closure_expression.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkClosureExpression], give one already wrapped. *)
