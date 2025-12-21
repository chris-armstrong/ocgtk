(* Signal class defined in gdtls_connection_signals.ml *)

(* High-level class for DtlsConnection *)
class dtls_connection (obj : Dtls_connection.t) = object (self)
  inherit Gdtls_connection_signals.dtls_connection_signals obj

  method close : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Dtls_connection.close obj cancellable)

  method get_certificate : unit -> GTls_certificate.tls_certificate option =
    fun () ->
      Option.map (fun ret -> new GTls_certificate.tls_certificate ret) (Dtls_connection.get_certificate obj)

  method get_ciphersuite_name : unit -> string option =
    fun () ->
      (Dtls_connection.get_ciphersuite_name obj)

  method get_database : unit -> GTls_connection_and__tls_database_and__tls_interaction.tls_database option =
    fun () ->
      Option.map (fun ret -> new GTls_connection_and__tls_database_and__tls_interaction.tls_database ret) (Dtls_connection.get_database obj)

  method get_interaction : unit -> GTls_connection_and__tls_database_and__tls_interaction.tls_interaction option =
    fun () ->
      Option.map (fun ret -> new GTls_connection_and__tls_database_and__tls_interaction.tls_interaction ret) (Dtls_connection.get_interaction obj)

  method get_negotiated_protocol : unit -> string option =
    fun () ->
      (Dtls_connection.get_negotiated_protocol obj)

  method get_peer_certificate : unit -> GTls_certificate.tls_certificate option =
    fun () ->
      Option.map (fun ret -> new GTls_certificate.tls_certificate ret) (Dtls_connection.get_peer_certificate obj)

  method get_protocol_version : unit -> Gio_enums.tlsprotocolversion =
    fun () ->
      (Dtls_connection.get_protocol_version obj)

  method get_rehandshake_mode : unit -> Gio_enums.tlsrehandshakemode =
    fun () ->
      (Dtls_connection.get_rehandshake_mode obj)

  method get_require_close_notify : unit -> bool =
    fun () ->
      (Dtls_connection.get_require_close_notify obj)

  method handshake : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Dtls_connection.handshake obj cancellable)

  method set_certificate : 'p1. (#GTls_certificate.tls_certificate as 'p1) -> unit =
    fun certificate ->
      let certificate = certificate#as_tls_certificate in
      (Dtls_connection.set_certificate obj certificate)

  method set_database : 'p1. (#GTls_connection_and__tls_database_and__tls_interaction.tls_database as 'p1) option -> unit =
    fun database ->
      let database = Option.map (fun (c) -> c#as_tls_database) database in
      (Dtls_connection.set_database obj database)

  method set_interaction : 'p1. (#GTls_connection_and__tls_database_and__tls_interaction.tls_interaction as 'p1) option -> unit =
    fun interaction ->
      let interaction = Option.map (fun (c) -> c#as_tls_interaction) interaction in
      (Dtls_connection.set_interaction obj interaction)

  method set_rehandshake_mode : Gio_enums.tlsrehandshakemode -> unit =
    fun mode ->
      (Dtls_connection.set_rehandshake_mode obj mode)

  method set_require_close_notify : bool -> unit =
    fun require_close_notify ->
      (Dtls_connection.set_require_close_notify obj require_close_notify)

  method shutdown : 'p1. bool -> bool -> (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun shutdown_read shutdown_write cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Dtls_connection.shutdown obj shutdown_read shutdown_write cancellable)

    method as_dtls_connection = obj
end

