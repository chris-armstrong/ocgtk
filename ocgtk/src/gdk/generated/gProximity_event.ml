class type proximity_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method as_proximity_event : Proximity_event.t
end

(* High-level class for ProximityEvent *)
class proximity_event (obj : Proximity_event.t) : proximity_event_t =
  object (self)
    inherit
      GApp_launch_context_cycle_de440b34.event
        (obj :> App_launch_context_cycle_de440b34.Event.t)

    method as_proximity_event = obj
  end
