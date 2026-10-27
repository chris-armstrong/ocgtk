(** A variant of [GtkClosureExpression] using a C closure.

    Its methods, signals and properties are on
    {!class-type-c_closure_expression_t}. The functions it is built on are in
    {!Ocgtk.Raw.C_closure_expression}. *)

(** The methods, signals and properties of a [GtkCClosureExpression]. *)
class type c_closure_expression_t = object
  inherit Expression.expression_t
  method as_c_closure_expression : Raw.C_closure_expression.t
end

class c_closure_expression :
  Raw.C_closure_expression.t ->
  c_closure_expression_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.C_closure_expression.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkCClosureExpression], give one already wrapped. *)
