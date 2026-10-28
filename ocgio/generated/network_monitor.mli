(** [GNetworkMonitor] provides an easy-to-use cross-platform API for monitoring
    network connectivity. On Linux, the available implementations are based on
    the kernel's netlink interface and on NetworkManager.

    Its methods, signals and properties are on {!class-type-network_monitor_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Network_monitor}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [NetworkMonitor].}

    Requires:
    - {{!Ocgio.Initable.class-type-initable_t}Ocgio.Initable}

    [GNetworkMonitor] provides an easy-to-use cross-platform API for monitoring
    network connectivity. On Linux, the available implementations are based on
    the kernel's netlink interface and on NetworkManager.

    There is also an implementation for use inside Flatpak sandboxes. *)
class type network_monitor_t = object
  (** {2:signals Signals} *)

  method on_network_changed :
    ?after:bool ->
    callback:(network_available:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the network configuration changes. *)

  (** {2:methods Methods} *)

  method can_reach :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result
  (** Attempts to determine whether or not the host pointed to by [connectable]
      can be reached, without actually trying to connect to it.

      This may return [TRUE] even when [GNetworkMonitor:network]-available is
      [FALSE], if, for example, [monitor] can determine that [connectable]
      refers to a host on a local network.

      If [monitor] believes that an attempt to connect to [connectable] will
      succeed, it will return [TRUE]. Otherwise, it will return [FALSE] and set
      [error] to an appropriate error (such as [G_IO_ERROR_HOST_UNREACHABLE]).

      Note that although this does not attempt to connect to [connectable], it
      may still block for a brief period of time (eg, trying to do multicast DNS
      on the local network), so if you do not want to block, you should use
      g_network_monitor_can_reach_async(). *)

  method can_reach_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an async network connectivity test. See
      g_network_monitor_can_reach_async(). *)

  method get_connectivity : unit -> Enums.networkconnectivity
  [@@ocaml.doc
    "Gets a more detailed networking state than\n\
     g_network_monitor_get_network_available().\n\n\
     If [GNetworkMonitor:network]-available is [FALSE], then the\n\
     connectivity state will be [G_NETWORK_CONNECTIVITY_LOCAL].\n\n\
     If [GNetworkMonitor:network]-available is [TRUE], then the\n\
     connectivity state will be [G_NETWORK_CONNECTIVITY_FULL] (if there\n\
     is full Internet connectivity), [G_NETWORK_CONNECTIVITY_LIMITED] (if\n\
     the host has a default route, but appears to be unable to actually\n\
     reach the full Internet), or [G_NETWORK_CONNECTIVITY_PORTAL] (if the\n\
     host is trapped behind a \"captive portal\" that requires some sort\n\
     of login or acknowledgement before allowing full Internet access).\n\n\
     Note that in the case of [G_NETWORK_CONNECTIVITY_LIMITED] and\n\
     [G_NETWORK_CONNECTIVITY_PORTAL], it is possible that some sites are\n\
     reachable but others are not. In this case, applications can\n\
     attempt to connect to remote servers, but should gracefully fall\n\
     back to their \"offline\" behavior if the connection attempt fails."]

  method get_network_available : unit -> bool
  [@@ocaml.doc
    "Checks if the network is available. \"Available\" here means that the\n\
     system has a default route available for at least one of IPv4 or\n\
     IPv6. It does not necessarily imply that the public Internet is\n\
     reachable. See [GNetworkMonitor:network]-available for more details."]

  method get_network_metered : unit -> bool
  (** Checks if the network is metered. See [GNetworkMonitor:network]-metered
      for more details. *)

  (** {2:conversions Conversions} *)

  method as_network_monitor : Raw.Network_monitor.t
end

class network_monitor : Raw.Network_monitor.t -> network_monitor_t
(** Wraps a raw handle of {!Ocgio.Raw.Network_monitor.t}. *)

(** {1:description Description}

    [GNetworkMonitor] provides an easy-to-use cross-platform API for monitoring
    network connectivity. On Linux, the available implementations are based on
    the kernel's netlink interface and on NetworkManager.

    There is also an implementation for use inside Flatpak sandboxes. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
