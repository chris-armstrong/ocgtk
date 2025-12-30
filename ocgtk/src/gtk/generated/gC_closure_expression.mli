class c_closure_expression : C_closure_expression.t ->
  object
    inherit GExpression.expression
  method as_expression : Expression.t
    method as_c_closure_expression : C_closure_expression.t
  end

