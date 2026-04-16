class type scaled_font_t = object
  method as_scaled_font : Scaled_font.t
end

class scaled_font : Scaled_font.t -> scaled_font_t
