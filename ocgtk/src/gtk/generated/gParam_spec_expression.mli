class type param_spec_expression_t = object
    method as_param_spec_expression : Param_spec_expression.t
end

class param_spec_expression : Param_spec_expression.t -> param_spec_expression_t

