class type string_sorter_t = object
  inherit Sorter.sorter_t
  method get_collation : unit -> Enums.collation
  method get_expression : unit -> Expression.expression_t option
  method get_ignore_case : unit -> bool
  method set_collation : Enums.collation -> unit
  method set_expression : Expression.expression_t option -> unit
  method set_ignore_case : bool -> unit
  method as_string_sorter : Raw.String_sorter.t
end

class string_sorter : Raw.String_sorter.t -> string_sorter_t

val new_ : Expression.expression_t option -> string_sorter_t
