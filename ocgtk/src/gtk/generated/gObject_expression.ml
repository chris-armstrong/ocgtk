class type object_expression_t = object
    inherit GExpression.expression_t
    method as_object_expression : Object_expression.t
end

(* High-level class for ObjectExpression *)
class object_expression (obj : Object_expression.t) : object_expression_t = object (self)
  inherit GExpression.expression (obj :> Expression.t)

    method as_object_expression = obj
end

