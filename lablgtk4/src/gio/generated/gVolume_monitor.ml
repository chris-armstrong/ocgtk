(* Signal class defined in gvolume_monitor_signals.ml *)

(* High-level class for VolumeMonitor *)
class volume_monitor (obj : Volume_monitor.t) = object (self)
  inherit Gvolume_monitor_signals.volume_monitor_signals obj

    method as_volume_monitor = obj
end

