(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

class attr_color (obj : Attr_color_cycle_ed189c09.Attr_color.t) : attr_color_t =
  object (self)
    method as_attr_color = obj
  end

and attr_float (obj : Attr_color_cycle_ed189c09.Attr_float.t) : attr_float_t =
  object (self)
    method as_attr_float = obj
  end

and attr_font_desc (obj : Attr_color_cycle_ed189c09.Attr_font_desc.t) :
  attr_font_desc_t =
  object (self)
    method as_attr_font_desc = obj
  end

and attr_font_features (obj : Attr_color_cycle_ed189c09.Attr_font_features.t) :
  attr_font_features_t =
  object (self)
    method as_attr_font_features = obj
  end

and attr_int (obj : Attr_color_cycle_ed189c09.Attr_int.t) : attr_int_t =
  object (self)
    method as_attr_int = obj
  end

and attr_language (obj : Attr_color_cycle_ed189c09.Attr_language.t) :
  attr_language_t =
  object (self)
    method as_attr_language = obj
  end

and attr_shape (obj : Attr_color_cycle_ed189c09.Attr_shape.t) : attr_shape_t =
  object (self)
    method as_attr_shape = obj
  end

and attr_size (obj : Attr_color_cycle_ed189c09.Attr_size.t) : attr_size_t =
  object (self)
    method as_attr_size = obj
  end

and attr_string (obj : Attr_color_cycle_ed189c09.Attr_string.t) : attr_string_t
  =
  object (self)
    method as_attr_string = obj
  end

and attribute (obj : Attr_color_cycle_ed189c09.Attribute.t) : attribute_t =
  object (self)
    method as_color : unit -> Attr_color_cycle_ed189c09.Attr_color.t option =
      fun () -> Attr_color_cycle_ed189c09.Attribute.as_color obj

    method as_float : unit -> Attr_color_cycle_ed189c09.Attr_float.t option =
      fun () -> Attr_color_cycle_ed189c09.Attribute.as_float obj

    method as_font_desc :
        unit -> Attr_color_cycle_ed189c09.Attr_font_desc.t option =
      fun () -> Attr_color_cycle_ed189c09.Attribute.as_font_desc obj

    method as_font_features :
        unit -> Attr_color_cycle_ed189c09.Attr_font_features.t option =
      fun () -> Attr_color_cycle_ed189c09.Attribute.as_font_features obj

    method as_int : unit -> Attr_color_cycle_ed189c09.Attr_int.t option =
      fun () -> Attr_color_cycle_ed189c09.Attribute.as_int obj

    method as_language :
        unit -> Attr_color_cycle_ed189c09.Attr_language.t option =
      fun () -> Attr_color_cycle_ed189c09.Attribute.as_language obj

    method as_shape : unit -> Attr_color_cycle_ed189c09.Attr_shape.t option =
      fun () -> Attr_color_cycle_ed189c09.Attribute.as_shape obj

    method as_size : unit -> Attr_color_cycle_ed189c09.Attr_size.t option =
      fun () -> Attr_color_cycle_ed189c09.Attribute.as_size obj

    method as_string : unit -> Attr_color_cycle_ed189c09.Attr_string.t option =
      fun () -> Attr_color_cycle_ed189c09.Attribute.as_string obj

    method destroy : unit -> unit =
      fun () -> Attr_color_cycle_ed189c09.Attribute.destroy obj

    method equal : Attr_color_cycle_ed189c09.Attribute.t -> bool =
      fun attr2 -> Attr_color_cycle_ed189c09.Attribute.equal obj attr2

    method init : Attr_class.t -> unit =
      fun klass -> Attr_color_cycle_ed189c09.Attribute.init obj klass

    method as_attribute = obj
  end
