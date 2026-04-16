class type proxy_address_enumerator_t = object
    inherit GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_address_enumerator_t
    method connectable : GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t
    method default_port : int
    method proxy_resolver : GProxy_resolver.proxy_resolver_t
    method set_proxy_resolver : GProxy_resolver.proxy_resolver_t -> unit
    method uri : string
    method as_proxy_address_enumerator : Proxy_address_enumerator.t
end

class proxy_address_enumerator : Proxy_address_enumerator.t -> proxy_address_enumerator_t

