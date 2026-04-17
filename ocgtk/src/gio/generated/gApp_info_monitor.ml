(* Signal class defined in gapp_info_monitor_signals.ml *)

class type app_info_monitor_t = object
  inherit Gapp_info_monitor_signals.app_info_monitor_signals
  method as_app_info_monitor : App_info_monitor.t
end

(* High-level class for AppInfoMonitor *)
class app_info_monitor (obj : App_info_monitor.t) : app_info_monitor_t =
  object (self)
    inherit Gapp_info_monitor_signals.app_info_monitor_signals obj
    method as_app_info_monitor = obj
  end
