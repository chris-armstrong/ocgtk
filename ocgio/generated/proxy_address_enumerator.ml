class type proxy_address_enumerator_t = object
  inherit
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_enumerator_t

  method connectable :
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t

  method default_port : int
  method proxy_resolver : GProxy_resolver.proxy_resolver_t
  method set_proxy_resolver : GProxy_resolver.proxy_resolver_t -> unit
  method uri : string
  method as_proxy_address_enumerator : Proxy_address_enumerator.t
end

(* High-level class for ProxyAddressEnumerator *)
class proxy_address_enumerator (obj : Proxy_address_enumerator.t) :
  proxy_address_enumerator_t =
  object (self)
    inherit
      GSocket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address_enumerator
        (obj
          :> Socket_address_and__socket_address_enumerator_and__socket_connectable
             .Socket_address_enumerator
             .t)

    method connectable =
      new
        GSocket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_connectable
        (Proxy_address_enumerator.get_connectable obj)

    method default_port = Proxy_address_enumerator.get_default_port obj

    method proxy_resolver =
      new GProxy_resolver.proxy_resolver
        (Proxy_address_enumerator.get_proxy_resolver obj)

    method set_proxy_resolver : GProxy_resolver.proxy_resolver_t -> unit =
      fun v ->
        Proxy_address_enumerator.set_proxy_resolver obj v#as_proxy_resolver

    method uri = Proxy_address_enumerator.get_uri obj
    method as_proxy_address_enumerator = obj
  end
