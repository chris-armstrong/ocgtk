class type dnd_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method get_drop : unit -> GDrop.drop_t option
  method as_dnd_event : Dnd_event.t
end

class dnd_event : Dnd_event.t -> dnd_event_t
