(* Signal handlers for UnixMountMonitor *)
class unix_mount_monitor_signals (obj : Unix_mount_monitor.t) = object
  (** Emitted when the unix mount points have changed. *)
  method on_mountpoints_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"mountpoints-changed" ~callback ~after:false

  (** Emitted when the unix mounts have changed. *)
  method on_mounts_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"mounts-changed" ~callback ~after:false

end
