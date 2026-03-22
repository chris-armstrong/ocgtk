class type pixbuf_simple_anim_iter_t = object
    inherit GPixbuf_animation_iter.pixbuf_animation_iter_t
    method as_pixbuf_simple_anim_iter : Pixbuf_simple_anim_iter.t
end

class pixbuf_simple_anim_iter : Pixbuf_simple_anim_iter.t -> pixbuf_simple_anim_iter_t

