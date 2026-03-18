(* GENERATED CODE - DO NOT EDIT *)
(* UnixSocketAddress: UnixSocketAddress *)

type t = [`unix_socket_address | `socket_address | `object_] Gobject.obj

(** Create a new UnixSocketAddress *)
external new_ : string -> t = "ml_g_unix_socket_address_new"

(* Methods *)
(** Gets @address's path, or for abstract sockets the "name".

Guaranteed to be zero-terminated, but an abstract socket
may contain embedded zeros, and thus you should use
g_unix_socket_address_get_path_len() to get the true length
of this string. *)
external get_path : t -> string = "ml_g_unix_socket_address_get_path"

(** Tests if @address is abstract. *)
external get_is_abstract : t -> bool = "ml_g_unix_socket_address_get_is_abstract"

(** Gets @address's type. *)
external get_address_type : t -> Gio_enums.unixsocketaddresstype = "ml_g_unix_socket_address_get_address_type"

(* Properties *)

(** Get property: abstract *)
external get_abstract : t -> bool = "ml_g_unix_socket_address_get_abstract"

