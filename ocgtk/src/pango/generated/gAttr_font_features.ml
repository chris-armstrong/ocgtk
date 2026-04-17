class type attr_font_features_t = object
    method as_attr_font_features : Attr_font_features.t
end

(* High-level class for AttrFontFeatures *)
class attr_font_features (obj : Attr_font_features.t) : attr_font_features_t = object (self)

    method as_attr_font_features = obj
end

