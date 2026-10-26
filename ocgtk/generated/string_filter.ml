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

(* High-level class for StringFilter *)
class string_filter (obj : Raw.String_filter.t) : string_filter_t =
  object (self)
    inherit Filter.filter (obj :> Raw.Filter.t)

    method get_expression : unit -> Expression.expression_t option =
      fun () ->
        Option.map
          (fun ret -> new Expression.expression ret)
          (Raw.String_filter.get_expression obj)

    method get_ignore_case : unit -> bool =
      fun () -> Raw.String_filter.get_ignore_case obj

    method get_match_mode : unit -> Enums.stringfiltermatchmode =
      fun () -> Raw.String_filter.get_match_mode obj

    method get_search : unit -> string option =
      fun () -> Raw.String_filter.get_search obj

    method set_expression : Expression.expression_t option -> unit =
      fun expression ->
        let expression = Option.map (fun c -> c#as_expression) expression in
        Raw.String_filter.set_expression obj expression

    method set_ignore_case : bool -> unit =
      fun ignore_case -> Raw.String_filter.set_ignore_case obj ignore_case

    method set_match_mode : Enums.stringfiltermatchmode -> unit =
      fun mode -> Raw.String_filter.set_match_mode obj mode

    method set_search : string option -> unit =
      fun search -> Raw.String_filter.set_search obj search

    method as_string_filter = obj
  end

let new_ (expression : Expression.expression_t option) : string_filter_t =
  let expression = Option.map (fun c -> c#as_expression) expression in
  let obj_ = Raw.String_filter.new_ expression in
  new string_filter obj_
