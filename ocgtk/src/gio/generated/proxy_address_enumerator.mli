(* GENERATED CODE - DO NOT EDIT *)
(* ProxyAddressEnumerator: ProxyAddressEnumerator *)

type t =
  [ `proxy_address_enumerator | `socket_address_enumerator | `object_ ]
  Gobject.obj
(** [GProxyAddressEnumerator] is a wrapper around [Gio.SocketAddressEnumerator]
    which takes the [Gio.SocketAddress] instances returned by the
    [Gio.SocketAddressEnumerator] and wraps them in [Gio.ProxyAddress]
    instances, using the given [Gio.ProxyAddressEnumerator:proxy-resolver].

    This enumerator will be returned (for example, by
    [Gio.SocketConnectable.enumerate]) as appropriate when a proxy is
    configured; there should be no need to manually wrap a
    [Gio.SocketAddressEnumerator] instance with one. *)

(* Methods *)
(* Properties *)

external get_connectable :
  t ->
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .Socket_connectable
  .t = "ml_g_proxy_address_enumerator_get_connectable"
(** Get property: connectable *)

external get_default_port : t -> int
  = "ml_g_proxy_address_enumerator_get_default_port"
(** Get property: default-port *)

external get_proxy_resolver : t -> Proxy_resolver.t
  = "ml_g_proxy_address_enumerator_get_proxy_resolver"
(** Get property: proxy-resolver *)

external set_proxy_resolver : t -> Proxy_resolver.t -> unit
  = "ml_g_proxy_address_enumerator_set_proxy_resolver"
(** Set property: proxy-resolver *)

external get_uri : t -> string = "ml_g_proxy_address_enumerator_get_uri"
(** Get property: uri *)
