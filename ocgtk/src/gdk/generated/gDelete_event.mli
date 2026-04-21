class type delete_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method as_delete_event : Delete_event.t
end

class delete_event : Delete_event.t -> delete_event_t
