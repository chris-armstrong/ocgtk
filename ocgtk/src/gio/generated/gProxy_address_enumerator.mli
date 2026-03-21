class type proxy_address_enumerator_t = object
    method default_port : int
    method uri : string
    method as_proxy_address_enumerator : Proxy_address_enumerator.t
end

class proxy_address_enumerator : Proxy_address_enumerator.t -> proxy_address_enumerator_t

