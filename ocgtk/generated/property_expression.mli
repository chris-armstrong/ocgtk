class type property_expression_t = object
  inherit Expression.expression_t
  method get_expression : unit -> Expression.expression_t option
  method as_property_expression : Raw.Property_expression.t
end

class property_expression : Raw.Property_expression.t -> property_expression_t

val new_ :
  Gobject.Type.t ->
  Expression.expression_t option ->
  string ->
  property_expression_t
