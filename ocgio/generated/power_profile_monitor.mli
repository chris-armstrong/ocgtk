(** [GPowerProfileMonitor] makes it possible for applications as well as OS
    components to monitor system power profiles and act upon them. It currently
    only exports whether the system is in “Power Saver” mode (known as “Low
    Power” mode on some systems).

    When in “Low Power” mode, it is recommended that applications:

    - disable automatic downloads;
    - reduce the rate of refresh from online sources such as calendar or email
      synchronisation;
    - reduce the use of expensive visual effects.

    It is also likely that OS components providing services to applications will
    lower their own background activity, for the sake of the system.

    There are a variety of tools that exist for power consumption analysis, but
    those usually depend on the OS and hardware used. On Linux, one could use
    [upower] to monitor the battery discharge rate, [powertop] to check on the
    background activity or activity at all), [sysprof] to inspect CPU usage, and
    [intel_gpu_time] to profile GPU usage.

    Don’t forget to disconnect the [GObject.Object::notify] signal for
    [Gio.PowerProfileMonitor:power-saver-enabled], and unref the
    [GPowerProfileMonitor] itself when exiting.

    Its methods, signals and properties are on
    {!class-type-power_profile_monitor_t}. The functions it is built on are in
    {!Ocgio.Raw.Power_profile_monitor}. *)

(** The methods, signals and properties of a [PowerProfileMonitor]. *)
class type power_profile_monitor_t = object
  method get_power_saver_enabled : unit -> bool
  (** Gets whether the system is in “Power Saver” mode.

      You are expected to listen to the
      [GPowerProfileMonitor::notify]::power-saver-enabled signal to know when
      the profile has changed. *)

  method as_power_profile_monitor : Raw.Power_profile_monitor.t
end

class power_profile_monitor :
  Raw.Power_profile_monitor.t ->
  power_profile_monitor_t
(** Wraps a raw handle of {!Ocgio.Raw.Power_profile_monitor.t}. *)
