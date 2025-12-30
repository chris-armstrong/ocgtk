(* High-level class for PowerProfileMonitor *)
class power_profile_monitor (obj : Power_profile_monitor.t) = object (self)

  method get_power_saver_enabled : unit -> bool =
    fun () ->
      (Power_profile_monitor.get_power_saver_enabled obj)

    method as_power_profile_monitor = obj
end

