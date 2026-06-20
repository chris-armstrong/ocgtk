class type constant_expression_t = object
  inherit GExpression.expression_t
  method get_value : unit -> Gobject.Value.t
  method as_constant_expression : Constant_expression.t
end

class constant_expression : Constant_expression.t -> constant_expression_t

val new_for_value : Gobject.Value.t -> constant_expression_t
