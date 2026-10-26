class type constant_expression_t = object
  inherit Expression.expression_t
  method get_value : unit -> Gobject.Value.t
  method as_constant_expression : Raw.Constant_expression.t
end

class constant_expression : Raw.Constant_expression.t -> constant_expression_t

val new_for_value : Gobject.Value.t -> constant_expression_t
