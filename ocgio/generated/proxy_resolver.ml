class type proxy_resolver_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_proxy_resolver : Raw.Proxy_resolver.t
end

(* High-level class for ProxyResolver *)
class proxy_resolver (obj : Raw.Proxy_resolver.t) : proxy_resolver_t =
  object (self)
    method is_supported : unit -> bool =
      fun () -> Raw.Proxy_resolver.is_supported obj

    method lookup :
        string ->
        Cancellable.cancellable_t option ->
        (string array, GError.t) result =
      fun uri cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Proxy_resolver.lookup obj uri cancellable

    method lookup_finish :
        Async_result.async_result_t -> (string array, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Proxy_resolver.lookup_finish obj result

    method as_proxy_resolver = obj
  end
