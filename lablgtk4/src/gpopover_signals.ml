(* Signal handlers for Popover *)
class popover_signals (obj : Popover.t) = object
  method activate_default ~callback =
    Gobject.Signal.connect_simple (Popover.as_widget obj :> [`widget] Gobject.obj) ~name:"activate-default" ~callback ~after:false

  method closed ~callback =
    Gobject.Signal.connect_simple (Popover.as_widget obj :> [`widget] Gobject.obj) ~name:"closed" ~callback ~after:false

end
