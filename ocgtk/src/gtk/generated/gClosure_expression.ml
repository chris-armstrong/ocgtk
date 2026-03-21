class type closure_expression_t = object
    method as_closure_expression : Closure_expression.t
end

(* High-level class for ClosureExpression *)
class closure_expression (obj : Closure_expression.t) : closure_expression_t = object (self)

    method as_closure_expression = obj
end

