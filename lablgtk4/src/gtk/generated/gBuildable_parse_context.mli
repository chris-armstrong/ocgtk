class buildable_parse_context : Buildable_parse_context.t ->
  object
    method get_element : unit -> string option
    method as_buildable_parse_context : Buildable_parse_context.t
  end

