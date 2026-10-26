class type string_object_t = object
  method get_string : unit -> string
  method as_string_object : Raw.String_object.t
end

class string_object : Raw.String_object.t -> string_object_t

val new_ : string -> string_object_t
