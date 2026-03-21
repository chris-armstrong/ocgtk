class type c_closure_expression_t = object
    method as_c_closure_expression : C_closure_expression.t
end

class c_closure_expression : C_closure_expression.t -> c_closure_expression_t

