class type tls_client_connection_t = object
    method copy_session_state : tls_client_connection_t -> unit
    method get_server_identity : unit -> GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t option
    method get_use_ssl3 : unit -> bool
    method get_validation_flags : unit -> Gio_enums.tlscertificateflags
    method set_server_identity : GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t -> unit
    method set_use_ssl3 : bool -> unit
    method set_validation_flags : Gio_enums.tlscertificateflags -> unit
    method as_tls_client_connection : Tls_client_connection.t
end

(* High-level class for TlsClientConnection *)
class tls_client_connection (obj : Tls_client_connection.t) : tls_client_connection_t = object (self)

  method copy_session_state : tls_client_connection_t -> unit =
    fun source ->
      let source = source#as_tls_client_connection in
      (Tls_client_connection.copy_session_state obj source)

  method get_server_identity : unit -> GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t option =
    fun () ->
      Option.map (fun ret -> new GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable ret) (Tls_client_connection.get_server_identity obj)

  method get_use_ssl3 : unit -> bool =
    fun () ->
      (Tls_client_connection.get_use_ssl3 obj)

  method get_validation_flags : unit -> Gio_enums.tlscertificateflags =
    fun () ->
      (Tls_client_connection.get_validation_flags obj)

  method set_server_identity : GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t -> unit =
    fun identity ->
      let identity = identity#as_socket_connectable in
      (Tls_client_connection.set_server_identity obj identity)

  method set_use_ssl3 : bool -> unit =
    fun use_ssl3 ->
      (Tls_client_connection.set_use_ssl3 obj use_ssl3)

  method set_validation_flags : Gio_enums.tlscertificateflags -> unit =
    fun flags ->
      (Tls_client_connection.set_validation_flags obj flags)

    method as_tls_client_connection = obj
end

