class type constant_expression_t = object
    method as_constant_expression : Constant_expression.t
end

(* High-level class for ConstantExpression *)
class constant_expression (obj : Constant_expression.t) : constant_expression_t = object (self)

    method as_constant_expression = obj
end

