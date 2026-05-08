class type dtls_connection_t = object
  method close : GCancellable.cancellable_t option -> (bool, GError.t) result
  method close_finish : GAsync_result.async_result_t -> (bool, GError.t) result

  method emit_accept_certificate :
    GTls_certificate.tls_certificate_t -> Gio_enums.tlscertificateflags -> bool

  method get_certificate : unit -> GTls_certificate.tls_certificate_t option
  method get_ciphersuite_name : unit -> string option

  method get_database :
    unit ->
    GTls_connection_and__tls_database_and__tls_interaction.tls_database_t option

  method get_interaction :
    unit ->
    GTls_connection_and__tls_database_and__tls_interaction.tls_interaction_t
    option

  method get_negotiated_protocol : unit -> string option

  method get_peer_certificate :
    unit -> GTls_certificate.tls_certificate_t option

  method get_peer_certificate_errors : unit -> Gio_enums.tlscertificateflags
  method get_protocol_version : unit -> Gio_enums.tlsprotocolversion
  method get_rehandshake_mode : unit -> Gio_enums.tlsrehandshakemode
  method get_require_close_notify : unit -> bool

  method handshake :
    GCancellable.cancellable_t option -> (bool, GError.t) result

  method handshake_finish :
    GAsync_result.async_result_t -> (bool, GError.t) result

  method set_advertised_protocols : string array option -> unit
  method set_certificate : GTls_certificate.tls_certificate_t -> unit

  method set_database :
    GTls_connection_and__tls_database_and__tls_interaction.tls_database_t option ->
    unit

  method set_interaction :
    GTls_connection_and__tls_database_and__tls_interaction.tls_interaction_t
    option ->
    unit

  method set_rehandshake_mode : Gio_enums.tlsrehandshakemode -> unit
  method set_require_close_notify : bool -> unit

  method shutdown :
    bool -> bool -> GCancellable.cancellable_t option -> (bool, GError.t) result

  method shutdown_finish :
    GAsync_result.async_result_t -> (bool, GError.t) result

  method base_socket : GDatagram_based.datagram_based_t
  method as_dtls_connection : Dtls_connection.t
end

class dtls_connection : Dtls_connection.t -> dtls_connection_t
