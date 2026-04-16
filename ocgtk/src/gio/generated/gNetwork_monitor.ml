(* Signal class defined in gnetwork_monitor_signals.ml *)

class type network_monitor_t = object
  inherit Gnetwork_monitor_signals.network_monitor_signals

  method can_reach :
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t ->
    GCancellable.cancellable_t option ->
    (bool, GError.t) result

  method can_reach_finish :
    GAsync_result.async_result_t -> (bool, GError.t) result

  method get_connectivity : unit -> Gio_enums.networkconnectivity
  method get_network_available : unit -> bool
  method get_network_metered : unit -> bool
  method as_network_monitor : Network_monitor.t
end

(* High-level class for NetworkMonitor *)
class network_monitor (obj : Network_monitor.t) : network_monitor_t =
  object (self)
    inherit Gnetwork_monitor_signals.network_monitor_signals obj

    method can_reach :
        GSocket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_connectable_t ->
        GCancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun connectable cancellable ->
        let connectable = connectable#as_socket_connectable in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Network_monitor.can_reach obj connectable cancellable

    method can_reach_finish :
        GAsync_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Network_monitor.can_reach_finish obj result

    method get_connectivity : unit -> Gio_enums.networkconnectivity =
      fun () -> Network_monitor.get_connectivity obj

    method get_network_available : unit -> bool =
      fun () -> Network_monitor.get_network_available obj

    method get_network_metered : unit -> bool =
      fun () -> Network_monitor.get_network_metered obj

    method as_network_monitor = obj
  end
