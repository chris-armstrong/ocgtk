(** A [GObject] property value in a [GtkExpression].

    Its methods, signals and properties are on
    {!class-type-property_expression_t}. The functions it is built on are in
    {!Ocgtk.Raw.Property_expression}. *)

(** The methods, signals and properties of a [GtkPropertyExpression]. *)
class type property_expression_t = object
  inherit Expression.expression_t
  method get_expression : unit -> Expression.expression_t option
  method as_property_expression : Raw.Property_expression.t
end

class property_expression : Raw.Property_expression.t -> property_expression_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Property_expression.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkPropertyExpression], give one already wrapped. *)

val new_ :
  Gobject.Type.t ->
  Expression.expression_t option ->
  string ->
  property_expression_t
