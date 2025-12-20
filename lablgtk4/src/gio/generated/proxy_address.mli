(* GENERATED CODE - DO NOT EDIT *)
(* ProxyAddress: ProxyAddress *)

type t = [`proxy_address | `inet_socket_address | `socket_address | `object_] Gobject.obj

(** Create a new ProxyAddress *)
external new_ : Inet_address.t -> unit -> string -> string -> unit -> string option -> string option -> t = "ml_g_proxy_address_new_bytecode" "ml_g_proxy_address_new_native"

(* Methods *)
(** Gets @proxy's username. *)
external get_username : t -> string option = "ml_g_proxy_address_get_username"

(** Gets the proxy URI that @proxy was constructed from. *)
external get_uri : t -> string option = "ml_g_proxy_address_get_uri"

(** Gets @proxy's protocol. eg, "socks" or "http" *)
external get_protocol : t -> string = "ml_g_proxy_address_get_protocol"

(** Gets @proxy's password. *)
external get_password : t -> string option = "ml_g_proxy_address_get_password"

(** Gets the protocol that is being spoken to the destination
server; eg, "http" or "ftp". *)
external get_destination_protocol : t -> string = "ml_g_proxy_address_get_destination_protocol"

(** Gets @proxy's destination hostname; that is, the name of the host
that will be connected to via the proxy, not the name of the proxy
itself. *)
external get_destination_hostname : t -> string = "ml_g_proxy_address_get_destination_hostname"

(* Properties *)

