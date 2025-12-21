(* Signal class defined in gapp_info_monitor_signals.ml *)

(* High-level class for AppInfoMonitor *)
class app_info_monitor (obj : App_info_monitor.t) = object (self)
  inherit Gapp_info_monitor_signals.app_info_monitor_signals obj

    method as_app_info_monitor = obj
end

