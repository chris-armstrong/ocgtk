class type pixbuf_simple_anim_t = object
    inherit GPixbuf_animation.pixbuf_animation_t
    method add_frame : GPixbuf.pixbuf_t -> unit
    method get_loop : unit -> bool
    method set_loop : bool -> unit
    method as_pixbuf_simple_anim : Pixbuf_simple_anim.t
end

class pixbuf_simple_anim : Pixbuf_simple_anim.t -> pixbuf_simple_anim_t

val new_ : int -> int -> float -> pixbuf_simple_anim_t
