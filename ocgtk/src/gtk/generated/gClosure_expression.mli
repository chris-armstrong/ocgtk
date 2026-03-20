class type closure_expression_t = object
    method as_closure_expression : Closure_expression.t
end

class closure_expression : Closure_expression.t -> closure_expression_t

