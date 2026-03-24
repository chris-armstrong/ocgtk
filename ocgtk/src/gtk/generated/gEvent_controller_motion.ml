(* Signal class defined in gevent_controller_motion_signals.ml *)

class type event_controller_motion_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    inherit Gevent_controller_motion_signals.event_controller_motion_signals
    method contains_pointer : unit -> bool
    method is_pointer : unit -> bool
    method as_event_controller_motion : Event_controller_motion.t
end

(* High-level class for EventControllerMotion *)
class event_controller_motion (obj : Event_controller_motion.t) : event_controller_motion_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t)
  inherit Gevent_controller_motion_signals.event_controller_motion_signals obj

  method contains_pointer : unit -> bool =
    fun () ->
      (Event_controller_motion.contains_pointer obj)

  method is_pointer : unit -> bool =
    fun () ->
      (Event_controller_motion.is_pointer obj)

    method as_event_controller_motion = obj
end

let new_ () : event_controller_motion_t =
  new event_controller_motion (Event_controller_motion.new_ ())

