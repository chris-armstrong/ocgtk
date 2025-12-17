class object_expression : Object_expression.t ->
  object
    inherit GExpression.expression
  method as_expression : Expression.t
    method as_object_expression : Object_expression.t
  end

