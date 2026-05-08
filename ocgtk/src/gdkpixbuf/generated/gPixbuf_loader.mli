class type pixbuf_loader_t = object
  method on_area_prepared : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_area_updated :
    callback:(x:int -> y:int -> width:int -> height:int -> unit) ->
    Gobject.Signal.handler_id

  method on_closed : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_size_prepared :
    callback:(width:int -> height:int -> unit) -> Gobject.Signal.handler_id

  method close : unit -> (bool, GError.t) result
  method get_animation : unit -> GPixbuf_animation.pixbuf_animation_t option
  method get_format : unit -> Pixbuf_format.t option
  method get_pixbuf : unit -> GPixbuf.pixbuf_t option
  method set_size : int -> int -> unit
  method write_bytes : Glib_bytes.t -> (bool, GError.t) result
  method as_pixbuf_loader : Pixbuf_loader.t
end

class pixbuf_loader : Pixbuf_loader.t -> pixbuf_loader_t

val new_ : unit -> pixbuf_loader_t
val new_with_mime_type : string -> (pixbuf_loader_t, GError.t) result
val new_with_type : string -> (pixbuf_loader_t, GError.t) result
