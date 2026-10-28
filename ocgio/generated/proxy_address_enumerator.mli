(** [GProxyAddressEnumerator] is a wrapper around [Gio.SocketAddressEnumerator]
    which takes the [Gio.SocketAddress] instances returned by the
    [Gio.SocketAddressEnumerator] and wraps them in [Gio.ProxyAddress]
    instances, using the given [Gio.ProxyAddressEnumerator:proxy-resolver].

    Its methods, signals and properties are on
    {!class-type-proxy_address_enumerator_t}. Its full description is under
    {!section-description}. The functions it is built on are in
    {!Ocgio.Raw.Proxy_address_enumerator}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ProxyAddressEnumerator].}

    Inherits from:
    {{!Ocgio.Socket_address_enumerator.class-type-socket_address_enumerator_t}Ocgio.Socket_address_enumerator}

    [GProxyAddressEnumerator] is a wrapper around [Gio.SocketAddressEnumerator]
    which takes the [Gio.SocketAddress] instances returned by the
    [Gio.SocketAddressEnumerator] and wraps them in [Gio.ProxyAddress]
    instances, using the given [Gio.ProxyAddressEnumerator:proxy-resolver].

    This enumerator will be returned (for example, by
    [Gio.SocketConnectable.enumerate]) as appropriate when a proxy is
    configured; there should be no need to manually wrap a
    [Gio.SocketAddressEnumerator] instance with one. *)
class type proxy_address_enumerator_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_enumerator_t

  (** {2:properties Properties} *)

  method connectable :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t
  (** The connectable being enumerated. *)

  method default_port : int
  (** The default port to use if [GProxyAddressEnumerator:uri] does not specify
      one. *)

  method proxy_resolver : Proxy_resolver.proxy_resolver_t
  (** The proxy resolver to use. *)

  method set_proxy_resolver : Proxy_resolver.proxy_resolver_t -> unit
  (** The proxy resolver to use. *)

  method uri : string
  (** The destination URI. Use [none://] for a generic socket. *)

  (** {2:conversions Conversions} *)

  method as_proxy_address_enumerator : Raw.Proxy_address_enumerator.t
end

class proxy_address_enumerator :
  Raw.Proxy_address_enumerator.t ->
  proxy_address_enumerator_t
(** Wraps a raw handle of {!Ocgio.Raw.Proxy_address_enumerator.t}. *)

(** {1:description Description}

    [GProxyAddressEnumerator] is a wrapper around [Gio.SocketAddressEnumerator]
    which takes the [Gio.SocketAddress] instances returned by the
    [Gio.SocketAddressEnumerator] and wraps them in [Gio.ProxyAddress]
    instances, using the given [Gio.ProxyAddressEnumerator:proxy-resolver].

    This enumerator will be returned (for example, by
    [Gio.SocketConnectable.enumerate]) as appropriate when a proxy is
    configured; there should be no need to manually wrap a
    [Gio.SocketAddressEnumerator] instance with one. *)
