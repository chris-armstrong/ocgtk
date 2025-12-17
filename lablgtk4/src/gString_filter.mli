class string_filter : String_filter.t ->
  object
    method get_expression : unit -> GExpression.expression option
    method get_ignore_case : unit -> bool
    method get_match_mode : unit -> Gtk_enums.stringfiltermatchmode
    method get_search : unit -> string option
    method set_expression : #GExpression.expression option -> unit
    method set_ignore_case : bool -> unit
    method set_match_mode : Gtk_enums.stringfiltermatchmode -> unit
    method set_search : string option -> unit
    method as_string_filter : String_filter.t
  end

