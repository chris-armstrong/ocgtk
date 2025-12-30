(* Signal handlers for FlowBoxChild *)
class flow_box_child_signals (obj : Flow_box_child.t) = object
  (** Emitted when the user activates a child widget in a `GtkFlowBox`.

This can happen either by clicking or double-clicking,
or via a keybinding.

This is a [keybinding signal](class.SignalAction.html),
but it can be used by applications for their own purposes.

The default bindings are <kbd>Space</kbd> and <kbd>Enter</kbd>. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
