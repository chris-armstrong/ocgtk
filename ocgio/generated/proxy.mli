(** A [GProxy] handles connecting to a remote host via a given type of proxy
    server. It is implemented by the [gio-proxy] extension point. The extensions
    are named after their proxy protocol name. As an example, a SOCKS5 proxy
    implementation can be retrieved with the name [socks5] using the function
    [Gio.IOExtensionPoint.get_extension_by_name].

    Its methods, signals and properties are on {!class-type-proxy_t}. The
    functions it is built on are in {!Ocgio.Raw.Proxy}. *)

(** The methods, signals and properties of a [GProxy]. *)
class type proxy_t = object
  method connect :
    Io_stream.io_stream_t ->
    Proxy_address.proxy_address_t ->
    Cancellable.cancellable_t option ->
    (Io_stream.io_stream_t, GError.t) result

  method connect_finish :
    Async_result.async_result_t -> (Io_stream.io_stream_t, GError.t) result

  method supports_hostname : unit -> bool
  method as_proxy : Raw.Proxy.t
end

class proxy : Raw.Proxy.t -> proxy_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Proxy.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GProxy], give one already wrapped. *)
