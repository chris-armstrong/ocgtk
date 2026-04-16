class type dtls_client_connection_t = object
  method get_server_identity :
    unit ->
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t

  method get_validation_flags : unit -> Gio_enums.tlscertificateflags

  method set_server_identity :
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t ->
    unit

  method set_validation_flags : Gio_enums.tlscertificateflags -> unit
  method as_dtls_client_connection : Dtls_client_connection.t
end

class dtls_client_connection :
  Dtls_client_connection.t ->
  dtls_client_connection_t
