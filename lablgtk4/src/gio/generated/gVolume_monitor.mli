class volume_monitor : Volume_monitor.t ->
  object
    inherit Gvolume_monitor_signals.volume_monitor_signals
    method as_volume_monitor : Volume_monitor.t
  end

