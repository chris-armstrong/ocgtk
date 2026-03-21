(* Signal class defined in gevent_controller_legacy_signals.ml *)

class type event_controller_legacy_t = object
    inherit Gevent_controller_legacy_signals.event_controller_legacy_signals
    method as_event_controller_legacy : Event_controller_legacy.t
end

(* High-level class for EventControllerLegacy *)
class event_controller_legacy (obj : Event_controller_legacy.t) : event_controller_legacy_t = object (self)
  inherit Gevent_controller_legacy_signals.event_controller_legacy_signals obj

    method as_event_controller_legacy = obj
end

