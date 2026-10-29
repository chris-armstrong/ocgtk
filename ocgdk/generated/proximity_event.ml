class type proximity_event_t = object
  inherit Event.event_t

  (** {2:conversions Conversions} *)

  method as_proximity_event : Raw.Proximity_event.t
end

(* High-level class for ProximityEvent *)
class proximity_event (obj : Raw.Proximity_event.t) : proximity_event_t =
  object (self)
    inherit Event.event (obj :> Raw.Event.t)
    method as_proximity_event = obj
  end
