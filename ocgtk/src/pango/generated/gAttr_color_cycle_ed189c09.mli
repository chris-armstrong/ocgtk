class type attr_color_t = object
  method get_attr : Attr_color_cycle_ed189c09.Attribute.t
  method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit
  method get_color : Color.t
  method set_color : Color.t -> unit
  method as_attr_color : Attr_color_cycle_ed189c09.Attr_color.t
end

and attr_float_t = object
  method get_attr : Attr_color_cycle_ed189c09.Attribute.t
  method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit
  method get_value : float
  method set_value : float -> unit
  method as_attr_float : Attr_color_cycle_ed189c09.Attr_float.t
end

and attr_font_desc_t = object
  method get_attr : Attr_color_cycle_ed189c09.Attribute.t
  method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit
  method get_desc : Font_description.t
  method set_desc : Font_description.t -> unit
  method as_attr_font_desc : Attr_color_cycle_ed189c09.Attr_font_desc.t
end

and attr_font_features_t = object
  method get_attr : Attr_color_cycle_ed189c09.Attribute.t
  method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit
  method get_features : string
  method set_features : string -> unit
  method as_attr_font_features : Attr_color_cycle_ed189c09.Attr_font_features.t
end

and attr_int_t = object
  method get_attr : Attr_color_cycle_ed189c09.Attribute.t
  method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit
  method get_value : int
  method set_value : int -> unit
  method as_attr_int : Attr_color_cycle_ed189c09.Attr_int.t
end

and attr_language_t = object
  method get_attr : Attr_color_cycle_ed189c09.Attribute.t
  method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit
  method get_value : Language.t
  method set_value : Language.t -> unit
  method as_attr_language : Attr_color_cycle_ed189c09.Attr_language.t
end

and attr_shape_t = object
  method get_attr : Attr_color_cycle_ed189c09.Attribute.t
  method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit
  method get_ink_rect : Rectangle.t
  method set_ink_rect : Rectangle.t -> unit
  method get_logical_rect : Rectangle.t
  method set_logical_rect : Rectangle.t -> unit
  method get_destroy_func : unit
  method set_destroy_func : unit -> unit
  method as_attr_shape : Attr_color_cycle_ed189c09.Attr_shape.t
end

and attr_size_t = object
  method get_attr : Attr_color_cycle_ed189c09.Attribute.t
  method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit
  method get_size : int
  method set_size : int -> unit
  method get_absolute : int
  method set_absolute : int -> unit
  method as_attr_size : Attr_color_cycle_ed189c09.Attr_size.t
end

and attr_string_t = object
  method get_attr : Attr_color_cycle_ed189c09.Attribute.t
  method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit
  method get_value : string
  method set_value : string -> unit
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
  method get_start_index : int
  method set_start_index : int -> unit
  method get_end_index : int
  method set_end_index : int -> unit
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

val make : int -> int -> attribute_t
val make : Attr_color_cycle_ed189c09.Attribute.t -> Color.t -> attr_color_t
val make : Attr_color_cycle_ed189c09.Attribute.t -> float -> attr_float_t

val make :
  Attr_color_cycle_ed189c09.Attribute.t ->
  Font_description.t ->
  attr_font_desc_t

val make :
  Attr_color_cycle_ed189c09.Attribute.t -> string -> attr_font_features_t

val make : Attr_color_cycle_ed189c09.Attribute.t -> int -> attr_int_t

val make :
  Attr_color_cycle_ed189c09.Attribute.t -> Language.t -> attr_language_t

val make :
  Attr_color_cycle_ed189c09.Attribute.t ->
  Rectangle.t ->
  Rectangle.t ->
  unit ->
  attr_shape_t

val make : Attr_color_cycle_ed189c09.Attribute.t -> int -> int -> attr_size_t
val make : Attr_color_cycle_ed189c09.Attribute.t -> string -> attr_string_t
