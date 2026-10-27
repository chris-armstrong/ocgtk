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
  method get_static_image : unit -> Pixbuf.pixbuf_t
  method get_width : unit -> int
  method is_static_image : unit -> bool
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
