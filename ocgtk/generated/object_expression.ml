class type object_expression_t = object
  inherit Expression.expression_t

  method get_object : unit -> [ `object_ ] Gobject.obj option
  (** Gets the object that the expression evaluates to. *)

  method as_object_expression : Raw.Object_expression.t
end

(* High-level class for ObjectExpression *)
class object_expression (obj : Raw.Object_expression.t) : object_expression_t =
  object (self)
    inherit Expression.expression (obj :> Raw.Expression.t)

    method get_object : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Raw.Object_expression.get_object obj

    method as_object_expression = obj
  end

let new_ (object_ : [ `object_ ] Gobject.obj) : object_expression_t =
  let obj_ = Raw.Object_expression.new_ object_ in
  new object_expression obj_
