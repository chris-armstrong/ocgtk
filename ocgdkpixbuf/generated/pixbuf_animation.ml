class type pixbuf_animation_t = object
  method get_height : unit -> int
  method get_static_image : unit -> Pixbuf.pixbuf_t
  method get_width : unit -> int
  method is_static_image : unit -> bool
  method as_pixbuf_animation : Raw.Pixbuf_animation.t
end

(* High-level class for PixbufAnimation *)
class pixbuf_animation (obj : Raw.Pixbuf_animation.t) : pixbuf_animation_t =
  object (self)
    method get_height : unit -> int =
      fun () -> Raw.Pixbuf_animation.get_height obj

    method get_static_image : unit -> Pixbuf.pixbuf_t =
      fun () -> new Pixbuf.pixbuf (Raw.Pixbuf_animation.get_static_image obj)

    method get_width : unit -> int =
      fun () -> Raw.Pixbuf_animation.get_width obj

    method is_static_image : unit -> bool =
      fun () -> Raw.Pixbuf_animation.is_static_image obj

    method as_pixbuf_animation = obj
  end

let new_from_file (filename : string) : (pixbuf_animation_t, GError.t) result =
  let obj_ = Raw.Pixbuf_animation.new_from_file filename in
  Result.map (fun obj_ -> new pixbuf_animation obj_) obj_

let new_from_resource (resource_path : string) :
    (pixbuf_animation_t, GError.t) result =
  let obj_ = Raw.Pixbuf_animation.new_from_resource resource_path in
  Result.map (fun obj_ -> new pixbuf_animation obj_) obj_

let new_from_stream (stream : Ocgio.Input_stream.input_stream_t)
    (cancellable : Ocgio.Cancellable.cancellable_t option) :
    (pixbuf_animation_t, GError.t) result =
  let stream = stream#as_input_stream in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ = Raw.Pixbuf_animation.new_from_stream stream cancellable in
  Result.map (fun obj_ -> new pixbuf_animation obj_) obj_

let new_from_stream_finish (async_result : Ocgio.Async_result.async_result_t) :
    (pixbuf_animation_t, GError.t) result =
  let async_result = async_result#as_async_result in
  let obj_ = Raw.Pixbuf_animation.new_from_stream_finish async_result in
  Result.map (fun obj_ -> new pixbuf_animation obj_) obj_
