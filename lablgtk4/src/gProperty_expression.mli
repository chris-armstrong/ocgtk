class property_expression : Property_expression.t ->
  object
    inherit GExpression.expression
    method get_expression : unit -> GExpression.expression option
  method as_expression : Expression.t
    method as_property_expression : Property_expression.t
  end

