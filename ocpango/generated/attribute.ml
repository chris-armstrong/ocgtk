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

(* High-level class for Attribute *)
class attribute (obj : Raw.Attribute.t) : attribute_t =
  object (self)
    method as_color : unit -> Raw.Attr_color.t option =
      fun () -> Raw.Attribute.as_color obj

    method as_float : unit -> Raw.Attr_float.t option =
      fun () -> Raw.Attribute.as_float obj

    method as_font_desc : unit -> Raw.Attr_font_desc.t option =
      fun () -> Raw.Attribute.as_font_desc obj

    method as_font_features : unit -> Raw.Attr_font_features.t option =
      fun () -> Raw.Attribute.as_font_features obj

    method as_int : unit -> Raw.Attr_int.t option =
      fun () -> Raw.Attribute.as_int obj

    method as_language : unit -> Raw.Attr_language.t option =
      fun () -> Raw.Attribute.as_language obj

    method as_shape : unit -> Raw.Attr_shape.t option =
      fun () -> Raw.Attribute.as_shape obj

    method as_size : unit -> Raw.Attr_size.t option =
      fun () -> Raw.Attribute.as_size obj

    method as_string : unit -> Raw.Attr_string.t option =
      fun () -> Raw.Attribute.as_string obj

    method destroy : unit -> unit = fun () -> Raw.Attribute.destroy obj

    method equal : Raw.Attribute.t -> bool =
      fun attr2 -> Raw.Attribute.equal obj attr2

    method init : Raw.Attr_class.t -> unit =
      fun klass -> Raw.Attribute.init obj klass

    method as_attribute = obj
  end
