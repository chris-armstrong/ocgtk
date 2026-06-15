class type attr_color_t = object
  method as_attr_color : Attr_color_cycle_ed189c09.Attr_color.t
end

and attr_float_t = object
  method as_attr_float : Attr_color_cycle_ed189c09.Attr_float.t
end

and attr_font_desc_t = object
  method as_attr_font_desc : Attr_color_cycle_ed189c09.Attr_font_desc.t
end

and attr_font_features_t = object
  method as_attr_font_features : Attr_color_cycle_ed189c09.Attr_font_features.t
end

and attr_int_t = object
  method as_attr_int : Attr_color_cycle_ed189c09.Attr_int.t
end

and attr_language_t = object
  method as_attr_language : Attr_color_cycle_ed189c09.Attr_language.t
end

and attr_shape_t = object
  method as_attr_shape : Attr_color_cycle_ed189c09.Attr_shape.t
end

and attr_size_t = object
  method as_attr_size : Attr_color_cycle_ed189c09.Attr_size.t
end

and attr_string_t = object
  method as_attr_string : Attr_color_cycle_ed189c09.Attr_string.t
end

and attribute_t = object
  method as_color : unit -> Attr_color_cycle_ed189c09.Attr_color.t option
  method as_float : unit -> Attr_color_cycle_ed189c09.Attr_float.t option

  method as_font_desc :
    unit -> Attr_color_cycle_ed189c09.Attr_font_desc.t option

  method as_font_features :
    unit -> Attr_color_cycle_ed189c09.Attr_font_features.t option

  method as_int : unit -> Attr_color_cycle_ed189c09.Attr_int.t option
  method as_language : unit -> Attr_color_cycle_ed189c09.Attr_language.t option
  method as_shape : unit -> Attr_color_cycle_ed189c09.Attr_shape.t option
  method as_size : unit -> Attr_color_cycle_ed189c09.Attr_size.t option
  method as_string : unit -> Attr_color_cycle_ed189c09.Attr_string.t option
  method destroy : unit -> unit
  method equal : Attr_color_cycle_ed189c09.Attribute.t -> bool
  method init : Attr_class.t -> unit
  method as_attribute : Attr_color_cycle_ed189c09.Attribute.t
end

class attr_color : Attr_color_cycle_ed189c09.Attr_color.t -> attr_color_t

and attr_float : Attr_color_cycle_ed189c09.Attr_float.t -> attr_float_t

and attr_font_desc :
  Attr_color_cycle_ed189c09.Attr_font_desc.t ->
  attr_font_desc_t

and attr_font_features :
  Attr_color_cycle_ed189c09.Attr_font_features.t ->
  attr_font_features_t

and attr_int : Attr_color_cycle_ed189c09.Attr_int.t -> attr_int_t

and attr_language : Attr_color_cycle_ed189c09.Attr_language.t -> attr_language_t

and attr_shape : Attr_color_cycle_ed189c09.Attr_shape.t -> attr_shape_t

and attr_size : Attr_color_cycle_ed189c09.Attr_size.t -> attr_size_t

and attr_string : Attr_color_cycle_ed189c09.Attr_string.t -> attr_string_t

and attribute : Attr_color_cycle_ed189c09.Attribute.t -> attribute_t
