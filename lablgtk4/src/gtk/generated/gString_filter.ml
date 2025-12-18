(* High-level class for StringFilter *)
class string_filter (obj : String_filter.t) = object (self)

  method get_expression : unit -> GExpression.expression option = fun () -> Option.map (fun ret -> new GExpression.expression ret) (String_filter.get_expression obj )

  method get_ignore_case : unit -> bool = fun () -> (String_filter.get_ignore_case obj )

  method get_match_mode : unit -> Gtk_enums.stringfiltermatchmode = fun () -> (String_filter.get_match_mode obj )

  method get_search : unit -> string option = fun () -> (String_filter.get_search obj )

  method set_expression : 'p1. (#GExpression.expression as 'p1) option -> unit =
    fun expression ->
      let expression = Option.map (fun (c) -> c#as_expression) expression in
      (String_filter.set_expression obj expression)

  method set_ignore_case : bool -> unit = fun ignore_case -> (String_filter.set_ignore_case obj ignore_case)

  method set_match_mode : Gtk_enums.stringfiltermatchmode -> unit = fun mode -> (String_filter.set_match_mode obj mode)

  method set_search : string option -> unit = fun search -> (String_filter.set_search obj search)

    method as_string_filter = obj
end

