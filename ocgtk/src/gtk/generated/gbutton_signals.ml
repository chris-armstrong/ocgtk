(* Signal handlers for Button *)
class button_signals (obj : Button.t) = object
  (** Emitted to animate press then release.

This is an action signal. Applications should never connect
to this signal, but use the [signal@Gtk.Button::clicked] signal.

The default bindings for this signal are all forms of the
<kbd>␣</kbd> and <kbd>Enter</kbd> keys. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  (** Emitted when the button has been activated (pressed and released). *)
  method on_clicked ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"clicked" ~callback ~after:false

end
