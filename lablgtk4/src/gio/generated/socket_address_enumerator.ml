(* GENERATED CODE - DO NOT EDIT *)
(* SocketAddressEnumerator: SocketAddressEnumerator *)

type t = [`socket_address_enumerator | `object_] Gobject.obj

(* Methods *)
(** Retrieves the next #GSocketAddress from @enumerator. Note that this
may block for some amount of time. (Eg, a #GNetworkAddress may need
to do a DNS lookup before it can return an address.) Use
g_socket_address_enumerator_next_async() if you need to avoid
blocking.

If @enumerator is expected to yield addresses, but for some reason
is unable to (eg, because of a DNS error), then the first call to
g_socket_address_enumerator_next() will return an appropriate error
in *@error. However, if the first call to
g_socket_address_enumerator_next() succeeds, then any further
internal errors (other than @cancellable being triggered) will be
ignored. *)
external next : t -> Cancellable.t option -> (Socket_address.t option, GError.t) result = "ml_g_socket_address_enumerator_next"

