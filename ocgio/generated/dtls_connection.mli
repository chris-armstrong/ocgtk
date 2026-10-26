class type dtls_connection_t = object
  method on_accept_certificate :
    ?after:bool ->
    callback:
      (peer_cert:Tls_certificate.tls_certificate_t ->
      errors:Enums.tlscertificateflags ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id

  method close : Cancellable.cancellable_t option -> (bool, GError.t) result
  method close_finish : Async_result.async_result_t -> (bool, GError.t) result

  method emit_accept_certificate :
    Tls_certificate.tls_certificate_t -> Enums.tlscertificateflags -> bool

  method get_certificate : unit -> Tls_certificate.tls_certificate_t option
  method get_ciphersuite_name : unit -> string option

  method get_database :
    unit ->
    Tls_connection_and__tls_database_and__tls_interaction.tls_database_t option

  method get_interaction :
    unit ->
    Tls_connection_and__tls_database_and__tls_interaction.tls_interaction_t
    option

  method get_negotiated_protocol : unit -> string option
  method get_peer_certificate : unit -> Tls_certificate.tls_certificate_t option
  method get_peer_certificate_errors : unit -> Enums.tlscertificateflags
  method get_protocol_version : unit -> Enums.tlsprotocolversion
  method get_rehandshake_mode : unit -> Enums.tlsrehandshakemode
  method get_require_close_notify : unit -> bool
  method handshake : Cancellable.cancellable_t option -> (bool, GError.t) result

  method handshake_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method set_advertised_protocols : string array option -> unit
  method set_certificate : Tls_certificate.tls_certificate_t -> unit

  method set_database :
    Tls_connection_and__tls_database_and__tls_interaction.tls_database_t option ->
    unit

  method set_interaction :
    Tls_connection_and__tls_database_and__tls_interaction.tls_interaction_t
    option ->
    unit

  method set_rehandshake_mode : Enums.tlsrehandshakemode -> unit
  method set_require_close_notify : bool -> unit

  method shutdown :
    bool -> bool -> Cancellable.cancellable_t option -> (bool, GError.t) result

  method shutdown_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method base_socket : Datagram_based.datagram_based_t
  method as_dtls_connection : Raw.Dtls_connection.t
end

class dtls_connection : Raw.Dtls_connection.t -> dtls_connection_t
