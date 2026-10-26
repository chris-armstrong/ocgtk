class type constant_expression_t = object
  inherit Expression.expression_t
  method get_value : unit -> Gobject.Value.t
  method as_constant_expression : Raw.Constant_expression.t
end

(* High-level class for ConstantExpression *)
class constant_expression (obj : Raw.Constant_expression.t) :
  constant_expression_t =
  object (self)
    inherit Expression.expression (obj :> Raw.Expression.t)

    method get_value : unit -> Gobject.Value.t =
      fun () -> Raw.Constant_expression.get_value obj

    method as_constant_expression = obj
  end

let new_for_value (value : Gobject.Value.t) : constant_expression_t =
  let obj_ = Raw.Constant_expression.new_for_value value in
  new constant_expression obj_
