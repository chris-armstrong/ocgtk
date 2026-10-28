(** Like [Gio.NetworkAddress] does with hostnames, [GNetworkService] provides an
    easy way to resolve a SRV record, and then attempt to connect to one of the
    hosts that implements that service, handling service priority/weighting,
    multiple IP addresses, and multiple address families.

    Its methods, signals and properties are on {!class-type-network_service_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Network_service}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [NetworkService].}

    Inherits from: [GObject.Object]

    Implements:
    - {{!Ocgio.Socket_connectable.class-type-socket_connectable_t}Ocgio.Socket_connectable}

    Like [Gio.NetworkAddress] does with hostnames, [GNetworkService] provides an
    easy way to resolve a SRV record, and then attempt to connect to one of the
    hosts that implements that service, handling service priority/weighting,
    multiple IP addresses, and multiple address families.

    See [Gio.SrvTarget] for more information about SRV records, and see
    [Gio.SocketConnectable] for an example of using the connectable interface.
*)
class type network_service_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t

  (** {2:methods Methods} *)

  method get_domain : unit -> string
  (** Gets the domain that [srv] serves. This might be either UTF-8 or
      ASCII-encoded, depending on what [srv] was created with. *)

  method get_protocol : unit -> string
  [@@ocaml.doc "Gets [srv]'s protocol name (eg, \"tcp\")."]

  method get_scheme : unit -> string
  (** Gets the URI scheme used to resolve proxies. By default, the service name
      is used as scheme. *)

  method get_service : unit -> string
  [@@ocaml.doc "Gets [srv]'s service name (eg, \"ldap\")."]

  method set_scheme : string -> unit
  (** Set's the URI scheme used to resolve proxies. By default, the service name
      is used as scheme. *)

  (** {2:conversions Conversions} *)

  method as_network_service : Raw.Network_service.t
end

class network_service : Raw.Network_service.t -> network_service_t
(** Wraps a raw handle of {!Ocgio.Raw.Network_service.t}. *)

(** {1:description Description}

    Like [Gio.NetworkAddress] does with hostnames, [GNetworkService] provides an
    easy way to resolve a SRV record, and then attempt to connect to one of the
    hosts that implements that service, handling service priority/weighting,
    multiple IP addresses, and multiple address families.

    See [Gio.SrvTarget] for more information about SRV records, and see
    [Gio.SocketConnectable] for an example of using the connectable interface.
*)

(** {1:constructors Constructors} *)

val new_ : string -> string -> string -> network_service_t
(** Creates a new [GNetworkService] representing the given [service],
    [protocol], and [domain]. This will initially be unresolved; use the
    [GSocketConnectable] interface to resolve it. *)
