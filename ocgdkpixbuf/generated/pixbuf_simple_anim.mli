class type pixbuf_simple_anim_t = object
  inherit Pixbuf_animation.pixbuf_animation_t
  method add_frame : Pixbuf.pixbuf_t -> unit
  method get_loop : unit -> bool
  method set_loop : bool -> unit
  method as_pixbuf_simple_anim : Raw.Pixbuf_simple_anim.t
end

class pixbuf_simple_anim : Raw.Pixbuf_simple_anim.t -> pixbuf_simple_anim_t

val new_ : int -> int -> float -> pixbuf_simple_anim_t
