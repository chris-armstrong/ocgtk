
class tls_connection : Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.t ->
  object
    inherit Gtls_connection_signals.tls_connection_signals
    method emit_accept_certificate : #GTls_certificate.tls_certificate -> Gio_enums.tlscertificateflags -> bool
    method get_certificate : unit -> GTls_certificate.tls_certificate option
    method get_ciphersuite_name : unit -> string option
    method get_database : unit -> tls_database option
    method get_interaction : unit -> tls_interaction option
    method get_negotiated_protocol : unit -> string option
    method get_peer_certificate : unit -> GTls_certificate.tls_certificate option
    method get_peer_certificate_errors : unit -> Gio_enums.tlscertificateflags
    method get_protocol_version : unit -> Gio_enums.tlsprotocolversion
    method get_rehandshake_mode : unit -> Gio_enums.tlsrehandshakemode
    method get_require_close_notify : unit -> bool
    method get_use_system_certdb : unit -> bool
    method handshake : #GCancellable.cancellable option -> (bool, GError.t) result
    method set_advertised_protocols : string array option -> unit
    method set_certificate : #GTls_certificate.tls_certificate -> unit
    method set_database : <as_tls_database: Tls_connection_and__tls_database_and__tls_interaction.Tls_database.t; ..> option -> unit
    method set_interaction : <as_tls_interaction: Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.t; ..> option -> unit
    method set_rehandshake_mode : Gio_enums.tlsrehandshakemode -> unit
    method set_require_close_notify : bool -> unit
    method set_use_system_certdb : bool -> unit
    method base_io_stream : GIo_stream.io_stream
    method as_tls_connection : Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.t
  end

and tls_database : Tls_connection_and__tls_database_and__tls_interaction.Tls_database.t ->
  object
    method create_certificate_handle : #GTls_certificate.tls_certificate -> string option
    method lookup_certificate_for_handle : string -> <as_tls_interaction: Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.t; ..> option -> Gio_enums.tlsdatabaselookupflags -> #GCancellable.cancellable option -> (GTls_certificate.tls_certificate option, GError.t) result
    method lookup_certificate_issuer : #GTls_certificate.tls_certificate -> <as_tls_interaction: Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.t; ..> option -> Gio_enums.tlsdatabaselookupflags -> #GCancellable.cancellable option -> (GTls_certificate.tls_certificate, GError.t) result
    method as_tls_database : Tls_connection_and__tls_database_and__tls_interaction.Tls_database.t
  end

and tls_interaction : Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.t ->
  object
    method ask_password : #GTls_password.tls_password -> #GCancellable.cancellable option -> (Gio_enums.tlsinteractionresult, GError.t) result
    method invoke_ask_password : #GTls_password.tls_password -> #GCancellable.cancellable option -> (Gio_enums.tlsinteractionresult, GError.t) result
    method invoke_request_certificate : <as_tls_connection: Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.t; ..> -> Gio_enums.tlscertificaterequestflags -> #GCancellable.cancellable option -> (Gio_enums.tlsinteractionresult, GError.t) result
    method request_certificate : <as_tls_connection: Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.t; ..> -> Gio_enums.tlscertificaterequestflags -> #GCancellable.cancellable option -> (Gio_enums.tlsinteractionresult, GError.t) result
    method as_tls_interaction : Tls_connection_and__tls_database_and__tls_interaction.Tls_interaction.t
  end
