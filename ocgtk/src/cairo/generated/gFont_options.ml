class type font_options_t = object
  method as_font_options : Font_options.t
end

(* High-level class for FontOptions *)
class font_options (obj : Font_options.t) : font_options_t =
  object (self)
    method as_font_options = obj
  end
