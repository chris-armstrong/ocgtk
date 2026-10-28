(** [GProxyAddressEnumerator] is a wrapper around [Gio.SocketAddressEnumerator]
    which takes the [Gio.SocketAddress] instances returned by the
    [Gio.SocketAddressEnumerator] and wraps them in [Gio.ProxyAddress]
    instances, using the given [Gio.ProxyAddressEnumerator:proxy-resolver].

    This enumerator will be returned (for example, by
    [Gio.SocketConnectable.enumerate]) as appropriate when a proxy is
    configured; there should be no need to manually wrap a
    [Gio.SocketAddressEnumerator] instance with one.

    Its methods, signals and properties are on
    {!class-type-proxy_address_enumerator_t}. The functions it is built on are
    in {!Ocgio.Raw.Proxy_address_enumerator}. *)

(** The methods, signals and properties of a [ProxyAddressEnumerator]. *)
class type proxy_address_enumerator_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_enumerator_t

  method connectable :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t

  method default_port : int
  method proxy_resolver : Proxy_resolver.proxy_resolver_t
  method set_proxy_resolver : Proxy_resolver.proxy_resolver_t -> unit
  method uri : string
  method as_proxy_address_enumerator : Raw.Proxy_address_enumerator.t
end

class proxy_address_enumerator :
  Raw.Proxy_address_enumerator.t ->
  proxy_address_enumerator_t
(** Wraps a raw handle of {!Ocgio.Raw.Proxy_address_enumerator.t}. *)
