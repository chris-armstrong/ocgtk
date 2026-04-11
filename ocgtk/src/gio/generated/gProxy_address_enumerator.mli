class type proxy_address_enumerator_t = object
  inherit
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_enumerator_t

  method default_port : int
  method uri : string
  method as_proxy_address_enumerator : Proxy_address_enumerator.t
end

class proxy_address_enumerator :
  Proxy_address_enumerator.t ->
  proxy_address_enumerator_t
