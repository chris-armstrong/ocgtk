class type app_info_monitor_t = object
  method on_changed : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method as_app_info_monitor : App_info_monitor.t
end

(* High-level class for AppInfoMonitor *)
class app_info_monitor (obj : App_info_monitor.t) : app_info_monitor_t =
  object (self)
    method on_changed ~callback =
      App_info_monitor.on_changed self#as_app_info_monitor ~callback

    method as_app_info_monitor = obj
  end
