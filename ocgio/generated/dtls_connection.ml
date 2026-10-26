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

(* High-level class for DtlsConnection *)
class dtls_connection (obj : Raw.Dtls_connection.t) : dtls_connection_t =
  object (self)
    method on_accept_certificate ?(after = false) ~callback () =
      Raw.Dtls_connection.on_accept_certificate ~after self#as_dtls_connection
        ~callback:(fun ~peer_cert ~errors ->
          callback
            ~peer_cert:(new Tls_certificate.tls_certificate peer_cert)
            ~errors)

    method close : Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Dtls_connection.close obj cancellable

    method close_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Dtls_connection.close_finish obj result

    method emit_accept_certificate :
        Tls_certificate.tls_certificate_t -> Enums.tlscertificateflags -> bool =
      fun peer_cert errors ->
        let peer_cert = peer_cert#as_tls_certificate in
        Raw.Dtls_connection.emit_accept_certificate obj peer_cert errors

    method get_certificate : unit -> Tls_certificate.tls_certificate_t option =
      fun () ->
        Option.map
          (fun ret -> new Tls_certificate.tls_certificate ret)
          (Raw.Dtls_connection.get_certificate obj)

    method get_ciphersuite_name : unit -> string option =
      fun () -> Raw.Dtls_connection.get_ciphersuite_name obj

    method get_database :
        unit ->
        Tls_connection_and__tls_database_and__tls_interaction.tls_database_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Tls_connection_and__tls_database_and__tls_interaction.tls_database
              ret)
          (Raw.Dtls_connection.get_database obj)

    method get_interaction :
        unit ->
        Tls_connection_and__tls_database_and__tls_interaction.tls_interaction_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Tls_connection_and__tls_database_and__tls_interaction
              .tls_interaction
              ret)
          (Raw.Dtls_connection.get_interaction obj)

    method get_negotiated_protocol : unit -> string option =
      fun () -> Raw.Dtls_connection.get_negotiated_protocol obj

    method get_peer_certificate :
        unit -> Tls_certificate.tls_certificate_t option =
      fun () ->
        Option.map
          (fun ret -> new Tls_certificate.tls_certificate ret)
          (Raw.Dtls_connection.get_peer_certificate obj)

    method get_peer_certificate_errors : unit -> Enums.tlscertificateflags =
      fun () -> Raw.Dtls_connection.get_peer_certificate_errors obj

    method get_protocol_version : unit -> Enums.tlsprotocolversion =
      fun () -> Raw.Dtls_connection.get_protocol_version obj

    method get_rehandshake_mode : unit -> Enums.tlsrehandshakemode =
      fun () -> Raw.Dtls_connection.get_rehandshake_mode obj

    method get_require_close_notify : unit -> bool =
      fun () -> Raw.Dtls_connection.get_require_close_notify obj

    method handshake :
        Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Dtls_connection.handshake obj cancellable

    method handshake_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Dtls_connection.handshake_finish obj result

    method set_advertised_protocols : string array option -> unit =
      fun protocols ->
        Raw.Dtls_connection.set_advertised_protocols obj protocols

    method set_certificate : Tls_certificate.tls_certificate_t -> unit =
      fun certificate ->
        let certificate = certificate#as_tls_certificate in
        Raw.Dtls_connection.set_certificate obj certificate

    method set_database :
        Tls_connection_and__tls_database_and__tls_interaction.tls_database_t
        option ->
        unit =
      fun database ->
        let database = Option.map (fun c -> c#as_tls_database) database in
        Raw.Dtls_connection.set_database obj database

    method set_interaction :
        Tls_connection_and__tls_database_and__tls_interaction.tls_interaction_t
        option ->
        unit =
      fun interaction ->
        let interaction =
          Option.map (fun c -> c#as_tls_interaction) interaction
        in
        Raw.Dtls_connection.set_interaction obj interaction

    method set_rehandshake_mode : Enums.tlsrehandshakemode -> unit =
      fun mode -> Raw.Dtls_connection.set_rehandshake_mode obj mode

    method set_require_close_notify : bool -> unit =
      fun require_close_notify ->
        Raw.Dtls_connection.set_require_close_notify obj require_close_notify

    method shutdown :
        bool ->
        bool ->
        Cancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun shutdown_read shutdown_write cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Dtls_connection.shutdown obj shutdown_read shutdown_write
          cancellable

    method shutdown_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Dtls_connection.shutdown_finish obj result

    method base_socket =
      new Datagram_based.datagram_based
        (Raw.Dtls_connection.get_base_socket obj)

    method as_dtls_connection = obj
  end
