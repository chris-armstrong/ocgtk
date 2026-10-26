class type pixbuf_animation_iter_t = object
  method get_delay_time : unit -> int
  method get_pixbuf : unit -> Pixbuf.pixbuf_t
  method on_currently_loading_frame : unit -> bool
  method as_pixbuf_animation_iter : Raw.Pixbuf_animation_iter.t
end

class pixbuf_animation_iter :
  Raw.Pixbuf_animation_iter.t ->
  pixbuf_animation_iter_t
