(* High-level class for CClosureExpression *)
class c_closure_expression (obj : C_closure_expression.t) = object (self)
  inherit GExpression.expression (C_closure_expression.as_expression obj)

  method as_expression = (C_closure_expression.as_expression obj)
    method as_c_closure_expression = obj
end

