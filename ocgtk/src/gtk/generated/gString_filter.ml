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

(* High-level class for StringFilter *)
class string_filter (obj : String_filter.t) : string_filter_t =
  object (self)
    inherit GFilter.filter (obj :> Filter.t)

    method get_expression : unit -> GExpression.expression_t option =
      fun () ->
        Option.map
          (fun ret -> new GExpression.expression ret)
          (String_filter.get_expression obj)

    method get_ignore_case : unit -> bool =
      fun () -> String_filter.get_ignore_case obj

    method get_match_mode : unit -> Gtk_enums.stringfiltermatchmode =
      fun () -> String_filter.get_match_mode obj

    method get_search : unit -> string option =
      fun () -> String_filter.get_search obj

    method set_expression : GExpression.expression_t option -> unit =
      fun expression ->
        let expression = Option.map (fun c -> c#as_expression) expression in
        String_filter.set_expression obj expression

    method set_ignore_case : bool -> unit =
      fun ignore_case -> String_filter.set_ignore_case obj ignore_case

    method set_match_mode : Gtk_enums.stringfiltermatchmode -> unit =
      fun mode -> String_filter.set_match_mode obj mode

    method set_search : string option -> unit =
      fun search -> String_filter.set_search obj search

    method as_string_filter = obj
  end

let new_ (expression : GExpression.expression_t option) : string_filter_t =
  let expression = Option.map (fun c -> c#as_expression) expression in
  let obj_ = String_filter.new_ expression in
  new string_filter obj_
