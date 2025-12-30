(* Signal handlers for Window *)
class window_signals (obj : Application_and__window_and__window_group.Window.t) = object
  (** Emitted when the user activates the default widget
of @window.

This is a [keybinding signal](class.SignalAction.html). *)
  method on_activate_default ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate-default" ~callback ~after:false

  (** Emitted when the user activates the currently focused
widget of @window.

This is a [keybinding signal](class.SignalAction.html). *)
  method on_activate_focus ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate-focus" ~callback ~after:false

  (** emitted when the set of accelerators or mnemonics that
are associated with @window changes. *)
  method on_keys_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"keys-changed" ~callback ~after:false

end
