class type object_expression_t = object
    inherit GExpression.expression_t
    method get_object : unit -> [`object_] Gobject.obj option
    method as_object_expression : Object_expression.t
end

(* High-level class for ObjectExpression *)
class object_expression (obj : Object_expression.t) : object_expression_t = object (self)
  inherit GExpression.expression (obj :> Expression.t)

  method get_object : unit -> [`object_] Gobject.obj option =
    fun () ->
      (Object_expression.get_object obj)

    method as_object_expression = obj
end

let new_ (object_ : [`object_] Gobject.obj) : object_expression_t =
  let obj_ = Object_expression.new_ object_ in
  new object_expression obj_

