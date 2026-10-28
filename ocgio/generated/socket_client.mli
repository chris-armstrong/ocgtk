(** [GSocketClient] is a lightweight high-level utility class for connecting to
    a network host using a connection oriented socket type.

    Its methods, signals and properties are on {!class-type-socket_client_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Socket_client}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [SocketClient].}

    Inherits from: [GObject.Object]

    [GSocketClient] is a lightweight high-level utility class for connecting to
    a network host using a connection oriented socket type.

    You create a [GSocketClient] object, set any options you want, and then call
    a sync or async connect operation, which returns a [Gio.SocketConnection]
    subclass on success.

    The type of the [Gio.SocketConnection] object returned depends on the type
    of the underlying socket that is in use. For instance, for a TCP/IP
    connection it will be a [Gio.TcpConnection].

    As [GSocketClient] is a lightweight object, you don't need to cache it. You
    can just create a new one any time you need one. *)
class type socket_client_t = object
  (** {2:signals Signals} *)

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
  (** Emitted when [client]'s activity on [connectable] changes state. Among
      other things, this can be used to provide progress information about a
      network connection in the UI. The meanings of the different [event] values
      are as follows:

      - [G_SOCKET_CLIENT_RESOLVING]: [client] is about to look up [connectable]
        in DNS. [connection] will be [NULL].

      - [G_SOCKET_CLIENT_RESOLVED]: [client] has successfully resolved
        [connectable] in DNS. [connection] will be [NULL].

      - [G_SOCKET_CLIENT_CONNECTING]: [client] is about to make a connection to
        a remote host; either a proxy server or the destination server itself.
        [connection] is the [GSocketConnection], which is not yet connected.
        Since GLib 2.40, you can access the remote address via
        g_socket_connection_get_remote_address().

      - [G_SOCKET_CLIENT_CONNECTED]: [client] has successfully connected to a
        remote host. [connection] is the connected [GSocketConnection].

      - [G_SOCKET_CLIENT_PROXY_NEGOTIATING]: [client] is about to negotiate with
        a proxy to get it to connect to [connectable]. [connection] is the
        [GSocketConnection] to the proxy server.

      - [G_SOCKET_CLIENT_PROXY_NEGOTIATED]: [client] has negotiated a connection
        to [connectable] through a proxy server. [connection] is the stream
        returned from g_proxy_connect(), which may or may not be a
        [GSocketConnection].

      - [G_SOCKET_CLIENT_TLS_HANDSHAKING]: [client] is about to begin a TLS
        handshake. [connection] is a [GTlsClientConnection].

      - [G_SOCKET_CLIENT_TLS_HANDSHAKED]: [client] has successfully completed
        the TLS handshake. [connection] is a [GTlsClientConnection].

      - [G_SOCKET_CLIENT_COMPLETE]: [client] has either successfully connected
        to [connectable] (in which case [connection] is the [GSocketConnection]
        that it will be returning to the caller) or has failed (in which case
        [connection] is [NULL] and the client is about to return an error).

      Each event except [G_SOCKET_CLIENT_COMPLETE] may be emitted multiple times
      (or not at all) for a given connectable (in particular, if [client] ends
      up attempting to connect to more than one address). However, if [client]
      emits the [GSocketClient::event] signal at all for a given connectable,
      then it will always emit it with [G_SOCKET_CLIENT_COMPLETE] when it is
      done.

      Note that there may be additional [GSocketClientEvent] values in the
      future; unrecognized [event] values should be ignored. *)

  (** {2:methods Methods} *)

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

  (** {2:properties Properties} *)

  method type_ : Enums.sockettype
  (** The type to use for socket construction. *)

  method set_type : Enums.sockettype -> unit
  (** The type to use for socket construction. *)

  (** {2:conversions Conversions} *)

  method as_socket_client : Raw.Socket_client.t
end

class socket_client : Raw.Socket_client.t -> socket_client_t
(** Wraps a raw handle of {!Ocgio.Raw.Socket_client.t}. *)

(** {1:description Description}

    [GSocketClient] is a lightweight high-level utility class for connecting to
    a network host using a connection oriented socket type.

    You create a [GSocketClient] object, set any options you want, and then call
    a sync or async connect operation, which returns a [Gio.SocketConnection]
    subclass on success.

    The type of the [Gio.SocketConnection] object returned depends on the type
    of the underlying socket that is in use. For instance, for a TCP/IP
    connection it will be a [Gio.TcpConnection].

    As [GSocketClient] is a lightweight object, you don't need to cache it. You
    can just create a new one any time you need one. *)

(** {1:constructors Constructors} *)

val new_ : unit -> socket_client_t
(** Creates a new [GSocketClient] with the default options. *)
