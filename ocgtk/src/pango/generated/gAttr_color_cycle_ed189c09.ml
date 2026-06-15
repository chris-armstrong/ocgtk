(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

class attr_color (obj : Attr_color_cycle_ed189c09.Attr_color.t) : attr_color_t =
  object (self)
    method get_attr : Attr_color_cycle_ed189c09.Attribute.t =
      Attr_color_cycle_ed189c09.Attr_color.get_attr obj

    method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_color.set_attr obj v

    method get_color : Color.t =
      Attr_color_cycle_ed189c09.Attr_color.get_color obj

    method set_color : Color.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_color.set_color obj v

    method as_attr_color = obj
  end

and attr_float (obj : Attr_color_cycle_ed189c09.Attr_float.t) : attr_float_t =
  object (self)
    method get_attr : Attr_color_cycle_ed189c09.Attribute.t =
      Attr_color_cycle_ed189c09.Attr_float.get_attr obj

    method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_float.set_attr obj v

    method get_value : float =
      Attr_color_cycle_ed189c09.Attr_float.get_value obj

    method set_value : float -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_float.set_value obj v

    method as_attr_float = obj
  end

and attr_font_desc (obj : Attr_color_cycle_ed189c09.Attr_font_desc.t) :
  attr_font_desc_t =
  object (self)
    method get_attr : Attr_color_cycle_ed189c09.Attribute.t =
      Attr_color_cycle_ed189c09.Attr_font_desc.get_attr obj

    method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_font_desc.set_attr obj v

    method get_desc : Font_description.t =
      Attr_color_cycle_ed189c09.Attr_font_desc.get_desc obj

    method set_desc : Font_description.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_font_desc.set_desc obj v

    method as_attr_font_desc = obj
  end

and attr_font_features (obj : Attr_color_cycle_ed189c09.Attr_font_features.t) :
  attr_font_features_t =
  object (self)
    method get_attr : Attr_color_cycle_ed189c09.Attribute.t =
      Attr_color_cycle_ed189c09.Attr_font_features.get_attr obj

    method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_font_features.set_attr obj v

    method get_features : string =
      Attr_color_cycle_ed189c09.Attr_font_features.get_features obj

    method set_features : string -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_font_features.set_features obj v

    method as_attr_font_features = obj
  end

and attr_int (obj : Attr_color_cycle_ed189c09.Attr_int.t) : attr_int_t =
  object (self)
    method get_attr : Attr_color_cycle_ed189c09.Attribute.t =
      Attr_color_cycle_ed189c09.Attr_int.get_attr obj

    method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_int.set_attr obj v

    method get_value : int = Attr_color_cycle_ed189c09.Attr_int.get_value obj

    method set_value : int -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_int.set_value obj v

    method as_attr_int = obj
  end

and attr_language (obj : Attr_color_cycle_ed189c09.Attr_language.t) :
  attr_language_t =
  object (self)
    method get_attr : Attr_color_cycle_ed189c09.Attribute.t =
      Attr_color_cycle_ed189c09.Attr_language.get_attr obj

    method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_language.set_attr obj v

    method get_value : Language.t =
      Attr_color_cycle_ed189c09.Attr_language.get_value obj

    method set_value : Language.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_language.set_value obj v

    method as_attr_language = obj
  end

and attr_shape (obj : Attr_color_cycle_ed189c09.Attr_shape.t) : attr_shape_t =
  object (self)
    method get_attr : Attr_color_cycle_ed189c09.Attribute.t =
      Attr_color_cycle_ed189c09.Attr_shape.get_attr obj

    method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_shape.set_attr obj v

    method get_ink_rect : Rectangle.t =
      Attr_color_cycle_ed189c09.Attr_shape.get_ink_rect obj

    method set_ink_rect : Rectangle.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_shape.set_ink_rect obj v

    method get_logical_rect : Rectangle.t =
      Attr_color_cycle_ed189c09.Attr_shape.get_logical_rect obj

    method set_logical_rect : Rectangle.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_shape.set_logical_rect obj v

    method get_destroy_func : unit =
      Attr_color_cycle_ed189c09.Attr_shape.get_destroy_func obj

    method set_destroy_func : unit -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_shape.set_destroy_func obj v

    method as_attr_shape = obj
  end

and attr_size (obj : Attr_color_cycle_ed189c09.Attr_size.t) : attr_size_t =
  object (self)
    method get_attr : Attr_color_cycle_ed189c09.Attribute.t =
      Attr_color_cycle_ed189c09.Attr_size.get_attr obj

    method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_size.set_attr obj v

    method get_size : int = Attr_color_cycle_ed189c09.Attr_size.get_size obj

    method set_size : int -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_size.set_size obj v

    method get_absolute : int =
      Attr_color_cycle_ed189c09.Attr_size.get_absolute obj

    method set_absolute : int -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_size.set_absolute obj v

    method as_attr_size = obj
  end

and attr_string (obj : Attr_color_cycle_ed189c09.Attr_string.t) : attr_string_t
  =
  object (self)
    method get_attr : Attr_color_cycle_ed189c09.Attribute.t =
      Attr_color_cycle_ed189c09.Attr_string.get_attr obj

    method set_attr : Attr_color_cycle_ed189c09.Attribute.t -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_string.set_attr obj v

    method get_value : string =
      Attr_color_cycle_ed189c09.Attr_string.get_value obj

    method set_value : string -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attr_string.set_value obj v

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

    method get_start_index : int =
      Attr_color_cycle_ed189c09.Attribute.get_start_index obj

    method set_start_index : int -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attribute.set_start_index obj v

    method get_end_index : int =
      Attr_color_cycle_ed189c09.Attribute.get_end_index obj

    method set_end_index : int -> unit =
      fun v -> Attr_color_cycle_ed189c09.Attribute.set_end_index obj v

    method as_attribute = obj
  end

let make (start_index : int) (end_index : int) : attribute_t =
  new attribute (Attr_color_cycle_ed189c09.Attribute.make start_index end_index)

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (color : Color.t) :
    attr_color_t =
  new attr_color (Attr_color_cycle_ed189c09.Attr_color.make attr color)

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (value : float) :
    attr_float_t =
  new attr_float (Attr_color_cycle_ed189c09.Attr_float.make attr value)

let make (attr : Attr_color_cycle_ed189c09.Attribute.t)
    (desc : Font_description.t) : attr_font_desc_t =
  new attr_font_desc (Attr_color_cycle_ed189c09.Attr_font_desc.make attr desc)

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (features : string) :
    attr_font_features_t =
  new attr_font_features
    (Attr_color_cycle_ed189c09.Attr_font_features.make attr features)

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (value : int) :
    attr_int_t =
  new attr_int (Attr_color_cycle_ed189c09.Attr_int.make attr value)

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (value : Language.t) :
    attr_language_t =
  new attr_language (Attr_color_cycle_ed189c09.Attr_language.make attr value)

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (ink_rect : Rectangle.t)
    (logical_rect : Rectangle.t) (destroy_func : unit) : attr_shape_t =
  new attr_shape
    (Attr_color_cycle_ed189c09.Attr_shape.make attr ink_rect logical_rect
       destroy_func)

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (size : int)
    (absolute : int) : attr_size_t =
  new attr_size (Attr_color_cycle_ed189c09.Attr_size.make attr size absolute)

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (value : string) :
    attr_string_t =
  new attr_string (Attr_color_cycle_ed189c09.Attr_string.make attr value)
