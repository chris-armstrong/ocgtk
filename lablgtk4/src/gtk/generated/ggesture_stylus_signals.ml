(* Signal handlers for GestureStylus *)
class gesture_stylus_signals (obj : Gesture_stylus.t) = object
  method on_down ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"down" ~callback ~after:false

  method on_motion ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"motion" ~callback ~after:false

  method on_proximity ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"proximity" ~callback ~after:false

  method on_up ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"up" ~callback ~after:false

end
