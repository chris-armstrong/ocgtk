(* Signal class defined in gmemory_monitor_signals.ml *)

(* High-level class for MemoryMonitor *)
class memory_monitor (obj : Memory_monitor.t) = object (self)
  inherit Gmemory_monitor_signals.memory_monitor_signals obj

    method as_memory_monitor = obj
end

