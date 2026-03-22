class type native_volume_monitor_t = object
    inherit GVolume_monitor.volume_monitor_t
    method as_native_volume_monitor : Native_volume_monitor.t
end

(* High-level class for NativeVolumeMonitor *)
class native_volume_monitor (obj : Native_volume_monitor.t) : native_volume_monitor_t = object (self)
  inherit GVolume_monitor.volume_monitor (Obj.magic obj : Volume_monitor.t)

    method as_native_volume_monitor = obj
end

