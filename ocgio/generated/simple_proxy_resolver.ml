class type simple_proxy_resolver_t = object
  inherit Proxy_resolver.proxy_resolver_t

  method set_default_proxy : string option -> unit
  [@@ocaml.doc
    "Sets the default proxy on [resolver], to be used for any URIs that\n\
     don't match [GSimpleProxyResolver:ignore]-hosts or a proxy set\n\
     via g_simple_proxy_resolver_set_uri_proxy().\n\n\
     If [default_proxy] starts with \"socks://\",\n\
     [GSimpleProxyResolver] will treat it as referring to all three of\n\
     the socks5, socks4a, and socks4 proxy types."]

  method set_ignore_hosts : string array -> unit
  (** Sets the list of ignored hosts.

      See [GSimpleProxyResolver:ignore]-hosts for more details on how the
      [ignore_hosts] argument is interpreted. *)

  method set_uri_proxy : string -> string -> unit
  [@@ocaml.doc
    "Adds a URI-scheme-specific proxy to [resolver]; URIs whose scheme\n\
     matches [uri_scheme] (and which don't match\n\
     [GSimpleProxyResolver:ignore]-hosts) will be proxied via [proxy].\n\n\
     As with [GSimpleProxyResolver:default]-proxy, if [proxy] starts with\n\
     \"socks://\", [GSimpleProxyResolver] will treat it\n\
     as referring to all three of the socks5, socks4a, and socks4 proxy\n\
     types."]

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
