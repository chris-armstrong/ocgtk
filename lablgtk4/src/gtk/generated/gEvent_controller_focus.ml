(* Signal class defined in gevent_controller_focus_signals.ml *)

(* High-level class for EventControllerFocus *)
class event_controller_focus (obj : Event_controller_focus.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Event_controller_focus.as_event_controller obj)
  inherit Gevent_controller_focus_signals.event_controller_focus_signals obj

  method contains_focus = Event_controller_focus.get_contains_focus obj

  method is_focus = Event_controller_focus.get_is_focus obj

  method as_event_controller = (Event_controller_focus.as_event_controller obj)
    method as_event_controller_focus = obj
end

