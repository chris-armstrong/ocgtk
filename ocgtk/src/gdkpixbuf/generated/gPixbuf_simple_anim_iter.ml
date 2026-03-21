class type pixbuf_simple_anim_iter_t = object
    method as_pixbuf_simple_anim_iter : Pixbuf_simple_anim_iter.t
end

(* High-level class for PixbufSimpleAnimIter *)
class pixbuf_simple_anim_iter (obj : Pixbuf_simple_anim_iter.t) : pixbuf_simple_anim_iter_t = object (self)

    method as_pixbuf_simple_anim_iter = obj
end

