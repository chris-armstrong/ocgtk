class type proximity_event_t = object
    method as_proximity_event : Proximity_event.t
end

(* High-level class for ProximityEvent *)
class proximity_event (obj : Proximity_event.t) : proximity_event_t = object (self)

    method as_proximity_event = obj
end

