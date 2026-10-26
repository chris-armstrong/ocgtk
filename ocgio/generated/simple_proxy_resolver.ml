class type simple_proxy_resolver_t = object
  inherit Proxy_resolver.proxy_resolver_t
  method set_default_proxy : string option -> unit
  method set_ignore_hosts : string array -> unit
  method set_uri_proxy : string -> string -> unit
  method as_simple_proxy_resolver : Raw.Simple_proxy_resolver.t
end

(* High-level class for SimpleProxyResolver *)
class simple_proxy_resolver (obj : Raw.Simple_proxy_resolver.t) :
  simple_proxy_resolver_t =
  object (self)
    inherit Proxy_resolver.proxy_resolver (Raw.Proxy_resolver.from_gobject obj)

    method set_default_proxy : string option -> unit =
      fun default_proxy ->
        Raw.Simple_proxy_resolver.set_default_proxy obj default_proxy

    method set_ignore_hosts : string array -> unit =
      fun ignore_hosts ->
        Raw.Simple_proxy_resolver.set_ignore_hosts obj ignore_hosts

    method set_uri_proxy : string -> string -> unit =
      fun uri_scheme proxy ->
        Raw.Simple_proxy_resolver.set_uri_proxy obj uri_scheme proxy

    method as_simple_proxy_resolver = obj
  end
