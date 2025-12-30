(* High-level class for ClosureExpression *)
class closure_expression (obj : Closure_expression.t) = object (self)
  inherit GExpression.expression (Closure_expression.as_expression obj)

  method as_expression = (Closure_expression.as_expression obj)
    method as_closure_expression = obj
end

