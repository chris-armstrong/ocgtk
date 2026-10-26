class type property_expression_t = object
  inherit Expression.expression_t
  method get_expression : unit -> Expression.expression_t option
  method as_property_expression : Raw.Property_expression.t
end

(* High-level class for PropertyExpression *)
class property_expression (obj : Raw.Property_expression.t) :
  property_expression_t =
  object (self)
    inherit Expression.expression (obj :> Raw.Expression.t)

    method get_expression : unit -> Expression.expression_t option =
      fun () ->
        Option.map
          (fun ret -> new Expression.expression ret)
          (Raw.Property_expression.get_expression obj)

    method as_property_expression = obj
  end

let new_ (this_type : Gobject.Type.t)
    (expression : Expression.expression_t option) (property_name : string) :
    property_expression_t =
  let expression = Option.map (fun c -> c#as_expression) expression in
  let obj_ = Raw.Property_expression.new_ this_type expression property_name in
  new property_expression obj_
