(* Signal handlers for Popover *)
class popover_signals (obj : Popover.t) = object
  method on_activate_default ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate-default" ~callback ~after:false

  method on_closed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"closed" ~callback ~after:false

end
