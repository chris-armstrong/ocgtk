(** A constant value in a [GtkExpression].

    Its methods, signals and properties are on
    {!class-type-constant_expression_t}. The functions it is built on are in
    {!Ocgtk.Raw.Constant_expression}. *)

(** The methods, signals and properties of a [GtkConstantExpression]. *)
class type constant_expression_t = object
  inherit Expression.expression_t

  method get_value : unit -> Gobject.Value.t
  (** Gets the value that a constant expression evaluates to. *)

  method as_constant_expression : Raw.Constant_expression.t
end

class constant_expression : Raw.Constant_expression.t -> constant_expression_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Constant_expression.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkConstantExpression], give one already wrapped. *)

val new_for_value : Gobject.Value.t -> constant_expression_t
