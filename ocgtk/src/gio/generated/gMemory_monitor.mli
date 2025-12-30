class memory_monitor : Memory_monitor.t ->
  object
    inherit Gmemory_monitor_signals.memory_monitor_signals
    method as_memory_monitor : Memory_monitor.t
  end

