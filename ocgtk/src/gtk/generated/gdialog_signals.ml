(* Signal handlers for Dialog *)
class dialog_signals (obj : Dialog.t) = object
  (** Emitted when the user uses a keybinding to close the dialog.

This is a [keybinding signal](class.SignalAction.html).

The default binding for this signal is the Escape key. *)
  method on_close ~callback =
    Gobject.Signal.connect_simple obj ~name:"close" ~callback ~after:false

end
