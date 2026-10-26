class type dnd_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_drop : unit -> Drop.drop_t option
  method as_dnd_event : Raw.Dnd_event.t
end

class dnd_event : Raw.Dnd_event.t -> dnd_event_t
