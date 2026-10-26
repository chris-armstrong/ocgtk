class type numeric_sorter_t = object
  inherit Sorter.sorter_t
  method get_expression : unit -> Expression.expression_t option
  method get_sort_order : unit -> Enums.sorttype
  method set_expression : Expression.expression_t option -> unit
  method set_sort_order : Enums.sorttype -> unit
  method as_numeric_sorter : Raw.Numeric_sorter.t
end

class numeric_sorter : Raw.Numeric_sorter.t -> numeric_sorter_t

val new_ : Expression.expression_t option -> numeric_sorter_t
