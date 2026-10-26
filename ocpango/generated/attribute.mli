class type attribute_t = object
  method as_color : unit -> Raw.Attr_color.t option
  method as_float : unit -> Raw.Attr_float.t option
  method as_font_desc : unit -> Raw.Attr_font_desc.t option
  method as_font_features : unit -> Raw.Attr_font_features.t option
  method as_int : unit -> Raw.Attr_int.t option
  method as_language : unit -> Raw.Attr_language.t option
  method as_shape : unit -> Raw.Attr_shape.t option
  method as_size : unit -> Raw.Attr_size.t option
  method as_string : unit -> Raw.Attr_string.t option
  method destroy : unit -> unit
  method equal : Raw.Attribute.t -> bool
  method init : Raw.Attr_class.t -> unit
  method as_attribute : Raw.Attribute.t
end

class attribute : Raw.Attribute.t -> attribute_t
