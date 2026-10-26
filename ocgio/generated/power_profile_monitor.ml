class type power_profile_monitor_t = object
  method get_power_saver_enabled : unit -> bool
  method as_power_profile_monitor : Raw.Power_profile_monitor.t
end

(* High-level class for PowerProfileMonitor *)
class power_profile_monitor (obj : Raw.Power_profile_monitor.t) :
  power_profile_monitor_t =
  object (self)
    method get_power_saver_enabled : unit -> bool =
      fun () -> Raw.Power_profile_monitor.get_power_saver_enabled obj

    method as_power_profile_monitor = obj
  end
