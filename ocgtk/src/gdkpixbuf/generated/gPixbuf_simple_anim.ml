class type pixbuf_simple_anim_t = object
    inherit GPixbuf_animation.pixbuf_animation_t
    method add_frame : GPixbuf.pixbuf_t -> unit
    method get_loop : unit -> bool
    method set_loop : bool -> unit
    method as_pixbuf_simple_anim : Pixbuf_simple_anim.t
end

(* High-level class for PixbufSimpleAnim *)
class pixbuf_simple_anim (obj : Pixbuf_simple_anim.t) : pixbuf_simple_anim_t = object (self)
  inherit GPixbuf_animation.pixbuf_animation (obj :> Pixbuf_animation.t)

  method add_frame : GPixbuf.pixbuf_t -> unit =
    fun pixbuf ->
      let pixbuf = pixbuf#as_pixbuf in
      (Pixbuf_simple_anim.add_frame obj pixbuf)

  method get_loop : unit -> bool =
    fun () ->
      (Pixbuf_simple_anim.get_loop obj)

  method set_loop : bool -> unit =
    fun loop ->
      (Pixbuf_simple_anim.set_loop obj loop)

    method as_pixbuf_simple_anim = obj
end

let new_ (width : int) (height : int) (rate : float) : pixbuf_simple_anim_t =
  let obj_ = Pixbuf_simple_anim.new_ width height rate in
  new pixbuf_simple_anim obj_

