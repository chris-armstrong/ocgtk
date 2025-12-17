class constant_expression : Constant_expression.t ->
  object
    inherit GExpression.expression
  method as_expression : Expression.t
    method as_constant_expression : Constant_expression.t
  end

