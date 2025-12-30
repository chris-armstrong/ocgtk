(* Signal class defined in gnetwork_monitor_signals.ml *)

(* High-level class for NetworkMonitor *)
class network_monitor (obj : Network_monitor.t) = object (self)
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

