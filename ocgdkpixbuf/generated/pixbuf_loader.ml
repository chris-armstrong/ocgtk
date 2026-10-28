class type pixbuf_loader_t = object
  (** {2:signals Signals} *)

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

  (** {2:methods Methods} *)

  method close : unit -> (bool, GError.t) result
  (** Informs a pixbuf loader that no further writes with
      gdk_pixbuf_loader_write() will occur, so that it can free its internal
      loading structures.

      This function also tries to parse any data that hasn't yet been parsed; if
      the remaining data is partial or corrupt, an error will be returned.

      If [false] is returned, [error] will be set to an error from the
      [GDK_PIXBUF_ERROR] or [G_FILE_ERROR] domains.

      If you're just cancelling a load rather than expecting it to be finished,
      passing [None] for [error] to ignore it is reasonable.

      Remember that this function does not release a reference on the loader, so
      you will need to explicitly release any reference you hold. *)

  method get_animation : unit -> Pixbuf_animation.pixbuf_animation_t option
  (** Queries the [GdkPixbufAnimation] that a pixbuf loader is currently
      creating.

      In general it only makes sense to call this function after the
      [GdkPixbuf.PixbufLoader::area-prepared] signal has been emitted by the
      loader.

      If the loader doesn't have enough bytes yet, and hasn't emitted the
      [area-prepared] signal, this function will return [None]. *)

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
     then this function returns [None].\n\n\
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

  (** {2:conversions Conversions} *)

  method as_pixbuf_loader : Raw.Pixbuf_loader.t
end

(* High-level class for PixbufLoader *)
class pixbuf_loader (obj : Raw.Pixbuf_loader.t) : pixbuf_loader_t =
  object (self)
    method on_area_prepared ?(after = false) ~callback () =
      Raw.Pixbuf_loader.on_area_prepared ~after self#as_pixbuf_loader ~callback

    method on_area_updated ?(after = false) ~callback () =
      Raw.Pixbuf_loader.on_area_updated ~after self#as_pixbuf_loader ~callback

    method on_closed ?(after = false) ~callback () =
      Raw.Pixbuf_loader.on_closed ~after self#as_pixbuf_loader ~callback

    method on_size_prepared ?(after = false) ~callback () =
      Raw.Pixbuf_loader.on_size_prepared ~after self#as_pixbuf_loader ~callback

    method close : unit -> (bool, GError.t) result =
      fun () -> Raw.Pixbuf_loader.close obj

    method get_animation : unit -> Pixbuf_animation.pixbuf_animation_t option =
      fun () ->
        Option.map
          (fun ret -> new Pixbuf_animation.pixbuf_animation ret)
          (Raw.Pixbuf_loader.get_animation obj)

    method get_format : unit -> Raw.Pixbuf_format.t option =
      fun () -> Raw.Pixbuf_loader.get_format obj

    method get_pixbuf : unit -> Pixbuf.pixbuf_t option =
      fun () ->
        Option.map
          (fun ret -> new Pixbuf.pixbuf ret)
          (Raw.Pixbuf_loader.get_pixbuf obj)

    method set_size : int -> int -> unit =
      fun width height -> Raw.Pixbuf_loader.set_size obj width height

    method write_bytes : Glib_bytes.t -> (bool, GError.t) result =
      fun buffer -> Raw.Pixbuf_loader.write_bytes obj buffer

    method as_pixbuf_loader = obj
  end

let new_ () : pixbuf_loader_t = new pixbuf_loader (Raw.Pixbuf_loader.new_ ())

let new_with_mime_type (mime_type : string) : (pixbuf_loader_t, GError.t) result
    =
  let obj_ = Raw.Pixbuf_loader.new_with_mime_type mime_type in
  Result.map (fun obj_ -> new pixbuf_loader obj_) obj_

let new_with_type (image_type : string) : (pixbuf_loader_t, GError.t) result =
  let obj_ = Raw.Pixbuf_loader.new_with_type image_type in
  Result.map (fun obj_ -> new pixbuf_loader obj_) obj_
