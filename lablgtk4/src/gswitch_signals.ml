(* Signal handlers for Switch *)
class switch_signals (obj : Switch.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Switch.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  method state_set ~callback =
    Gobject.Signal.connect_simple (Switch.as_widget obj :> [`widget] Gobject.obj) ~name:"state-set" ~callback ~after:false

end
