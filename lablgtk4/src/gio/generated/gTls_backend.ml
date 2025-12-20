(* High-level class for TlsBackend *)
class tls_backend (obj : Tls_backend.t) = object (self)

  method get_default_database : unit -> GTls_connection_and__tls_database_and__tls_interaction.tls_database =
    fun () ->
      new  GTls_connection_and__tls_database_and__tls_interaction.tls_database(Tls_backend.get_default_database obj)

  method set_default_database : 'p1. (#GTls_connection_and__tls_database_and__tls_interaction.tls_database as 'p1) option -> unit =
    fun database ->
      let database = Option.map (fun (c) -> c#as_tls_database) database in
      (Tls_backend.set_default_database obj database)

  method supports_dtls : unit -> bool =
    fun () ->
      (Tls_backend.supports_dtls obj)

  method supports_tls : unit -> bool =
    fun () ->
      (Tls_backend.supports_tls obj)

    method as_tls_backend = obj
end

