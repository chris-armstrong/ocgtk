(* GENERATED CODE - DO NOT EDIT *)
(* SocketConnectable: SocketConnectable *)

type t = [`socket_connectable] Gobject.obj

(* Methods *)
(** Format a #GSocketConnectable as a string. This is a human-readable format for
use in debugging output, and is not a stable serialization format. It is not
suitable for use in user interfaces as it exposes too much information for a
user.

If the #GSocketConnectable implementation does not support string formatting,
the implementation’s type name will be returned as a fallback. *)
external to_string : t -> string = "ml_g_socket_connectable_to_string"

(** Creates a #GSocketAddressEnumerator for @connectable that will
return a #GProxyAddress for each of its addresses that you must connect
to via a proxy.

If @connectable does not implement
g_socket_connectable_proxy_enumerate(), this will fall back to
calling g_socket_connectable_enumerate(). *)
external proxy_enumerate : t -> Socket_address_enumerator.t = "ml_g_socket_connectable_proxy_enumerate"

(** Creates a #GSocketAddressEnumerator for @connectable. *)
external enumerate : t -> Socket_address_enumerator.t = "ml_g_socket_connectable_enumerate"

