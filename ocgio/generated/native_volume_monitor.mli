class type native_volume_monitor_t = object
  inherit Volume_monitor.volume_monitor_t
  method as_native_volume_monitor : Raw.Native_volume_monitor.t
end

class native_volume_monitor :
  Raw.Native_volume_monitor.t ->
  native_volume_monitor_t
