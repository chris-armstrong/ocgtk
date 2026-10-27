class type string_filter_t = object
  inherit Filter.filter_t
  method get_expression : unit -> Expression.expression_t option
  method get_ignore_case : unit -> bool
  method get_match_mode : unit -> Enums.stringfiltermatchmode
  method get_search : unit -> string option
  method set_expression : Expression.expression_t option -> unit
  method set_ignore_case : bool -> unit
  method set_match_mode : Enums.stringfiltermatchmode -> unit
  method set_search : string option -> unit
  method as_string_filter : Raw.String_filter.t
end

class string_filter : Raw.String_filter.t -> string_filter_t

val new_ : Expression.expression_t option -> string_filter_t
