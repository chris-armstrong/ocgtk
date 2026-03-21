class type proxy_address_enumerator_t = object
    method default_port : int
    method uri : string
    method as_proxy_address_enumerator : Proxy_address_enumerator.t
end

(* High-level class for ProxyAddressEnumerator *)
class proxy_address_enumerator (obj : Proxy_address_enumerator.t) : proxy_address_enumerator_t = object (self)

  method default_port = Proxy_address_enumerator.get_default_port obj

  method uri = Proxy_address_enumerator.get_uri obj

    method as_proxy_address_enumerator = obj
end

