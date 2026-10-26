class type object_expression_t = object
  inherit Expression.expression_t
  method get_object : unit -> [ `object_ ] Gobject.obj option
  method as_object_expression : Raw.Object_expression.t
end

class object_expression : Raw.Object_expression.t -> object_expression_t

val new_ : [ `object_ ] Gobject.obj -> object_expression_t
