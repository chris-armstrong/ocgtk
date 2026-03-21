class type bool_filter_t = object
    method get_expression : unit -> GExpression.expression_t option
    method get_invert : unit -> bool
    method set_expression : GExpression.expression_t option -> unit
    method set_invert : bool -> unit
    method as_bool_filter : Bool_filter.t
end

(* High-level class for BoolFilter *)
class bool_filter (obj : Bool_filter.t) : bool_filter_t = object (self)

  method get_expression : unit -> GExpression.expression_t option =
    fun () ->
      Option.map (fun ret -> new GExpression.expression ret) (Bool_filter.get_expression obj)

  method get_invert : unit -> bool =
    fun () ->
      (Bool_filter.get_invert obj)

  method set_expression : GExpression.expression_t option -> unit =
    fun expression ->
      let expression = Option.map (fun (c) -> c#as_expression) expression in
      (Bool_filter.set_expression obj expression)

  method set_invert : bool -> unit =
    fun invert ->
      (Bool_filter.set_invert obj invert)

    method as_bool_filter = obj
end

