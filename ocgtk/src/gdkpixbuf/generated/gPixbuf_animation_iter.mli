class type pixbuf_animation_iter_t = object
  method get_delay_time : unit -> int
  method get_pixbuf : unit -> GPixbuf.pixbuf_t
  method on_currently_loading_frame : unit -> bool
  method as_pixbuf_animation_iter : Pixbuf_animation_iter.t
end

class pixbuf_animation_iter : Pixbuf_animation_iter.t -> pixbuf_animation_iter_t
