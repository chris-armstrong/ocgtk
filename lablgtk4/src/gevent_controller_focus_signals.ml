(* Signal handlers for EventControllerFocus *)
class event_controller_focus_signals (obj : Event_controller_focus.t) = object
  method enter ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"enter" ~callback ~after:false

  method leave ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"leave" ~callback ~after:false

end
