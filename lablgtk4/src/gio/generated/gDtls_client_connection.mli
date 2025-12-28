class dtls_client_connection : Dtls_client_connection.t ->
  object
    method get_server_identity : unit -> GSocket_connectable.socket_connectable
    method get_validation_flags : unit -> Gio_enums.tlscertificateflags
    method set_validation_flags : Gio_enums.tlscertificateflags -> unit
    method as_dtls_client_connection : Dtls_client_connection.t
  end

