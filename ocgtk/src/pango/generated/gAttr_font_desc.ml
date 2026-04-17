class type attr_font_desc_t = object
    method as_attr_font_desc : Attr_font_desc.t
end

(* High-level class for AttrFontDesc *)
class attr_font_desc (obj : Attr_font_desc.t) : attr_font_desc_t = object (self)

    method as_attr_font_desc = obj
end

