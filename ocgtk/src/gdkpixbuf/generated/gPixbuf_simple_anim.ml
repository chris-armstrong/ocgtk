(* High-level class for PixbufSimpleAnim *)
class pixbuf_simple_anim (obj : Pixbuf_simple_anim.t) = object (self)

  method add_frame : 'p1. (#GPixbuf.pixbuf as 'p1) -> unit =
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

