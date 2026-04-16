class type simple_proxy_resolver_t = object
    inherit GProxy_resolver.proxy_resolver_t
    method set_default_proxy : string option -> unit
    method set_ignore_hosts : string array -> unit
    method set_uri_proxy : string -> string -> unit
    method as_simple_proxy_resolver : Simple_proxy_resolver.t
end

class simple_proxy_resolver : Simple_proxy_resolver.t -> simple_proxy_resolver_t

