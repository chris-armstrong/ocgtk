class type pixbuf_non_anim_t = object
    inherit GPixbuf_animation.pixbuf_animation_t
    method as_pixbuf_non_anim : Pixbuf_non_anim.t
end

class pixbuf_non_anim : Pixbuf_non_anim.t -> pixbuf_non_anim_t

val new_ : GPixbuf.pixbuf_t -> pixbuf_non_anim_t
