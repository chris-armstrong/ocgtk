(* Signal class defined in gunix_mount_monitor_signals.ml *)

(* High-level class for UnixMountMonitor *)
class unix_mount_monitor (obj : Unix_mount_monitor.t) = object (self)
  inherit Gunix_mount_monitor_signals.unix_mount_monitor_signals obj

  method set_rate_limit : int -> unit =
    fun limit_msec ->
      (Unix_mount_monitor.set_rate_limit obj limit_msec)

    method as_unix_mount_monitor = obj
end

