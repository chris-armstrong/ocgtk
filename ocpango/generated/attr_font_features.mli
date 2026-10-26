class type attr_font_features_t = object
  method as_attr_font_features : Raw.Attr_font_features.t
end

class attr_font_features : Raw.Attr_font_features.t -> attr_font_features_t
