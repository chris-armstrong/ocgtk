(** A variant of [GtkClosureExpression] using a C closure.

    Its methods, signals and properties are on
    {!class-type-c_closure_expression_t}. The functions it is built on are in
    {!Ocgtk.Raw.C_closure_expression}. *)

(** The methods, signals and properties of a [CClosureExpression]. *)
class type c_closure_expression_t = object
  inherit Expression.expression_t
  method as_c_closure_expression : Raw.C_closure_expression.t
end

class c_closure_expression :
  Raw.C_closure_expression.t ->
  c_closure_expression_t
(** Wraps a raw handle of {!Ocgtk.Raw.C_closure_expression.t}. *)
