class type attribute_t = object
  method as_color : unit -> Attr_color.t option
  method as_float : unit -> Attr_float.t option
  method as_font_desc : unit -> Attr_font_desc.t option
  method as_font_features : unit -> Attr_font_features.t option
  method as_int : unit -> Attr_int.t option
  method as_language : unit -> Attr_language.t option
  method as_shape : unit -> Attr_shape.t option
  method as_size : unit -> Attr_size.t option
  method as_string : unit -> Attr_string.t option
  method destroy : unit -> unit
  method equal : Attribute.t -> bool
  method init : Attr_class.t -> unit
  method as_attribute : Attribute.t
end

class attribute : Attribute.t -> attribute_t
