class type attr_size_t = object
  method as_attr_size : Attr_size.t
end

class attr_size : Attr_size.t -> attr_size_t
