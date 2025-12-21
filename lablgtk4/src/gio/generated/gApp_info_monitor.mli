class app_info_monitor : App_info_monitor.t ->
  object
    inherit Gapp_info_monitor_signals.app_info_monitor_signals
    method as_app_info_monitor : App_info_monitor.t
  end

