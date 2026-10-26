class type font_options_t = object
  method as_font_options : Font_options.t
end

class font_options : Font_options.t -> font_options_t
