class type attribute_t = object
  (** {2:methods Methods} *)

  method as_color : unit -> Raw.Attr_color.t option
  (** Returns the attribute cast to [PangoAttrColor].

      This is mainly useful for language bindings. *)

  method as_float : unit -> Raw.Attr_float.t option
  (** Returns the attribute cast to [PangoAttrFloat].

      This is mainly useful for language bindings. *)

  method as_font_desc : unit -> Raw.Attr_font_desc.t option
  (** Returns the attribute cast to [PangoAttrFontDesc].

      This is mainly useful for language bindings. *)

  method as_font_features : unit -> Raw.Attr_font_features.t option
  (** Returns the attribute cast to [PangoAttrFontFeatures].

      This is mainly useful for language bindings. *)

  method as_int : unit -> Raw.Attr_int.t option
  (** Returns the attribute cast to [PangoAttrInt].

      This is mainly useful for language bindings. *)

  method as_language : unit -> Raw.Attr_language.t option
  (** Returns the attribute cast to [PangoAttrLanguage].

      This is mainly useful for language bindings. *)

  method as_shape : unit -> Raw.Attr_shape.t option
  (** Returns the attribute cast to [PangoAttrShape].

      This is mainly useful for language bindings. *)

  method as_size : unit -> Raw.Attr_size.t option
  (** Returns the attribute cast to [PangoAttrSize].

      This is mainly useful for language bindings. *)

  method as_string : unit -> Raw.Attr_string.t option
  (** Returns the attribute cast to [PangoAttrString].

      This is mainly useful for language bindings. *)

  method destroy : unit -> unit
  (** Destroy a [PangoAttribute] and free all associated memory. *)

  method equal : Raw.Attribute.t -> bool
  (** Compare two attributes for equality.

      This compares only the actual value of the two attributes and not the
      ranges that the attributes apply to. *)

  method init : Raw.Attr_class.t -> unit
  (** Initializes [attr]'s klass to [klass], it's start_index to
      [PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING] and end_index to
      [PANGO_ATTR_INDEX_TO_TEXT_END] such that the attribute applies to the
      entire text by default. *)

  (** {2:conversions Conversions} *)

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
