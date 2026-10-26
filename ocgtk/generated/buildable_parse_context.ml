class type buildable_parse_context_t = object
  method get_element : unit -> string option
  method get_element_stack : unit -> string array
  method as_buildable_parse_context : Buildable_parse_context.t
end

(* High-level class for BuildableParseContext *)
class buildable_parse_context (obj : Buildable_parse_context.t) :
  buildable_parse_context_t =
  object (self)
    method get_element : unit -> string option =
      fun () -> Buildable_parse_context.get_element obj

    method get_element_stack : unit -> string array =
      fun () -> Buildable_parse_context.get_element_stack obj

    method as_buildable_parse_context = obj
  end
