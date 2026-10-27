(** The classes of {!Ocgio.Tls_connection}, {!Ocgio.Tls_database},
    {!Ocgio.Tls_interaction}, defined together because they refer to each other.
    Each has a module of its own that re-exports it; use that module rather than
    this one. *)

(** The methods, signals and properties of a [GTlsConnection]. *)
class type tls_connection_t = object
  inherit Io_stream.io_stream_t

  method on_accept_certificate :
    ?after:bool ->
    callback:
      (peer_cert:Tls_certificate.tls_certificate_t ->
      errors:Enums.tlscertificateflags ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted during the TLS handshake after the peer certificate has been
      received. You can examine [peer_cert]'s certification path by calling
      g_tls_certificate_get_issuer() on it.

      For a client-side connection, [peer_cert] is the server's certificate, and
      the signal will only be emitted if the certificate was not acceptable
      according to [conn]'s [GTlsClientConnection:validation_flags]. If you
      would like the certificate to be accepted despite [errors], return [TRUE]
      from the signal handler. Otherwise, if no handler accepts the certificate,
      the handshake will fail with [G_TLS_ERROR_BAD_CERTIFICATE].

      GLib guarantees that if certificate verification fails, this signal will
      be emitted with at least one error will be set in [errors], but it does
      not guarantee that all possible errors will be set. Accordingly, you may
      not safely decide to ignore any particular type of error. For example, it
      would be incorrect to ignore [G_TLS_CERTIFICATE_EXPIRED] if you want to
      allow expired certificates, because this could potentially be the only
      error flag set even if other problems exist with the certificate.

      For a server-side connection, [peer_cert] is the certificate presented by
      the client, if this was requested via the server's
      [GTlsServerConnection:authentication_mode]. On the server side, the signal
      is always emitted when the client presents a certificate, and the
      certificate will only be accepted if a handler returns [TRUE].

      Note that if this signal is emitted as part of asynchronous I/O in the
      main thread, then you should not attempt to interact with the user before
      returning from the signal handler. If you want to let the user decide
      whether or not to accept the certificate, you would have to return [FALSE]
      from the signal handler on the first attempt, and then after the
      connection attempt returns a [G_TLS_ERROR_BAD_CERTIFICATE], you can
      interact with the user, and if the user decides to accept the certificate,
      remember that fact, create a new connection, and return [TRUE] from the
      signal handler the next time.

      If you are doing I/O in another thread, you do not need to worry about
      this, and can simply block in the signal handler until the UI thread
      returns an answer. *)

  method emit_accept_certificate :
    Tls_certificate.tls_certificate_t -> Enums.tlscertificateflags -> bool
  (** Used by [GTlsConnection] implementations to emit the
      [GTlsConnection::accept]-certificate signal. *)

  method get_certificate : unit -> Tls_certificate.tls_certificate_t option
  (** Gets [conn]'s certificate, as set by g_tls_connection_set_certificate().
  *)

  method get_ciphersuite_name : unit -> string option
  (** Returns the name of the current TLS ciphersuite, or [NULL] if the
      connection has not handshaked or has been closed. Beware that the TLS
      backend may use any of multiple different naming conventions, because
      OpenSSL and GnuTLS have their own ciphersuite naming conventions that are
      different from each other and different from the standard, IANA-
      registered ciphersuite names. The ciphersuite name is intended to be
      displayed to the user for informative purposes only, and parsing it is not
      recommended. *)

  method get_database : unit -> tls_database_t option
  (** Gets the certificate database that [conn] uses to verify peer
      certificates. See g_tls_connection_set_database(). *)

  method get_interaction : unit -> tls_interaction_t option
  (** Get the object that will be used to interact with the user. It will be
      used for things like prompting the user for passwords. If [NULL] is
      returned, then no user interaction will occur for this connection. *)

  method get_negotiated_protocol : unit -> string option
  (** Gets the name of the application-layer protocol negotiated during the
      handshake.

      If the peer did not use the ALPN extension, or did not advertise a
      protocol that matched one of [conn]'s protocols, or the TLS backend does
      not support ALPN, then this will be [NULL]. See
      g_tls_connection_set_advertised_protocols(). *)

  method get_peer_certificate : unit -> Tls_certificate.tls_certificate_t option
  (** Gets [conn]'s peer's certificate after the handshake has completed or
      failed. (It is not set during the emission of
      [GTlsConnection::accept]-certificate.) *)

  method get_peer_certificate_errors : unit -> Enums.tlscertificateflags
  (** Gets the errors associated with validating [conn]'s peer's certificate,
      after the handshake has completed or failed. (It is not set during the
      emission of [GTlsConnection::accept]-certificate.)

      See [GTlsConnection:peer]-certificate-errors for more information. *)

  method get_protocol_version : unit -> Enums.tlsprotocolversion
  (** Returns the current TLS protocol version, which may be
      [G_TLS_PROTOCOL_VERSION_UNKNOWN] if the connection has not handshaked, or
      has been closed, or if the TLS backend has implemented a protocol version
      that is not a recognized [GTlsProtocolVersion]. *)

  method get_rehandshake_mode : unit -> Enums.tlsrehandshakemode
  (** Gets [conn] rehandshaking mode. See
      g_tls_connection_set_rehandshake_mode() for details. *)

  method get_require_close_notify : unit -> bool
  (** Tests whether or not [conn] expects a proper TLS close notification when
      the connection is closed. See g_tls_connection_set_require_close_notify()
      for details. *)

  method get_use_system_certdb : unit -> bool
  (** Gets whether [conn] uses the system certificate database to verify peer
      certificates. See g_tls_connection_set_use_system_certdb(). *)

  method handshake : Cancellable.cancellable_t option -> (bool, GError.t) result
  [@@ocaml.doc
    "Attempts a TLS handshake on [conn].\n\n\
     On the client side, it is never necessary to call this method;\n\
     although the connection needs to perform a handshake after\n\
     connecting (or after sending a \"STARTTLS\"-type command),\n\
     [GTlsConnection] will handle this for you automatically when you try\n\
     to send or receive data on the connection. You can call\n\
     g_tls_connection_handshake() manually if you want to know whether\n\
     the initial handshake succeeded or failed (as opposed to just\n\
     immediately trying to use [conn] to read or write, in which case,\n\
     if it fails, it may not be possible to tell if it failed before or\n\
     after completing the handshake), but beware that servers may reject\n\
     client authentication after the handshake has completed, so a\n\
     successful handshake does not indicate the connection will be usable.\n\n\
     Likewise, on the server side, although a handshake is necessary at\n\
     the beginning of the communication, you do not need to call this\n\
     function explicitly unless you want clearer error reporting.\n\n\
     Previously, calling g_tls_connection_handshake() after the initial\n\
     handshake would trigger a rehandshake; however, this usage was\n\
     deprecated in GLib 2.60 because rehandshaking was removed from the\n\
     TLS protocol in TLS 1.3. Since GLib 2.64, calling this function after\n\
     the initial handshake will no longer do anything.\n\n\
     When using a [GTlsConnection] created by [GSocketClient], the\n\
     [GSocketClient] performs the initial handshake, so calling this\n\
     function manually is not recommended.\n\n\
     [GTlsConnection::accept_certificate] may be emitted during the\n\
     handshake."]

  method handshake_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finish an asynchronous TLS handshake operation. See
      g_tls_connection_handshake() for more information. *)

  method set_advertised_protocols : string array option -> unit
  (** Sets the list of application-layer protocols to advertise that the caller
      is willing to speak on this connection. The Application-Layer Protocol
      Negotiation (ALPN) extension will be used to negotiate a compatible
      protocol with the peer; use g_tls_connection_get_negotiated_protocol() to
      find the negotiated protocol after the handshake. Specifying [NULL] for
      the the value of [protocols] will disable ALPN negotiation.

      See
      {{:https://www.iana.org/assignments/tls-extensiontype-values/tls-extensiontype-values.xhtml#alpn-protocol-ids}IANA
       TLS ALPN Protocol IDs} for a list of registered protocol IDs. *)

  method set_certificate : Tls_certificate.tls_certificate_t -> unit
  (** This sets the certificate that [conn] will present to its peer during the
      TLS handshake. For a [GTlsServerConnection], it is mandatory to set this,
      and that will normally be done at construct time.

      For a [GTlsClientConnection], this is optional. If a handshake fails with
      [G_TLS_ERROR_CERTIFICATE_REQUIRED], that means that the server requires a
      certificate, and if you try connecting again, you should call this method
      first. You can call g_tls_client_connection_get_accepted_cas() on the
      failed connection to get a list of Certificate Authorities that the server
      will accept certificates from.

      (It is also possible that a server will allow the connection with or
      without a certificate; in that case, if you don't provide a certificate,
      you can tell that the server requested one by the fact that
      g_tls_client_connection_get_accepted_cas() will return non-[NULL].) *)

  method set_database : tls_database_t option -> unit
  (** Sets the certificate database that is used to verify peer certificates.
      This is set to the default database by default. See
      g_tls_backend_get_default_database(). If set to [NULL], then peer
      certificate validation will always set the [G_TLS_CERTIFICATE_UNKNOWN_CA]
      error (meaning [GTlsConnection::accept]-certificate will always be emitted
      on client-side connections, unless that bit is not set in
      [GTlsClientConnection:validation]-flags).

      There are nonintuitive security implications when using a non-default
      database. See [GTlsConnection:database] for details. *)

  method set_interaction : tls_interaction_t option -> unit
  (** Set the object that will be used to interact with the user. It will be
      used for things like prompting the user for passwords.

      The [interaction] argument will normally be a derived subclass of
      [GTlsInteraction]. [NULL] can also be provided if no user interaction
      should occur for this connection. *)

  method set_rehandshake_mode : Enums.tlsrehandshakemode -> unit
  (** Since GLib 2.64, changing the rehandshake mode is no longer supported and
      will have no effect. With TLS 1.3, rehandshaking has been removed from the
      TLS protocol, replaced by separate post-handshake authentication and rekey
      operations. *)

  method set_require_close_notify : bool -> unit
  [@@ocaml.doc
    "Sets whether or not [conn] expects a proper TLS close notification\n\
     before the connection is closed. If this is [TRUE] (the default),\n\
     then [conn] will expect to receive a TLS close notification from its\n\
     peer before the connection is closed, and will return a\n\
     [G_TLS_ERROR_EOF] error if the connection is closed without proper\n\
     notification (since this may indicate a network error, or\n\
     man-in-the-middle attack).\n\n\
     In some protocols, the application will know whether or not the\n\
     connection was closed cleanly based on application-level data\n\
     (because the application-level data includes a length field, or is\n\
     somehow self-delimiting); in this case, the close notify is\n\
     redundant and sometimes omitted. (TLS 1.1 explicitly allows this;\n\
     in TLS 1.0 it is technically an error, but often done anyway.) You\n\
     can use g_tls_connection_set_require_close_notify() to tell [conn]\n\
     to allow an \"unannounced\" connection close, in which case the close\n\
     will show up as a 0-length read, as in a non-TLS\n\
     [GSocketConnection], and it is up to the application to check that\n\
     the data has been fully received.\n\n\
     Note that this only affects the behavior when the peer closes the\n\
     connection; when the application calls g_io_stream_close() itself\n\
     on [conn], this will send a close notification regardless of the\n\
     setting of this property. If you explicitly want to do an unclean\n\
     close, you can close [conn]'s [GTlsConnection:base]-io-stream rather\n\
     than closing [conn] itself, but note that this may only be done when no \
     other\n\
     operations are pending on [conn] or the base I/O stream."]

  method set_use_system_certdb : bool -> unit
  (** Sets whether [conn] uses the system certificate database to verify peer
      certificates. This is [TRUE] by default. If set to [FALSE], then peer
      certificate validation will always set the [G_TLS_CERTIFICATE_UNKNOWN_CA]
      error (meaning [GTlsConnection::accept]-certificate will always be emitted
      on client-side connections, unless that bit is not set in
      [GTlsClientConnection:validation]-flags). *)

  method base_io_stream : Io_stream.io_stream_t
  method as_tls_connection : Raw.Tls_connection.t
end

(** The methods, signals and properties of a [GTlsDatabase]. *)
and tls_database_t = object
  method create_certificate_handle :
    Tls_certificate.tls_certificate_t -> string option
  (** Create a handle string for the certificate. The database will only be able
      to create a handle for certificates that originate from the database. In
      cases where the database cannot create a handle for a certificate, [NULL]
      will be returned.

      This handle should be stable across various instances of the application,
      and between applications. If a certificate is modified in the database,
      then it is not guaranteed that this handle will continue to point to it.
  *)

  method lookup_certificate_for_handle :
    string ->
    tls_interaction_t option ->
    Enums.tlsdatabaselookupflags ->
    Cancellable.cancellable_t option ->
    (Tls_certificate.tls_certificate_t option, GError.t) result
  (** Look up a certificate by its handle.

      The handle should have been created by calling
      g_tls_database_create_certificate_handle() on a [GTlsDatabase] object of
      the same TLS backend. The handle is designed to remain valid across
      instantiations of the database.

      If the handle is no longer valid, or does not point to a certificate in
      this database, then [NULL] will be returned.

      This function can block, use
      g_tls_database_lookup_certificate_for_handle_async() to perform the lookup
      operation asynchronously. *)

  method lookup_certificate_for_handle_finish :
    Async_result.async_result_t ->
    (Tls_certificate.tls_certificate_t, GError.t) result
  (** Finish an asynchronous lookup of a certificate by its handle. See
      g_tls_database_lookup_certificate_for_handle() for more information.

      If the handle is no longer valid, or does not point to a certificate in
      this database, then [NULL] will be returned. *)

  method lookup_certificate_issuer :
    Tls_certificate.tls_certificate_t ->
    tls_interaction_t option ->
    Enums.tlsdatabaselookupflags ->
    Cancellable.cancellable_t option ->
    (Tls_certificate.tls_certificate_t, GError.t) result
  (** Look up the issuer of [certificate] in the database. The
      [GTlsCertificate:issuer] property of [certificate] is not modified, and
      the two certificates are not hooked into a chain.

      This function can block. Use
      g_tls_database_lookup_certificate_issuer_async() to perform the lookup
      operation asynchronously.

      Beware this function cannot be used to build certification paths. The
      issuer certificate returned by this function may not be the same as the
      certificate that would actually be used to construct a valid certification
      path during certificate verification.
      {{:https://datatracker.ietf.org/doc/html/rfc4158}RFC 4158} explains why an
      issuer certificate cannot be naively assumed to be part of the the
      certification path (though GLib's TLS backends may not follow the path
      building strategies outlined in this RFC). Due to the complexity of
      certification path building, GLib does not provide any way to know which
      certification path will actually be used when verifying a TLS certificate.
      Accordingly, this function cannot be used to make security-related
      decisions. Only GLib itself should make security decisions about TLS
      certificates. *)

  method lookup_certificate_issuer_finish :
    Async_result.async_result_t ->
    (Tls_certificate.tls_certificate_t, GError.t) result
  (** Finish an asynchronous lookup issuer operation. See
      g_tls_database_lookup_certificate_issuer() for more information. *)

  method lookup_certificates_issued_by_finish :
    Async_result.async_result_t ->
    (Tls_certificate.tls_certificate_t list, GError.t) result
  (** Finish an asynchronous lookup of certificates. See
      g_tls_database_lookup_certificates_issued_by() for more information. *)

  method verify_chain :
    Tls_certificate.tls_certificate_t ->
    string ->
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t
    option ->
    tls_interaction_t option ->
    Enums.tlsdatabaseverifyflags ->
    Cancellable.cancellable_t option ->
    (Enums.tlscertificateflags, GError.t) result
  (** Determines the validity of a certificate chain, outside the context of a
      TLS session.

      [chain] is a chain of [GTlsCertificate] objects each pointing to the next
      certificate in the chain by its [GTlsCertificate:issuer] property.

      [purpose] describes the purpose (or usage) for which the certificate is
      being used. Typically [purpose] will be set to
      [G_TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER] which means that the
      certificate is being used to authenticate a server (and we are acting as
      the client).

      The [identity] is used to ensure the server certificate is valid for the
      expected peer identity. If the identity does not match the certificate,
      [G_TLS_CERTIFICATE_BAD_IDENTITY] will be set in the return value. If
      [identity] is [NULL], that bit will never be set in the return value. The
      peer identity may also be used to check for pinned certificates (trust
      exceptions) in the database. These may override the normal verification
      process on a host-by-host basis.

      Currently there are no [flags], and [G_TLS_DATABASE_VERIFY_NONE] should be
      used.

      If [chain] is found to be valid, then the return value will be 0. If
      [chain] is found to be invalid, then the return value will indicate at
      least one problem found. If the function is unable to determine whether
      [chain] is valid (for example, because [cancellable] is triggered before
      it completes) then the return value will be
      [G_TLS_CERTIFICATE_GENERIC_ERROR] and [error] will be set accordingly.
      [error] is not set when [chain] is successfully analyzed but found to be
      invalid.

      GLib guarantees that if certificate verification fails, at least one error
      will be set in the return value, but it does not guarantee that all
      possible errors will be set. Accordingly, you may not safely decide to
      ignore any particular type of error. For example, it would be incorrect to
      mask [G_TLS_CERTIFICATE_EXPIRED] if you want to allow expired
      certificates, because this could potentially be the only error flag set
      even if other problems exist with the certificate.

      Prior to GLib 2.48, GLib's default TLS backend modified [chain] to
      represent the certification path built by [GTlsDatabase] during
      certificate verification by adjusting the [GTlsCertificate:issuer]
      property of each certificate in [chain]. Since GLib 2.48, this no longer
      occurs, so you cannot rely on [GTlsCertificate:issuer] to represent the
      actual certification path used during certificate verification.

      Because TLS session context is not used, [GTlsDatabase] may not perform as
      many checks on the certificates as [GTlsConnection] would. For example,
      certificate constraints may not be honored, and revocation checks may not
      be performed. The best way to verify TLS certificates used by a TLS
      connection is to let [GTlsConnection] handle the verification.

      The TLS backend may attempt to look up and add missing certificates to the
      chain. This may involve HTTP requests to download missing certificates.

      This function can block. Use g_tls_database_verify_chain_async() to
      perform the verification operation asynchronously. *)

  method verify_chain_finish :
    Async_result.async_result_t -> (Enums.tlscertificateflags, GError.t) result
  (** Finish an asynchronous verify chain operation. See
      g_tls_database_verify_chain() for more information.

      If [chain] is found to be valid, then the return value will be 0. If
      [chain] is found to be invalid, then the return value will indicate the
      problems found. If the function is unable to determine whether [chain] is
      valid or not (eg, because [cancellable] is triggered before it completes)
      then the return value will be [G_TLS_CERTIFICATE_GENERIC_ERROR] and
      [error] will be set accordingly. [error] is not set when [chain] is
      successfully analyzed but found to be invalid. *)

  method as_tls_database : Raw.Tls_database.t
end

(** The methods, signals and properties of a [GTlsInteraction]. *)
and tls_interaction_t = object
  method ask_password :
    Tls_password.tls_password_t ->
    Cancellable.cancellable_t option ->
    (Enums.tlsinteractionresult, GError.t) result
  (** Run synchronous interaction to ask the user for a password. In general,
      g_tls_interaction_invoke_ask_password() should be used instead of this
      function.

      Derived subclasses usually implement a password prompt, although they may
      also choose to provide a password from elsewhere. The [password] value
      will be filled in and then [callback] will be called. Alternatively the
      user may abort this password request, which will usually abort the TLS
      connection.

      If the interaction is cancelled by the cancellation object, or by the user
      then [G_TLS_INTERACTION_FAILED] will be returned with an error that
      contains a [G_IO_ERROR_CANCELLED] error code. Certain implementations may
      not support immediate cancellation. *)

  method ask_password_finish :
    Async_result.async_result_t -> (Enums.tlsinteractionresult, GError.t) result
  (** Complete an ask password user interaction request. This should be once the
      g_tls_interaction_ask_password_async() completion callback is called.

      If [G_TLS_INTERACTION_HANDLED] is returned, then the [GTlsPassword] passed
      to g_tls_interaction_ask_password() will have its password filled in.

      If the interaction is cancelled by the cancellation object, or by the user
      then [G_TLS_INTERACTION_FAILED] will be returned with an error that
      contains a [G_IO_ERROR_CANCELLED] error code. *)

  method invoke_ask_password :
    Tls_password.tls_password_t ->
    Cancellable.cancellable_t option ->
    (Enums.tlsinteractionresult, GError.t) result
  (** Invoke the interaction to ask the user for a password. It invokes this
      interaction in the main loop, specifically the [GMainContext] returned by
      g_main_context_get_thread_default() when the interaction is created. This
      is called by called by [GTlsConnection] or [GTlsDatabase] to ask the user
      for a password.

      Derived subclasses usually implement a password prompt, although they may
      also choose to provide a password from elsewhere. The [password] value
      will be filled in and then [callback] will be called. Alternatively the
      user may abort this password request, which will usually abort the TLS
      connection.

      The implementation can either be a synchronous (eg: modal dialog) or an
      asynchronous one (eg: modeless dialog). This function will take care of
      calling which ever one correctly.

      If the interaction is cancelled by the cancellation object, or by the user
      then [G_TLS_INTERACTION_FAILED] will be returned with an error that
      contains a [G_IO_ERROR_CANCELLED] error code. Certain implementations may
      not support immediate cancellation. *)

  method invoke_request_certificate :
    tls_connection_t ->
    Enums.tlscertificaterequestflags ->
    Cancellable.cancellable_t option ->
    (Enums.tlsinteractionresult, GError.t) result
  (** Invoke the interaction to ask the user to choose a certificate to use with
      the connection. It invokes this interaction in the main loop, specifically
      the [GMainContext] returned by g_main_context_get_thread_default() when
      the interaction is created. This is called by called by [GTlsConnection]
      when the peer requests a certificate during the handshake.

      Derived subclasses usually implement a certificate selector, although they
      may also choose to provide a certificate from elsewhere. Alternatively the
      user may abort this certificate request, which may or may not abort the
      TLS connection.

      The implementation can either be a synchronous (eg: modal dialog) or an
      asynchronous one (eg: modeless dialog). This function will take care of
      calling which ever one correctly.

      If the interaction is cancelled by the cancellation object, or by the user
      then [G_TLS_INTERACTION_FAILED] will be returned with an error that
      contains a [G_IO_ERROR_CANCELLED] error code. Certain implementations may
      not support immediate cancellation. *)

  method request_certificate :
    tls_connection_t ->
    Enums.tlscertificaterequestflags ->
    Cancellable.cancellable_t option ->
    (Enums.tlsinteractionresult, GError.t) result
  (** Run synchronous interaction to ask the user to choose a certificate to use
      with the connection. In general,
      g_tls_interaction_invoke_request_certificate() should be used instead of
      this function.

      Derived subclasses usually implement a certificate selector, although they
      may also choose to provide a certificate from elsewhere. Alternatively the
      user may abort this certificate request, which will usually abort the TLS
      connection.

      If [G_TLS_INTERACTION_HANDLED] is returned, then the [GTlsConnection]
      passed to g_tls_interaction_request_certificate() will have had its
      [GTlsConnection:certificate] filled in.

      If the interaction is cancelled by the cancellation object, or by the user
      then [G_TLS_INTERACTION_FAILED] will be returned with an error that
      contains a [G_IO_ERROR_CANCELLED] error code. Certain implementations may
      not support immediate cancellation. *)

  method request_certificate_finish :
    Async_result.async_result_t -> (Enums.tlsinteractionresult, GError.t) result
  (** Complete a request certificate user interaction request. This should be
      once the g_tls_interaction_request_certificate_async() completion callback
      is called.

      If [G_TLS_INTERACTION_HANDLED] is returned, then the [GTlsConnection]
      passed to g_tls_interaction_request_certificate_async() will have had its
      [GTlsConnection:certificate] filled in.

      If the interaction is cancelled by the cancellation object, or by the user
      then [G_TLS_INTERACTION_FAILED] will be returned with an error that
      contains a [G_IO_ERROR_CANCELLED] error code. *)

  method as_tls_interaction : Raw.Tls_interaction.t
end

(** Wraps a layer 1 handle, {!Ocgio.Raw.Tls_connection.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GTlsConnection], give one already wrapped. *)
class tls_connection : Raw.Tls_connection.t -> tls_connection_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Tls_database.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GTlsDatabase], give one already wrapped. *)

and tls_database : Raw.Tls_database.t -> tls_database_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Tls_interaction.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GTlsInteraction], give one already wrapped. *)

and tls_interaction : Raw.Tls_interaction.t -> tls_interaction_t
