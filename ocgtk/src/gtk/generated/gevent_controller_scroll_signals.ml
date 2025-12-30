(* Signal handlers for EventControllerScroll *)
class event_controller_scroll_signals (obj : Event_controller_scroll.t) = object
  (** Signals that a new scrolling operation has begun.

It will only be emitted on devices capable of it. *)
  method on_scroll_begin ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"scroll-begin" ~callback ~after:false

  (** Signals that a scrolling operation has finished.

It will only be emitted on devices capable of it. *)
  method on_scroll_end ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"scroll-end" ~callback ~after:false

end
