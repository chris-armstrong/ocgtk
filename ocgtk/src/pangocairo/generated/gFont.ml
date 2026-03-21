class type font_t = object
    method get_scaled_font : unit -> Ocgtk_cairo.Cairo.scaled_font_t option
    method as_font : Font.t
end

(* High-level class for Font *)
class font (obj : Font.t) : font_t = object (self)

  method get_scaled_font : unit -> Ocgtk_cairo.Cairo.scaled_font_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_cairo.Cairo.scaled_font ret) (Font.get_scaled_font obj)

    method as_font = obj
end

