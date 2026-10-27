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

  method emit_accept_certificate :
    Tls_certificate.tls_certificate_t -> Enums.tlscertificateflags -> bool

  method get_certificate : unit -> Tls_certificate.tls_certificate_t option
  method get_ciphersuite_name : unit -> string option
  method get_database : unit -> tls_database_t option
  method get_interaction : unit -> tls_interaction_t option
  method get_negotiated_protocol : unit -> string option
  method get_peer_certificate : unit -> Tls_certificate.tls_certificate_t option
  method get_peer_certificate_errors : unit -> Enums.tlscertificateflags
  method get_protocol_version : unit -> Enums.tlsprotocolversion
  method get_rehandshake_mode : unit -> Enums.tlsrehandshakemode
  method get_require_close_notify : unit -> bool
  method get_use_system_certdb : unit -> bool
  method handshake : Cancellable.cancellable_t option -> (bool, GError.t) result

  method handshake_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method set_advertised_protocols : string array option -> unit
  method set_certificate : Tls_certificate.tls_certificate_t -> unit
  method set_database : tls_database_t option -> unit
  method set_interaction : tls_interaction_t option -> unit
  method set_rehandshake_mode : Enums.tlsrehandshakemode -> unit
  method set_require_close_notify : bool -> unit
  method set_use_system_certdb : bool -> unit
  method base_io_stream : Io_stream.io_stream_t
  method as_tls_connection : Raw.Tls_connection.t
end

(** The methods, signals and properties of a [GTlsDatabase]. *)
and tls_database_t = object
  method create_certificate_handle :
    Tls_certificate.tls_certificate_t -> string option

  method lookup_certificate_for_handle :
    string ->
    tls_interaction_t option ->
    Enums.tlsdatabaselookupflags ->
    Cancellable.cancellable_t option ->
    (Tls_certificate.tls_certificate_t option, GError.t) result

  method lookup_certificate_for_handle_finish :
    Async_result.async_result_t ->
    (Tls_certificate.tls_certificate_t, GError.t) result

  method lookup_certificate_issuer :
    Tls_certificate.tls_certificate_t ->
    tls_interaction_t option ->
    Enums.tlsdatabaselookupflags ->
    Cancellable.cancellable_t option ->
    (Tls_certificate.tls_certificate_t, GError.t) result

  method lookup_certificate_issuer_finish :
    Async_result.async_result_t ->
    (Tls_certificate.tls_certificate_t, GError.t) result

  method lookup_certificates_issued_by_finish :
    Async_result.async_result_t ->
    (Tls_certificate.tls_certificate_t list, GError.t) result

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

  method verify_chain_finish :
    Async_result.async_result_t -> (Enums.tlscertificateflags, GError.t) result

  method as_tls_database : Raw.Tls_database.t
end

(** The methods, signals and properties of a [GTlsInteraction]. *)
and tls_interaction_t = object
  method ask_password :
    Tls_password.tls_password_t ->
    Cancellable.cancellable_t option ->
    (Enums.tlsinteractionresult, GError.t) result

  method ask_password_finish :
    Async_result.async_result_t -> (Enums.tlsinteractionresult, GError.t) result

  method invoke_ask_password :
    Tls_password.tls_password_t ->
    Cancellable.cancellable_t option ->
    (Enums.tlsinteractionresult, GError.t) result

  method invoke_request_certificate :
    tls_connection_t ->
    Enums.tlscertificaterequestflags ->
    Cancellable.cancellable_t option ->
    (Enums.tlsinteractionresult, GError.t) result

  method request_certificate :
    tls_connection_t ->
    Enums.tlscertificaterequestflags ->
    Cancellable.cancellable_t option ->
    (Enums.tlsinteractionresult, GError.t) result

  method request_certificate_finish :
    Async_result.async_result_t -> (Enums.tlsinteractionresult, GError.t) result

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
