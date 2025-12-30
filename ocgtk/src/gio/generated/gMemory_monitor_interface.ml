(* High-level class for MemoryMonitorInterface *)
class memory_monitor_interface (obj : Memory_monitor_interface.t) = object (self)

    method as_memory_monitor_interface = obj
end

