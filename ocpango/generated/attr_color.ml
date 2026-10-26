class type attr_color_t = object
  method as_attr_color : Attr_color.t
end

(* High-level class for AttrColor *)
class attr_color (obj : Attr_color.t) : attr_color_t =
  object (self)
    method as_attr_color = obj
  end
