class closure_expression : Closure_expression.t ->
  object
    inherit GExpression.expression
  method as_expression : Expression.t
    method as_closure_expression : Closure_expression.t
  end

