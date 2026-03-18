(* High-level class for PropertyExpression *)
class property_expression (obj : Property_expression.t) = object (self)

  method get_expression : unit -> GExpression.expression option =
    fun () ->
      Option.map (fun ret -> new GExpression.expression ret) (Property_expression.get_expression obj)

    method as_property_expression = obj
end

