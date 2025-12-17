class numeric_sorter : Numeric_sorter.t ->
  object
    method get_expression : unit -> GExpression.expression option
    method get_sort_order : unit -> Gtk_enums.sorttype
    method set_expression : #GExpression.expression option -> unit
    method set_sort_order : Gtk_enums.sorttype -> unit
    method as_numeric_sorter : Numeric_sorter.t
  end

