(* GENERATED CODE - DO NOT EDIT *)
(* PixbufAnimation: PixbufAnimation *)

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

    The class built on this module is in {!Ocgdkpixbuf.Pixbuf_animation}. *)

type t = [ `pixbuf_animation | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gdk_pixbuf_pixbuf_animation_get_type"

external new_from_file : string -> (t, GError.t) result
  = "ml_gdk_pixbuf_animation_new_from_file"
(** Creates a new animation by loading it from a file.

    The file format is detected automatically.

    If the file's format does not support multi-frame images, then an animation
    with a single frame will be created.

    Possible errors are in the [GDK_PIXBUF_ERROR] and [G_FILE_ERROR] domains. *)

external new_from_resource : string -> (t, GError.t) result
  = "ml_gdk_pixbuf_animation_new_from_resource"
(** Creates a new pixbuf animation by loading an image from an resource.

    The file format is detected automatically. If [None] is returned, then
    [error] will be set. *)

external new_from_stream :
  Ocgio_raw.Input_stream.t ->
  Ocgio_raw.Cancellable.t option ->
  (t, GError.t) result = "ml_gdk_pixbuf_animation_new_from_stream"
(** Creates a new animation by loading it from an input stream.

    The file format is detected automatically.

    If [None] is returned, then [error] will be set.

    The [cancellable] can be used to abort the operation from another thread. If
    the operation was cancelled, the error [G_IO_ERROR_CANCELLED] will be
    returned. Other possible errors are in the [GDK_PIXBUF_ERROR] and
    [G_IO_ERROR] domains.

    The stream is not closed. *)

external new_from_stream_finish :
  Ocgio_raw.Async_result.t -> (t, GError.t) result
  = "ml_gdk_pixbuf_animation_new_from_stream_finish"
(** Finishes an asynchronous pixbuf animation creation operation started with
    [GdkPixbuf.PixbufAnimation.new_from_stream_async]. *)

(* Methods *)

external is_static_image : t -> bool = "ml_gdk_pixbuf_animation_is_static_image"
(** Checks whether the animation is a static image.

    If you load a file with gdk_pixbuf_animation_new_from_file() and it turns
    out to be a plain, unanimated image, then this function will return [true].
    Use gdk_pixbuf_animation_get_static_image() to retrieve the image. *)

external get_width : t -> int = "ml_gdk_pixbuf_animation_get_width"
(** Queries the width of the bounding box of a pixbuf animation. *)

external get_static_image : t -> Pixbuf.t
  = "ml_gdk_pixbuf_animation_get_static_image"
(** Retrieves a static image for the animation.

    If an animation is really just a plain image (has only one frame), this
    function returns that image.

    If the animation is an animation, this function returns a reasonable image
    to use as a static unanimated image, which might be the first frame, or
    something more sophisticated depending on the file format.

    If an animation hasn't loaded any frames yet, this function will return
    [None]. *)

external get_height : t -> int = "ml_gdk_pixbuf_animation_get_height"
(** Queries the height of the bounding box of a pixbuf animation. *)
