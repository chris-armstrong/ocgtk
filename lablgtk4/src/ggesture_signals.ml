(* Signal handlers for Gesture *)
class gesture_signals (obj : Gesture.t) = object
  method on_begin_ ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"begin" ~callback ~after:false

  method on_cancel ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"cancel" ~callback ~after:false

  method on_end_ ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"end" ~callback ~after:false

  method on_sequence_state_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"sequence-state-changed" ~callback ~after:false

  method on_update ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"update" ~callback ~after:false

end
