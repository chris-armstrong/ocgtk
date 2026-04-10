(* GENERATED CODE - DO NOT EDIT *)
(* SocketAddress: SocketAddress *)

type t = [`socket_address | `object_] Gobject.obj

(* Methods *)
(** Gets the size of @address's native struct sockaddr.
You can use this to allocate memory to pass to
g_socket_address_to_native(). *)
external get_native_size : t -> int = "ml_g_socket_address_get_native_size"

(** Gets the socket family type of @address. *)
external get_family : t -> Gio_enums.socketfamily = "ml_g_socket_address_get_family"

(* Properties *)

