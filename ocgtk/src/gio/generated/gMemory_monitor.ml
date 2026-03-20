(* Signal class defined in gmemory_monitor_signals.ml *)

class type memory_monitor_t = object
    inherit Gmemory_monitor_signals.memory_monitor_signals
    method as_memory_monitor : Memory_monitor.t
end

(* High-level class for MemoryMonitor *)
class memory_monitor (obj : Memory_monitor.t) : memory_monitor_t = object (self)
  inherit Gmemory_monitor_signals.memory_monitor_signals obj

    method as_memory_monitor = obj
end

