class type c_closure_expression_t = object
    method as_c_closure_expression : C_closure_expression.t
end

(* High-level class for CClosureExpression *)
class c_closure_expression (obj : C_closure_expression.t) : c_closure_expression_t = object (self)

    method as_c_closure_expression = obj
end

