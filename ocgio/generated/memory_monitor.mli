class type memory_monitor_t = object
  method on_low_memory_warning :
    ?after:bool ->
    callback:(level:Enums.memorymonitorwarninglevel -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method as_memory_monitor : Raw.Memory_monitor.t
end

class memory_monitor : Raw.Memory_monitor.t -> memory_monitor_t
