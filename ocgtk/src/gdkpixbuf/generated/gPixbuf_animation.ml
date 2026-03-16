(* High-level class for PixbufAnimation *)
class pixbuf_animation (obj : Pixbuf_animation.t) = object (self)

  method get_height : unit -> int =
    fun () ->
      (Pixbuf_animation.get_height obj)

  method get_static_image : unit -> GPixbuf.pixbuf =
    fun () ->
      new  GPixbuf.pixbuf(Pixbuf_animation.get_static_image obj)

  method get_width : unit -> int =
    fun () ->
      (Pixbuf_animation.get_width obj)

  method is_static_image : unit -> bool =
    fun () ->
      (Pixbuf_animation.is_static_image obj)

    method as_pixbuf_animation = obj
end

