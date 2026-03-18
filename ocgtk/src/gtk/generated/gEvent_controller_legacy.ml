(* Signal class defined in gevent_controller_legacy_signals.ml *)

(* High-level class for EventControllerLegacy *)
class event_controller_legacy (obj : Event_controller_legacy.t) = object (self)
  inherit Gevent_controller_legacy_signals.event_controller_legacy_signals obj

    method as_event_controller_legacy = obj
end

