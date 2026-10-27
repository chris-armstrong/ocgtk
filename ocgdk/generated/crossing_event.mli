class type crossing_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_detail : unit -> Enums.notifytype
  method get_focus : unit -> bool
  method get_mode : unit -> Enums.crossingmode
  method as_crossing_event : Raw.Crossing_event.t
end

class crossing_event : Raw.Crossing_event.t -> crossing_event_t
