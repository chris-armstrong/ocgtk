(** The [PangoAttribute] structure represents the common portions of all
    attributes.

    Particular types of attributes include this structure as their initial
    portion. The common portion of the attribute holds the range to which the
    value in the type-specific part of the attribute applies and should be
    initialized using [Pango.Attribute.init]. By default, an attribute will have
    an all-inclusive range of \[0,[G_MAXUINT]\].

    Its methods, signals and properties are on {!class-type-attribute_t}. The
    functions it is built on are in {!Ocpango.Raw.Attribute}. *)

(** The methods, signals and properties of a [PangoAttribute]. *)
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
(** Wraps a layer 1 handle, {!Ocpango.Raw.Attribute.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoAttribute], give one already wrapped. *)
