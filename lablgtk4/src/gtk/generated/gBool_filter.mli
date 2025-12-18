class bool_filter : Bool_filter.t ->
  object
    method invert : bool
    method set_invert : bool -> unit
    method get_expression : unit -> GExpression.expression option
    method set_expression : #GExpression.expression option -> unit
    method as_bool_filter : Bool_filter.t
  end

