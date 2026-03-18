(* Signal class defined in gevent_controller_motion_signals.ml *)

(* High-level class for EventControllerMotion *)
class event_controller_motion (obj : Event_controller_motion.t) = object (self)
  inherit Gevent_controller_motion_signals.event_controller_motion_signals obj

  method contains_pointer : unit -> bool =
    fun () ->
      (Event_controller_motion.contains_pointer obj)

  method is_pointer : unit -> bool =
    fun () ->
      (Event_controller_motion.is_pointer obj)

    method as_event_controller_motion = obj
end

