class type attr_string_t = object
  method as_attr_string : Attr_string.t
end

class attr_string : Attr_string.t -> attr_string_t
