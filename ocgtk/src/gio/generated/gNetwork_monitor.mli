class network_monitor : Network_monitor.t ->
  object
    inherit Gnetwork_monitor_signals.network_monitor_signals
    method get_connectivity : unit -> Gio_enums.networkconnectivity
    method get_network_available : unit -> bool
    method get_network_metered : unit -> bool
    method as_network_monitor : Network_monitor.t
  end

