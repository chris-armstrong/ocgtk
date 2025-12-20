class proxy_address_enumerator : Proxy_address_enumerator.t ->
  object
    method default_port : int
    method uri : string
    method as_proxy_address_enumerator : Proxy_address_enumerator.t
  end

