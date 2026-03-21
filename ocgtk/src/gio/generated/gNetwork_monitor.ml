(* Signal class defined in gnetwork_monitor_signals.ml *)

class type network_monitor_t = object
    inherit Gnetwork_monitor_signals.network_monitor_signals
    method get_connectivity : unit -> Gio_enums.networkconnectivity
    method get_network_available : unit -> bool
    method get_network_metered : unit -> bool
    method as_network_monitor : Network_monitor.t
end

(* High-level class for NetworkMonitor *)
class network_monitor (obj : Network_monitor.t) : network_monitor_t = object (self)
  inherit Gnetwork_monitor_signals.network_monitor_signals obj

  method get_connectivity : unit -> Gio_enums.networkconnectivity =
    fun () ->
      (Network_monitor.get_connectivity obj)

  method get_network_available : unit -> bool =
    fun () ->
      (Network_monitor.get_network_available obj)

  method get_network_metered : unit -> bool =
    fun () ->
      (Network_monitor.get_network_metered obj)

    method as_network_monitor = obj
end

