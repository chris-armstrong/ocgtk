class type string_sorter_t = object
  inherit GSorter.sorter_t
  method get_collation : unit -> Gtk_enums.collation
  method get_expression : unit -> GExpression.expression_t option
  method get_ignore_case : unit -> bool
  method set_collation : Gtk_enums.collation -> unit
  method set_expression : GExpression.expression_t option -> unit
  method set_ignore_case : bool -> unit
  method as_string_sorter : String_sorter.t
end

(* High-level class for StringSorter *)
class string_sorter (obj : String_sorter.t) : string_sorter_t =
  object (self)
    inherit GSorter.sorter (obj :> Sorter.t)

    method get_collation : unit -> Gtk_enums.collation =
      fun () -> String_sorter.get_collation obj

    method get_expression : unit -> GExpression.expression_t option =
      fun () ->
        Option.map
          (fun ret -> new GExpression.expression ret)
          (String_sorter.get_expression obj)

    method get_ignore_case : unit -> bool =
      fun () -> String_sorter.get_ignore_case obj

    method set_collation : Gtk_enums.collation -> unit =
      fun collation -> String_sorter.set_collation obj collation

    method set_expression : GExpression.expression_t option -> unit =
      fun expression ->
        let expression = Option.map (fun c -> c#as_expression) expression in
        String_sorter.set_expression obj expression

    method set_ignore_case : bool -> unit =
      fun ignore_case -> String_sorter.set_ignore_case obj ignore_case

    method as_string_sorter = obj
  end

let new_ (expression : GExpression.expression_t option) : string_sorter_t =
  let expression = Option.map (fun c -> c#as_expression) expression in
  let obj_ = String_sorter.new_ expression in
  new string_sorter obj_
