(* Signal class defined in gevent_controller_focus_signals.ml *)

class type event_controller_focus_t = object
    inherit Gevent_controller_focus_signals.event_controller_focus_signals
    method contains_focus : unit -> bool
    method is_focus : unit -> bool
    method as_event_controller_focus : Event_controller_focus.t
end

(* High-level class for EventControllerFocus *)
class event_controller_focus (obj : Event_controller_focus.t) : event_controller_focus_t = object (self)
  inherit Gevent_controller_focus_signals.event_controller_focus_signals obj

  method contains_focus : unit -> bool =
    fun () ->
      (Event_controller_focus.contains_focus obj)

  method is_focus : unit -> bool =
    fun () ->
      (Event_controller_focus.is_focus obj)

    method as_event_controller_focus = obj
end

