(** The [PangoAttribute] structure represents the common portions of all
    attributes.

    Its methods, signals and properties are on {!class-type-attribute_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocpango.Raw.Attribute}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Attribute].}

    The [PangoAttribute] structure represents the common portions of all
    attributes.

    Particular types of attributes include this structure as their initial
    portion. The common portion of the attribute holds the range to which the
    value in the type-specific part of the attribute applies and should be
    initialized using [Pango.Attribute.init]. By default, an attribute will have
    an all-inclusive range of \[0,[G_MAXUINT]\]. *)
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

class attribute : Raw.Attribute.t -> attribute_t
(** Wraps a raw handle of {!Ocpango.Raw.Attribute.t}. *)

(** {1:description Description}

    The [PangoAttribute] structure represents the common portions of all
    attributes.

    Particular types of attributes include this structure as their initial
    portion. The common portion of the attribute holds the range to which the
    value in the type-specific part of the attribute applies and should be
    initialized using [Pango.Attribute.init]. By default, an attribute will have
    an all-inclusive range of \[0,[G_MAXUINT]\]. *)
