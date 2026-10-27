class type socket_client_t = object
  method on_event :
    ?after:bool ->
    callback:
      (event:Enums.socketclientevent ->
      connectable:
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_connectable_t ->
      connection:Io_stream.io_stream_t option ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method add_application_proxy : string -> unit
  (** Enable proxy protocols to be handled by the application. When the
      indicated proxy protocol is returned by the [GProxyResolver],
      [GSocketClient] will consider this protocol as supported but will not try
      to find a [GProxy] instance to handle handshaking. The application must
      check for this case by calling g_socket_connection_get_remote_address() on
      the returned [GSocketConnection], and seeing if it's a [GProxyAddress] of
      the appropriate type, to determine whether or not it needs to handle the
      proxy handshaking itself.

      This should be used for proxy protocols that are dialects of another
      protocol such as HTTP proxy. It also allows cohabitation of proxy
      protocols that are reused between protocols. A good example is HTTP. It
      can be used to proxy HTTP, FTP and Gopher and can also be use as generic
      socket proxy through the HTTP CONNECT method.

      When the proxy is detected as being an application proxy, TLS handshake
      will be skipped. This is required to let the application do the proxy
      specific handshake. *)

  method connect :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t ->
    Cancellable.cancellable_t option ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result
  (** Tries to resolve the [connectable] and make a network connection to it.

      Upon a successful connection, a new [GSocketConnection] is constructed and
      returned. The caller owns this new object and must drop their reference to
      it when finished with it.

      The type of the [GSocketConnection] object returned depends on the type of
      the underlying socket that is used. For instance, for a TCP/IP connection
      it will be a [GTcpConnection].

      The socket created will be the same family as the address that the
      [connectable] resolves to, unless family is set with
      g_socket_client_set_family() or indirectly via
      g_socket_client_set_local_address(). The socket type defaults to
      [G_SOCKET_TYPE_STREAM] but can be set with
      g_socket_client_set_socket_type().

      If a local address is specified with g_socket_client_set_local_address()
      the socket will be bound to this address before connecting. *)

  method connect_finish :
    Async_result.async_result_t ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result
  (** Finishes an async connect operation. See g_socket_client_connect_async()
  *)

  method connect_to_host :
    string ->
    UInt16.t ->
    Cancellable.cancellable_t option ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result
  (** This is a helper function for g_socket_client_connect().

      Attempts to create a TCP connection to the named host.

      [host_and_port] may be in any of a number of recognized formats; an IPv6
      address, an IPv4 address, or a domain name (in which case a DNS lookup is
      performed). Quoting with \[\] is supported for all address types. A port
      override may be specified in the usual way with a colon. Ports may be
      given as decimal numbers or symbolic names (in which case an /etc/services
      lookup is performed).

      If no port override is given in [host_and_port] then [default_port] will
      be used as the port number to connect to.

      In general, [host_and_port] is expected to be provided by the user
      (allowing them to give the hostname, and a port override if necessary) and
      [default_port] is expected to be provided by the application.

      In the case that an IP address is given, a single connection attempt is
      made. In the case that a name is given, multiple connection attempts may
      be made, in turn and according to the number of address records in DNS,
      until a connection succeeds.

      Upon a successful connection, a new [GSocketConnection] is constructed and
      returned. The caller owns this new object and must drop their reference to
      it when finished with it.

      In the event of any failure (DNS error, service not found, no hosts
      connectable) [NULL] is returned and [error] (if non-[NULL]) is set
      accordingly. *)

  method connect_to_host_finish :
    Async_result.async_result_t ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result
  (** Finishes an async connect operation. See
      g_socket_client_connect_to_host_async() *)

  method connect_to_service :
    string ->
    string ->
    Cancellable.cancellable_t option ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result
  [@@ocaml.doc
    "Attempts to create a TCP connection to a service.\n\n\
     This call looks up the SRV record for [service] at [domain] for the\n\
     \"tcp\" protocol.  It then attempts to connect, in turn, to each of\n\
     the hosts providing the service until either a connection succeeds\n\
     or there are no hosts remaining.\n\n\
     Upon a successful connection, a new [GSocketConnection] is constructed\n\
     and returned.  The caller owns this new object and must drop their\n\
     reference to it when finished with it.\n\n\
     In the event of any failure (DNS error, service not found, no hosts\n\
     connectable) [NULL] is returned and [error] (if non-[NULL]) is set\n\
     accordingly."]

  method connect_to_service_finish :
    Async_result.async_result_t ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result
  (** Finishes an async connect operation. See
      g_socket_client_connect_to_service_async() *)

  method connect_to_uri :
    string ->
    UInt16.t ->
    Cancellable.cancellable_t option ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result
  [@@ocaml.doc
    "This is a helper function for g_socket_client_connect().\n\n\
     Attempts to create a TCP connection with a network URI.\n\n\
     [uri] may be any valid URI containing an \"authority\" (hostname/port)\n\
     component. If a port is not specified in the URI, [default_port]\n\
     will be used. TLS will be negotiated if [GSocketClient:tls] is [TRUE].\n\
     ([GSocketClient] does not know to automatically assume TLS for\n\
     certain URI schemes.)\n\n\
     Using this rather than g_socket_client_connect() or\n\
     g_socket_client_connect_to_host() allows [GSocketClient] to\n\
     determine when to use application-specific proxy protocols.\n\n\
     Upon a successful connection, a new [GSocketConnection] is constructed\n\
     and returned.  The caller owns this new object and must drop their\n\
     reference to it when finished with it.\n\n\
     In the event of any failure (DNS error, service not found, no hosts\n\
     connectable) [NULL] is returned and [error] (if non-[NULL]) is set\n\
     accordingly."]

  method connect_to_uri_finish :
    Async_result.async_result_t ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result
  (** Finishes an async connect operation. See
      g_socket_client_connect_to_uri_async() *)

  method get_enable_proxy : unit -> bool
  (** Gets the proxy enable state; see g_socket_client_set_enable_proxy() *)

  method get_family : unit -> Enums.socketfamily
  (** Gets the socket family of the socket client.

      See g_socket_client_set_family() for details. *)

  method get_local_address :
    unit ->
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t
    option
  (** Gets the local address of the socket client.

      See g_socket_client_set_local_address() for details. *)

  method get_protocol : unit -> Enums.socketprotocol
  (** Gets the protocol name type of the socket client.

      See g_socket_client_set_protocol() for details. *)

  method get_proxy_resolver : unit -> Proxy_resolver.proxy_resolver_t
  (** Gets the [GProxyResolver] being used by [client]. Normally, this will be
      the resolver returned by g_proxy_resolver_get_default(), but you can
      override it with g_socket_client_set_proxy_resolver(). *)

  method get_socket_type : unit -> Enums.sockettype
  (** Gets the socket type of the socket client.

      See g_socket_client_set_socket_type() for details. *)

  method get_timeout : unit -> int
  (** Gets the I/O timeout time for sockets created by [client].

      See g_socket_client_set_timeout() for details. *)

  method get_tls : unit -> bool
  (** Gets whether [client] creates TLS connections. See
      g_socket_client_set_tls() for details. *)

  method get_tls_validation_flags : unit -> Enums.tlscertificateflags
  (** Gets the TLS validation flags used creating TLS connections via [client].

      This function does not work as originally designed and is impossible to
      use correctly. See [GSocketClient:tls]-validation-flags for more
      information. *)

  method set_enable_proxy : bool -> unit
  (** Sets whether or not [client] attempts to make connections via a proxy
      server. When enabled (the default), [GSocketClient] will use a
      [GProxyResolver] to determine if a proxy protocol such as SOCKS is needed,
      and automatically do the necessary proxy negotiation.

      See also g_socket_client_set_proxy_resolver(). *)

  method set_family : Enums.socketfamily -> unit
  (** Sets the socket family of the socket client. If this is set to something
      other than [G_SOCKET_FAMILY_INVALID] then the sockets created by this
      object will be of the specified family.

      This might be useful for instance if you want to force the local
      connection to be an ipv4 socket, even though the address might be an ipv6
      mapped to ipv4 address. *)

  method set_local_address :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t
    option ->
    unit
  (** Sets the local address of the socket client. The sockets created by this
      object will bound to the specified address (if not [NULL]) before
      connecting.

      This is useful if you want to ensure that the local side of the connection
      is on a specific port, or on a specific interface. *)

  method set_protocol : Enums.socketprotocol -> unit
  (** Sets the protocol of the socket client. The sockets created by this object
      will use of the specified protocol.

      If [protocol] is [G_SOCKET_PROTOCOL_DEFAULT] that means to use the default
      protocol for the socket family and type. *)

  method set_proxy_resolver : Proxy_resolver.proxy_resolver_t option -> unit
  (** Overrides the [GProxyResolver] used by [client]. You can call this if you
      want to use specific proxies, rather than using the system default proxy
      settings.

      Note that whether or not the proxy resolver is actually used depends on
      the setting of [GSocketClient:enable]-proxy, which is not changed by this
      function (but which is [TRUE] by default) *)

  method set_socket_type : Enums.sockettype -> unit
  (** Sets the socket type of the socket client. The sockets created by this
      object will be of the specified type.

      It doesn't make sense to specify a type of [G_SOCKET_TYPE_DATAGRAM], as
      GSocketClient is used for connection oriented services. *)

  method set_timeout : int -> unit
  (** Sets the I/O timeout for sockets created by [client]. [timeout] is a time
      in seconds, or 0 for no timeout (the default).

      The timeout value affects the initial connection attempt as well, so
      setting this may cause calls to g_socket_client_connect(), etc, to fail
      with [G_IO_ERROR_TIMED_OUT]. *)

  method set_tls : bool -> unit
  (** Sets whether [client] creates TLS (aka SSL) connections. If [tls] is
      [TRUE], [client] will wrap its connections in a [GTlsClientConnection] and
      perform a TLS handshake when connecting.

      Note that since [GSocketClient] must return a [GSocketConnection], but
      [GTlsClientConnection] is not a [GSocketConnection], this actually wraps
      the resulting [GTlsClientConnection] in a [GTcpWrapperConnection] when
      returning it. You can use g_tcp_wrapper_connection_get_base_io_stream() on
      the return value to extract the [GTlsClientConnection].

      If you need to modify the behavior of the TLS handshake (eg, by setting a
      client-side certificate to use, or connecting to the
      [GTlsConnection::accept]-certificate signal), you can connect to
      [client]'s [GSocketClient::event] signal and wait for it to be emitted
      with [G_SOCKET_CLIENT_TLS_HANDSHAKING], which will give you a chance to
      see the [GTlsClientConnection] before the handshake starts. *)

  method set_tls_validation_flags : Enums.tlscertificateflags -> unit
  (** Sets the TLS validation flags used when creating TLS connections via
      [client]. The default value is [G_TLS_CERTIFICATE_VALIDATE_ALL].

      This function does not work as originally designed and is impossible to
      use correctly. See [GSocketClient:tls]-validation-flags for more
      information. *)

  method type_ : Enums.sockettype
  method set_type : Enums.sockettype -> unit
  method as_socket_client : Raw.Socket_client.t
end

(* High-level class for SocketClient *)
class socket_client (obj : Raw.Socket_client.t) : socket_client_t =
  object (self)
    method on_event ?(after = false) ~callback () =
      Raw.Socket_client.on_event ~after self#as_socket_client
        ~callback:(fun ~event ~connectable ~connection ->
          callback ~event
            ~connectable:
              (new
                 Socket_address_and__socket_address_enumerator_and__socket_connectable
                 .socket_connectable
                 connectable)
            ~connection:
              (Option.map (fun w -> new Io_stream.io_stream w) connection))

    method add_application_proxy : string -> unit =
      fun protocol -> Raw.Socket_client.add_application_proxy obj protocol

    method connect :
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_connectable_t ->
        Cancellable.cancellable_t option ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun connectable cancellable ->
        let connectable = connectable#as_socket_connectable in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect obj connectable cancellable)

    method connect_finish :
        Async_result.async_result_t ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_finish obj result)

    method connect_to_host :
        string ->
        UInt16.t ->
        Cancellable.cancellable_t option ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun host_and_port default_port cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_to_host obj host_and_port default_port
             cancellable)

    method connect_to_host_finish :
        Async_result.async_result_t ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_to_host_finish obj result)

    method connect_to_service :
        string ->
        string ->
        Cancellable.cancellable_t option ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun domain service cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_to_service obj domain service cancellable)

    method connect_to_service_finish :
        Async_result.async_result_t ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_to_service_finish obj result)

    method connect_to_uri :
        string ->
        UInt16.t ->
        Cancellable.cancellable_t option ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun uri default_port cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_to_uri obj uri default_port cancellable)

    method connect_to_uri_finish :
        Async_result.async_result_t ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_to_uri_finish obj result)

    method get_enable_proxy : unit -> bool =
      fun () -> Raw.Socket_client.get_enable_proxy obj

    method get_family : unit -> Enums.socketfamily =
      fun () -> Raw.Socket_client.get_family obj

    method get_local_address :
        unit ->
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_address_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Socket_address_and__socket_address_enumerator_and__socket_connectable
              .socket_address
              ret)
          (Raw.Socket_client.get_local_address obj)

    method get_protocol : unit -> Enums.socketprotocol =
      fun () -> Raw.Socket_client.get_protocol obj

    method get_proxy_resolver : unit -> Proxy_resolver.proxy_resolver_t =
      fun () ->
        new Proxy_resolver.proxy_resolver
          (Raw.Socket_client.get_proxy_resolver obj)

    method get_socket_type : unit -> Enums.sockettype =
      fun () -> Raw.Socket_client.get_socket_type obj

    method get_timeout : unit -> int =
      fun () -> Raw.Socket_client.get_timeout obj

    method get_tls : unit -> bool = fun () -> Raw.Socket_client.get_tls obj

    method get_tls_validation_flags : unit -> Enums.tlscertificateflags =
      fun () -> Raw.Socket_client.get_tls_validation_flags obj

    method set_enable_proxy : bool -> unit =
      fun enable -> Raw.Socket_client.set_enable_proxy obj enable

    method set_family : Enums.socketfamily -> unit =
      fun family -> Raw.Socket_client.set_family obj family

    method set_local_address :
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_address_t
        option ->
        unit =
      fun address ->
        let address = Option.map (fun c -> c#as_socket_address) address in
        Raw.Socket_client.set_local_address obj address

    method set_protocol : Enums.socketprotocol -> unit =
      fun protocol -> Raw.Socket_client.set_protocol obj protocol

    method set_proxy_resolver : Proxy_resolver.proxy_resolver_t option -> unit =
      fun proxy_resolver ->
        let proxy_resolver =
          Option.map (fun c -> c#as_proxy_resolver) proxy_resolver
        in
        Raw.Socket_client.set_proxy_resolver obj proxy_resolver

    method set_socket_type : Enums.sockettype -> unit =
      fun type_ -> Raw.Socket_client.set_socket_type obj type_

    method set_timeout : int -> unit =
      fun timeout -> Raw.Socket_client.set_timeout obj timeout

    method set_tls : bool -> unit = fun tls -> Raw.Socket_client.set_tls obj tls

    method set_tls_validation_flags : Enums.tlscertificateflags -> unit =
      fun flags -> Raw.Socket_client.set_tls_validation_flags obj flags

    method type_ = Raw.Socket_client.get_type obj
    method set_type v = Raw.Socket_client.set_type obj v
    method as_socket_client = obj
  end

let new_ () : socket_client_t = new socket_client (Raw.Socket_client.new_ ())
