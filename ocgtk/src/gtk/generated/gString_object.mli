class type string_object_t = object
    method get_string : unit -> string
    method as_string_object : String_object.t
end

class string_object : String_object.t -> string_object_t

