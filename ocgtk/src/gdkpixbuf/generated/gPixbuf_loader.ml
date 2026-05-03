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

(* High-level class for PixbufLoader *)
class pixbuf_loader (obj : Pixbuf_loader.t) : pixbuf_loader_t =
  object (self)
    method on_area_prepared ~callback =
      Pixbuf_loader.on_area_prepared self#as_pixbuf_loader ~callback

    method on_area_updated ~callback =
      Pixbuf_loader.on_area_updated self#as_pixbuf_loader ~callback

    method on_closed ~callback =
      Pixbuf_loader.on_closed self#as_pixbuf_loader ~callback

    method on_size_prepared ~callback =
      Pixbuf_loader.on_size_prepared self#as_pixbuf_loader ~callback

    method close : unit -> (bool, GError.t) result =
      fun () -> Pixbuf_loader.close obj

    method get_animation : unit -> GPixbuf_animation.pixbuf_animation_t option =
      fun () ->
        Option.map
          (fun ret -> new GPixbuf_animation.pixbuf_animation ret)
          (Pixbuf_loader.get_animation obj)

    method get_format : unit -> Pixbuf_format.t option =
      fun () -> Pixbuf_loader.get_format obj

    method get_pixbuf : unit -> GPixbuf.pixbuf_t option =
      fun () ->
        Option.map
          (fun ret -> new GPixbuf.pixbuf ret)
          (Pixbuf_loader.get_pixbuf obj)

    method set_size : int -> int -> unit =
      fun width height -> Pixbuf_loader.set_size obj width height

    method write_bytes : Glib_bytes.t -> (bool, GError.t) result =
      fun buffer -> Pixbuf_loader.write_bytes obj buffer

    method as_pixbuf_loader = obj
  end

let new_ () : pixbuf_loader_t = new pixbuf_loader (Pixbuf_loader.new_ ())

let new_with_mime_type (mime_type : string) : (pixbuf_loader_t, GError.t) result
    =
  let obj_ = Pixbuf_loader.new_with_mime_type mime_type in
  Result.map (fun obj_ -> new pixbuf_loader obj_) obj_

let new_with_type (image_type : string) : (pixbuf_loader_t, GError.t) result =
  let obj_ = Pixbuf_loader.new_with_type image_type in
  Result.map (fun obj_ -> new pixbuf_loader obj_) obj_
