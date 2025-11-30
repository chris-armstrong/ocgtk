(* Signal handlers for GestureStylus *)
class gesture_stylus_signals (obj : Gesture_stylus.t) = object
  method down ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"down" ~callback ~after:false

  method motion ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"motion" ~callback ~after:false

  method proximity ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"proximity" ~callback ~after:false

  method up ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"up" ~callback ~after:false

end
