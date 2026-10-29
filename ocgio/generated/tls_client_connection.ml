class type tls_client_connection_t = object
  (** {2:methods Methods} *)

  method copy_session_state : tls_client_connection_t -> unit
  (** Possibly copies session state from one connection to another, for use in
      TLS session resumption. This is not normally needed, but may be used when
      the same session needs to be used between different endpoints, as is
      required by some protocols, such as FTP over TLS. [source] should have
      already completed a handshake and, since TLS 1.3, it should have been used
      to read data at least once. [conn] should not have completed a handshake.

      It is not possible to know whether a call to this function will actually
      do anything. Because session resumption is normally used only for
      performance benefit, the TLS backend might not implement this function.
      Even if implemented, it may not actually succeed in allowing [conn] to
      resume [source]'s TLS session, because the server may not have sent a
      session resumption token to [source], or it may refuse to accept the token
      from [conn]. There is no way to know whether a call to this function is
      actually successful.

      Using this function is not required to benefit from session resumption. If
      the TLS backend supports session resumption, the session will be resumed
      automatically if it is possible to do so without weakening the privacy
      guarantees normally provided by TLS, without need to call this function.
      For example, with TLS 1.3, a session ticket will be automatically copied
      from any [GTlsClientConnection] that has previously received session
      tickets from the server, provided a ticket is available that has not
      previously been used for session resumption, since session ticket reuse
      would be a privacy weakness. Using this function causes the ticket to be
      copied without regard for privacy considerations. *)

  method get_server_identity :
    unit -> Socket_connectable.socket_connectable_t option
  (** Gets [conn]'s expected server identity *)

  method get_use_ssl3 : unit -> bool
  (** SSL 3.0 is no longer supported. See g_tls_client_connection_set_use_ssl3()
      for details. *)

  method get_validation_flags : unit -> Enums.tlscertificateflags
  (** Gets [conn]'s validation flags

      This function does not work as originally designed and is impossible to
      use correctly. See [GTlsClientConnection:validation]-flags for more
      information. *)

  method set_server_identity : Socket_connectable.socket_connectable_t -> unit
  (** Sets [conn]'s expected server identity, which is used both to tell servers
      on virtual hosts which certificate to present, and also to let [conn] know
      what name to look for in the certificate when performing
      [G_TLS_CERTIFICATE_BAD_IDENTITY] validation, if enabled. *)

  method set_use_ssl3 : bool -> unit
  (** Since GLib 2.42.1, SSL 3.0 is no longer supported.

      From GLib 2.42.1 through GLib 2.62, this function could be used to force
      use of TLS 1.0, the lowest-supported TLS protocol version at the time. In
      the past, this was needed to connect to broken TLS servers that exhibited
      protocol version intolerance. Such servers are no longer common, and using
      TLS 1.0 is no longer considered acceptable.

      Since GLib 2.64, this function does nothing. *)

  method set_validation_flags : Enums.tlscertificateflags -> unit
  (** Sets [conn]'s validation flags, to override the default set of checks
      performed when validating a server certificate. By default,
      [G_TLS_CERTIFICATE_VALIDATE_ALL] is used.

      This function does not work as originally designed and is impossible to
      use correctly. See [GTlsClientConnection:validation]-flags for more
      information. *)

  (** {2:conversions Conversions} *)

  method as_tls_client_connection : Raw.Tls_client_connection.t
end

(* High-level class for TlsClientConnection *)
class tls_client_connection (obj : Raw.Tls_client_connection.t) :
  tls_client_connection_t =
  object (self)
    method copy_session_state : tls_client_connection_t -> unit =
      fun source ->
        let source = source#as_tls_client_connection in
        Raw.Tls_client_connection.copy_session_state obj source

    method get_server_identity :
        unit -> Socket_connectable.socket_connectable_t option =
      fun () ->
        Option.map
          (fun ret -> new Socket_connectable.socket_connectable ret)
          (Raw.Tls_client_connection.get_server_identity obj)

    method get_use_ssl3 : unit -> bool =
      fun () -> Raw.Tls_client_connection.get_use_ssl3 obj

    method get_validation_flags : unit -> Enums.tlscertificateflags =
      fun () -> Raw.Tls_client_connection.get_validation_flags obj

    method set_server_identity : Socket_connectable.socket_connectable_t -> unit
        =
      fun identity ->
        let identity = identity#as_socket_connectable in
        Raw.Tls_client_connection.set_server_identity obj identity

    method set_use_ssl3 : bool -> unit =
      fun use_ssl3 -> Raw.Tls_client_connection.set_use_ssl3 obj use_ssl3

    method set_validation_flags : Enums.tlscertificateflags -> unit =
      fun flags -> Raw.Tls_client_connection.set_validation_flags obj flags

    method as_tls_client_connection = obj
  end
