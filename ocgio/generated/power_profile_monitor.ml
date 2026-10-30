class type power_profile_monitor_t = object
  (** {2:methods Methods} *)

  method get_power_saver_enabled : unit -> bool
  (** Gets whether the system is in “Power Saver” mode.

      You are expected to listen to the
      [GPowerProfileMonitor::notify]::power-saver-enabled signal to know when
      the profile has changed. *)

  (** {2:conversions Conversions} *)

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
