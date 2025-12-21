(* Signal handlers for AppInfoMonitor *)
class app_info_monitor_signals (obj : App_info_monitor.t) = object
  (** Signal emitted when the app info database changes, when applications are
installed or removed. *)
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

end
