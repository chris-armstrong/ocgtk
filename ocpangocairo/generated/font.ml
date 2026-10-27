class type font_t = object
  method get_scaled_font : unit -> Occairo.Scaled_font.scaled_font_t option
  (** Gets the [cairo_scaled_font_t] used by [font]. The scaled font can be
      referenced and kept using cairo_scaled_font_reference(). *)

  method as_font : Raw.Font.t
end

(* High-level class for Font *)
class font (obj : Raw.Font.t) : font_t =
  object (self)
    method get_scaled_font : unit -> Occairo.Scaled_font.scaled_font_t option =
      fun () ->
        Option.map
          (fun ret -> new Occairo.Scaled_font.scaled_font ret)
          (Raw.Font.get_scaled_font obj)

    method as_font = obj
  end
