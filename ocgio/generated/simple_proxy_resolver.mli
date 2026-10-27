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

(** The methods, signals and properties of a [GSimpleProxyResolver]. *)
class type simple_proxy_resolver_t = object
  inherit Proxy_resolver.proxy_resolver_t
  method set_default_proxy : string option -> unit
  method set_ignore_hosts : string array -> unit
  method set_uri_proxy : string -> string -> unit
  method as_simple_proxy_resolver : Raw.Simple_proxy_resolver.t
end

class simple_proxy_resolver :
  Raw.Simple_proxy_resolver.t ->
  simple_proxy_resolver_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Simple_proxy_resolver.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GSimpleProxyResolver], give one already wrapped. *)
