class type network_monitor_t = object
  method on_network_changed :
    callback:(network_available:bool -> unit) -> Gobject.Signal.handler_id

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

class network_monitor : Network_monitor.t -> network_monitor_t
