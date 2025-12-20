(* GENERATED CODE - DO NOT EDIT *)
(* SocketAddress: SocketAddress *)

type t = [`socket_address | `object_] Gobject.obj

(** Create a new SocketAddress *)
external new_from_native : unit -> unit -> t = "ml_g_socket_address_new_from_native"

(* Methods *)
(** Gets the socket family type of @address. *)
external get_family : t -> Gio_enums.socketfamily = "ml_g_socket_address_get_family"

(* Properties *)

