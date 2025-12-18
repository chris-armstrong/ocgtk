(* High-level class for StringObject *)
class string_object (obj : String_object.t) = object (self)

  method string = String_object.get_string obj

    method as_string_object = obj
end

