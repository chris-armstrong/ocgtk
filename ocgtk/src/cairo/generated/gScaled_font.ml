class type scaled_font_t = object
    method as_scaled_font : Scaled_font.t
end

(* High-level class for ScaledFont *)
class scaled_font (obj : Scaled_font.t) : scaled_font_t = object (self)

    method as_scaled_font = obj
end

