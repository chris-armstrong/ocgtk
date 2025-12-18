(* Signal handlers for InfoBar *)
class info_bar_signals (obj : Info_bar.t) = object
  (** Gets emitted when the user uses a keybinding to dismiss the info bar.

The ::close signal is a [keybinding signal](class.SignalAction.html).

The default binding for this signal is the Escape key. *)
  method on_close ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"close" ~callback ~after:false

end
