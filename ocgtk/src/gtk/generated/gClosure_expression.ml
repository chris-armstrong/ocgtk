class type closure_expression_t = object
  inherit GExpression.expression_t
  method as_closure_expression : Closure_expression.t
end

(* High-level class for ClosureExpression *)
class closure_expression (obj : Closure_expression.t) : closure_expression_t =
  object (self)
    inherit GExpression.expression (obj :> Expression.t)
    method as_closure_expression = obj
  end
