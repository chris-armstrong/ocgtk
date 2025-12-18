(* Signal class defined in gevent_controller_legacy_signals.ml *)

(* High-level class for EventControllerLegacy *)
class event_controller_legacy (obj : Event_controller_legacy.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Event_controller_legacy.as_event_controller obj)
  inherit Gevent_controller_legacy_signals.event_controller_legacy_signals obj

  method as_event_controller = (Event_controller_legacy.as_event_controller obj)
    method as_event_controller_legacy = obj
end

