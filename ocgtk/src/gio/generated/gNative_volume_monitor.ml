class type native_volume_monitor_t = object
    method as_native_volume_monitor : Native_volume_monitor.t
end

(* High-level class for NativeVolumeMonitor *)
class native_volume_monitor (obj : Native_volume_monitor.t) : native_volume_monitor_t = object (self)

    method as_native_volume_monitor = obj
end

