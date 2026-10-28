(** A [GProxy] handles connecting to a remote host via a given type of proxy
    server. It is implemented by the [gio-proxy] extension point. The extensions
    are named after their proxy protocol name. As an example, a SOCKS5 proxy
    implementation can be retrieved with the name [socks5] using the function
    [Gio.IOExtensionPoint.get_extension_by_name].

    Its methods, signals and properties are on {!class-type-proxy_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgio.Raw.Proxy}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Proxy].}

    A [GProxy] handles connecting to a remote host via a given type of proxy
    server. It is implemented by the [gio-proxy] extension point. The extensions
    are named after their proxy protocol name. As an example, a SOCKS5 proxy
    implementation can be retrieved with the name [socks5] using the function
    [Gio.IOExtensionPoint.get_extension_by_name]. *)
class type proxy_t = object
  (** {2:methods Methods} *)

  method connect :
    Io_stream.io_stream_t ->
    Proxy_address.proxy_address_t ->
    Cancellable.cancellable_t option ->
    (Io_stream.io_stream_t, GError.t) result
  (** Given [connection] to communicate with a proxy (eg, a [GSocketConnection]
      that is connected to the proxy server), this does the necessary handshake
      to connect to [proxy_address], and if required, wraps the [GIOStream] to
      handle proxy payload. *)

  method connect_finish :
    Async_result.async_result_t -> (Io_stream.io_stream_t, GError.t) result
  (** See g_proxy_connect(). *)

  method supports_hostname : unit -> bool
  (** Some proxy protocols expect to be passed a hostname, which they will
      resolve to an IP address themselves. Others, like SOCKS4, do not allow
      this. This function will return [false] if [proxy] is implementing such a
      protocol. When [false] is returned, the caller should resolve the
      destination hostname first, and then pass a [GProxyAddress] containing the
      stringified IP address to g_proxy_connect() or g_proxy_connect_async(). *)

  (** {2:conversions Conversions} *)

  method as_proxy : Raw.Proxy.t
end

class proxy : Raw.Proxy.t -> proxy_t
(** Wraps a raw handle of {!Ocgio.Raw.Proxy.t}. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
