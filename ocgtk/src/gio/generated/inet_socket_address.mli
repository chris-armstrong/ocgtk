(* GENERATED CODE - DO NOT EDIT *)
(* InetSocketAddress: InetSocketAddress *)

type t = [`inet_socket_address | `socket_address | `object_] Gobject.obj

(** Create a new InetSocketAddress *)
external new_ : Inet_address.t -> int -> t = "ml_g_inet_socket_address_new"

(** Create a new InetSocketAddress *)
external new_from_string : string -> int -> t = "ml_g_inet_socket_address_new_from_string"

(* Methods *)
(** Gets the `sin6_scope_id` field from @address,
which must be an IPv6 address. *)
external get_scope_id : t -> int = "ml_g_inet_socket_address_get_scope_id"

(** Gets @address's port. *)
external get_port : t -> int = "ml_g_inet_socket_address_get_port"

(** Gets the `sin6_flowinfo` field from @address,
which must be an IPv6 address. *)
external get_flowinfo : t -> int = "ml_g_inet_socket_address_get_flowinfo"

(** Gets @address's #GInetAddress. *)
external get_address : t -> Inet_address.t = "ml_g_inet_socket_address_get_address"

(* Properties *)

