(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

class tls_connection (obj : Raw.Tls_connection.t) : tls_connection_t =
  object (self)
    inherit Io_stream.io_stream (obj :> Raw.Io_stream.t)

    method on_accept_certificate ?(after = false) ~callback () =
      Raw.Tls_connection.on_accept_certificate ~after self#as_tls_connection
        ~callback:(fun ~peer_cert ~errors ->
          callback
            ~peer_cert:(new Tls_certificate.tls_certificate peer_cert)
            ~errors)

    method emit_accept_certificate :
        Tls_certificate.tls_certificate_t -> Enums.tlscertificateflags -> bool =
      fun peer_cert errors ->
        let peer_cert = peer_cert#as_tls_certificate in
        Raw.Tls_connection.emit_accept_certificate obj peer_cert errors

    method get_certificate : unit -> Tls_certificate.tls_certificate_t option =
      fun () ->
        Option.map
          (fun ret -> new Tls_certificate.tls_certificate ret)
          (Raw.Tls_connection.get_certificate obj)

    method get_ciphersuite_name : unit -> string option =
      fun () -> Raw.Tls_connection.get_ciphersuite_name obj

    method get_database : unit -> tls_database_t option =
      fun () ->
        Option.map
          (fun ret -> new tls_database ret)
          (Raw.Tls_connection.get_database obj)

    method get_interaction : unit -> tls_interaction_t option =
      fun () ->
        Option.map
          (fun ret -> new tls_interaction ret)
          (Raw.Tls_connection.get_interaction obj)

    method get_negotiated_protocol : unit -> string option =
      fun () -> Raw.Tls_connection.get_negotiated_protocol obj

    method get_peer_certificate :
        unit -> Tls_certificate.tls_certificate_t option =
      fun () ->
        Option.map
          (fun ret -> new Tls_certificate.tls_certificate ret)
          (Raw.Tls_connection.get_peer_certificate obj)

    method get_peer_certificate_errors : unit -> Enums.tlscertificateflags =
      fun () -> Raw.Tls_connection.get_peer_certificate_errors obj

    method get_protocol_version : unit -> Enums.tlsprotocolversion =
      fun () -> Raw.Tls_connection.get_protocol_version obj

    method get_rehandshake_mode : unit -> Enums.tlsrehandshakemode =
      fun () -> Raw.Tls_connection.get_rehandshake_mode obj

    method get_require_close_notify : unit -> bool =
      fun () -> Raw.Tls_connection.get_require_close_notify obj

    method get_use_system_certdb : unit -> bool =
      fun () -> Raw.Tls_connection.get_use_system_certdb obj

    method handshake :
        Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Tls_connection.handshake obj cancellable

    method handshake_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Tls_connection.handshake_finish obj result

    method set_advertised_protocols : string array option -> unit =
      fun protocols -> Raw.Tls_connection.set_advertised_protocols obj protocols

    method set_certificate : Tls_certificate.tls_certificate_t -> unit =
      fun certificate ->
        let certificate = certificate#as_tls_certificate in
        Raw.Tls_connection.set_certificate obj certificate

    method set_database : tls_database_t option -> unit =
      fun database ->
        let database = Option.map (fun c -> c#as_tls_database) database in
        Raw.Tls_connection.set_database obj database

    method set_interaction : tls_interaction_t option -> unit =
      fun interaction ->
        let interaction =
          Option.map (fun c -> c#as_tls_interaction) interaction
        in
        Raw.Tls_connection.set_interaction obj interaction

    method set_rehandshake_mode : Enums.tlsrehandshakemode -> unit =
      fun mode -> Raw.Tls_connection.set_rehandshake_mode obj mode

    method set_require_close_notify : bool -> unit =
      fun require_close_notify ->
        Raw.Tls_connection.set_require_close_notify obj require_close_notify

    method set_use_system_certdb : bool -> unit =
      fun use_system_certdb ->
        Raw.Tls_connection.set_use_system_certdb obj use_system_certdb

    method base_io_stream =
      new Io_stream.io_stream (Raw.Tls_connection.get_base_io_stream obj)

    method as_tls_connection = obj
  end

and tls_database (obj : Raw.Tls_database.t) : tls_database_t =
  object (self)
    method create_certificate_handle :
        Tls_certificate.tls_certificate_t -> string option =
      fun certificate ->
        let certificate = certificate#as_tls_certificate in
        Raw.Tls_database.create_certificate_handle obj certificate

    method lookup_certificate_for_handle :
        string ->
        tls_interaction_t option ->
        Enums.tlsdatabaselookupflags ->
        Cancellable.cancellable_t option ->
        (Tls_certificate.tls_certificate_t option, GError.t) result =
      fun handle interaction flags cancellable ->
        let interaction =
          Option.map (fun c -> c#as_tls_interaction) interaction
        in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret ->
            Option.map (fun ret -> new Tls_certificate.tls_certificate ret) ret)
          (Raw.Tls_database.lookup_certificate_for_handle obj handle interaction
             flags cancellable)

    method lookup_certificate_for_handle_finish :
        Async_result.async_result_t ->
        (Tls_certificate.tls_certificate_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Tls_certificate.tls_certificate ret)
          (Raw.Tls_database.lookup_certificate_for_handle_finish obj result)

    method lookup_certificate_issuer :
        Tls_certificate.tls_certificate_t ->
        tls_interaction_t option ->
        Enums.tlsdatabaselookupflags ->
        Cancellable.cancellable_t option ->
        (Tls_certificate.tls_certificate_t, GError.t) result =
      fun certificate interaction flags cancellable ->
        let certificate = certificate#as_tls_certificate in
        let interaction =
          Option.map (fun c -> c#as_tls_interaction) interaction
        in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new Tls_certificate.tls_certificate ret)
          (Raw.Tls_database.lookup_certificate_issuer obj certificate
             interaction flags cancellable)

    method lookup_certificate_issuer_finish :
        Async_result.async_result_t ->
        (Tls_certificate.tls_certificate_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Tls_certificate.tls_certificate ret)
          (Raw.Tls_database.lookup_certificate_issuer_finish obj result)

    method lookup_certificates_issued_by_finish :
        Async_result.async_result_t ->
        (Tls_certificate.tls_certificate_t list, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (List.map (fun ret -> new Tls_certificate.tls_certificate ret))
          (Raw.Tls_database.lookup_certificates_issued_by_finish obj result)

    method verify_chain :
        Tls_certificate.tls_certificate_t ->
        string ->
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_connectable_t
        option ->
        tls_interaction_t option ->
        Enums.tlsdatabaseverifyflags ->
        Cancellable.cancellable_t option ->
        (Enums.tlscertificateflags, GError.t) result =
      fun chain purpose identity interaction flags cancellable ->
        let chain = chain#as_tls_certificate in
        let identity = Option.map (fun c -> c#as_socket_connectable) identity in
        let interaction =
          Option.map (fun c -> c#as_tls_interaction) interaction
        in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Tls_database.verify_chain obj chain purpose identity interaction
          flags cancellable

    method verify_chain_finish :
        Async_result.async_result_t ->
        (Enums.tlscertificateflags, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Tls_database.verify_chain_finish obj result

    method as_tls_database = obj
  end

and tls_interaction (obj : Raw.Tls_interaction.t) : tls_interaction_t =
  object (self)
    method ask_password :
        Tls_password.tls_password_t ->
        Cancellable.cancellable_t option ->
        (Enums.tlsinteractionresult, GError.t) result =
      fun password cancellable ->
        let password = password#as_tls_password in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Tls_interaction.ask_password obj password cancellable

    method ask_password_finish :
        Async_result.async_result_t ->
        (Enums.tlsinteractionresult, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Tls_interaction.ask_password_finish obj result

    method invoke_ask_password :
        Tls_password.tls_password_t ->
        Cancellable.cancellable_t option ->
        (Enums.tlsinteractionresult, GError.t) result =
      fun password cancellable ->
        let password = password#as_tls_password in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Tls_interaction.invoke_ask_password obj password cancellable

    method invoke_request_certificate :
        tls_connection_t ->
        Enums.tlscertificaterequestflags ->
        Cancellable.cancellable_t option ->
        (Enums.tlsinteractionresult, GError.t) result =
      fun connection flags cancellable ->
        let connection = connection#as_tls_connection in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Tls_interaction.invoke_request_certificate obj connection flags
          cancellable

    method request_certificate :
        tls_connection_t ->
        Enums.tlscertificaterequestflags ->
        Cancellable.cancellable_t option ->
        (Enums.tlsinteractionresult, GError.t) result =
      fun connection flags cancellable ->
        let connection = connection#as_tls_connection in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Tls_interaction.request_certificate obj connection flags cancellable

    method request_certificate_finish :
        Async_result.async_result_t ->
        (Enums.tlsinteractionresult, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Tls_interaction.request_certificate_finish obj result

    method as_tls_interaction = obj
  end
