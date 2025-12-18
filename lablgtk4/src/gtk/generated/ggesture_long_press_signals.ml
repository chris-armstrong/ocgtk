(* Signal handlers for GestureLongPress *)
class gesture_long_press_signals (obj : Gesture_long_press.t) = object
  method on_cancelled ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"cancelled" ~callback ~after:false

  method on_pressed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"pressed" ~callback ~after:false

end
