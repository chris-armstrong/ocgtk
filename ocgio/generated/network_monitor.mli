(** [GNetworkMonitor] provides an easy-to-use cross-platform API for monitoring
    network connectivity. On Linux, the available implementations are based on
    the kernel's netlink interface and on NetworkManager.

    There is also an implementation for use inside Flatpak sandboxes.

    Its methods, signals and properties are on {!class-type-network_monitor_t}.
    The functions it is built on are in {!Ocgio.Raw.Network_monitor}. *)

(** The methods, signals and properties of a [GNetworkMonitor]. *)
class type network_monitor_t = object
  method on_network_changed :
    ?after:bool ->
    callback:(network_available:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method can_reach :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result

  method can_reach_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method get_connectivity : unit -> Enums.networkconnectivity
  method get_network_available : unit -> bool
  method get_network_metered : unit -> bool
  method as_network_monitor : Raw.Network_monitor.t
end

class network_monitor : Raw.Network_monitor.t -> network_monitor_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Network_monitor.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GNetworkMonitor], give one already wrapped. *)
