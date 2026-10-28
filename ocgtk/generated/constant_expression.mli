(** A constant value in a [GtkExpression].

    Its methods, signals and properties are on
    {!class-type-constant_expression_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Constant_expression}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ConstantExpression].}

    A constant value in a [GtkExpression]. *)
class type constant_expression_t = object
  inherit Expression.expression_t

  (** {2:methods Methods} *)

  method get_value : unit -> Gobject.Value.t
  (** Gets the value that a constant expression evaluates to. *)

  (** {2:conversions Conversions} *)

  method as_constant_expression : Raw.Constant_expression.t
end

class constant_expression : Raw.Constant_expression.t -> constant_expression_t
(** Wraps a raw handle of {!Ocgtk.Raw.Constant_expression.t}. *)

(** {1:constructors Constructors} *)

val new_for_value : Gobject.Value.t -> constant_expression_t
(** Creates an expression that always evaluates to the given [value]. *)
