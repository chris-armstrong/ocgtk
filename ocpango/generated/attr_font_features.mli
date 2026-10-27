(** The [PangoAttrFontFeatures] structure is used to represent OpenType font
    features as an attribute.

    Its methods, signals and properties are on
    {!class-type-attr_font_features_t}. The functions it is built on are in
    {!Ocpango.Raw.Attr_font_features}. *)

(** The methods, signals and properties of a [PangoAttrFontFeatures]. *)
class type attr_font_features_t = object
  method as_attr_font_features : Raw.Attr_font_features.t
end

class attr_font_features : Raw.Attr_font_features.t -> attr_font_features_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Attr_font_features.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [PangoAttrFontFeatures], give one already wrapped. *)
