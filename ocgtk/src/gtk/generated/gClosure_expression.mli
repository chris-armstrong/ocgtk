class type closure_expression_t = object
    inherit GExpression.expression_t
    method as_closure_expression : Closure_expression.t
end

class closure_expression : Closure_expression.t -> closure_expression_t

