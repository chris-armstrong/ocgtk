(* High-level class for ConstantExpression *)
class constant_expression (obj : Constant_expression.t) = object (self)
  inherit GExpression.expression (Constant_expression.as_expression obj)

  method as_expression = (Constant_expression.as_expression obj)
    method as_constant_expression = obj
end

