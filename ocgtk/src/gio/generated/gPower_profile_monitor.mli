class power_profile_monitor : Power_profile_monitor.t ->
  object
    method get_power_saver_enabled : unit -> bool
    method as_power_profile_monitor : Power_profile_monitor.t
  end

