(* GENERATED CODE - DO NOT EDIT *)
(* InetSocketAddress: InetSocketAddress *)

type t = [`inet_socket_address | `socket_address | `object_] Gobject.obj

(** Create a new InetSocketAddress *)
external new_ : Inet_address.t -> unit -> t = "ml_g_inet_socket_address_new"

(** Create a new InetSocketAddress *)
external new_from_string : string -> int -> t = "ml_g_inet_socket_address_new_from_string"

(* Methods *)
(** Gets @address's #GInetAddress. *)
external get_address : t -> Inet_address.t = "ml_g_inet_socket_address_get_address"

(* Properties *)

