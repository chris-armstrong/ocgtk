class type closure_expression_t = object
  inherit Expression.expression_t
  method as_closure_expression : Raw.Closure_expression.t
end

(* High-level class for ClosureExpression *)
class closure_expression (obj : Raw.Closure_expression.t) : closure_expression_t
  =
  object (self)
    inherit Expression.expression (obj :> Raw.Expression.t)
    method as_closure_expression = obj
  end
