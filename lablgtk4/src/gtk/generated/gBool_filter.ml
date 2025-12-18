(* High-level class for BoolFilter *)
class bool_filter (obj : Bool_filter.t) = object (self)

  method invert = Bool_filter.get_invert obj
  method set_invert v = Bool_filter.set_invert obj v

  method get_expression : unit -> GExpression.expression option = fun () -> Option.map (fun ret -> new GExpression.expression ret) (Bool_filter.get_expression obj )

  method set_expression : 'p1. (#GExpression.expression as 'p1) option -> unit =
    fun expression ->
      let expression = Option.map (fun (c) -> c#as_expression) expression in
      (Bool_filter.set_expression obj expression)

    method as_bool_filter = obj
end

