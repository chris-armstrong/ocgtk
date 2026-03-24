class type property_expression_t = object
    inherit GExpression.expression_t
    method get_expression : unit -> GExpression.expression_t option
    method as_property_expression : Property_expression.t
end

(* High-level class for PropertyExpression *)
class property_expression (obj : Property_expression.t) : property_expression_t = object (self)
  inherit GExpression.expression (obj :> Expression.t)

  method get_expression : unit -> GExpression.expression_t option =
    fun () ->
      Option.map (fun ret -> new GExpression.expression ret) (Property_expression.get_expression obj)

    method as_property_expression = obj
end

