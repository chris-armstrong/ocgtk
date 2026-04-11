class type proxy_address_enumerator_t = object
  inherit
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_enumerator_t

  method default_port : int
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

    method default_port = Proxy_address_enumerator.get_default_port obj
    method uri = Proxy_address_enumerator.get_uri obj
    method as_proxy_address_enumerator = obj
  end
