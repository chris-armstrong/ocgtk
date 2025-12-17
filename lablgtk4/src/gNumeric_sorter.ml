(* High-level class for NumericSorter *)
class numeric_sorter (obj : Numeric_sorter.t) = object (self)

  method get_expression : unit -> GExpression.expression option = fun () -> Option.map (fun ret -> new GExpression.expression ret) (Numeric_sorter.get_expression obj )

  method get_sort_order : unit -> Gtk_enums.sorttype = fun () -> (Numeric_sorter.get_sort_order obj )

  method set_expression : 'p1. (#GExpression.expression as 'p1) option -> unit =
    fun expression ->
      let expression = Option.map (fun (c) -> c#as_expression) expression in
      (Numeric_sorter.set_expression obj expression)

  method set_sort_order : Gtk_enums.sorttype -> unit = fun sort_order -> (Numeric_sorter.set_sort_order obj sort_order)

    method as_numeric_sorter = obj
end

