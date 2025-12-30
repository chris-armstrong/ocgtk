class tls_client_connection : Tls_client_connection.t ->
  object
    method get_server_identity : unit -> GSocket_connectable.socket_connectable option
    method get_use_ssl3 : unit -> bool
    method get_validation_flags : unit -> Gio_enums.tlscertificateflags
    method set_use_ssl3 : bool -> unit
    method set_validation_flags : Gio_enums.tlscertificateflags -> unit
    method as_tls_client_connection : Tls_client_connection.t
  end

