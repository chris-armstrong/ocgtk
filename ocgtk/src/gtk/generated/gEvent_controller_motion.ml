(* Signal class defined in gevent_controller_motion_signals.ml *)

(* High-level class for EventControllerMotion *)
class event_controller_motion (obj : Event_controller_motion.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Event_controller_motion.as_event_controller obj)
  inherit Gevent_controller_motion_signals.event_controller_motion_signals obj

  method contains_pointer : unit -> bool =
    fun () ->
      (Event_controller_motion.contains_pointer obj)

  method is_pointer : unit -> bool =
    fun () ->
      (Event_controller_motion.is_pointer obj)

  method as_event_controller = (Event_controller_motion.as_event_controller obj)
    method as_event_controller_motion = obj
end

