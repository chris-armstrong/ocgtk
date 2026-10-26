class type pixbuf_simple_anim_t = object
  inherit Pixbuf_animation.pixbuf_animation_t
  method add_frame : Pixbuf.pixbuf_t -> unit
  method get_loop : unit -> bool
  method set_loop : bool -> unit
  method as_pixbuf_simple_anim : Raw.Pixbuf_simple_anim.t
end

(* High-level class for PixbufSimpleAnim *)
class pixbuf_simple_anim (obj : Raw.Pixbuf_simple_anim.t) : pixbuf_simple_anim_t
  =
  object (self)
    inherit Pixbuf_animation.pixbuf_animation (obj :> Raw.Pixbuf_animation.t)

    method add_frame : Pixbuf.pixbuf_t -> unit =
      fun pixbuf ->
        let pixbuf = pixbuf#as_pixbuf in
        Raw.Pixbuf_simple_anim.add_frame obj pixbuf

    method get_loop : unit -> bool =
      fun () -> Raw.Pixbuf_simple_anim.get_loop obj

    method set_loop : bool -> unit =
      fun loop -> Raw.Pixbuf_simple_anim.set_loop obj loop

    method as_pixbuf_simple_anim = obj
  end

let new_ (width : int) (height : int) (rate : float) : pixbuf_simple_anim_t =
  let obj_ = Raw.Pixbuf_simple_anim.new_ width height rate in
  new pixbuf_simple_anim obj_
