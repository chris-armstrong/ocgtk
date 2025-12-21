class dtls_connection : Dtls_connection.t ->
  object
    inherit Gdtls_connection_signals.dtls_connection_signals
    method close : #GCancellable.cancellable option -> (bool, GError.t) result
    method get_certificate : unit -> GTls_certificate.tls_certificate option
    method get_ciphersuite_name : unit -> string option
    method get_database : unit -> GTls_connection_and__tls_database_and__tls_interaction.tls_database option
    method get_interaction : unit -> GTls_connection_and__tls_database_and__tls_interaction.tls_interaction option
    method get_negotiated_protocol : unit -> string option
    method get_peer_certificate : unit -> GTls_certificate.tls_certificate option
    method get_protocol_version : unit -> Gio_enums.tlsprotocolversion
    method get_rehandshake_mode : unit -> Gio_enums.tlsrehandshakemode
    method get_require_close_notify : unit -> bool
    method handshake : #GCancellable.cancellable option -> (bool, GError.t) result
    method set_certificate : #GTls_certificate.tls_certificate -> unit
    method set_database : #GTls_connection_and__tls_database_and__tls_interaction.tls_database option -> unit
    method set_interaction : #GTls_connection_and__tls_database_and__tls_interaction.tls_interaction option -> unit
    method set_rehandshake_mode : Gio_enums.tlsrehandshakemode -> unit
    method set_require_close_notify : bool -> unit
    method shutdown : bool -> bool -> #GCancellable.cancellable option -> (bool, GError.t) result
    method as_dtls_connection : Dtls_connection.t
  end

