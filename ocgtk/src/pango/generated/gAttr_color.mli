class type attr_color_t = object
  method as_attr_color : Attr_color.t
end

class attr_color : Attr_color.t -> attr_color_t
