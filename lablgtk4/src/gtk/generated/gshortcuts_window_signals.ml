(* Signal handlers for ShortcutsWindow *)
class shortcuts_window_signals (obj : Shortcuts_window.t) = object
  (** Emitted when the user uses a keybinding to close the window.

This is a [keybinding signal](class.SignalAction.html).

The default binding for this signal is the Escape key. *)
  method on_close ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"close" ~callback ~after:false

  (** Emitted when the user uses a keybinding to start a search.

This is a [keybinding signal](class.SignalAction.html).

The default binding for this signal is Control-F. *)
  method on_search ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"search" ~callback ~after:false

end
