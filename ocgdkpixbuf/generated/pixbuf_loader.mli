(** Incremental image loader.

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
    stamp.

    Its methods, signals and properties are on {!class-type-pixbuf_loader_t}.
    The functions it is built on are in {!Ocgdkpixbuf.Raw.Pixbuf_loader}. *)

(** The methods, signals and properties of a [GdkPixbufLoader]. *)
class type pixbuf_loader_t = object
  method on_area_prepared :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_area_updated :
    ?after:bool ->
    callback:(x:int -> y:int -> width:int -> height:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_closed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_size_prepared :
    ?after:bool ->
    callback:(width:int -> height:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method close : unit -> (bool, GError.t) result
  method get_animation : unit -> Pixbuf_animation.pixbuf_animation_t option
  method get_format : unit -> Raw.Pixbuf_format.t option
  method get_pixbuf : unit -> Pixbuf.pixbuf_t option
  method set_size : int -> int -> unit
  method write_bytes : Glib_bytes.t -> (bool, GError.t) result
  method as_pixbuf_loader : Raw.Pixbuf_loader.t
end

class pixbuf_loader : Raw.Pixbuf_loader.t -> pixbuf_loader_t
(** Wraps a layer 1 handle, {!Ocgdkpixbuf.Raw.Pixbuf_loader.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GdkPixbufLoader], give one already wrapped. *)

val new_ : unit -> pixbuf_loader_t
val new_with_mime_type : string -> (pixbuf_loader_t, GError.t) result
val new_with_type : string -> (pixbuf_loader_t, GError.t) result
