class pixbuf_loader : Pixbuf_loader.t ->
  object
    inherit Gpixbuf_loader_signals.pixbuf_loader_signals
    method close : unit -> (bool, GError.t) result
    method get_animation : unit -> GPixbuf_animation.pixbuf_animation option
    method get_format : unit -> Pixbuf_format.t option
    method get_pixbuf : unit -> GPixbuf.pixbuf option
    method set_size : int -> int -> unit
    method as_pixbuf_loader : Pixbuf_loader.t
  end

