class type string_filter_t = object
    inherit GFilter.filter_t
    method get_expression : unit -> GExpression.expression_t option
    method get_ignore_case : unit -> bool
    method get_match_mode : unit -> Gtk_enums.stringfiltermatchmode
    method get_search : unit -> string option
    method set_expression : GExpression.expression_t option -> unit
    method set_ignore_case : bool -> unit
    method set_match_mode : Gtk_enums.stringfiltermatchmode -> unit
    method set_search : string option -> unit
    method as_string_filter : String_filter.t
end

class string_filter : String_filter.t -> string_filter_t

