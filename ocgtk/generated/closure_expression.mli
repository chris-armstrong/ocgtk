class type closure_expression_t = object
  inherit Expression.expression_t
  method as_closure_expression : Raw.Closure_expression.t
end

class closure_expression : Raw.Closure_expression.t -> closure_expression_t
