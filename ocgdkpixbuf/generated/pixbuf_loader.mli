(** Incremental image loader.

    Its methods, signals and properties are on {!class-type-pixbuf_loader_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgdkpixbuf.Raw.Pixbuf_loader}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PixbufLoader].}

    Incremental image loader.

    [GdkPixbufLoader] provides a way for applications to drive the process of
    loading an image, by letting them send the image data directly to the loader
    instead of having the loader read the data from a file. Applications can use
    this functionality instead of [gdk_pixbuf_new_from_file()] or
    [gdk_pixbuf_animation_new_from_file()] when they need to parse image data in
    small chunks. For example, it should be used when reading an image from a
    (potentially) slow network connection, or when loading an extremely large
    file.

    To use [GdkPixbufLoader] to load an image, create a new instance, and call
    [GdkPixbuf.PixbufLoader.write] to send the data to it. When done,
    [GdkPixbuf.PixbufLoader.close] should be called to end the stream and
    finalize everything.

    The loader will emit three important signals throughout the process:

    - [GdkPixbuf.PixbufLoader::size-prepared] will be emitted as soon as the
      image has enough information to determine the size of the image to be
      used. If you want to scale the image while loading it, you can call
      [GdkPixbuf.PixbufLoader.set_size] in response to this signal.
    - [GdkPixbuf.PixbufLoader::area-prepared] will be emitted as soon as the
      pixbuf of the desired has been allocated. You can obtain the [GdkPixbuf]
      instance by calling [GdkPixbuf.PixbufLoader.get_pixbuf]. If you want to
      use it, simply acquire a reference to it. You can also call
      [gdk_pixbuf_loader_get_pixbuf()] later to get the same pixbuf.
    - [GdkPixbuf.PixbufLoader::area-updated] will be emitted every time a region
      is updated. This way you can update a partially completed image. Note that
      you do not know anything about the completeness of an image from the
      updated area. For example, in an interlaced image you will need to make
      several passes before the image is done loading.

    {b Loading an animation}

    Loading an animation is almost as easy as loading an image. Once the first
    [GdkPixbuf.PixbufLoader::area-prepared] signal has been emitted, you can
    call [GdkPixbuf.PixbufLoader.get_animation] to get the
    [GdkPixbuf.PixbufAnimation] instance, and then call and
    [GdkPixbuf.PixbufAnimation.get_iter] to get a
    [GdkPixbuf.PixbufAnimationIter] to retrieve the pixbuf for the desired time
    stamp. *)
class type pixbuf_loader_t = object
  method on_area_prepared :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** This signal is emitted when the pixbuf loader has allocated the pixbuf in
      the desired size.

      After this signal is emitted, applications can call
      gdk_pixbuf_loader_get_pixbuf() to fetch the partially-loaded pixbuf. *)

  method on_area_updated :
    ?after:bool ->
    callback:(x:int -> y:int -> width:int -> height:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** This signal is emitted when a significant area of the image being loaded
      has been updated.

      Normally it means that a complete scanline has been read in, but it could
      be a different area as well.

      Applications can use this signal to know when to repaint areas of an image
      that is being loaded. *)

  method on_closed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** This signal is emitted when gdk_pixbuf_loader_close() is called.

      It can be used by different parts of an application to receive
      notification when an image loader is closed by the code that drives it. *)

  method on_size_prepared :
    ?after:bool ->
    callback:(width:int -> height:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** This signal is emitted when the pixbuf loader has been fed the initial
      amount of data that is required to figure out the size of the image that
      it will create.

      Applications can call gdk_pixbuf_loader_set_size() in response to this
      signal to set the desired size to which the image should be scaled. *)

  method close : unit -> (bool, GError.t) result
  (** Informs a pixbuf loader that no further writes with
      gdk_pixbuf_loader_write() will occur, so that it can free its internal
      loading structures.

      This function also tries to parse any data that hasn't yet been parsed; if
      the remaining data is partial or corrupt, an error will be returned.

      If [FALSE] is returned, [error] will be set to an error from the
      [GDK_PIXBUF_ERROR] or [G_FILE_ERROR] domains.

      If you're just cancelling a load rather than expecting it to be finished,
      passing [NULL] for [error] to ignore it is reasonable.

      Remember that this function does not release a reference on the loader, so
      you will need to explicitly release any reference you hold. *)

  method get_animation : unit -> Pixbuf_animation.pixbuf_animation_t option
  (** Queries the [GdkPixbufAnimation] that a pixbuf loader is currently
      creating.

      In general it only makes sense to call this function after the
      [GdkPixbuf.PixbufLoader::area-prepared] signal has been emitted by the
      loader.

      If the loader doesn't have enough bytes yet, and hasn't emitted the
      [area-prepared] signal, this function will return [NULL]. *)

  method get_format : unit -> Raw.Pixbuf_format.t option
  (** Obtains the available information about the format of the currently
      loading image file. *)

  method get_pixbuf : unit -> Pixbuf.pixbuf_t option
  [@@ocaml.doc
    "Queries the [GdkPixbuf] that a pixbuf loader is currently creating.\n\n\
     In general it only makes sense to call this function after the\n\
     [GdkPixbuf.PixbufLoader::area-prepared] signal has been\n\
     emitted by the loader; this means that enough data has been read\n\
     to know the size of the image that will be allocated.\n\n\
     If the loader has not received enough data via gdk_pixbuf_loader_write(),\n\
     then this function returns [NULL].\n\n\
     The returned pixbuf will be the same in all future calls to the loader,\n\
     so if you want to keep using it, you should acquire a reference to it.\n\n\
     Additionally, if the loader is an animation, it will return the \"static\n\
     image\" of the animation (see gdk_pixbuf_animation_get_static_image())."]

  method set_size : int -> int -> unit
  (** Causes the image to be scaled while it is loaded.

      The desired image size can be determined relative to the original size of
      the image by calling gdk_pixbuf_loader_set_size() from a signal handler
      for the ::size-prepared signal.

      Attempts to set the desired image size are ignored after the emission of
      the ::size-prepared signal. *)

  method write_bytes : Glib_bytes.t -> (bool, GError.t) result
  (** Parses the next contents of the given image buffer. *)

  method as_pixbuf_loader : Raw.Pixbuf_loader.t
end

class pixbuf_loader : Raw.Pixbuf_loader.t -> pixbuf_loader_t
(** Wraps a raw handle of {!Ocgdkpixbuf.Raw.Pixbuf_loader.t}. *)

(** {1:description Description}

    Incremental image loader.

    [GdkPixbufLoader] provides a way for applications to drive the process of
    loading an image, by letting them send the image data directly to the loader
    instead of having the loader read the data from a file. Applications can use
    this functionality instead of [gdk_pixbuf_new_from_file()] or
    [gdk_pixbuf_animation_new_from_file()] when they need to parse image data in
    small chunks. For example, it should be used when reading an image from a
    (potentially) slow network connection, or when loading an extremely large
    file.

    To use [GdkPixbufLoader] to load an image, create a new instance, and call
    [GdkPixbuf.PixbufLoader.write] to send the data to it. When done,
    [GdkPixbuf.PixbufLoader.close] should be called to end the stream and
    finalize everything.

    The loader will emit three important signals throughout the process:

    - [GdkPixbuf.PixbufLoader::size-prepared] will be emitted as soon as the
      image has enough information to determine the size of the image to be
      used. If you want to scale the image while loading it, you can call
      [GdkPixbuf.PixbufLoader.set_size] in response to this signal.
    - [GdkPixbuf.PixbufLoader::area-prepared] will be emitted as soon as the
      pixbuf of the desired has been allocated. You can obtain the [GdkPixbuf]
      instance by calling [GdkPixbuf.PixbufLoader.get_pixbuf]. If you want to
      use it, simply acquire a reference to it. You can also call
      [gdk_pixbuf_loader_get_pixbuf()] later to get the same pixbuf.
    - [GdkPixbuf.PixbufLoader::area-updated] will be emitted every time a region
      is updated. This way you can update a partially completed image. Note that
      you do not know anything about the completeness of an image from the
      updated area. For example, in an interlaced image you will need to make
      several passes before the image is done loading.

    {b Loading an animation}

    Loading an animation is almost as easy as loading an image. Once the first
    [GdkPixbuf.PixbufLoader::area-prepared] signal has been emitted, you can
    call [GdkPixbuf.PixbufLoader.get_animation] to get the
    [GdkPixbuf.PixbufAnimation] instance, and then call and
    [GdkPixbuf.PixbufAnimation.get_iter] to get a
    [GdkPixbuf.PixbufAnimationIter] to retrieve the pixbuf for the desired time
    stamp. *)

(** {1:constructors Constructors} *)

val new_ : unit -> pixbuf_loader_t
(** Creates a new pixbuf loader object. *)

val new_with_mime_type : string -> (pixbuf_loader_t, GError.t) result
[@@ocaml.doc
  "Creates a new pixbuf loader object that always attempts to parse\n\
   image data as if it were an image of MIME type [mime_type], instead of\n\
   identifying the type automatically.\n\n\
   This function is useful if you want an error if the image isn't the\n\
   expected MIME type; for loading image formats that can't be reliably\n\
   identified by looking at the data; or if the user manually forces a\n\
   specific MIME type.\n\n\
   The list of supported mime types depends on what image loaders\n\
   are installed, but typically \"image/png\", \"image/jpeg\", \"image/gif\",\n\
   \"image/tiff\" and \"image/x-xpixmap\" are among the supported mime types.\n\
   To obtain the full list of supported mime types, call\n\
   gdk_pixbuf_format_get_mime_types() on each of the [GdkPixbufFormat]\n\
   structs returned by gdk_pixbuf_get_formats()."]

val new_with_type : string -> (pixbuf_loader_t, GError.t) result
[@@ocaml.doc
  "Creates a new pixbuf loader object that always attempts to parse\n\
   image data as if it were an image of type [image_type], instead of\n\
   identifying the type automatically.\n\n\
   This function is useful if you want an error if the image isn't the\n\
   expected type; for loading image formats that can't be reliably\n\
   identified by looking at the data; or if the user manually forces\n\
   a specific type.\n\n\
   The list of supported image formats depends on what image loaders\n\
   are installed, but typically \"png\", \"jpeg\", \"gif\", \"tiff\" and\n\
   \"xpm\" are among the supported formats. To obtain the full list of\n\
   supported image formats, call gdk_pixbuf_format_get_name() on each\n\
   of the [GdkPixbufFormat] structs returned by gdk_pixbuf_get_formats()."]
