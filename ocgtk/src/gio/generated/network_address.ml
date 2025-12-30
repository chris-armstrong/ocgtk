(* GENERATED CODE - DO NOT EDIT *)
(* NetworkAddress: NetworkAddress *)

type t = [`network_address | `object_] Gobject.obj

(** Create a new NetworkAddress *)
external new_ : string -> unit -> t = "ml_g_network_address_new"

(** Create a new NetworkAddress *)
external new_loopback : unit -> t = "ml_g_network_address_new_loopback"

(* Methods *)
(** Gets @addr's scheme *)
external get_scheme : t -> string option = "ml_g_network_address_get_scheme"

(** Gets @addr's hostname. This might be either UTF-8 or ASCII-encoded,
depending on what @addr was created with. *)
external get_hostname : t -> string = "ml_g_network_address_get_hostname"

(* Properties *)

