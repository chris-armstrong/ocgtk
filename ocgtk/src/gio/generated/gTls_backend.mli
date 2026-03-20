class type tls_backend_t = object
    method get_default_database : unit -> GTls_connection_and__tls_database_and__tls_interaction.tls_database_t
    method set_default_database : GTls_connection_and__tls_database_and__tls_interaction.tls_database_t option -> unit
    method supports_dtls : unit -> bool
    method supports_tls : unit -> bool
    method as_tls_backend : Tls_backend.t
end

class tls_backend : Tls_backend.t -> tls_backend_t

