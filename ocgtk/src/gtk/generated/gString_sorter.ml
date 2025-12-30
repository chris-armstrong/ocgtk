(* High-level class for StringSorter *)
class string_sorter (obj : String_sorter.t) = object (self)

  method get_collation : unit -> Gtk_enums.collation =
    fun () ->
      (String_sorter.get_collation obj)

  method get_expression : unit -> GExpression.expression option =
    fun () ->
      Option.map (fun ret -> new GExpression.expression ret) (String_sorter.get_expression obj)

  method get_ignore_case : unit -> bool =
    fun () ->
      (String_sorter.get_ignore_case obj)

  method set_collation : Gtk_enums.collation -> unit =
    fun collation ->
      (String_sorter.set_collation obj collation)

  method set_expression : 'p1. (#GExpression.expression as 'p1) option -> unit =
    fun expression ->
      let expression = Option.map (fun (c) -> c#as_expression) expression in
      (String_sorter.set_expression obj expression)

  method set_ignore_case : bool -> unit =
    fun ignore_case ->
      (String_sorter.set_ignore_case obj ignore_case)

    method as_string_sorter = obj
end

