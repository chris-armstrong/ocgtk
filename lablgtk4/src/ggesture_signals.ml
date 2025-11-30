(* Signal handlers for Gesture *)
class gesture_signals (obj : Gesture.t) = object
  method begin_ ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"begin" ~callback ~after:false

  method cancel ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"cancel" ~callback ~after:false

  method end_ ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"end" ~callback ~after:false

  method sequence_state_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"sequence-state-changed" ~callback ~after:false

  method update ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"update" ~callback ~after:false

end
