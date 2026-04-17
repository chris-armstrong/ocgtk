(* Signal handlers for PixbufLoader *)
class pixbuf_loader_signals (obj : Pixbuf_loader.t) = object
  (** This signal is emitted when the pixbuf loader has allocated the
pixbuf in the desired size.

After this signal is emitted, applications can call
gdk_pixbuf_loader_get_pixbuf() to fetch the partially-loaded
pixbuf. *)
  method on_area_prepared ~callback =
    Gobject.Signal.connect_simple obj ~name:"area-prepared" ~callback ~after:false

  (** This signal is emitted when gdk_pixbuf_loader_close() is called.

It can be used by different parts of an application to receive
notification when an image loader is closed by the code that
drives it. *)
  method on_closed ~callback =
    Gobject.Signal.connect_simple obj ~name:"closed" ~callback ~after:false

end
