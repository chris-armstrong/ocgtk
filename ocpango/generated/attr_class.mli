class type attr_class_t = object
  method as_attr_class : Raw.Attr_class.t
end

class attr_class : Raw.Attr_class.t -> attr_class_t
