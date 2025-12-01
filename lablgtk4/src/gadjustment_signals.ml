(* Signal handlers for Adjustment *)
class adjustment_signals (obj : Adjustment.t) = object
  method changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

  method value_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"value-changed" ~callback ~after:false

end
