(* High-level class for StringFilter *)
class string_filter (obj : String_filter.t) = object (self)

  method ignore_case = String_filter.get_ignore_case obj
  method set_ignore_case v = String_filter.set_ignore_case obj v

  method search = String_filter.get_search obj
  method set_search v = String_filter.set_search obj v

  method get_expression : unit -> GExpression.expression option = fun () -> Option.map (fun ret -> new GExpression.expression ret) (String_filter.get_expression obj )

  method get_match_mode : unit -> Gtk_enums.stringfiltermatchmode = fun () -> (String_filter.get_match_mode obj )

  method set_expression : 'p1. (#GExpression.expression as 'p1) option -> unit =
    fun expression ->
      let expression = Option.map (fun (c) -> c#as_expression) expression in
      (String_filter.set_expression obj expression)

  method set_match_mode : Gtk_enums.stringfiltermatchmode -> unit = fun mode -> (String_filter.set_match_mode obj mode)

    method as_string_filter = obj
end

