(* Signal handlers for Popover *)
class popover_signals (obj : Popover.t) =
  object
    method on_activate_default ~callback =
      Gobject.Signal.connect_simple obj ~name:"activate-default" ~callback
        ~after:false
    (** Emitted whend the user activates the default widget.

        This is a [keybinding signal](class.SignalAction.html). *)

    method on_closed ~callback =
      Gobject.Signal.connect_simple obj ~name:"closed" ~callback ~after:false
    (** Emitted when the popover is closed. *)
  end
