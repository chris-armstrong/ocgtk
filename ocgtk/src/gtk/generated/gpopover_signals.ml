(* Signal handlers for Popover *)
class popover_signals (obj : Popover.t) = object
  (** Emitted whend the user activates the default widget.

This is a [keybinding signal](class.SignalAction.html). *)
  method on_activate_default ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate-default" ~callback ~after:false

  (** Emitted when the popover is closed. *)
  method on_closed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"closed" ~callback ~after:false

end
