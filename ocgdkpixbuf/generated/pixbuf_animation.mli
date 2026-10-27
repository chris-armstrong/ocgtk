(** An opaque object representing an animation.

    The GdkPixBuf library provides a simple mechanism to load and represent
    animations. An animation is conceptually a series of frames to be displayed
    over time.

    The animation may not be represented as a series of frames internally; for
    example, it may be stored as a sprite and instructions for moving the sprite
    around a background.

    To display an animation you don't need to understand its representation,
    however; you just ask [GdkPixbuf] what should be displayed at a given point
    in time.

    Its methods, signals and properties are on {!class-type-pixbuf_animation_t}.
    The functions it is built on are in {!Ocgdkpixbuf.Raw.Pixbuf_animation}. *)

(** The methods, signals and properties of a [GdkPixbufAnimation]. *)
class type pixbuf_animation_t = object
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

  method as_pixbuf_animation : Raw.Pixbuf_animation.t
end

class pixbuf_animation : Raw.Pixbuf_animation.t -> pixbuf_animation_t
(** Wraps a layer 1 handle, {!Ocgdkpixbuf.Raw.Pixbuf_animation.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GdkPixbufAnimation], give one already wrapped. *)

val new_from_file : string -> (pixbuf_animation_t, GError.t) result
val new_from_resource : string -> (pixbuf_animation_t, GError.t) result

val new_from_stream :
  Ocgio.Input_stream.input_stream_t ->
  Ocgio.Cancellable.cancellable_t option ->
  (pixbuf_animation_t, GError.t) result

val new_from_stream_finish :
  Ocgio.Async_result.async_result_t -> (pixbuf_animation_t, GError.t) result
