class type tls_backend_t = object
  method get_certificate_type : unit -> int
  method get_client_connection_type : unit -> int

  method get_default_database :
    unit ->
    GTls_connection_and__tls_database_and__tls_interaction.tls_database_t

  method get_dtls_client_connection_type : unit -> int
  method get_dtls_server_connection_type : unit -> int
  method get_file_database_type : unit -> int
  method get_server_connection_type : unit -> int

  method set_default_database :
    GTls_connection_and__tls_database_and__tls_interaction.tls_database_t option ->
    unit

  method supports_dtls : unit -> bool
  method supports_tls : unit -> bool
  method as_tls_backend : Tls_backend.t
end

(* High-level class for TlsBackend *)
class tls_backend (obj : Tls_backend.t) : tls_backend_t =
  object (self)
    method get_certificate_type : unit -> int =
      fun () -> Tls_backend.get_certificate_type obj

    method get_client_connection_type : unit -> int =
      fun () -> Tls_backend.get_client_connection_type obj

    method get_default_database :
        unit ->
        GTls_connection_and__tls_database_and__tls_interaction.tls_database_t =
      fun () ->
        new GTls_connection_and__tls_database_and__tls_interaction.tls_database
          (Tls_backend.get_default_database obj)

    method get_dtls_client_connection_type : unit -> int =
      fun () -> Tls_backend.get_dtls_client_connection_type obj

    method get_dtls_server_connection_type : unit -> int =
      fun () -> Tls_backend.get_dtls_server_connection_type obj

    method get_file_database_type : unit -> int =
      fun () -> Tls_backend.get_file_database_type obj

    method get_server_connection_type : unit -> int =
      fun () -> Tls_backend.get_server_connection_type obj

    method set_default_database :
        GTls_connection_and__tls_database_and__tls_interaction.tls_database_t
        option ->
        unit =
      fun database ->
        let database = Option.map (fun c -> c#as_tls_database) database in
        Tls_backend.set_default_database obj database

    method supports_dtls : unit -> bool =
      fun () -> Tls_backend.supports_dtls obj

    method supports_tls : unit -> bool = fun () -> Tls_backend.supports_tls obj
    method as_tls_backend = obj
  end
