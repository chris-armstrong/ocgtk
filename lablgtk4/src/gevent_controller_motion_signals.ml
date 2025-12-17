(* Signal handlers for EventControllerMotion *)
class event_controller_motion_signals (obj : Event_controller_motion.t) = object
  method on_enter ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"enter" ~callback ~after:false

  method on_leave ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"leave" ~callback ~after:false

  method on_motion ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"motion" ~callback ~after:false

end
