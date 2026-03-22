class type unix_mount_monitor_t = object
    inherit Gunix_mount_monitor_signals.unix_mount_monitor_signals
    method set_rate_limit : int -> unit
    method as_unix_mount_monitor : Unix_mount_monitor.t
end

class unix_mount_monitor : Unix_mount_monitor.t -> unix_mount_monitor_t

val new_ : unit -> unix_mount_monitor_t
