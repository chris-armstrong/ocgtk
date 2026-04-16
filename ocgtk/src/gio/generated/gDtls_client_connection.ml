class type dtls_client_connection_t = object
    method get_server_identity : unit -> GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t
    method get_validation_flags : unit -> Gio_enums.tlscertificateflags
    method set_server_identity : GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t -> unit
    method set_validation_flags : Gio_enums.tlscertificateflags -> unit
    method as_dtls_client_connection : Dtls_client_connection.t
end

(* High-level class for DtlsClientConnection *)
class dtls_client_connection (obj : Dtls_client_connection.t) : dtls_client_connection_t = object (self)

  method get_server_identity : unit -> GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t =
    fun () ->
      new  GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable(Dtls_client_connection.get_server_identity obj)

  method get_validation_flags : unit -> Gio_enums.tlscertificateflags =
    fun () ->
      (Dtls_client_connection.get_validation_flags obj)

  method set_server_identity : GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t -> unit =
    fun identity ->
      let identity = identity#as_socket_connectable in
      (Dtls_client_connection.set_server_identity obj identity)

  method set_validation_flags : Gio_enums.tlscertificateflags -> unit =
    fun flags ->
      (Dtls_client_connection.set_validation_flags obj flags)

    method as_dtls_client_connection = obj
end

