class string_sorter : String_sorter.t ->
  object
    method ignore_case : bool
    method set_ignore_case : bool -> unit
    method get_collation : unit -> Gtk_enums.collation
    method get_expression : unit -> GExpression.expression option
    method set_collation : Gtk_enums.collation -> unit
    method set_expression : #GExpression.expression option -> unit
    method as_string_sorter : String_sorter.t
  end

