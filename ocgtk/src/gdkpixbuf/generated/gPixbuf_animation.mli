class pixbuf_animation : Pixbuf_animation.t ->
  object
    method get_height : unit -> int
    method get_static_image : unit -> GPixbuf.pixbuf
    method get_width : unit -> int
    method is_static_image : unit -> bool
    method as_pixbuf_animation : Pixbuf_animation.t
  end

