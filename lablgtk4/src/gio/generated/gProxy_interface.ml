(* High-level class for ProxyInterface *)
class proxy_interface (obj : Proxy_interface.t) = object (self)

    method as_proxy_interface = obj
end

