class type memory_monitor_t = object
  method on_low_memory_warning :
    callback:(level:Gio_enums.memorymonitorwarninglevel -> unit) ->
    Gobject.Signal.handler_id

  method as_memory_monitor : Memory_monitor.t
end

class memory_monitor : Memory_monitor.t -> memory_monitor_t
