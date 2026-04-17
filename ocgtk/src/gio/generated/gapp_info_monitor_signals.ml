(* Signal handlers for AppInfoMonitor *)
class app_info_monitor_signals (obj : App_info_monitor.t) =
  object
    method on_changed ~callback =
      Gobject.Signal.connect_simple obj ~name:"changed" ~callback ~after:false
    (** Signal emitted when the app info database changes, when applications are
        installed or removed. *)
  end
