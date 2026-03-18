class property_expression : Property_expression.t ->
  object
    method get_expression : unit -> GExpression.expression option
    method as_property_expression : Property_expression.t
  end

