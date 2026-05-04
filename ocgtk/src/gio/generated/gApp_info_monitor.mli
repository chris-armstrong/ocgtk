class type app_info_monitor_t = object
  method on_changed : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method as_app_info_monitor : App_info_monitor.t
end

class app_info_monitor : App_info_monitor.t -> app_info_monitor_t
