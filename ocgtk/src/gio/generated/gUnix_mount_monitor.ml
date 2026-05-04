class type unix_mount_monitor_t = object
  method on_mountpoints_changed :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_mounts_changed :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method set_rate_limit : int -> unit
  method as_unix_mount_monitor : Unix_mount_monitor.t
end

(* High-level class for UnixMountMonitor *)
class unix_mount_monitor (obj : Unix_mount_monitor.t) : unix_mount_monitor_t =
  object (self)
    method on_mountpoints_changed ~callback =
      Unix_mount_monitor.on_mountpoints_changed self#as_unix_mount_monitor
        ~callback

    method on_mounts_changed ~callback =
      Unix_mount_monitor.on_mounts_changed self#as_unix_mount_monitor ~callback

    method set_rate_limit : int -> unit =
      fun limit_msec -> Unix_mount_monitor.set_rate_limit obj limit_msec

    method as_unix_mount_monitor = obj
  end

let new_ () : unix_mount_monitor_t =
  new unix_mount_monitor (Unix_mount_monitor.new_ ())
