class type unix_mount_monitor_t = object
  method on_mountpoints_changed :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_mounts_changed :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method set_rate_limit : int -> unit
  method as_unix_mount_monitor : Unix_mount_monitor.t
end

class unix_mount_monitor : Unix_mount_monitor.t -> unix_mount_monitor_t

val new_ : unit -> unix_mount_monitor_t
