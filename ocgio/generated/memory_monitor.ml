class type memory_monitor_t = object
  method on_low_memory_warning :
    ?after:bool ->
    callback:(level:Enums.memorymonitorwarninglevel -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method as_memory_monitor : Raw.Memory_monitor.t
end

(* High-level class for MemoryMonitor *)
class memory_monitor (obj : Raw.Memory_monitor.t) : memory_monitor_t =
  object (self)
    method on_low_memory_warning ?(after = false) ~callback () =
      Raw.Memory_monitor.on_low_memory_warning ~after self#as_memory_monitor
        ~callback

    method as_memory_monitor = obj
  end
