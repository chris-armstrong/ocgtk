class type string_sorter_t = object
    method get_collation : unit -> Gtk_enums.collation
    method get_expression : unit -> GExpression.expression_t option
    method get_ignore_case : unit -> bool
    method set_collation : Gtk_enums.collation -> unit
    method set_expression : GExpression.expression_t option -> unit
    method set_ignore_case : bool -> unit
    method as_string_sorter : String_sorter.t
end

class string_sorter : String_sorter.t -> string_sorter_t

