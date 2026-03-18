(* High-level class for Font *)
class font (obj : Font.t) = object (self)

  method get_scaled_font : unit -> Ocgtk_cairo.Cairo.scaled_font option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_cairo.Cairo.scaled_font ret) (Font.get_scaled_font obj)

    method as_font = obj
end

