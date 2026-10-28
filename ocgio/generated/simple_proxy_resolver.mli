(** [GSimpleProxyResolver] is a simple [Gio.ProxyResolver] implementation that
    handles a single default proxy, multiple URI-scheme-specific proxies, and a
    list of hosts that proxies should not be used for.

    [GSimpleProxyResolver] is never the default proxy resolver, but it can be
    used as the base class for another proxy resolver implementation, or it can
    be created and used manually, such as with
    [Gio.SocketClient.set_proxy_resolver].

    Its methods, signals and properties are on
    {!class-type-simple_proxy_resolver_t}. The functions it is built on are in
    {!Ocgio.Raw.Simple_proxy_resolver}. *)

(** {b The methods, signals and properties of a [SimpleProxyResolver].}

    [GSimpleProxyResolver] is a simple [Gio.ProxyResolver] implementation that
    handles a single default proxy, multiple URI-scheme-specific proxies, and a
    list of hosts that proxies should not be used for.

    [GSimpleProxyResolver] is never the default proxy resolver, but it can be
    used as the base class for another proxy resolver implementation, or it can
    be created and used manually, such as with
    [Gio.SocketClient.set_proxy_resolver]. *)
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

class simple_proxy_resolver :
  Raw.Simple_proxy_resolver.t ->
  simple_proxy_resolver_t
(** Wraps a raw handle of {!Ocgio.Raw.Simple_proxy_resolver.t}. *)
