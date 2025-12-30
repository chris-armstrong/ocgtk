(* High-level class for ProxyAddressEnumerator *)
class proxy_address_enumerator (obj : Proxy_address_enumerator.t) = object (self)

  method default_port = Proxy_address_enumerator.get_default_port obj

  method uri = Proxy_address_enumerator.get_uri obj

    method as_proxy_address_enumerator = obj
end

