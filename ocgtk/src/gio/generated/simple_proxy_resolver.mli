(* GENERATED CODE - DO NOT EDIT *)
(* SimpleProxyResolver: SimpleProxyResolver *)

(** [GSimpleProxyResolver] is a simple [Gio.ProxyResolver] implementation that
    handles a single default proxy, multiple URI-scheme-specific proxies, and a
    list of hosts that proxies should not be used for.

    [GSimpleProxyResolver] is never the default proxy resolver, but it can be
    used as the base class for another proxy resolver implementation, or it can
    be created and used manually, such as with
    [Gio.SocketClient.set_proxy_resolver]. *)

type t = [ `simple_proxy_resolver | `object_ ] Gobject.obj

(* Methods *)

external set_uri_proxy : t -> string -> string -> unit
  = "ml_g_simple_proxy_resolver_set_uri_proxy"
(** Adds a URI-scheme-specific proxy to [resolver]; URIs whose scheme matches
    [uri_scheme] (and which don't match [GSimpleProxyResolver:ignore]-hosts)
    will be proxied via [proxy].

    As with [GSimpleProxyResolver:default]-proxy, if [proxy] starts with
    “socks://”, [GSimpleProxyResolver] will treat it as referring to all three
    of the socks5, socks4a, and socks4 proxy types. *)

external set_ignore_hosts : t -> string array -> unit
  = "ml_g_simple_proxy_resolver_set_ignore_hosts"
(** Sets the list of ignored hosts.

    See [GSimpleProxyResolver:ignore]-hosts for more details on how the
    [ignore_hosts] argument is interpreted. *)

external set_default_proxy : t -> string option -> unit
  = "ml_g_simple_proxy_resolver_set_default_proxy"
(** Sets the default proxy on [resolver], to be used for any URIs that don't
    match [GSimpleProxyResolver:ignore]-hosts or a proxy set via
    g_simple_proxy_resolver_set_uri_proxy().

    If [default_proxy] starts with “socks://”, [GSimpleProxyResolver] will treat
    it as referring to all three of the socks5, socks4a, and socks4 proxy types.
*)

(* Properties *)
