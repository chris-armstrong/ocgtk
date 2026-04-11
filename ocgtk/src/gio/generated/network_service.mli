(* GENERATED CODE - DO NOT EDIT *)
(* NetworkService: NetworkService *)

type t = [`network_service | `object_] Gobject.obj

(** Create a new NetworkService *)
external new_ : string -> string -> string -> t = "ml_g_network_service_new"

(* Methods *)
(** Set's the URI scheme used to resolve proxies. By default, the service name
is used as scheme. *)
external set_scheme : t -> string -> unit = "ml_g_network_service_set_scheme"

(** Gets @srv's service name (eg, "ldap"). *)
external get_service : t -> string = "ml_g_network_service_get_service"

(** Gets the URI scheme used to resolve proxies. By default, the service name
is used as scheme. *)
external get_scheme : t -> string = "ml_g_network_service_get_scheme"

(** Gets @srv's protocol name (eg, "tcp"). *)
external get_protocol : t -> string = "ml_g_network_service_get_protocol"

(** Gets the domain that @srv serves. This might be either UTF-8 or
ASCII-encoded, depending on what @srv was created with. *)
external get_domain : t -> string = "ml_g_network_service_get_domain"

(* Properties *)

