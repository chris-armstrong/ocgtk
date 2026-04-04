class type pixbuf_non_anim_t = object
    inherit GPixbuf_animation.pixbuf_animation_t
    method as_pixbuf_non_anim : Pixbuf_non_anim.t
end

(* High-level class for PixbufNonAnim *)
class pixbuf_non_anim (obj : Pixbuf_non_anim.t) : pixbuf_non_anim_t = object (self)
  inherit GPixbuf_animation.pixbuf_animation (obj :> Pixbuf_animation.t)

    method as_pixbuf_non_anim = obj
end

let new_ (pixbuf : GPixbuf.pixbuf_t) : pixbuf_non_anim_t =
  let pixbuf = pixbuf#as_pixbuf in
  let obj_ = Pixbuf_non_anim.new_ pixbuf in
  new pixbuf_non_anim obj_

