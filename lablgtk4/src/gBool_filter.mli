class bool_filter : Bool_filter.t ->
  object
    method get_expression : unit -> GExpression.expression option
    method get_invert : unit -> bool
    method set_expression : #GExpression.expression option -> unit
    method set_invert : bool -> unit
    method as_bool_filter : Bool_filter.t
  end

