class type pixbuf_animation_iter_t = object
  method get_delay_time : unit -> int
  method get_pixbuf : unit -> Pixbuf.pixbuf_t
  method on_currently_loading_frame : unit -> bool
  method as_pixbuf_animation_iter : Raw.Pixbuf_animation_iter.t
end

(* High-level class for PixbufAnimationIter *)
class pixbuf_animation_iter (obj : Raw.Pixbuf_animation_iter.t) :
  pixbuf_animation_iter_t =
  object (self)
    method get_delay_time : unit -> int =
      fun () -> Raw.Pixbuf_animation_iter.get_delay_time obj

    method get_pixbuf : unit -> Pixbuf.pixbuf_t =
      fun () -> new Pixbuf.pixbuf (Raw.Pixbuf_animation_iter.get_pixbuf obj)

    method on_currently_loading_frame : unit -> bool =
      fun () -> Raw.Pixbuf_animation_iter.on_currently_loading_frame obj

    method as_pixbuf_animation_iter = obj
  end
