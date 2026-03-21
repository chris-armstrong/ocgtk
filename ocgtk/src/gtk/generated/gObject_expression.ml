class type object_expression_t = object
    method as_object_expression : Object_expression.t
end

(* High-level class for ObjectExpression *)
class object_expression (obj : Object_expression.t) : object_expression_t = object (self)

    method as_object_expression = obj
end

