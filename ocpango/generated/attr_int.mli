class type attr_int_t = object
  method as_attr_int : Raw.Attr_int.t
end

class attr_int : Raw.Attr_int.t -> attr_int_t
