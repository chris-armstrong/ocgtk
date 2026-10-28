class type pixbuf_animation_t = object
  (** {2:methods Methods} *)

  method get_height : unit -> int
  (** Queries the height of the bounding box of a pixbuf animation. *)

  method get_static_image : unit -> Pixbuf.pixbuf_t
  (** Retrieves a static image for the animation.

      If an animation is really just a plain image (has only one frame), this
      function returns that image.

      If the animation is an animation, this function returns a reasonable image
      to use as a static unanimated image, which might be the first frame, or
      something more sophisticated depending on the file format.

      If an animation hasn't loaded any frames yet, this function will return
      [NULL]. *)

  method get_width : unit -> int
  (** Queries the width of the bounding box of a pixbuf animation. *)

  method is_static_image : unit -> bool
  (** Checks whether the animation is a static image.

      If you load a file with gdk_pixbuf_animation_new_from_file() and it turns
      out to be a plain, unanimated image, then this function will return
      [TRUE]. Use gdk_pixbuf_animation_get_static_image() to retrieve the image.
  *)

  (** {2:conversions Conversions} *)

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
