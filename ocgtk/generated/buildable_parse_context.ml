class type buildable_parse_context_t = object
  method get_element : unit -> string option
  method get_element_stack : unit -> string array
  method as_buildable_parse_context : Raw.Buildable_parse_context.t
end

(* High-level class for BuildableParseContext *)
class buildable_parse_context (obj : Raw.Buildable_parse_context.t) :
  buildable_parse_context_t =
  object (self)
    method get_element : unit -> string option =
      fun () -> Raw.Buildable_parse_context.get_element obj

    method get_element_stack : unit -> string array =
      fun () -> Raw.Buildable_parse_context.get_element_stack obj

    method as_buildable_parse_context = obj
  end
