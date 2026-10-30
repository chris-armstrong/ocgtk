class type attr_font_features_t = object
  (** {2:conversions Conversions} *)

  method as_attr_font_features : Raw.Attr_font_features.t
end

(* High-level class for AttrFontFeatures *)
class attr_font_features (obj : Raw.Attr_font_features.t) : attr_font_features_t
  =
  object (self)
    method as_attr_font_features = obj
  end
