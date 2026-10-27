class type native_volume_monitor_t = object
  inherit Volume_monitor.volume_monitor_t
  method as_native_volume_monitor : Raw.Native_volume_monitor.t
end

(* High-level class for NativeVolumeMonitor *)
class native_volume_monitor (obj : Raw.Native_volume_monitor.t) :
  native_volume_monitor_t =
  object (self)
    inherit Volume_monitor.volume_monitor (obj :> Raw.Volume_monitor.t)
    method as_native_volume_monitor = obj
  end
