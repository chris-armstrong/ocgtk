(* High-level class for SimpleProxyResolver *)
class simple_proxy_resolver (obj : Simple_proxy_resolver.t) = object (self)

  method set_default_proxy : string option -> unit =
    fun default_proxy ->
      (Simple_proxy_resolver.set_default_proxy obj default_proxy)

  method set_uri_proxy : string -> string -> unit =
    fun uri_scheme proxy ->
      (Simple_proxy_resolver.set_uri_proxy obj uri_scheme proxy)

    method as_simple_proxy_resolver = obj
end

