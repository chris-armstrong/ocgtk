(** An opaque object representing an animation.

    Its methods, signals and properties are on {!class-type-pixbuf_animation_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgdkpixbuf.Raw.Pixbuf_animation}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PixbufAnimation].}

    An opaque object representing an animation.

    The GdkPixBuf library provides a simple mechanism to load and represent
    animations. An animation is conceptually a series of frames to be displayed
    over time.

    The animation may not be represented as a series of frames internally; for
    example, it may be stored as a sprite and instructions for moving the sprite
    around a background.

    To display an animation you don't need to understand its representation,
    however; you just ask [GdkPixbuf] what should be displayed at a given point
    in time. *)
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
(** Wraps a raw handle of {!Ocgdkpixbuf.Raw.Pixbuf_animation.t}. *)

(** {1:description Description}

    An opaque object representing an animation.

    The GdkPixBuf library provides a simple mechanism to load and represent
    animations. An animation is conceptually a series of frames to be displayed
    over time.

    The animation may not be represented as a series of frames internally; for
    example, it may be stored as a sprite and instructions for moving the sprite
    around a background.

    To display an animation you don't need to understand its representation,
    however; you just ask [GdkPixbuf] what should be displayed at a given point
    in time. *)

(** {1:constructors Constructors} *)

val new_from_file : string -> (pixbuf_animation_t, GError.t) result
(** Creates a new animation by loading it from a file.

    The file format is detected automatically.

    If the file's format does not support multi-frame images, then an animation
    with a single frame will be created.

    Possible errors are in the [GDK_PIXBUF_ERROR] and [G_FILE_ERROR] domains. *)

val new_from_resource : string -> (pixbuf_animation_t, GError.t) result
(** Creates a new pixbuf animation by loading an image from an resource.

    The file format is detected automatically. If [NULL] is returned, then
    [error] will be set. *)

val new_from_stream :
  Ocgio.Input_stream.input_stream_t ->
  Ocgio.Cancellable.cancellable_t option ->
  (pixbuf_animation_t, GError.t) result
(** Creates a new animation by loading it from an input stream.

    The file format is detected automatically.

    If [NULL] is returned, then [error] will be set.

    The [cancellable] can be used to abort the operation from another thread. If
    the operation was cancelled, the error [G_IO_ERROR_CANCELLED] will be
    returned. Other possible errors are in the [GDK_PIXBUF_ERROR] and
    [G_IO_ERROR] domains.

    The stream is not closed. *)

val new_from_stream_finish :
  Ocgio.Async_result.async_result_t -> (pixbuf_animation_t, GError.t) result
(** Finishes an asynchronous pixbuf animation creation operation started with
    [GdkPixbuf.PixbufAnimation.new_from_stream_async]. *)
