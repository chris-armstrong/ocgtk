(** A [GObject] property value in a [GtkExpression].

    Its methods, signals and properties are on
    {!class-type-property_expression_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Property_expression}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PropertyExpression].}

    Inherits from: {{!Ocgtk.Expression.class-type-expression_t}Ocgtk.Expression}

    A [GObject] property value in a [GtkExpression]. *)
class type property_expression_t = object
  inherit Expression.expression_t

  (** {2:methods Methods} *)

  method get_expression : unit -> Expression.expression_t option
  (** Gets the expression specifying the object of a property expression. *)

  (** {2:conversions Conversions} *)

  method as_property_expression : Raw.Property_expression.t
end

class property_expression : Raw.Property_expression.t -> property_expression_t
(** Wraps a raw handle of {!Ocgtk.Raw.Property_expression.t}. *)

(** {1:constructors Constructors} *)

val new_ :
  Gobject.Type.t ->
  Expression.expression_t option ->
  string ->
  property_expression_t
(** Creates an expression that looks up a property.

    The object to use is found by evaluating the [expression], or using the
    [this] argument when [expression] is [NULL].

    If the resulting object conforms to [this_type], its property named
    [property_name] will be queried. Otherwise, this expression's evaluation
    will fail.

    The given [this_type] must have a property with [property_name]. *)
