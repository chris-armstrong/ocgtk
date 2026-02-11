(* Signal class defined in gpixbuf_loader_signals.ml *)

(* High-level class for PixbufLoader *)
class pixbuf_loader (obj : Pixbuf_loader.t) = object (self)
  inherit Gpixbuf_loader_signals.pixbuf_loader_signals obj

  method close : unit -> (bool, GError.t) result =
    fun () ->
      (Pixbuf_loader.close obj)

  method get_animation : unit -> GPixbuf_animation.pixbuf_animation option =
    fun () ->
      Option.map (fun ret -> new GPixbuf_animation.pixbuf_animation ret) (Pixbuf_loader.get_animation obj)

  method get_format : unit -> Pixbuf_format.t option =
    fun () ->
      (Pixbuf_loader.get_format obj)

  method get_pixbuf : unit -> GPixbuf.pixbuf option =
    fun () ->
      Option.map (fun ret -> new GPixbuf.pixbuf ret) (Pixbuf_loader.get_pixbuf obj)

  method set_size : int -> int -> unit =
    fun width height ->
      (Pixbuf_loader.set_size obj width height)

    method as_pixbuf_loader = obj
end

