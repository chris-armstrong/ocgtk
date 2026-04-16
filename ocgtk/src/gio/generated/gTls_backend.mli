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

class tls_backend : Tls_backend.t -> tls_backend_t
