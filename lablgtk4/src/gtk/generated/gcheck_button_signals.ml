(* Signal handlers for CheckButton *)
class check_button_signals (obj : Check_button.t) = object
  (** Emitted to when the check button is activated.

The `::activate` signal on `GtkCheckButton` is an action signal and
emitting it causes the button to animate press then release.

Applications should never connect to this signal, but use the
[signal@Gtk.CheckButton::toggled] signal.

The default bindings for this signal are all forms of the
<kbd>␣</kbd> and <kbd>Enter</kbd> keys. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  (** Emitted when the buttons's [property@Gtk.CheckButton:active]
property changes. *)
  method on_toggled ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"toggled" ~callback ~after:false

end
