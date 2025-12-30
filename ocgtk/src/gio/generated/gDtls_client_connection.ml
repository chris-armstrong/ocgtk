(* High-level class for DtlsClientConnection *)
class dtls_client_connection (obj : Dtls_client_connection.t) = object (self)

  method get_server_identity : unit -> GSocket_connectable.socket_connectable =
    fun () ->
      new  GSocket_connectable.socket_connectable(Dtls_client_connection.get_server_identity obj)

  method get_validation_flags : unit -> Gio_enums.tlscertificateflags =
    fun () ->
      (Dtls_client_connection.get_validation_flags obj)

  method set_validation_flags : Gio_enums.tlscertificateflags -> unit =
    fun flags ->
      (Dtls_client_connection.set_validation_flags obj flags)

    method as_dtls_client_connection = obj
end

