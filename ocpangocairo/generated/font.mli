class type font_t = object
  method get_scaled_font :
    unit -> Ocgtk_cairo.Cairo.Scaled_font.scaled_font_t option

  method as_font : Font.t
end

class font : Font.t -> font_t
