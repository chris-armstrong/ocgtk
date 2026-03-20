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
    method copy : unit -> Attribute.t
    method destroy : unit -> unit
    method equal : Attribute.t -> bool
    method init : Attr_class.t -> unit
    method as_attribute : Attribute.t
end

(* High-level class for Attribute *)
class attribute (obj : Attribute.t) : attribute_t = object (self)

  method as_color : unit -> Attr_color.t option =
    fun () ->
      (Attribute.as_color obj)

  method as_float : unit -> Attr_float.t option =
    fun () ->
      (Attribute.as_float obj)

  method as_font_desc : unit -> Attr_font_desc.t option =
    fun () ->
      (Attribute.as_font_desc obj)

  method as_font_features : unit -> Attr_font_features.t option =
    fun () ->
      (Attribute.as_font_features obj)

  method as_int : unit -> Attr_int.t option =
    fun () ->
      (Attribute.as_int obj)

  method as_language : unit -> Attr_language.t option =
    fun () ->
      (Attribute.as_language obj)

  method as_shape : unit -> Attr_shape.t option =
    fun () ->
      (Attribute.as_shape obj)

  method as_size : unit -> Attr_size.t option =
    fun () ->
      (Attribute.as_size obj)

  method as_string : unit -> Attr_string.t option =
    fun () ->
      (Attribute.as_string obj)

  method copy : unit -> Attribute.t =
    fun () ->
      (Attribute.copy obj)

  method destroy : unit -> unit =
    fun () ->
      (Attribute.destroy obj)

  method equal : Attribute.t -> bool =
    fun attr2 ->
      (Attribute.equal obj attr2)

  method init : Attr_class.t -> unit =
    fun klass ->
      (Attribute.init obj klass)

    method as_attribute = obj
end

