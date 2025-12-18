(* High-level class for ObjectExpression *)
class object_expression (obj : Object_expression.t) = object (self)
  inherit GExpression.expression (Object_expression.as_expression obj)

  method as_expression = (Object_expression.as_expression obj)
    method as_object_expression = obj
end

