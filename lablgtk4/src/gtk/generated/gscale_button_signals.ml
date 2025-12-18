(* Signal handlers for ScaleButton *)
class scale_button_signals (obj : Scale_button.t) = object
  (** Emitted to dismiss the popup.

This is a [keybinding signal](class.SignalAction.html).

The default binding for this signal is <kbd>Escape</kbd>. *)
  method on_popdown ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"popdown" ~callback ~after:false

  (** Emitted to popup the scale widget.

This is a [keybinding signal](class.SignalAction.html).

The default bindings for this signal are <kbd>Space</kbd>,
<kbd>Enter</kbd> and <kbd>Return</kbd>. *)
  method on_popup ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"popup" ~callback ~after:false

end
