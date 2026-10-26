class type dtls_client_connection_t = object
  method get_server_identity :
    unit ->
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t

  method get_validation_flags : unit -> Enums.tlscertificateflags

  method set_server_identity :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t ->
    unit

  method set_validation_flags : Enums.tlscertificateflags -> unit
  method as_dtls_client_connection : Raw.Dtls_client_connection.t
end

class dtls_client_connection :
  Raw.Dtls_client_connection.t ->
  dtls_client_connection_t
