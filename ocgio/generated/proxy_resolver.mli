(** [GProxyResolver] provides synchronous and asynchronous network proxy
    resolution. [GProxyResolver] is used within [Gio.SocketClient] through the
    method [Gio.SocketConnectable.proxy_enumerate].

    Its methods, signals and properties are on {!class-type-proxy_resolver_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgio.Raw.Proxy_resolver}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ProxyResolver].}

    [GProxyResolver] provides synchronous and asynchronous network proxy
    resolution. [GProxyResolver] is used within [Gio.SocketClient] through the
    method [Gio.SocketConnectable.proxy_enumerate].

    Implementations of [GProxyResolver] based on
    {{:https://github.com/libproxy/libproxy}libproxy} and GNOME settings can be
    found in {{:https://gitlab.gnome.org/GNOME/glib-networking}glib-networking}.
    GIO comes with an implementation for use inside Flatpak portals. *)
class type proxy_resolver_t = object
  method is_supported : unit -> bool
  (** Checks if [resolver] can be used on this system. (This is used internally;
      g_proxy_resolver_get_default() will only return a proxy resolver that
      returns [TRUE] for this method.) *)

  method lookup :
    string ->
    Cancellable.cancellable_t option ->
    (string array, GError.t) result
  (** Looks into the system proxy configuration to determine what proxy, if any,
      to use to connect to [uri]. The returned proxy URIs are of the form
      <protocol>://\[user\[:password\]@\]host\[:port\] or [direct://], where
      [<protocol>] could be http, rtsp, socks or other proxying protocol.

      If you don't know what network protocol is being used on the socket, you
      should use [none] as the URI protocol. In this case, the resolver might
      still return a generic proxy type (such as SOCKS), but would not return
      protocol-specific proxy types (such as http).

      [direct://] is used when no proxy is needed. Direct connection should not
      be attempted unless it is part of the returned array of proxies. *)

  method lookup_finish :
    Async_result.async_result_t -> (string array, GError.t) result
  (** Call this function to obtain the array of proxy URIs when
      g_proxy_resolver_lookup_async() is complete. See g_proxy_resolver_lookup()
      for more details. *)

  method as_proxy_resolver : Raw.Proxy_resolver.t
end

class proxy_resolver : Raw.Proxy_resolver.t -> proxy_resolver_t
(** Wraps a raw handle of {!Ocgio.Raw.Proxy_resolver.t}. *)

(** {1:description Description}

    [GProxyResolver] provides synchronous and asynchronous network proxy
    resolution. [GProxyResolver] is used within [Gio.SocketClient] through the
    method [Gio.SocketConnectable.proxy_enumerate].

    Implementations of [GProxyResolver] based on
    {{:https://github.com/libproxy/libproxy}libproxy} and GNOME settings can be
    found in {{:https://gitlab.gnome.org/GNOME/glib-networking}glib-networking}.
    GIO comes with an implementation for use inside Flatpak portals. *)
