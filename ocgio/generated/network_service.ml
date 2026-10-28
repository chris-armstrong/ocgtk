class type network_service_t = object
  inherit Socket_connectable.socket_connectable_t

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

(* High-level class for NetworkService *)
class network_service (obj : Raw.Network_service.t) : network_service_t =
  object (self)
    inherit
      Socket_connectable.socket_connectable
        (Raw.Socket_connectable.from_gobject obj)

    method get_domain : unit -> string =
      fun () -> Raw.Network_service.get_domain obj

    method get_protocol : unit -> string =
      fun () -> Raw.Network_service.get_protocol obj

    method get_scheme : unit -> string =
      fun () -> Raw.Network_service.get_scheme obj

    method get_service : unit -> string =
      fun () -> Raw.Network_service.get_service obj

    method set_scheme : string -> unit =
      fun scheme -> Raw.Network_service.set_scheme obj scheme

    method as_network_service = obj
  end

let new_ (service : string) (protocol : string) (domain : string) :
    network_service_t =
  let obj_ = Raw.Network_service.new_ service protocol domain in
  new network_service obj_
