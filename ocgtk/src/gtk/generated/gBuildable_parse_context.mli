class type buildable_parse_context_t = object
    method get_element : unit -> string option
    method get_element_stack : unit -> string array
    method as_buildable_parse_context : Buildable_parse_context.t
end

class buildable_parse_context : Buildable_parse_context.t -> buildable_parse_context_t

