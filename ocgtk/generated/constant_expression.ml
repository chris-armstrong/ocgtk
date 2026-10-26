class type constant_expression_t = object
  inherit GExpression.expression_t
  method get_value : unit -> Gobject.Value.t
  method as_constant_expression : Constant_expression.t
end

(* High-level class for ConstantExpression *)
class constant_expression (obj : Constant_expression.t) : constant_expression_t
  =
  object (self)
    inherit GExpression.expression (obj :> Expression.t)

    method get_value : unit -> Gobject.Value.t =
      fun () -> Constant_expression.get_value obj

    method as_constant_expression = obj
  end

let new_for_value (value : Gobject.Value.t) : constant_expression_t =
  let obj_ = Constant_expression.new_for_value value in
  new constant_expression obj_
