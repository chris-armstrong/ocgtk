(* Signal class defined in gpixbuf_loader_signals.ml *)

class type pixbuf_loader_t = object
    inherit Gpixbuf_loader_signals.pixbuf_loader_signals
    method close : unit -> (bool, GError.t) result
    method get_animation : unit -> GPixbuf_animation.pixbuf_animation_t option
    method get_format : unit -> Pixbuf_format.t option
    method get_pixbuf : unit -> GPixbuf.pixbuf_t option
    method set_size : int -> int -> unit
    method as_pixbuf_loader : Pixbuf_loader.t
end

(* High-level class for PixbufLoader *)
class pixbuf_loader (obj : Pixbuf_loader.t) : pixbuf_loader_t = object (self)
  inherit Gpixbuf_loader_signals.pixbuf_loader_signals obj

  method close : unit -> (bool, GError.t) result =
    fun () ->
      (Pixbuf_loader.close obj)

  method get_animation : unit -> GPixbuf_animation.pixbuf_animation_t option =
    fun () ->
      Option.map (fun ret -> new GPixbuf_animation.pixbuf_animation ret) (Pixbuf_loader.get_animation obj)

  method get_format : unit -> Pixbuf_format.t option =
    fun () ->
      (Pixbuf_loader.get_format obj)

  method get_pixbuf : unit -> GPixbuf.pixbuf_t option =
    fun () ->
      Option.map (fun ret -> new GPixbuf.pixbuf ret) (Pixbuf_loader.get_pixbuf obj)

  method set_size : int -> int -> unit =
    fun width height ->
      (Pixbuf_loader.set_size obj width height)

    method as_pixbuf_loader = obj
end

let new_ () : pixbuf_loader_t =
  new pixbuf_loader (Pixbuf_loader.new_ ())

let new_with_mime_type (mime_type : string) : (pixbuf_loader_t, GError.t) result =
  let obj_ = Pixbuf_loader.new_with_mime_type mime_type in
Result.map (fun obj_ ->  new pixbuf_loader obj_) obj_

let new_with_type (image_type : string) : (pixbuf_loader_t, GError.t) result =
  let obj_ = Pixbuf_loader.new_with_type image_type in
Result.map (fun obj_ ->  new pixbuf_loader obj_) obj_

