(* Signal handlers for GLArea *)
class gl_area_signals (obj : Gl_area.t) = object
  (** Emitted when the widget is being realized.

This allows you to override how the GL context is created.
This is useful when you want to reuse an existing GL context,
or if you want to try creating different kinds of GL options.

If context creation fails then the signal handler can use
[method@Gtk.GLArea.set_error] to register a more detailed error
of how the construction failed. *)
  method on_create_context ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"create-context" ~callback ~after:false

end
