class type crossing_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method get_detail : unit -> Gdk_enums.notifytype
  method get_focus : unit -> bool
  method get_mode : unit -> Gdk_enums.crossingmode
  method as_crossing_event : Crossing_event.t
end

class crossing_event : Crossing_event.t -> crossing_event_t
