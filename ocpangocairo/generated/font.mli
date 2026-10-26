class type font_t = object
  method get_scaled_font : unit -> Occairo.Scaled_font.scaled_font_t option
  method as_font : Raw.Font.t
end

class font : Raw.Font.t -> font_t
