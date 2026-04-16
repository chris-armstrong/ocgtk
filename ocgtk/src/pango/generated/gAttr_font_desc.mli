class type attr_font_desc_t = object
  method as_attr_font_desc : Attr_font_desc.t
end

class attr_font_desc : Attr_font_desc.t -> attr_font_desc_t
