(** The [PangoAttrFontFeatures] structure is used to represent OpenType font
    features as an attribute.

    Its methods, signals and properties are on
    {!class-type-attr_font_features_t}. The functions it is built on are in
    {!Ocpango.Raw.Attr_font_features}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AttrFontFeatures].}

    The [PangoAttrFontFeatures] structure is used to represent OpenType font
    features as an attribute. *)
class type attr_font_features_t = object
  (** {2:conversions Conversions} *)

  method as_attr_font_features : Raw.Attr_font_features.t
end

class attr_font_features : Raw.Attr_font_features.t -> attr_font_features_t
(** Wraps a raw handle of {!Ocpango.Raw.Attr_font_features.t}. *)
