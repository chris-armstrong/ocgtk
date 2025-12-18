(* Signal handlers for SpinButton *)
class spin_button_signals (obj : Spin_button.t) = object
  (** Emitted when the spin button is activated.

The keybindings for this signal are all forms of the <kbd>Enter</kbd> key.

If the <kbd>Enter</kbd> key results in the value being committed to the
spin button, then activation does not occur until <kbd>Enter</kbd> is
pressed again. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  (** Emitted when the value is changed.

Also see the [signal@Gtk.SpinButton::output] signal. *)
  method on_value_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"value-changed" ~callback ~after:false

  (** Emitted right after the spinbutton wraps from its maximum
to its minimum value or vice-versa. *)
  method on_wrapped ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"wrapped" ~callback ~after:false

end
