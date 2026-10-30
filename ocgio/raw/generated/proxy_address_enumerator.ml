(* GENERATED CODE - DO NOT EDIT *)
(* ProxyAddressEnumerator: ProxyAddressEnumerator *)

(** [GProxyAddressEnumerator] is a wrapper around
    {{!Ocgio.Raw.Socket_address_enumerator}[Gio.SocketAddressEnumerator]} which
    takes the {{!Ocgio.Raw.Socket_address}[Gio.SocketAddress]} instances
    returned by the
    {{!Ocgio.Raw.Socket_address_enumerator}[Gio.SocketAddressEnumerator]} and
    wraps them in {{!Ocgio.Raw.Proxy_address}[Gio.ProxyAddress]} instances,
    using the given
    {{!Ocgio.Raw.Proxy_address_enumerator.val-get_proxy_resolver}[Gio.ProxyAddressEnumerator:proxy-resolver]}.

    This enumerator will be returned (for example, by
    {{!Ocgio.Raw.Socket_connectable.val-enumerate}[Gio.SocketConnectable.enumerate]})
    as appropriate when a proxy is configured; there should be no need to
    manually wrap a
    {{!Ocgio.Raw.Socket_address_enumerator}[Gio.SocketAddressEnumerator]}
    instance with one.

    The class built on this module is in {!Ocgio.Proxy_address_enumerator}. *)

type t =
  [ `proxy_address_enumerator | `socket_address_enumerator | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gio_proxy_address_enumerator_get_type"

(* Methods *)
(* Properties *)

external get_connectable :
  t ->
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .Socket_connectable
  .t = "ml_g_proxy_address_enumerator_get_connectable"
(** The connectable being enumerated. *)

external get_default_port : t -> int
  = "ml_g_proxy_address_enumerator_get_default_port"
(** The default port to use if
    {{!Ocgio.Raw.Proxy_address_enumerator.val-get_uri}[GProxyAddressEnumerator:uri]}
    does not specify one. *)

external get_proxy_resolver : t -> Proxy_resolver.t
  = "ml_g_proxy_address_enumerator_get_proxy_resolver"
(** The proxy resolver to use. *)

external set_proxy_resolver : t -> Proxy_resolver.t -> unit
  = "ml_g_proxy_address_enumerator_set_proxy_resolver"
(** The proxy resolver to use. *)

external get_uri : t -> string = "ml_g_proxy_address_enumerator_get_uri"
(** The destination URI. Use [none://] for a generic socket. *)
