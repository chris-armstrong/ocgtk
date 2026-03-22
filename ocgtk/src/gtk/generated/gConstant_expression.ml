class type constant_expression_t = object
    inherit GExpression.expression_t
    method as_constant_expression : Constant_expression.t
end

(* High-level class for ConstantExpression *)
class constant_expression (obj : Constant_expression.t) : constant_expression_t = object (self)
  inherit GExpression.expression (Obj.magic obj : Expression.t)

    method as_constant_expression = obj
end

