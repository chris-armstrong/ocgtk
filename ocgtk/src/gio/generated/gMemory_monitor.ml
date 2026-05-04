class type memory_monitor_t = object
  method on_low_memory_warning :
    callback:(level:Gio_enums.memorymonitorwarninglevel -> unit) ->
    Gobject.Signal.handler_id

  method as_memory_monitor : Memory_monitor.t
end

(* High-level class for MemoryMonitor *)
class memory_monitor (obj : Memory_monitor.t) : memory_monitor_t =
  object (self)
    method on_low_memory_warning ~callback =
      Memory_monitor.on_low_memory_warning self#as_memory_monitor ~callback

    method as_memory_monitor = obj
  end
