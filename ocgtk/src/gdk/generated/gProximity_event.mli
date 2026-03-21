class type proximity_event_t = object
    method as_proximity_event : Proximity_event.t
end

class proximity_event : Proximity_event.t -> proximity_event_t

