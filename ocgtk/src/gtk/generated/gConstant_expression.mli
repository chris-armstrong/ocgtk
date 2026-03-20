class type constant_expression_t = object
    method as_constant_expression : Constant_expression.t
end

class constant_expression : Constant_expression.t -> constant_expression_t

