(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)
(* Signal class defined in gtls_connection_signals.ml *)

class tls_connection (obj : Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.t) = object (self)
  inherit Gtls_connection_signals.tls_connection_signals obj

  method emit_accept_certificate : 'p1. (#GTls_certificate.tls_certificate as 'p1) -> Gio_enums.tlscertificateflags -> bool =
    fun peer_cert errors ->
      let peer_cert = peer_cert#as_tls_certificate in
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.emit_accept_certificate obj peer_cert errors)

  method get_certificate : unit -> GTls_certificate.tls_certificate option =
    fun () ->
      Option.map (fun ret -> new GTls_certificate.tls_certificate ret) (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.get_certificate obj)

  method get_ciphersuite_name : unit -> string option =
    fun () ->
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.get_ciphersuite_name obj)

  method get_database : unit -> tls_database option =
    fun () ->
      Option.map (fun ret -> new tls_database ret) (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.get_database obj)

  method get_interaction : unit -> tls_interaction option =
    fun () ->
      Option.map (fun ret -> new tls_interaction ret) (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.get_interaction obj)

  method get_negotiated_protocol : unit -> string option =
    fun () ->
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.get_negotiated_protocol obj)

  method get_peer_certificate : unit -> GTls_certificate.tls_certificate option =
    fun () ->
      Option.map (fun ret -> new GTls_certificate.tls_certificate ret) (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.get_peer_certificate obj)

  method get_peer_certificate_errors : unit -> Gio_enums.tlscertificateflags =
    fun () ->
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.get_peer_certificate_errors obj)

  method get_protocol_version : unit -> Gio_enums.tlsprotocolversion =
    fun () ->
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.get_protocol_version obj)

  method get_rehandshake_mode : unit -> Gio_enums.tlsrehandshakemode =
    fun () ->
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.get_rehandshake_mode obj)

  method get_require_close_notify : unit -> bool =
    fun () ->
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.get_require_close_notify obj)

  method get_use_system_certdb : unit -> bool =
    fun () ->
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.get_use_system_certdb obj)

  method handshake : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.handshake obj cancellable)

  method set_advertised_protocols : string array option -> unit =
    fun protocols ->
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.set_advertised_protocols obj protocols)

  method set_certificate : 'p1. (#GTls_certificate.tls_certificate as 'p1) -> unit =
    fun certificate ->
      let certificate = certificate#as_tls_certificate in
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.set_certificate obj certificate)

  method set_database : 'p1. (<as_tls_database: Tls_connection_and__tls_database_and__tls_interaction.Tls_database.t; ..> as 'p1) option -> unit =
    fun database ->
      let database = Option.map (fun (c) -> c#as_tls_database) database in
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.set_database obj database)

  method set_interaction : 'p1. (<as_tls_interaction: Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.t; ..> as 'p1) option -> unit =
    fun interaction ->
      let interaction = Option.map (fun (c) -> c#as_tls_interaction) interaction in
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.set_interaction obj interaction)

  method set_rehandshake_mode : Gio_enums.tlsrehandshakemode -> unit =
    fun mode ->
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.set_rehandshake_mode obj mode)

  method set_require_close_notify : bool -> unit =
    fun require_close_notify ->
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.set_require_close_notify obj require_close_notify)

  method set_use_system_certdb : bool -> unit =
    fun use_system_certdb ->
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.set_use_system_certdb obj use_system_certdb)

  method base_io_stream = new GIo_stream.io_stream (Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.get_base_io_stream obj)

    method as_tls_connection = obj
end

and tls_database (obj : Tls_connection_and__tls_database_and__tls_interaction.Tls_database.t) = object (self)

  method create_certificate_handle : 'p1. (#GTls_certificate.tls_certificate as 'p1) -> string option =
    fun certificate ->
      let certificate = certificate#as_tls_certificate in
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_database.create_certificate_handle obj certificate)

  method lookup_certificate_for_handle : 'p1 'p2. string -> (<as_tls_interaction: Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.t; ..> as 'p1) option -> Gio_enums.tlsdatabaselookupflags -> (#GCancellable.cancellable as 'p2) option -> (GTls_certificate.tls_certificate option, GError.t) result =
    fun handle interaction flags cancellable ->
      let interaction = Option.map (fun (c) -> c#as_tls_interaction) interaction in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> Option.map (fun ret -> new GTls_certificate.tls_certificate ret) ret)(Tls_connection_and__tls_database_and__tls_interaction.Tls_database.lookup_certificate_for_handle obj handle interaction flags cancellable)

  method lookup_certificate_issuer : 'p1 'p2 'p3. (#GTls_certificate.tls_certificate as 'p1) -> (<as_tls_interaction: Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.t; ..> as 'p2) option -> Gio_enums.tlsdatabaselookupflags -> (#GCancellable.cancellable as 'p3) option -> (GTls_certificate.tls_certificate, GError.t) result =
    fun certificate interaction flags cancellable ->
      let certificate = certificate#as_tls_certificate in
      let interaction = Option.map (fun (c) -> c#as_tls_interaction) interaction in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GTls_certificate.tls_certificate ret)(Tls_connection_and__tls_database_and__tls_interaction.Tls_database.lookup_certificate_issuer obj certificate interaction flags cancellable)

    method as_tls_database = obj
end

and tls_interaction (obj : Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.t) = object (self)

  method ask_password : 'p1 'p2. (#GTls_password.tls_password as 'p1) -> (#GCancellable.cancellable as 'p2) option -> (Gio_enums.tlsinteractionresult, GError.t) result =
    fun password cancellable ->
      let password = password#as_tls_password in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.ask_password obj password cancellable)

  method invoke_ask_password : 'p1 'p2. (#GTls_password.tls_password as 'p1) -> (#GCancellable.cancellable as 'p2) option -> (Gio_enums.tlsinteractionresult, GError.t) result =
    fun password cancellable ->
      let password = password#as_tls_password in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.invoke_ask_password obj password cancellable)

  method invoke_request_certificate : 'p1 'p2. (<as_tls_connection: Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.t; ..> as 'p1) -> Gio_enums.tlscertificaterequestflags -> (#GCancellable.cancellable as 'p2) option -> (Gio_enums.tlsinteractionresult, GError.t) result =
    fun connection flags cancellable ->
      let connection = connection#as_tls_connection in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.invoke_request_certificate obj connection flags cancellable)

  method request_certificate : 'p1 'p2. (<as_tls_connection: Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.t; ..> as 'p1) -> Gio_enums.tlscertificaterequestflags -> (#GCancellable.cancellable as 'p2) option -> (Gio_enums.tlsinteractionresult, GError.t) result =
    fun connection flags cancellable ->
      let connection = connection#as_tls_connection in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.request_certificate obj connection flags cancellable)

    method as_tls_interaction = obj
end
