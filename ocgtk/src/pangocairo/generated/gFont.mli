class font : Font.t ->
  object
    method get_scaled_font : unit -> Ocgtk_cairo.Cairo.scaled_font option
    method as_font : Font.t
  end

