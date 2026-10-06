(* GENERATED CODE - DO NOT EDIT *)
(* NetworkService: NetworkService *)

(** Like [Gio.NetworkAddress] does with hostnames, [GNetworkService] provides an
    easy way to resolve a SRV record, and then attempt to connect to one of the
    hosts that implements that service, handling service priority/weighting,
    multiple IP addresses, and multiple address families.

    See [Gio.SrvTarget] for more information about SRV records, and see
    [Gio.SocketConnectable] for an example of using the connectable interface.
*)

type t = [ `network_service | `object_ ] Gobject.obj

external new_ : string -> string -> string -> t = "ml_g_network_service_new"
(** Create a new NetworkService *)

(* Methods *)

external set_scheme : t -> string -> unit = "ml_g_network_service_set_scheme"
(** Set's the URI scheme used to resolve proxies. By default, the service name
    is used as scheme. *)

external get_service : t -> string = "ml_g_network_service_get_service"
[@@ocaml.doc "Gets [srv]'s service name (eg, \"ldap\")."]

external get_scheme : t -> string = "ml_g_network_service_get_scheme"
(** Gets the URI scheme used to resolve proxies. By default, the service name is
    used as scheme. *)

external get_protocol : t -> string = "ml_g_network_service_get_protocol"
[@@ocaml.doc "Gets [srv]'s protocol name (eg, \"tcp\")."]

external get_domain : t -> string = "ml_g_network_service_get_domain"
(** Gets the domain that [srv] serves. This might be either UTF-8 or
    ASCII-encoded, depending on what [srv] was created with. *)

(* Properties *)
