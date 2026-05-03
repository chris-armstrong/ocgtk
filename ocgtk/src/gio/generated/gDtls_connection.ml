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

(* High-level class for DtlsConnection *)
class dtls_connection (obj : Dtls_connection.t) : dtls_connection_t =
  object (self)
    method close : GCancellable.cancellable_t option -> (bool, GError.t) result
        =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Dtls_connection.close obj cancellable

    method close_finish :
        GAsync_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Dtls_connection.close_finish obj result

    method emit_accept_certificate :
        GTls_certificate.tls_certificate_t ->
        Gio_enums.tlscertificateflags ->
        bool =
      fun peer_cert errors ->
        let peer_cert = peer_cert#as_tls_certificate in
        Dtls_connection.emit_accept_certificate obj peer_cert errors

    method get_certificate : unit -> GTls_certificate.tls_certificate_t option =
      fun () ->
        Option.map
          (fun ret -> new GTls_certificate.tls_certificate ret)
          (Dtls_connection.get_certificate obj)

    method get_ciphersuite_name : unit -> string option =
      fun () -> Dtls_connection.get_ciphersuite_name obj

    method get_database :
        unit ->
        GTls_connection_and__tls_database_and__tls_interaction.tls_database_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              GTls_connection_and__tls_database_and__tls_interaction
              .tls_database
              ret)
          (Dtls_connection.get_database obj)

    method get_interaction :
        unit ->
        GTls_connection_and__tls_database_and__tls_interaction.tls_interaction_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              GTls_connection_and__tls_database_and__tls_interaction
              .tls_interaction
              ret)
          (Dtls_connection.get_interaction obj)

    method get_negotiated_protocol : unit -> string option =
      fun () -> Dtls_connection.get_negotiated_protocol obj

    method get_peer_certificate :
        unit -> GTls_certificate.tls_certificate_t option =
      fun () ->
        Option.map
          (fun ret -> new GTls_certificate.tls_certificate ret)
          (Dtls_connection.get_peer_certificate obj)

    method get_peer_certificate_errors : unit -> Gio_enums.tlscertificateflags =
      fun () -> Dtls_connection.get_peer_certificate_errors obj

    method get_protocol_version : unit -> Gio_enums.tlsprotocolversion =
      fun () -> Dtls_connection.get_protocol_version obj

    method get_rehandshake_mode : unit -> Gio_enums.tlsrehandshakemode =
      fun () -> Dtls_connection.get_rehandshake_mode obj

    method get_require_close_notify : unit -> bool =
      fun () -> Dtls_connection.get_require_close_notify obj

    method handshake :
        GCancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Dtls_connection.handshake obj cancellable

    method handshake_finish :
        GAsync_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Dtls_connection.handshake_finish obj result

    method set_advertised_protocols : string array option -> unit =
      fun protocols -> Dtls_connection.set_advertised_protocols obj protocols

    method set_certificate : GTls_certificate.tls_certificate_t -> unit =
      fun certificate ->
        let certificate = certificate#as_tls_certificate in
        Dtls_connection.set_certificate obj certificate

    method set_database :
        GTls_connection_and__tls_database_and__tls_interaction.tls_database_t
        option ->
        unit =
      fun database ->
        let database = Option.map (fun c -> c#as_tls_database) database in
        Dtls_connection.set_database obj database

    method set_interaction :
        GTls_connection_and__tls_database_and__tls_interaction.tls_interaction_t
        option ->
        unit =
      fun interaction ->
        let interaction =
          Option.map (fun c -> c#as_tls_interaction) interaction
        in
        Dtls_connection.set_interaction obj interaction

    method set_rehandshake_mode : Gio_enums.tlsrehandshakemode -> unit =
      fun mode -> Dtls_connection.set_rehandshake_mode obj mode

    method set_require_close_notify : bool -> unit =
      fun require_close_notify ->
        Dtls_connection.set_require_close_notify obj require_close_notify

    method shutdown :
        bool ->
        bool ->
        GCancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun shutdown_read shutdown_write cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Dtls_connection.shutdown obj shutdown_read shutdown_write cancellable

    method shutdown_finish :
        GAsync_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Dtls_connection.shutdown_finish obj result

    method base_socket =
      new GDatagram_based.datagram_based (Dtls_connection.get_base_socket obj)

    method as_dtls_connection = obj
  end
