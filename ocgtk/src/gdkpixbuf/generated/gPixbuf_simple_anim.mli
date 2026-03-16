class pixbuf_simple_anim : Pixbuf_simple_anim.t ->
  object
    method add_frame : #GPixbuf.pixbuf -> unit
    method get_loop : unit -> bool
    method set_loop : bool -> unit
    method as_pixbuf_simple_anim : Pixbuf_simple_anim.t
  end

