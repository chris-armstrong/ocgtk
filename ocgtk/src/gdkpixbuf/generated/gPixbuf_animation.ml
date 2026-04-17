class type pixbuf_animation_t = object
    method get_height : unit -> int
    method get_static_image : unit -> GPixbuf.pixbuf_t
    method get_width : unit -> int
    method is_static_image : unit -> bool
    method as_pixbuf_animation : Pixbuf_animation.t
end

(* High-level class for PixbufAnimation *)
class pixbuf_animation (obj : Pixbuf_animation.t) : pixbuf_animation_t = object (self)

  method get_height : unit -> int =
    fun () ->
      (Pixbuf_animation.get_height obj)

  method get_static_image : unit -> GPixbuf.pixbuf_t =
    fun () ->
      new  GPixbuf.pixbuf(Pixbuf_animation.get_static_image obj)

  method get_width : unit -> int =
    fun () ->
      (Pixbuf_animation.get_width obj)

  method is_static_image : unit -> bool =
    fun () ->
      (Pixbuf_animation.is_static_image obj)

    method as_pixbuf_animation = obj
end

let new_from_file (filename : string) : (pixbuf_animation_t, GError.t) result =
  let obj_ = Pixbuf_animation.new_from_file filename in
Result.map (fun obj_ ->  new pixbuf_animation obj_) obj_

let new_from_resource (resource_path : string) : (pixbuf_animation_t, GError.t) result =
  let obj_ = Pixbuf_animation.new_from_resource resource_path in
Result.map (fun obj_ ->  new pixbuf_animation obj_) obj_

let new_from_stream (stream : Ocgtk_gio.Gio.Input_stream.input_stream_t) (cancellable : Ocgtk_gio.Gio.Cancellable.cancellable_t option) : (pixbuf_animation_t, GError.t) result =
  let stream = stream#as_input_stream in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ = Pixbuf_animation.new_from_stream stream cancellable in
Result.map (fun obj_ ->  new pixbuf_animation obj_) obj_

let new_from_stream_finish (async_result : Ocgtk_gio.Gio.Async_result.async_result_t) : (pixbuf_animation_t, GError.t) result =
  let async_result = async_result#as_async_result in
  let obj_ = Pixbuf_animation.new_from_stream_finish async_result in
Result.map (fun obj_ ->  new pixbuf_animation obj_) obj_

