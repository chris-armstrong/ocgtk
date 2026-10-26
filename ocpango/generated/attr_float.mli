class type attr_float_t = object
  method as_attr_float : Raw.Attr_float.t
end

class attr_float : Raw.Attr_float.t -> attr_float_t
