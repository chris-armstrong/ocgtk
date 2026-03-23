class type numeric_sorter_t = object
    inherit GSorter.sorter_t
    method get_expression : unit -> GExpression.expression_t option
    method get_sort_order : unit -> Gtk_enums.sorttype
    method set_expression : GExpression.expression_t option -> unit
    method set_sort_order : Gtk_enums.sorttype -> unit
    method as_numeric_sorter : Numeric_sorter.t
end

class numeric_sorter : Numeric_sorter.t -> numeric_sorter_t

val new_ : GExpression.expression_t option -> numeric_sorter_t
