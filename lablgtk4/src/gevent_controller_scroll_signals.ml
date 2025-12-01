(* Signal handlers for EventControllerScroll *)
class event_controller_scroll_signals (obj : Event_controller_scroll.t) = object
  method decelerate ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"decelerate" ~callback ~after:false

  method scroll ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"scroll" ~callback ~after:false

  method scroll_begin ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"scroll-begin" ~callback ~after:false

  method scroll_end ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"scroll-end" ~callback ~after:false

end
