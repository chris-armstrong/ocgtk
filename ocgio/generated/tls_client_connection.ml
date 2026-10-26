class type tls_client_connection_t = object
  method copy_session_state : tls_client_connection_t -> unit

  method get_server_identity :
    unit ->
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t
    option

  method get_use_ssl3 : unit -> bool
  method get_validation_flags : unit -> Enums.tlscertificateflags

  method set_server_identity :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t ->
    unit

  method set_use_ssl3 : bool -> unit
  method set_validation_flags : Enums.tlscertificateflags -> unit
  method as_tls_client_connection : Raw.Tls_client_connection.t
end

(* High-level class for TlsClientConnection *)
class tls_client_connection (obj : Raw.Tls_client_connection.t) :
  tls_client_connection_t =
  object (self)
    method copy_session_state : tls_client_connection_t -> unit =
      fun source ->
        let source = source#as_tls_client_connection in
        Raw.Tls_client_connection.copy_session_state obj source

    method get_server_identity :
        unit ->
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_connectable_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Socket_address_and__socket_address_enumerator_and__socket_connectable
              .socket_connectable
              ret)
          (Raw.Tls_client_connection.get_server_identity obj)

    method get_use_ssl3 : unit -> bool =
      fun () -> Raw.Tls_client_connection.get_use_ssl3 obj

    method get_validation_flags : unit -> Enums.tlscertificateflags =
      fun () -> Raw.Tls_client_connection.get_validation_flags obj

    method set_server_identity :
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_connectable_t ->
        unit =
      fun identity ->
        let identity = identity#as_socket_connectable in
        Raw.Tls_client_connection.set_server_identity obj identity

    method set_use_ssl3 : bool -> unit =
      fun use_ssl3 -> Raw.Tls_client_connection.set_use_ssl3 obj use_ssl3

    method set_validation_flags : Enums.tlscertificateflags -> unit =
      fun flags -> Raw.Tls_client_connection.set_validation_flags obj flags

    method as_tls_client_connection = obj
  end
