(* Signal class defined in gunix_mount_monitor_signals.ml *)

class type unix_mount_monitor_t = object
    inherit Gunix_mount_monitor_signals.unix_mount_monitor_signals
    method set_rate_limit : int -> unit
    method as_unix_mount_monitor : Unix_mount_monitor.t
end

(* High-level class for UnixMountMonitor *)
class unix_mount_monitor (obj : Unix_mount_monitor.t) : unix_mount_monitor_t = object (self)
  inherit Gunix_mount_monitor_signals.unix_mount_monitor_signals obj

  method set_rate_limit : int -> unit =
    fun limit_msec ->
      (Unix_mount_monitor.set_rate_limit obj limit_msec)

    method as_unix_mount_monitor = obj
end

