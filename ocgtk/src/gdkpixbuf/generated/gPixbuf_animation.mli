class type pixbuf_animation_t = object
    method get_height : unit -> int
    method get_static_image : unit -> GPixbuf.pixbuf_t
    method get_width : unit -> int
    method is_static_image : unit -> bool
    method as_pixbuf_animation : Pixbuf_animation.t
end

class pixbuf_animation : Pixbuf_animation.t -> pixbuf_animation_t

