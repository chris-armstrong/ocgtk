class type property_expression_t = object
  inherit GExpression.expression_t
  method get_expression : unit -> GExpression.expression_t option
  method as_property_expression : Property_expression.t
end

class property_expression : Property_expression.t -> property_expression_t

val new_ :
  int -> GExpression.expression_t option -> string -> property_expression_t
