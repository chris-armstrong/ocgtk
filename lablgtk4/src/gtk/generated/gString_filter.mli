class string_filter : String_filter.t ->
  object
    method ignore_case : bool
    method set_ignore_case : bool -> unit
    method search : string
    method set_search : string -> unit
    method get_expression : unit -> GExpression.expression option
    method get_match_mode : unit -> Gtk_enums.stringfiltermatchmode
    method set_expression : #GExpression.expression option -> unit
    method set_match_mode : Gtk_enums.stringfiltermatchmode -> unit
    method as_string_filter : String_filter.t
  end

