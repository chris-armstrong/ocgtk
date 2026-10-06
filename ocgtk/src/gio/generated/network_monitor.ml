(* GENERATED CODE - DO NOT EDIT *)
(* NetworkMonitor: NetworkMonitor *)

(** [GNetworkMonitor] provides an easy-to-use cross-platform API for monitoring
    network connectivity. On Linux, the available implementations are based on
    the kernel's netlink interface and on NetworkManager.

    There is also an implementation for use inside Flatpak sandboxes. *)

type t = [ `network_monitor ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t
  = "ml_gio_network_monitor_from_gobject"

(* Methods *)

external get_network_metered : t -> bool
  = "ml_g_network_monitor_get_network_metered"
(** Checks if the network is metered. See [GNetworkMonitor:network]-metered for
    more details. *)

external get_network_available : t -> bool
  = "ml_g_network_monitor_get_network_available"
[@@ocaml.doc
  "Checks if the network is available. \"Available\" here means that the\n\
   system has a default route available for at least one of IPv4 or\n\
   IPv6. It does not necessarily imply that the public Internet is\n\
   reachable. See [GNetworkMonitor:network]-available for more details."]

external get_connectivity : t -> Gio_enums.networkconnectivity
  = "ml_g_network_monitor_get_connectivity"
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

external can_reach_finish : t -> Async_result.t -> (bool, GError.t) result
  = "ml_g_network_monitor_can_reach_finish"
(** Finishes an async network connectivity test. See
    g_network_monitor_can_reach_async(). *)

external can_reach :
  t ->
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .Socket_connectable
  .t ->
  Cancellable.t option ->
  (bool, GError.t) result = "ml_g_network_monitor_can_reach"
(** Attempts to determine whether or not the host pointed to by [connectable]
    can be reached, without actually trying to connect to it.

    This may return [TRUE] even when [GNetworkMonitor:network]-available is
    [FALSE], if, for example, [monitor] can determine that [connectable] refers
    to a host on a local network.

    If [monitor] believes that an attempt to connect to [connectable] will
    succeed, it will return [TRUE]. Otherwise, it will return [FALSE] and set
    [error] to an appropriate error (such as [G_IO_ERROR_HOST_UNREACHABLE]).

    Note that although this does not attempt to connect to [connectable], it may
    still block for a brief period of time (eg, trying to do multicast DNS on
    the local network), so if you do not want to block, you should use
    g_network_monitor_can_reach_async(). *)

(* Properties *)

let on_network_changed ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let network_available =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_boolean v
        in
        callback ~network_available)
  in
  Gobject.Signal.connect obj ~name:"network-changed" ~callback:closure
    ~after:(Option.value after ~default:false)
