class type tls_connection_t = object
  inherit GIo_stream.io_stream_t
  inherit Gtls_connection_signals.tls_connection_signals

  method emit_accept_certificate :
    GTls_certificate.tls_certificate_t -> Gio_enums.tlscertificateflags -> bool

  method get_certificate : unit -> GTls_certificate.tls_certificate_t option
  method get_ciphersuite_name : unit -> string option
  method get_database : unit -> tls_database_t option
  method get_interaction : unit -> tls_interaction_t option
  method get_negotiated_protocol : unit -> string option

  method get_peer_certificate :
    unit -> GTls_certificate.tls_certificate_t option

  method get_peer_certificate_errors : unit -> Gio_enums.tlscertificateflags
  method get_protocol_version : unit -> Gio_enums.tlsprotocolversion
  method get_rehandshake_mode : unit -> Gio_enums.tlsrehandshakemode
  method get_require_close_notify : unit -> bool
  method get_use_system_certdb : unit -> bool

  method handshake :
    GCancellable.cancellable_t option -> (bool, GError.t) result

  method handshake_finish :
    GAsync_result.async_result_t -> (bool, GError.t) result

  method set_advertised_protocols : string array option -> unit
  method set_certificate : GTls_certificate.tls_certificate_t -> unit
  method set_database : tls_database_t option -> unit
  method set_interaction : tls_interaction_t option -> unit
  method set_rehandshake_mode : Gio_enums.tlsrehandshakemode -> unit
  method set_require_close_notify : bool -> unit
  method set_use_system_certdb : bool -> unit
  method base_io_stream : GIo_stream.io_stream_t

  method as_tls_connection :
    Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.t
end

and tls_database_t = object
  method create_certificate_handle :
    GTls_certificate.tls_certificate_t -> string option

  method lookup_certificate_for_handle :
    string ->
    tls_interaction_t option ->
    Gio_enums.tlsdatabaselookupflags ->
    GCancellable.cancellable_t option ->
    (GTls_certificate.tls_certificate_t option, GError.t) result

  method lookup_certificate_for_handle_finish :
    GAsync_result.async_result_t ->
    (GTls_certificate.tls_certificate_t, GError.t) result

  method lookup_certificate_issuer :
    GTls_certificate.tls_certificate_t ->
    tls_interaction_t option ->
    Gio_enums.tlsdatabaselookupflags ->
    GCancellable.cancellable_t option ->
    (GTls_certificate.tls_certificate_t, GError.t) result

  method lookup_certificate_issuer_finish :
    GAsync_result.async_result_t ->
    (GTls_certificate.tls_certificate_t, GError.t) result

  method lookup_certificates_issued_by_finish :
    GAsync_result.async_result_t -> (Tls_certificate.t list, GError.t) result

  method verify_chain :
    GTls_certificate.tls_certificate_t ->
    string ->
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t
    option ->
    tls_interaction_t option ->
    Gio_enums.tlsdatabaseverifyflags ->
    GCancellable.cancellable_t option ->
    (Gio_enums.tlscertificateflags, GError.t) result

  method verify_chain_finish :
    GAsync_result.async_result_t ->
    (Gio_enums.tlscertificateflags, GError.t) result

  method as_tls_database :
    Tls_connection_and__tls_database_and__tls_interaction.Tls_database.t
end

and tls_interaction_t = object
  method ask_password :
    GTls_password.tls_password_t ->
    GCancellable.cancellable_t option ->
    (Gio_enums.tlsinteractionresult, GError.t) result

  method ask_password_finish :
    GAsync_result.async_result_t ->
    (Gio_enums.tlsinteractionresult, GError.t) result

  method invoke_ask_password :
    GTls_password.tls_password_t ->
    GCancellable.cancellable_t option ->
    (Gio_enums.tlsinteractionresult, GError.t) result

  method invoke_request_certificate :
    tls_connection_t ->
    Gio_enums.tlscertificaterequestflags ->
    GCancellable.cancellable_t option ->
    (Gio_enums.tlsinteractionresult, GError.t) result

  method request_certificate :
    tls_connection_t ->
    Gio_enums.tlscertificaterequestflags ->
    GCancellable.cancellable_t option ->
    (Gio_enums.tlsinteractionresult, GError.t) result

  method request_certificate_finish :
    GAsync_result.async_result_t ->
    (Gio_enums.tlsinteractionresult, GError.t) result

  method as_tls_interaction :
    Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.t
end

class tls_connection :
  Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.t ->
  tls_connection_t

and tls_database :
  Tls_connection_and__tls_database_and__tls_interaction.Tls_database.t ->
  tls_database_t

and tls_interaction :
  Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.t ->
  tls_interaction_t
