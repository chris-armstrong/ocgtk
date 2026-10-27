(** [GProxyResolver] provides synchronous and asynchronous network proxy
    resolution. [GProxyResolver] is used within [Gio.SocketClient] through the
    method [Gio.SocketConnectable.proxy_enumerate].

    Implementations of [GProxyResolver] based on
    {{:https://github.com/libproxy/libproxy}libproxy} and GNOME settings can be
    found in {{:https://gitlab.gnome.org/GNOME/glib-networking}glib-networking}.
    GIO comes with an implementation for use inside Flatpak portals.

    Its methods, signals and properties are on {!class-type-proxy_resolver_t}.
    The functions it is built on are in {!Ocgio.Raw.Proxy_resolver}. *)

(** The methods, signals and properties of a [GProxyResolver]. *)
class type proxy_resolver_t = object
  method is_supported : unit -> bool

  method lookup :
    string ->
    Cancellable.cancellable_t option ->
    (string array, GError.t) result

  method lookup_finish :
    Async_result.async_result_t -> (string array, GError.t) result

  method as_proxy_resolver : Raw.Proxy_resolver.t
end

class proxy_resolver : Raw.Proxy_resolver.t -> proxy_resolver_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Proxy_resolver.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GProxyResolver], give one already wrapped. *)
