class type c_closure_expression_t = object
  inherit Expression.expression_t
  method as_c_closure_expression : Raw.C_closure_expression.t
end

class c_closure_expression :
  Raw.C_closure_expression.t ->
  c_closure_expression_t
