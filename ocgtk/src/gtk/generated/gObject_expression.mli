class type object_expression_t = object
    inherit GExpression.expression_t
    method as_object_expression : Object_expression.t
end

class object_expression : Object_expression.t -> object_expression_t

