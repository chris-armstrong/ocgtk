class type focus_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method get_in : unit -> bool
  method as_focus_event : Focus_event.t
end

class focus_event : Focus_event.t -> focus_event_t
