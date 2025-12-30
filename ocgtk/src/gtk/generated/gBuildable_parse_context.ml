(* High-level class for BuildableParseContext *)
class buildable_parse_context (obj : Buildable_parse_context.t) = object (self)

  method get_element : unit -> string option =
    fun () ->
      (Buildable_parse_context.get_element obj)

    method as_buildable_parse_context = obj
end

