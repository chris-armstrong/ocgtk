(* Signal handlers for GesturePan *)
class gesture_pan_signals (obj : Gesture_pan.t) = object
  method pan ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"pan" ~callback ~after:false

end
