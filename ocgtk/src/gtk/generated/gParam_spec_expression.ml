class type param_spec_expression_t = object
  method as_param_spec_expression : Param_spec_expression.t
end

(* High-level class for ParamSpecExpression *)
class param_spec_expression (obj : Param_spec_expression.t) :
  param_spec_expression_t =
  object (self)
    method as_param_spec_expression = obj
  end
