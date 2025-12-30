class simple_proxy_resolver : Simple_proxy_resolver.t ->
  object
    method set_default_proxy : string option -> unit
    method set_uri_proxy : string -> string -> unit
    method as_simple_proxy_resolver : Simple_proxy_resolver.t
  end

