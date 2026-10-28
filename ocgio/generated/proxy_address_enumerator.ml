class type proxy_address_enumerator_t = object
  inherit Socket_address_enumerator.socket_address_enumerator_t

  (** {2:properties Properties} *)

  method connectable : Socket_connectable.socket_connectable_t
  (** The connectable being enumerated. *)

  method default_port : int
  (** The default port to use if [GProxyAddressEnumerator:uri] does not specify
      one. *)

  method proxy_resolver : Proxy_resolver.proxy_resolver_t
  (** The proxy resolver to use. *)

  method set_proxy_resolver : Proxy_resolver.proxy_resolver_t -> unit
  (** The proxy resolver to use. *)

  method uri : string
  (** The destination URI. Use [none://] for a generic socket. *)

  (** {2:conversions Conversions} *)

  method as_proxy_address_enumerator : Raw.Proxy_address_enumerator.t
end

(* High-level class for ProxyAddressEnumerator *)
class proxy_address_enumerator (obj : Raw.Proxy_address_enumerator.t) :
  proxy_address_enumerator_t =
  object (self)
    inherit
      Socket_address_enumerator.socket_address_enumerator
        (obj :> Raw.Socket_address_enumerator.t)

    method connectable =
      new Socket_connectable.socket_connectable
        (Raw.Proxy_address_enumerator.get_connectable obj)

    method default_port = Raw.Proxy_address_enumerator.get_default_port obj

    method proxy_resolver =
      new Proxy_resolver.proxy_resolver
        (Raw.Proxy_address_enumerator.get_proxy_resolver obj)

    method set_proxy_resolver : Proxy_resolver.proxy_resolver_t -> unit =
      fun v ->
        Raw.Proxy_address_enumerator.set_proxy_resolver obj v#as_proxy_resolver

    method uri = Raw.Proxy_address_enumerator.get_uri obj
    method as_proxy_address_enumerator = obj
  end
