class type c_closure_expression_t = object
  inherit GExpression.expression_t
  method as_c_closure_expression : C_closure_expression.t
end

(* High-level class for CClosureExpression *)
class c_closure_expression (obj : C_closure_expression.t) :
  c_closure_expression_t =
  object (self)
    inherit GExpression.expression (obj :> Expression.t)
    method as_c_closure_expression = obj
  end
