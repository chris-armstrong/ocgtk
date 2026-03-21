class type bool_filter_t = object
    method get_expression : unit -> GExpression.expression_t option
    method get_invert : unit -> bool
    method set_expression : GExpression.expression_t option -> unit
    method set_invert : bool -> unit
    method as_bool_filter : Bool_filter.t
end

class bool_filter : Bool_filter.t -> bool_filter_t

