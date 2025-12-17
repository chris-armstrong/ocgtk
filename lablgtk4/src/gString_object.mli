class string_object : String_object.t ->
  object
    method get_string : unit -> string
    method as_string_object : String_object.t
  end

